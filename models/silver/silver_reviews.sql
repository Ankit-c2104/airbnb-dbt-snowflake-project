{{ config(materialized = 'incremental', unique_key = 'REVIEW_ID') }}

SELECT
    REVIEW_ID,
    BOOKING_ID,
    LISTING_ID,
    HOST_ID,
    GUEST_ID,
    REVIEW_DATE,
    OVERALL_RATING,
    LOWER(SENTIMENT) AS SENTIMENT,
    CREATED_AT

FROM {{ ref('bronze_reviews') }}
