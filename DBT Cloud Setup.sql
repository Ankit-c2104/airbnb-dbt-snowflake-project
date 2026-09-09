
--commands ran in cursor terminal
openssl genrsa 2048 | openssl pkcs8 -topk8 -inform PEM -out svc_semantic_layer_rsa_key.p8 -nocrypt // no need of a Passphrase, keep it empty
openssl rsa -in svc_semantic_layer_rsa_key.p8 -pubout -out svc_semantic_layer_rsa_key.pub

// this gives public key to use in RSA_PUBLIC_KEY while creating service token in SNF
cat svc_semantic_layer_rsa_key.pub

// this command gives private key to use in semantic layer config in dbt cloud
--cat svc_semantic_layer_rsa_key.p8 




--cat svc_semantic_layer_rsa_key.pub 
// this gives public key to use in RSA_PUBLIC_KEY while creating service token

-----BEGIN PUBLIC KEY-----
MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEApWxAQCUZsUIX74xV62Zu
ZIZBb7W2ZVsMXKzS0N60s7/C6rfxjQ7NJOpizrcxgHioReVgrcIl2Cxz6Envt3Dh
vJ9YOGCPHCpD2M5NAJSQnC0UA4j/Rm7oedOA4PZ97NFvs4jGr4oFhaOk9KO4VXJR
YQCQICdD3OQUFzwx8ZMzLtSBbUiSKPA/MLfuv8KQB8UMRvPw2HLIGX62tWeMSogr
pVps9dLbaHQ5hLcPer1FV6R4TztOi+6/YK5N6o+YGToWBRALDIRNBjwNusnoKsyB
Slb3gbwKVNQYbtBtf7FsIgiqLU49GN719xOyVSJ5tdSzfMNlzfqL7hGAl/Egb9iB
0wIDAQAB
-----END PUBLIC KEY-----

-- New private key being used in dbt cloud for user SVC_SEMANTIC_LAYER created specially for semantic usage. 
-- Entering this in Semantic layer config
// private key to use in semantic layer config in dbt cloud
--cat svc_semantic_layer_rsa_key.p8 

-----BEGIN PRIVATE KEY-----
MIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQClbEBAJRmxQhfv
jFXrZm5khkFvtbZlWwxcrNLQ3rSzv8Lqt/GNDs0k6mLOtzGAeKhF5WCtwiXYLHPo
Se+3cOG8n1g4YI8cKkPYzk0AlJCcLRQDiP9Gbuh504Dg9n3s0W+ziMavigWFo6T0
o7hVclFhAJAgJ0Pc5BQXPDHxkzMu1IFtSJIo8D8wt+6/wpAHxQxG8/DYcsgZfra1
Z4xKiCulWmz10ttodDmEtw96vUVXpHhPO06L7r9grk3qj5gZOhYFEAsMhE0GPA26
yegqzIFKVveBvApU1Bhu0G1/sWwiCKotTj0Y3vX3E7JVInm11LN8w2XN+ovuEYCX
8SBv2IHTAgMBAAECggEAT9JB2JHuaVWqphkR9oJZP2F3HtfQeOzrtKZiHY5xJJEi
FU+IG5gqTidZYUUNel/+VqfdtEqMJ1kf3tUaempaSsGa+K1DMQSF845sopyNgQbR
cvk+sLZgsDRqKmNWlRjkbP3RXa/chUVXGgMMNhLxCL0UTqeTu/lEZofR069DUdNK
7tPozRUJZm4MMfo2PqjIMWbdzHU9EeJK/Xdxgevs5TqFzRvMWZGzvKGxhIcd2IJg
lMrY6soVkfgxw+hO/k5e16DD9kkvjHEgofOqVz4sTB8lohTzxHAVRcxOgwZ8KdXc
5h4XSXVdiIaW+5VYqFL2ckbarS+QM7kYwEM46ah+rQKBgQDZis5Lozqp32XyupNz
Q3G/28cxJ0Lr44uBVQFM/n/3EtyXn/lX5128Oidm4ovgcQzXK4qM1S0XLQFy2Bw6
RjbP6iVn4Mo/6WqKGmYJmTag1AKhZjy93pFQ0bKQI7LeRWBx0uR8KpybdAtu8bar
D8SGsf2IMMjOb68Lst33kDaV7QKBgQDCqrTrogxLrv6r1SS/qAtfmlddVhlUtibI
yfQvedbsSNRa5tvm8XpPNd3BmVM/3jdJhfBhLEVmc6uHwD0hEIFgV4M8cAueyRV0
+0kAwnwTsdR3QW5O18TxBZnyM7Ez2jQ7zUnshOcCy/QIfGeI96ynZIPwOYUHb/j+
+wmW9CR+vwKBgBnBTEE6NwTLlRdSrYhU8M+lJoUUP+ELlIWgWcIS03Wd/w3Ye73D
f558SBPvOF4/JCUJW6LmzirTQjuliFoB3BVrhDgzLd65NMra6z+xqv0JfLI9F23n
Ps8RtJFKGLAmCJARRsnIhbgF2iCtb1H7UOodgoWwOOXv5Qp+h7b6lOvVAoGAfP6h
lt+BZ6Ng0TLWGt4rF2MCD+N19mfTdX//c/CW6TdGa2vq7VpGf9AFqQbrZoooE+SV
2b9UfJlvHYZ5ed6gRB1NHiSPwZA6X9fuIze99eNsmnp/+s4fHefL1rIMaVAF1BRY
EC+yKaCN/FjtHgxyZzVqZnh4i7MBPbAxkyUGvf8CgYAkyJE/TA2GGkvHSyVbAHBn
DSNe+zvh6HTDZL8Bg72lBFpPb8PP2BjjJ3Vn25LUyX3kcqmVBsYR/puB+9jISFIj
peb/58b92ZH/SB+LySs/KDae4fHfa1ujSds6QZ3E/a5yXPeBRGHnk/FQPIf0HCc8
jcH87meyPWcCNcXpxs5/2A==
-----END PRIVATE KEY-----



