WITH CTE AS (

SELECT 
to_timestamp(started_at) AS Started_at,
DATE(to_timestamp(started_at)) AS Date_started_at,
HOUR(to_timestamp(started_at)) AS Hour_started_at,
CASE WHEN DAYNAME(to_timestamp(started_at)) in ('Sat','Sun')
THEN 'WEEKEND'
ELSE 'BUSINESSDAY'
END AS DAY_TYPE,

CASE WHEN MONTH(TO_TIMESTAMP(STARTED_AT)) in (12,1,2)
THEN 'WINTER'
WHEN MONTH(TO_TIMESTAMP(STARTED_AT)) in (3,4,5)
THEN 'SPRING'
WHEN MONTH(TO_TIMESTAMP(STARTED_AT)) in (6,7,8)
THEN 'SUMMER'
ELSE 'AUTUMN'
END AS STATION_OF_YEAR
FROM 
{{ source('demo', 'BIKE') }}
WHERE STARTED_AT != 'started_at'
)

SELECT 
*
FROM 
CTE