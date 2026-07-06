
{% set flag = 1 %}

select *
from {{ ref('bronze_bookings') }}

{% if flag == 1 %}
    where nights_booked > 1
{% else %}
    where nights_booked = 1
{% endif %}