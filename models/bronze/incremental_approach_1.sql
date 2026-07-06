{% set incremental_flag = 1 %}
{% set incremental_col = 'created_at' %}


SELECT *
FROM {{ source('staging', 'bookings') }}


 {% if incremental_flag == 1 %}
    WHERE {{ incremental_col }} > (SELECT COALESCE(MAX({{ incremental_col }}), '1900-01-01') FROM {{ this }}) 
        {# Can also write: {{ ref('incremental_approach_1') }} #}
{% endif %}


{# 
 -- This model did not run the first time because we reference {{ this }}, which has not been created yet. 
 -- First run the model without the incremental logic.

 -- new records would just append/DUPLICATE. This suplicate scenario is handled in approach_2.sql
#}

