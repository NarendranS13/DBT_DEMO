WITH bike as (

    SELECT
    distinct
    start_statio_id as start_station_id,
    start_station_name,
    start_lat,
    start_lng
    FROM 
    {{source('demo','BIKE')}}
    WHERE RIDE_ID != 'ride_id'
)

SELECT 
*
FROM bike