CREATE TABLE CF_NOTIFICATIONS_PWA_HISTORY 
(
  ID NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY INCREMENT BY 1 MAXVALUE 9999999999 MINVALUE 1 NOCACHE NOT NULL 
, STARTER_ID NUMBER 
, STARTER_NOTIFICATION_ID NUMBER 
, NOTIFICATION_ID NUMBER 
, CREATED_BY VARCHAR2(100 CHAR) NOT NULL 
, CREATED_ON DATE NOT NULL 
, MODIFIED_BY VARCHAR2(100 CHAR) 
, MODIFIED_ON DATE 
, CONSTRAINT PK_NOTIFICATION_HISTORY PRIMARY KEY (ID)
, CONSTRAINT FK_NOTIFICATIONS_NOTIFICATION_HISTORY FOREIGN KEY (STARTER_NOTIFICATION_ID) REFERENCES CF_STARTERS_NOTIFICATIONS_PWA (ID)
, CONSTRAINT FK_NOTIFICATIONS_PWA_NOTIFICATION_HISTORY FOREIGN KEY (NOTIFICATION_ID) REFERENCES CF_NOTIFICATIONS_PWA (ID)
, CONSTRAINT FK_STARTERS_NOTIFICATION_HISTORY FOREIGN KEY (STARTER_ID) REFERENCES CF_STARTERS (ID)
);