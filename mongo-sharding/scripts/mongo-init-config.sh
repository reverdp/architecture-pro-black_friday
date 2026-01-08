#!/bin/bash

docker compose exec -T configSrv1 mongosh --port 27017 --quiet <<EOF
rs.initiate({
  _id: "config_server",
  configsvr: true,
  members: [
    { _id: 0, host: "configSrv1:27017" },
    { _id: 1, host: "configSrv2:27027" },
    { _id: 2, host: "configSrv3:27037" }
  ]
})
EOF

echo
read -r -p "Готово. Нажми Enter чтобы закрыть..." _
