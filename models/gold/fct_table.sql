WITH obt AS (
    SELECT * FROM {{ ref('obt') }}
),

dim_listings AS (
    SELECT * FROM {{ ref('dim_listings') }}
    WHERE DBT_VALID_TO = '9999-12-31'
),

dim_hosts AS (
    SELECT * FROM {{ ref('dim_hosts') }}
    WHERE DBT_VALID_TO = '9999-12-31'
)

SELECT
    obt.BOOKING_ID,
    obt.LISTING_ID,
    obt.HOST_ID,
    obt.TOTAL_AMOUNT,
    obt.SERVICE_FEE,
    obt.CLEANING_FEE,
    obt.ACCOMMODATES,
    obt.BEDROOMS,
    obt.BATHROOMS,
    obt.PRICE_PER_NIGHT,
    obt.RESPONSE_RATE,
    obt.BOOKING_DATE,
    dim_listings.PROPERTY_TYPE,
    dim_listings.ROOM_TYPE,
    dim_listings.CITY,
    dim_listings.COUNTRY,
    dim_hosts.HOST_NAME,
    dim_hosts.IS_SUPERHOST
FROM obt
LEFT JOIN dim_listings
    ON obt.LISTING_ID = dim_listings.LISTING_ID
LEFT JOIN dim_hosts
    ON obt.HOST_ID = dim_hosts.HOST_ID
