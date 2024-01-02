export ADDRESS=$(grep -o '"address": *"[^"]*"' ./data/keystore/accountKeystore | grep -o '"[^"]*"$' | sed 's/"//g')
export PRIVATE_CONFIG=ignore
nohup geth --datadir data \
        --networkid 10 \
        --nodiscover \
        --verbosity 5 \
        --syncmode full \
        --nousb \
        --raft \
        --raftport 53000 \
        --raftblocktime 300 \
        --emitcheckpoints \
        --http \
        --http.addr 127.0.0.1 \
        --http.port 8545 \
        --http.corsdomain "*" \
        --http.vhosts "*" \
        --ws \
        --ws.addr 127.0.0.1 \
        --ws.port 8546 \
        --ws.origins "*" \
        --http.api admin,trace,db,eth,debug,miner,net,shh,txpool,personal,web3,quorum,raft \
        --ws.api admin,trace,db,eth,debug,miner,net,shh,txpool,personal,web3,quorum,raft \
        --unlock ${ADDRESS} \
        --allow-insecure-unlock \
        --password ./data/keystore/accountPassword \
        --port 30303 \
        > /home/avenbreaks/zerocash/raft/logs/node0.log &