/*
 *  Licensed to the Apache Software Foundation (ASF) under one or more
 *  contributor license agreements.  See the NOTICE file distributed with
 *  this work for additional information regarding copyright ownership.
 *  The ASF licenses this file to You under the Apache License, Version 2.0
 *  (the "License"); you may not use this file except in compliance with
 *  the License.  You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 *
 */

package com.harmazing.framework.util.ssh;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Iterator;
import java.util.List;

import com.jcraft.jsch.ChannelExec;
import com.jcraft.jsch.JSchException;
import com.jcraft.jsch.Session;

/**
 * Utility class to carry out an upload scp transfer.
 */
public class ScpToMessage extends AbstractSshMessage {

    private static final int HUNDRED_KILOBYTES = 102400;
    private static final int BUFFER_SIZE = 100*1024;
    private static final int DEFAULT_DIR_MODE = 0755;
    private static final int DEFAULT_FILE_MODE = 0644;

    private File localFile;
    private String remotePath;
    private List directoryList;
    private Integer fileMode, dirMode;

    /**
     * Constructor for ScpToMessage
     * @param session the ssh session to use
     */
    public ScpToMessage(final Session session) {
        super(session);
    }

    /**
     * Constructor for ScpToMessage
     * @param verbose if true do verbose logging
     * @param session the ssh session to use
     * @since Ant 1.7
     */
    public ScpToMessage(final boolean verbose, final Session session) {
        super(verbose, session);
    }

    /**
     * Constructor for a local file to remote.
     * @param verbose if true do verbose logging
     * @param session the scp session to use
     * @param aLocalFile the local file
     * @param aRemotePath the remote path
     * @since Ant 1.6.2
     */
    public ScpToMessage(final boolean verbose,
                        final Session session,
                        final File aLocalFile,
                        final String aRemotePath) {
        this(verbose, session, aRemotePath);

        this.localFile = aLocalFile;
    }

    /**
     * Constructor for a local directories to remote.
     * @param verbose if true do verbose logging
     * @param session the scp session to use
     * @param aDirectoryList a list of directories
     * @param aRemotePath the remote path
     * @since Ant 1.6.2
     */
    public ScpToMessage(final boolean verbose,
                        final Session session,
                        final List aDirectoryList,
                        final String aRemotePath) {
        this(verbose, session, aRemotePath);

        this.directoryList = aDirectoryList;
    }

    /**
     * Constructor for ScpToMessage.
     * @param verbose if true do verbose logging
     * @param session the scp session to use
     * @param aRemotePath the remote path
     * @since Ant 1.6.2
     */
    private ScpToMessage(final boolean verbose,
                         final Session session,
                         final String aRemotePath) {
        super(verbose, session);
        this.remotePath = aRemotePath;
    }

    /**
     * Constructor for ScpToMessage.
     * @param session the scp session to use
     * @param aLocalFile the local file
     * @param aRemotePath the remote path
     */
    public ScpToMessage(final Session session,
                        final File aLocalFile,
                        final String aRemotePath) {
        this(false, session, aLocalFile, aRemotePath);
    }

    /**
     * Constructor for ScpToMessage.
     * @param session the scp session to use
     * @param aDirectoryList a list of directories
     * @param aRemotePath the remote path
     */
    public ScpToMessage(final Session session,
                         final List aDirectoryList,
                         final String aRemotePath) {
        this(false, session, aDirectoryList, aRemotePath);
    }

    /**
     * Carry out the transfer.
     * @throws IOException on i/o errors
     * @throws JSchException on errors detected by scp
     */
    @Override
    public String execute() throws IOException, JSchException {
		ByteArrayOutputStream err = new ByteArrayOutputStream();
        if (directoryList != null) {
            doMultipleTransfer(err);
        }
        if (localFile != null) {
            doSingleTransfer(err);
        }
        log("done.\n");
        return err.toString();
    }

    private void doSingleTransfer(OutputStream err) throws IOException, JSchException {
        final String cmd = "scp -t " + remotePath;
        final ChannelExec channel = (ChannelExec) openExecChannel(cmd);
        try {

            final OutputStream out = channel.getOutputStream();
            final InputStream in = channel.getInputStream();
            channel.setErrStream(err);
            channel.connect();

            waitForAck(in);
            sendFileToRemote(localFile, in, out);
        } finally {
            if (channel != null) {
                channel.disconnect();
            }
        }
    }

