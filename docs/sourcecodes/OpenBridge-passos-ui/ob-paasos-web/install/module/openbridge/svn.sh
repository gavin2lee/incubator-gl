#!/bin/bash

# 安装openbridge-subversion
# wangxinxiang@yihecloud.com
# 2016-07-26

OPTS=$(getopt -o h:P:u:p: --long registry:,data_dir:: -- "$@")
if [ $? != 0 ]; then
  echo "[ERROR] 参数错误！"
  usage;
  exit 1
fi

eval set -- "$OPTS"

registry="docker.yihecloud.com:443"
version="1.0"
db_port="3306"
data_dir="/data/subversion"

db_host=
db_user=
db_pswd=

while true; do
  case "$1" in
  -h) db_host=$2; shift 2;;
  -P) db_port=$2; shift 2;;
  -u) db_user=$2; shift 2;;
  -p) db_pswd=$2; shift 2;;
  --registry) registry=$2; shift 2;;
  --data_dir) data_dir=$2;   shift 2;;
  --) shift; break;;
  esac
done

function check_opt() {
  arg="\$$1"
  if [ "$(eval echo $arg)"  = "" ]; then
    echo "[ERROR] <$1> 参数缺失！"
    usage;
    exit 1
  fi
}

function usage() {
  echo "
Usage: $0 
  -h <db_host> 
  -P <db port>, default: 3306
  -u <db_user> 
  -p <db_pswd> 
  --registry <docker registry>, default: docker.yihecloud.com:443
  --data_dir <subversion data directory>, default: /data/subversion
"
}

# check options
check_opt "registry"
check_opt "db_host"
check_opt "db_user"
check_opt "db_port"
check_opt "db_pswd"

# change directory user.
chown apache:apache -R $data_dir

# run docker image
docker run -dti --name svn \
  --restart=always \
  -e DB_HOST=$db_host \
  -e DB_PORT=$db_port \
  -e DB_USER=$db_user \
  -e DB_PASSWORD=$db_pswd \
  -e DB_DATABASE=openbridge \
  -v $data_dir:/data/ \
  -p 9090:80 \
  $registry/openbridge/svnservice:$version

# show status
docker ps |grep "svn"