{% macro multiply(x, y) %}
    round({{ x }} * {{ y }}, 2)
{% endmacro %}