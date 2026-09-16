-- DDL For My Tables

-- CREATE DATABASE AIRBNB;
-- CREATE SCHEMA AIRBNB.STAGING
-- CREATE WAREHOUSE TRANSFORMING USING WEBUI OR USING COMPUTE WH AS DEFAULT

--  Added data using SNOWFLAKE UI from CSV files in Airbnb DBT Project or file format for this 3 tables

-- Refer to Desktop->Airbnb DBt Snowflake Project -> Airbnb DBT project CSV Files -> Snowflake Setup Files & Queries

USE DATABASE AIRBNB;
USE SCHEMA STAGING;

CREATE OR REPLACE TABLE HOSTS (
    host_id NUMBER,
    host_name STRING,
    host_since DATE,
    is_superhost BOOLEAN,
    response_rate NUMBER,
    created_at TIMESTAMP,
    PRIMARY KEY (host_id)
);

-- DROP TABLE HOSTS;

CREATE OR REPLACE TABLE LISTINGS (
    listing_id NUMBER,
    host_id NUMBER,
    property_type STRING,
    room_type STRING,
    city STRING,
    country STRING,
    accommodates NUMBER,
    bedrooms NUMBER,
    bathrooms NUMBER,
    price_per_night NUMBER,
    created_at TIMESTAMP,
    PRIMARY KEY (listing_id)
);

-- DROP TABLE LISTINGS;

CREATE OR REPLACE TABLE BOOKINGS (
    booking_id STRING,
    listing_id NUMBER,
    booking_date TIMESTAMP,
    nights_booked NUMBER,
    booking_amount NUMBER,
    cleaning_fee NUMBER,
    service_fee NUMBER,
    booking_status STRING,
    created_at TIMESTAMP,
    PRIMARY KEY (booking_id)
);

-- file format code to directly load the data without loading it from UI 

/*
USE DATABASE AIRBNB;
USE SCHEMA STAGING;

--  FILE FORMAT
CREATE FILE FORMAT IF NOT EXISTS csv_format
  TYPE = 'CSV' 
  FIELD_DELIMITER = ','
  SKIP_HEADER = 1
  ERROR_ON_COLUMN_COUNT_MISMATCH = FALSE;

show file formats;

-- CREATE STAGE
CREATE OR REPLACE STAGE snowstage
FILE_FORMAT = csv_format
URL='s3://airbnbdataset-ankit/airbnb_source/';
    
show stages;

COPY INTO AIRBNB.STAGING.BOOKINGS
FROM @snowstage
FILES=('bookings.csv')
CREDENTIALS=(aws_key_id = 'AKIAZZLRZYPBGPASK7MY', aws_secret_key = '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');

select * from AIRBNB.STAGING.BOOKINGS;

COPY INTO AIRBNB.STAGING.HOSTS
FROM @snowstage
FILES=('hosts.csv')
CREDENTIALS=(aws_key_id = 'AKIAZZLRZYPBGPASK7MY', aws_secret_key = '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');

select * from AIRBNB.STAGING.HOSTS;

COPY INTO AIRBNB.STAGING.LISTINGS
FROM @snowstage
FILES=('listings.csv')
CREDENTIALS=(aws_key_id = 'AKIAZZLRZYPBGPASK7MY', aws_secret_key = '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');

select * from AIRBNB.STAGING.LISTINGS;


*/

--  Added data using SNOWFLAKE UI from CSV files in Airbnb DBT Project.

-- ============================================================
-- New staging tables: AIRBNB.staging.guests / reviews / payments
-- Mirrors conventions of existing staging.listings/hosts/bookings

-- Refer to Desktop->Airbnb DBt Snowflake Project -> Airbnb DBT project CSV Files -> Snowflake Setup Files & Queries
-- ============================================================

CREATE OR REPLACE TABLE AIRBNB.staging.guests (
    guest_id       NUMBER        NOT NULL,
    guest_name     VARCHAR,
    email          VARCHAR,
    signup_date    DATE,
    country        VARCHAR,
    is_verified    BOOLEAN,
    created_at     TIMESTAMP_NTZ
);

CREATE OR REPLACE TABLE AIRBNB.staging.reviews (
    review_id       VARCHAR       NOT NULL,   -- UUID, matches bookings.booking_id style
    booking_id      VARCHAR       NOT NULL,   -- FK -> bookings.booking_id
    listing_id      NUMBER        NOT NULL,   -- FK -> listings.listing_id
    host_id         NUMBER        NOT NULL,   -- FK -> hosts.host_id
    guest_id        NUMBER        NOT NULL,   -- FK -> guests.guest_id
    review_date     DATE,
    overall_rating  NUMBER(2,0),              -- 1-5
    sentiment       VARCHAR,                  -- positive / neutral / negative (derived)
    created_at      TIMESTAMP_NTZ
);

CREATE OR REPLACE TABLE AIRBNB.staging.payments (
    payment_id       VARCHAR      NOT NULL,   -- UUID
    booking_id       VARCHAR      NOT NULL,   -- FK -> bookings.booking_id
    host_id          NUMBER       NOT NULL,   -- FK -> hosts.host_id
    guest_id         NUMBER,                  -- FK -> guests.guest_id (NULL for payout rows)
    payment_date     DATE,
    payment_type     VARCHAR,                 -- charge / refund / payout
    payment_status   VARCHAR,                 -- completed / pending / failed
    payment_amount   NUMBER(10,2),
    created_at       TIMESTAMP_NTZ
);



select * from AIRBNB.STAGING.GUESTS;
select * from AIRBNB.STAGING.PAYMENTS;
select * from AIRBNB.STAGING.REVIEWS;

ALTER USER ankitc SET DEFAULT_ROLE = 'ACCOUNTADMIN', DEFAULT_WAREHOUSE = 'transforming';

select * from AIRBNB.BRONZE_SCHEMA.BRONZE_REVIEWS;

