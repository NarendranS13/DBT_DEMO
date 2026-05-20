WITH CTE AS (

SELECT 
to_timestamp(started_at) AS Started_at,
DATE(to_timestamp(started_at)) AS Date_started_at,
HOUR(to_timestamp(started_at)) AS Hour_started_at,
{{day_type('STARTED_AT')}} AS DAY_TYPE,
{{get_season('STARTED_AT')}} AS STATION_OF_YEAR

FROM 
{{ source('demo', 'BIKE') }}
WHERE STARTED_AT != 'started_at'
)

SELECT 
*
FROM 
CTE