// Dbt cloud srvice token for - claude-mcp-service-token

-- Important Note - give Admin / Developer Permission to the token to be able to use the token, otherwise it will give "insufficient priviliges error"
// The below token is generated while creating the token. Use it in claude's deveopers edit confit
// NEWW
dbtc_lG6U6Iw4LGQi6AM1Y6wy7dXkYoGJnVBzwMytHiCpalPCo8FzY0




In snowflake:

-- Run as ACCOUNTADMIN (or a role with MANAGE GRANTS / role-creation privileges)


-- 1. Create a read-only role scoped to the Semantic Layer's needs
CREATE ROLE IF NOT EXISTS SEMANTIC_LAYER_QUERY;

-- 2. Grant warehouse usage (needed to execute queries)
GRANT USAGE ON WAREHOUSE TRANSFORMING TO ROLE SEMANTIC_LAYER_QUERY;

-- 3. Grant database + schema usage
GRANT USAGE ON DATABASE AIRBNB TO ROLE SEMANTIC_LAYER_QUERY;
GRANT USAGE ON SCHEMA AIRBNB.GOLD_SCHEMA TO ROLE SEMANTIC_LAYER_QUERY;

-- 4. Grant SELECT only, on existing AND future tables/views in the gold schema
--    (the Semantic Layer only reads from fct_/dim_ models, never writes)
GRANT SELECT ON ALL TABLES IN SCHEMA AIRBNB.GOLD_SCHEMA TO ROLE SEMANTIC_LAYER_QUERY;
GRANT SELECT ON FUTURE TABLES IN SCHEMA AIRBNB.GOLD_SCHEMA TO ROLE SEMANTIC_LAYER_QUERY;
GRANT SELECT ON ALL VIEWS IN SCHEMA AIRBNB.GOLD_SCHEMA TO ROLE SEMANTIC_LAYER_QUERY;
GRANT SELECT ON FUTURE VIEWS IN SCHEMA AIRBNB.GOLD_SCHEMA TO ROLE SEMANTIC_LAYER_QUERY;

-- 5. Attach the role to a service user
--    (reuses your existing key pair — no new key needed, just a role switch)
--GRANT ROLE SEMANTIC_LAYER_QUERY TO USER ankitc;
USE ROLE SECURITYADMIN;

CREATE or replace USER SVC_SEMANTIC_LAYER
  TYPE = SERVICE
  DEFAULT_ROLE = SEMANTIC_LAYER_QUERY
  DEFAULT_WAREHOUSE = TRANSFORMING
  RSA_PUBLIC_KEY = 'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEApWxAQCUZsUIX74xV62Zu
ZIZBb7W2ZVsMXKzS0N60s7/C6rfxjQ7NJOpizrcxgHioReVgrcIl2Cxz6Envt3Dh
vJ9YOGCPHCpD2M5NAJSQnC0UA4j/Rm7oedOA4PZ97NFvs4jGr4oFhaOk9KO4VXJR
YQCQICdD3OQUFzwx8ZMzLtSBbUiSKPA/MLfuv8KQB8UMRvPw2HLIGX62tWeMSogr
pVps9dLbaHQ5hLcPer1FV6R4TztOi+6/YK5N6o+YGToWBRALDIRNBjwNusnoKsyB
Slb3gbwKVNQYbtBtf7FsIgiqLU49GN719xOyVSJ5tdSzfMNlzfqL7hGAl/Egb9iB
0wIDAQAB'  -- paste from step 1
  COMMENT = 'Service identity for dbt Cloud Semantic Layer credential — never grant to a human user';

GRANT ROLE SEMANTIC_LAYER_QUERY TO USER SVC_SEMANTIC_LAYER;

-- 6. Verify
SHOW GRANTS TO ROLE SEMANTIC_LAYER_QUERY;

SHOW GRANTS OF ROLE SEMANTIC_LAYER_QUERY;  -- should list only SVC_SEMANTIC_LAYER

use role SEMANTIC_LAYER_QUERY;
use warehouse transforming;
use schema airbnb.gold_schema;

select * from fct_bookings;



