//DBT Cloud Setup

-- Run this command in the terminal in the IDE:
openssl pkcs8 -topk8 -inform PEM -outform PEM \
  -in ~/.snowflake_keys/rsa_key.p8 \
  -out ~/.snowflake_keys/rsa_key_encrypted.p8 \
  -v2 aes256

-- Enter paraphrase twice, it can be any text. Save it:
eg: hellowworld -- use it in dbt cloud's "Private key passphrase" section


-- Run the command
cat ~/.snowflake_keys/rsa_key_encrypted.p8

-- Private key will be generated, copy the entire key form begin to end, including it.

-----BEGIN ENCRYPTED PRIVATE KEY-----
MIIFNTBfBgkqhkiG9w0BBQ0wUjAxBgkqhkiG9w0BBQwwJAQQfjGmEFwAC88Z3SvI
o86TBQICCAAwDAYIKoZIhvcNAgkFADAdBglghkgBZQMEASoEEDX3lsMXbgJnlc+F
zYEYsCwEggTQ1MWULxBYQi0OfpvmASnSf4O4veIMPEju3VQt4mfRf9jDOgWATBRx
fMSVZ3gb7W7UeB4RTz+QQywlBoJ3fe9P+fyyYFOOsR/ignYZljxTpMaJNVYP0E7s
Qw7k8Q6s/Tc2lfiKNX5JGzBIdKasCUu7IE4zb891uyBiWFYGqBoDLTaPKGRaoSb8
pYLHUWE6wzZJ/kPtA1H6o+dPMziOWdNYhmk9mtAdUIxATkoAT5y7CsDwLKjWfI+3
Ox+aLGdS5IUMRpai3hrbVhcSiOZlrI7tby+Ec22AM3pQWxfREZ3IOcU2tKVpDkTw
wuVwmkr8QgYk0alAAqV5EWv0KXul9/pY3C18kzmyCvhcHLw5nMigusQDK9OsjiBD
X9fcPF4rwI4RaPFvMbhkkmj4MXCz0q040oYignKU2QFCz8tqQD3PfnE0Y7+92Ziz
YJV66U/7AxbG4FCT6CqzrG2O7O6GvX//LkWXlfd0O8LQJq1jc0NRBvM2rWRu3+VL
fvi3adnxFjFxzXrgjmeyzgL5of1KPg5ngVoLDK77Hlzq7CPLimLp5k1Fiz4fX1hm
yQDDlQBMCQvfXtZuRkVDAQoF5G1UK5QSgRnEKR+net9vND7xfjCiWzeas5jmCkg1
4bqG8da2S2F/LqvEyA1+fuSP3fSiZucsyzIxB6spx1pXRqYbXderR3YCXnBRe7N6
HE3q5WC3TQ3zlci3SwKDuL6SQrpxCLIjRQFd3pAMQLH1j+vJWfEGInKBFXvO3TyY
xsKQne+1QkqnVw6uEELr84VC0RLen/bp04i8H+j48ZU/umi0SchudQuxZkUS1hQY
JcdS4XHy0ARHqXYyml7DR3GXwzaw+JBVtv0PQcUieYpE8+cJ5f+tVBvE7oAfzbMC
hQw4x5XafEfwUQLwB7eT8Crpt8jWRqWSSmJI+NV/2MgUWWPUS9BO6tuG0a9ed5cY
udr6Xgs7PjVFKGR9UlFgHpHw7SEMnekQ7vMXciNfbyuFNomUNI4LWx3LoSUm2zx1
kmu3ibdY9EfYN3p/sFucsH+TdPqSmO2oKhNa596nMRPrDNwRbaydOtYkHfUFeSE3
egYY9DSWIJJHCiezeDPN2kMBjsYRjtaLBDP5tvXOLH4Nzv4u78CnCu+ufL5MfNl6
9+4vBHSy+OlTIwWphV0AHStNAtEtneTwfVq5O5KFpL+r3T5IXJ1KTw7fx2Jd4fVe
Qj3f1uRdUFqmp59Ig7nDswIEt8Bjqr602jRndUwqhhqVCZrM0ErnMSQrwHqQqEmP
jJo89GTKN2yH4TuK87WCG1UIUlyboW/1HjvXOPWQ0rDZu47l2DLN8F0UtZAFIHBz
Y+/EmzPk7DmCnTjT+NkoFJs1FEgMiDWIcJhhH4kHztPF7W1lWPGRecDJf3wGIvTu
ctwW/rTi5qrLFJrrVqxM0q0uOb62q4PEPLk86kXYjXGv6NeCmLVJWyAPaHvdft7I
D2P5y3C7oWjnWHLwau3BBKm7UQWZQRq6CigceMjIIbfSBdl+4lQs+hlkzStJsJyV
7XRIdUKoxjKkJn/sMamICVVatZ4pdy1NKIDlFdSkH1HviaDj1ds+4F5mT/Cp2n7x
VWkDIydA+fNVIZv3pyHYaWzwVtDYNFwO6lwro2vrV/tkii1Zr7fSQnA=
-----END ENCRYPTED PRIVATE KEY-----


// Use the private key along with paraphrase to connect to datawarehouse.