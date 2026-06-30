select *
from {{ source('staging', 'listings') }}