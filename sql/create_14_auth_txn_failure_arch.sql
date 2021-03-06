Prompt drop TABLE AUTH_TXN_FAILURE;
ALTER TABLE AUTH_TXN_FAILURE
 DROP PRIMARY KEY CASCADE
/

DROP TABLE AUTH_TXN_FAILURE CASCADE CONSTRAINTS
/

Prompt Table AUTH_TXN_FAILURE;
--
-- AUTH_TXN_FAILURE  (Table) 
--
CREATE TABLE AUTH_TXN_FAILURE
(
  TXN_ID    INTEGER,
  SEQ_ID    NUMBER(3),
  MESSAGE   VARCHAR2(1024 BYTE),
  FREETEXT  VARCHAR2(1024 BYTE),
  VERSION   NUMBER(18)
) TABLESPACE tables_arch
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING
/


Prompt Index IDX_AUTH_TXN_FAILURE_PK;
--
-- IDX_AUTH_TXN_FAILURE_PK  (Index) 
--
CREATE UNIQUE INDEX IDX_AUTH_TXN_FAILURE_PK ON AUTH_TXN_FAILURE
(TXN_ID, SEQ_ID)
LOGGING
NOPARALLEL
/


-- 
-- Non Foreign Key Constraints for Table AUTH_TXN_FAILURE 
-- 
Prompt Non-Foreign Key Constraints on Table AUTH_TXN_FAILURE;
ALTER TABLE AUTH_TXN_FAILURE ADD (
  CONSTRAINT IDX_AUTH_TXN_FAILURE_PK
  PRIMARY KEY
  (TXN_ID, SEQ_ID)
  USING INDEX IDX_AUTH_TXN_FAILURE_PK
  ENABLE VALIDATE)
/

-- 
-- Foreign Key Constraints for Table AUTH_TXN_FAILURE 
-- 
Prompt Foreign Key Constraints on Table AUTH_TXN_FAILURE;
ALTER TABLE AUTH_TXN_FAILURE ADD (
  CONSTRAINT IDX_AUTH_TXN_FAILURE_FK 
  FOREIGN KEY (TXN_ID, SEQ_ID) 
  REFERENCES AUTH_TXN (TXN_ID,SEQ_ID)
  ENABLE NOVALIDATE)
/
