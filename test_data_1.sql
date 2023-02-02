/*Percentage share of each language: Share of each language for different contents.
Task: Calculate the percentage share of each language in the last 30 days?*/

SELECT 
    b.language AS Language,
    (b.total_number_of_language / a.total_number_of_jobs) * 100 AS 'Percentage Share of Jobs'
FROM
    (SELECT 
        COUNT(job_id) AS total_number_of_jobs
    FROM
        ops) AS a
        CROSS JOIN
    (SELECT 
        language, COUNT(language) AS 'total_number_of_language'
    FROM
        ops
    GROUP BY language) AS b
