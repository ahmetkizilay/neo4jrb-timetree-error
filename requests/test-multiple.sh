#! /bin/bash

SERVER_URL=http://localhost:7474
for i in {1..100}
do
  http POST ${SERVER_URL}/db/data/transaction --verbose < ./requests/delete-all.json

  http POST ${SERVER_URL}/db/data/transaction/${i} --verbose < ./requests/timetree.json
  http POST ${SERVER_URL}/db/data/transaction/${i}/commit --verbose
done