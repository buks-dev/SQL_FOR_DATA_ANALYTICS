CREATE TABLE job_applied(
    job_id INT,
    application_sent_date DATE,
    custom_resume Boolean,
    resume_file_name VARCHAR(255),
    cover_letter_sent BOOLEAN,
    cover_letter_file_name VARCHAR,
    status VARCHAR(50)
);

INSERT INTO job_applied (
    job_id,
    application_sent_date,
    custom_resume,
    resume_file_name,
    cover_letter_sent,
    cover_letter_file_name,
    status
  )
VALUES(
    1,
    '2024-02-01',
    true,
    'resume_01.pdf',
    true,
    'cover_letter_01.pdf',
    'submitted'
);



INSERT INTO job_applied (
    job_id,
    application_sent_date,
    custom_resume,
    resume_file_name,
    cover_letter_sent,
    cover_letter_file_name,
    status
  )
VALUES 
(2,'2024-03-22',true,'resume_02.pdf',true,'cover_letter_02.pdf','Interview scheduled'),
(3,'2024-04-11',true,'resume_03.pdf',true,'cover_letter_03.pdf','ghosted'),
(4,'2024-05-13',true,'resume_04.pdf',false,NULL,'submitted'),
(5,'2024-06-09',true,'resume_05.pdf',true,'cover_letter_05.pdf','rejected');


ALTER TABLE job_applied
ADD contact VARCHAR(50);

ALTER TABLE Job_applied
RENAME COLUMN job_id TO id; 

UPDATE job_applied
SET contact = 'John Doe'
WHERE job_id = 1;

UPDATE job_applied
SET contact = 'Ayase Momo'
WHERE job_id = 2;

UPDATE job_applied
SET contact = 'Takakura Ken'
WHERE job_id = 3;

UPDATE job_applied
SET contact = 'Yagami Light'
WHERE job_id = 4;

UPDATE job_applied
SET contact = 'Ayanokoji Kiotaka'
WHERE job_id = 5;

ALTER TABLE Job_applied
RENAME contact TO contact_name;


ALTER TABLE Job_applied
ALTER COLUMN contact_name type text;

ALTER TABLE Job_applied
DROP COLUMN contact_name;

DROP TABLE  job_applied;


SELECT *
FROM job_applied;