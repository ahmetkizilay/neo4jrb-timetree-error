#! /bin/bash

SERVER_URL=http://localhost:7474
http POST ${SERVER_URL}/db/data/transaction --verbose < ./requests/delete-all.json

read -p 'ENTER transaction no: ' TX;

http POST ${SERVER_URL}/db/data/transaction/${TX} --verbose < ./requests/timetree.json
http POST ${SERVER_URL}/db/data/transaction/${TX}/commit --verbose