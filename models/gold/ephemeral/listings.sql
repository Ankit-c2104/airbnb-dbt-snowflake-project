{{
  config(
    materialized = 'ephemeral',
    )
}}

WITH listings AS
(
    SELECT
        LISTING_ID,
        PROPERTY_TYPE,
        ROOM_TYPE,
        CITY,
        COUNTRY,
        PRICE_PER_NIGHT_TAG,
        LISTING_CREATED_AT
    FROM
        {{ ref('obt') }}
    QUALIFY ROW_NUMBER() OVER (PARTITION BY LISTING_ID ORDER BY LISTING_CREATED_AT DESC) = 1
)
SELECT * FROM listings