    private void doMultipleTransfer(OutputStream err ) throws IOException, JSchException {
        final ChannelExec channel = (ChannelExec)openExecChannel("scp -r -d -t " + remotePath);
        try {
            final OutputStream out = channel.getOutputStream();
            final InputStream in = channel.getInputStream();
            channel.setErrStream(err);
            channel.connect();

            waitForAck(in);
            for (final Iterator i = directoryList.iterator(); i.hasNext();) {
                final Directory current = (Directory) i.next();
                sendDirectory(current, in, out);
            }
        } finally {
            if (channel != null) {
                channel.disconnect();
            }
        }
    }

    private void sendDirectory(final Directory current,
                               final InputStream in,
                               final OutputStream out) throws IOException {
        for (final Iterator fileIt = current.filesIterator(); fileIt.hasNext();) {
            sendFileToRemote((File) fileIt.next(), in, out);
        }
        for (final Iterator dirIt = current.directoryIterator(); dirIt.hasNext();) {
            final Directory dir = (Directory) dirIt.next();
            sendDirectoryToRemote(dir, in, out);
        }
    }

    private void sendDirectoryToRemote(final Directory directory,
                                        final InputStream in,
                                        final OutputStream out) throws IOException {
        String command = "D0";
        command += Integer.toOctalString(getDirMode());
        command += " 0 ";
        command += directory.getDirectory().getName();
        command += "\n";

        out.write(command.getBytes());
        out.flush();

        waitForAck(in);
        sendDirectory(directory, in, out);
        out.write("E\n".getBytes());
        out.flush();
        waitForAck(in);
    }

    private void sendFileToRemote(final File localFile,
                                   final InputStream in,
                                   final OutputStream out) throws IOException {
        // send "C0644 filesize filename", where filename should not include '/'
        final long filesize = localFile.length();
        String command = "C0";
        command += Integer.toOctalString(getFileMode());
        command += " " + filesize + " ";
        command += localFile.getName();
        command += "\n";

        out.write(command.getBytes());
        out.flush();

        waitForAck(in);

        // send a content of lfile
        final FileInputStream fis = new FileInputStream(localFile);
        final byte[] buf = new byte[BUFFER_SIZE];
        final long startTime = System.currentTimeMillis();
        long totalLength = 0;

        // only track progress for files larger than 100kb in verbose mode
        final boolean trackProgress = getVerbose() && filesize > HUNDRED_KILOBYTES;
        // since filesize keeps on decreasing we have to store the
        // initial filesize
        final long initFilesize = filesize;
        int percentTransmitted = 0;

        try {
            if (this.getVerbose()) {
                log("Sending: " + localFile.getName() + " : " + localFile.length());
            }
            while (true) {
                final int len = fis.read(buf, 0, buf.length);
                if (len <= 0) {
                    break;
                }
                out.write(buf, 0, len);
                totalLength += len;

                if (trackProgress) {
                    percentTransmitted = trackProgress(initFilesize,
                                                       totalLength,
                                                       percentTransmitted);
                }
            }
            out.flush();
            sendAck(out);
            waitForAck(in);
        } finally {
            if (this.getVerbose()) {
                final long endTime = System.currentTimeMillis();
                logStats(startTime, endTime, totalLength);
            }
            fis.close();
        }
    }

    /**
     * Get the local file
     * @return the local file
     */
    public File getLocalFile() {
        return localFile;
    }

    /**
     * Get the remote path
     * @return the remote path
     */
    public String getRemotePath() {
        return remotePath;
    }

    /**
     * Set the file mode, defaults to 0644.
     * @since Ant 1.9.5
     */
    public void setFileMode(int fileMode) {
        this.fileMode = fileMode;
    }

    /**
     * Get the file mode.
     * @since Ant 1.9.5
     */
    public int getFileMode() {
        return fileMode != null ? fileMode.intValue() : DEFAULT_FILE_MODE;
    }

    /**
     * Set the dir mode, defaults to 0755.
     * @since Ant 1.9.5
     */
    public void setDirMode(int dirMode) {
        this.dirMode = dirMode;
    }

    /**
     * Get the dir mode.
     * @since Ant 1.9.5
     */
    public int getDirMode() {
        return dirMode != null ? dirMode.intValue() : DEFAULT_DIR_MODE;
    }

}
