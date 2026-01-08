#!/bin/bash

docker compose exec -T mongos_router1 mongosh --port 27020 --quiet <<EOF
sh.addShard("shard1/shard1a:27018,shard1b:27028,shard1c:27038");
sh.addShard("shard2/shard2a:27019,shard2b:27029,shard2c:27039");
sh.enableSharding("somedb");
sh.shardCollection("somedb.helloDoc", { "name" : "hashed" } )
use somedb
for(var i = 0; i < 1000; i++) db.helloDoc.insert({age:i, name:"ly"+i})
EOF

echo
read -r -p "Готово. Нажми Enter чтобы закрыть..." _
