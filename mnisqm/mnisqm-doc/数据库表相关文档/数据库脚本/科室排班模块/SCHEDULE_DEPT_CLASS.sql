CREATE TABLE SCHEDULE_DEPT_CLASS(
SEQ_ID BIGINT IDENTITY NOT NULL,
DEPT_CODE	VARCHAR(20),
STATUS	VARCHAR(2),
CLASS_CODE	VARCHAR(20),
CLASS_NAME	VARCHAR(50),
START_TIME	VARCHAR(5),
END_TIME	VARCHAR(5),
CREATE_TIME	datetime,
UPDATE_TIME	datetime,
CREATE_PERSON	varchar(20),
UPDATE_PERSON	varchar(20)
)