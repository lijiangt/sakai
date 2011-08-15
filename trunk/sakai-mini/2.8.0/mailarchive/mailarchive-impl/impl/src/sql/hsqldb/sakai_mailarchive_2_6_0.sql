ALTER TABLE MAILARCHIVE_MESSAGE ADD SUBJECT VARCHAR (255) NULL;
ALTER TABLE MAILARCHIVE_MESSAGE ADD BODY LONGVARCHAR NULL;

CREATE INDEX IE_MAILARC_SUBJECT ON MAILARCHIVE_MESSAGE
(
       SUBJECT                   ASC
);

