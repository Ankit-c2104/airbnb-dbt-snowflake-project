select *
from {{ source('staging', 'hosts') }}