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

/*Amount of users growing over time for a product.
Task: Calculate the user growth for product*/

SELECT 
	a.week_num, a.number, 
    LAG(a.number) OVER(ORDER BY a.week_num) as previous_week_val, 
	a.number -  LAG(a.number) OVER(ORDER BY a.week_num) as growth, 
	IF (a.number -  LAG(a.number) OVER(ORDER BY a.week_num)>0, 'growing','losing') 

FROM
	(SELECT extract(week FROM occurred_at) as "week_num", count(event_type) as number
	FROM `table-2 events`
	WHERE event_type = 'signup_flow'
	GROUP BY 1) as a
ORDER BY 1


/*Calculate the weekly engagement per device?*/
SELECT 
    EXTRACT(WEEK FROM `occurred_at`) AS week_num,
    device,
    COUNT(DISTINCT user_id) AS no_of_users
FROM
    `table-2 events`
WHERE
    event_type = 'engagement'
GROUP BY 1 , 2
ORDER BY 1 , 3


/*Calculate the email engagement metrics?*/
SELECT count(distinct user_id), action, user_type 
FROM `operation analytics and investigating metric spike`.`table-3 email_events`;
GROUP BY 1
WHERE action = 'email_clickthrough'
