{% macro generate_schema_name(custom_schema_name=none, node=none) -%}
    {%- if custom_schema_name is none -%}
        {{ return(target.schema) }}
    {%- else -%}
        {{ return(custom_schema_name | trim) }}
    {%- endif -%}
{%- endmacro %}

{% macro default__generate_schema_name(custom_schema_name=none, node=none) -%}
    {{ return(generate_schema_name(custom_schema_name, node)) }}
{%- endmacro %}

{% macro generate_schema_name_for_env(custom_schema_name, node) -%}
    {{ return(generate_schema_name(custom_schema_name, node)) }}
{%- endmacro %}

