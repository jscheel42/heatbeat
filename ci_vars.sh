#!/bin/bash

sed -i -e "s/\${PORT}/$PORT/g" \
  -e "s/\${HOST}/$HOST/g" \
  -e "s/\${SECRET_KEY_BASE}/$SECRET_KEY_BASE/g" \
  -e "s/\${DB_HOST}/$DB_HOST/g" \
  -e "s/\${DB_PORT}/$DB_PORT/g" \
  -e "s/\${DB_NAME}/$DB_NAME/g" \
  -e "s/\${DB_USER}/$DB_USER/g" \
  -e "s/\${DB_PASS}/$DB_PASS/g" $1
  
