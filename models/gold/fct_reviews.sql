WITH reviews AS (
    SELECT * FROM {{ ref('silver_reviews') }}
),

listings AS (
    SELECT * FROM {{ ref('silver_listings') }}
),

hosts AS (
    SELECT * FROM {{ ref('silver_hosts') }}
),

guests AS (
    SELECT * FROM {{ ref('silver_guests') }}
)

SELECT
    reviews.REVIEW_ID,
    reviews.BOOKING_ID,
    reviews.LISTING_ID,
    reviews.HOST_ID,
    reviews.GUEST_ID,
    reviews.REVIEW_DATE,
    reviews.OVERALL_RATING,
    reviews.SENTIMENT,
    listings.PROPERTY_TYPE,
    listings.ROOM_TYPE,
    listings.CITY,
    listings.COUNTRY,
    hosts.HOST_NAME,
    guests.GUEST_NAME,
    reviews.CREATED_AT
FROM reviews
LEFT JOIN listings
    ON reviews.LISTING_ID = listings.LISTING_ID
LEFT JOIN hosts
    ON reviews.HOST_ID = hosts.HOST_ID
LEFT JOIN guests
    ON reviews.GUEST_ID = guests.GUEST_ID
