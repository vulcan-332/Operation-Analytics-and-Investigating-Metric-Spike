/*Number of jobs reviewed: Amount of jobs reviewed over time.
Task: Calculate the number of jobs reviewed per hour per day for November 2020?*/

SELECT 
    ds AS Date, COUNT(actor_id) / 24 AS 'Reviews Per Hour'
FROM
    Ops
WHERE
    ds BETWEEN '2020-11-01' AND '2020-11-30'
GROUP BY ds
ORDER BY ds



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
    
    

/*Duplicate rows: Rows that have the same value present in them.
Task: Let’s say you see some duplicate rows in the data. Display duplicates from the table*/
SELECT 
    a.language,
    a.num AS instances,
    IF(a.num = 1, 'Unique', 'Duplicate') AS Identifier,
    time_taken_per_language
FROM
    (SELECT 
        COUNT(*) AS num,
            language,
            SUM(time_spent) AS time_taken_per_language
    FROM
        ops
    GROUP BY job_id , language
    ORDER BY job_id) AS a
ORDER BY instances DESC
