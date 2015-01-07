SET default_storage_engine=MYISAM;
-- insert SQL here.
CREATE TABLE `carbarn`( 
`readme` LONGTEXT, -- seeded from dbreadme.txt in the job directory, then 'DATEDATE' and 'XXXXXX' is replaced with the actual date and record count.
`records` VARCHAR(32), -- set to human-readable number of records in main table.
`date` VARCHAR(64)  -- set to human-readable date string.
);
INSERT INTO carbarn (readme,records,date) VALUES('',0,'');
