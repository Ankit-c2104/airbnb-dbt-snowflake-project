WITH obt AS (
    SELECT * FROM {{ ref('obt') }}
),

-- as-of join inputs: each version tagged with its entity's earliest captured
-- DBT_VALID_FROM, so bookings that predate any captured snapshot history
-- fall back to the earliest known version instead of matching nothing.
dim_listings AS (
    SELECT
        *,
        MIN(DBT_VALID_FROM) OVER (PARTITION BY LISTING_ID) AS FIRST_VALID_FROM
    FROM {{ ref('dim_listings') }}
),

dim_hosts AS (
    SELECT
        *,
        MIN(DBT_VALID_FROM) OVER (PARTITION BY HOST_ID) AS FIRST_VALID_FROM
    FROM {{ ref('dim_hosts') }}
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
    obt.BOOKING_STATUS,
    dim_listings.PROPERTY_TYPE,
    dim_listings.ROOM_TYPE,
    dim_listings.CITY,
    dim_listings.COUNTRY,
    dim_hosts.HOST_NAME,
    dim_hosts.IS_SUPERHOST
FROM obt
LEFT JOIN dim_listings
    ON obt.LISTING_ID = dim_listings.LISTING_ID
    AND obt.BOOKING_DATE < dim_listings.DBT_VALID_TO
    AND (
        obt.BOOKING_DATE >= dim_listings.DBT_VALID_FROM
        OR dim_listings.DBT_VALID_FROM = dim_listings.FIRST_VALID_FROM
    )
LEFT JOIN dim_hosts
    ON obt.HOST_ID = dim_hosts.HOST_ID
    AND obt.BOOKING_DATE < dim_hosts.DBT_VALID_TO
    AND (
        obt.BOOKING_DATE >= dim_hosts.DBT_VALID_FROM
        OR dim_hosts.DBT_VALID_FROM = dim_hosts.FIRST_VALID_FROM
    )


