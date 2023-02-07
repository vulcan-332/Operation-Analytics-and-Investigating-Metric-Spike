/* Calculate the weekly user engagement*/

SELECT 
    EXTRACT(WEEK FROM occurred_at) AS "Week_Number",
    COUNT(Dis_User_Id) as "Number of Distinct Users"
FROM
    (SELECT DISTINCT
        user_id AS Dis_User_ID, occurred_at
    FROM
        `table-2 events`) AS a
GROUP BY Week_Number
