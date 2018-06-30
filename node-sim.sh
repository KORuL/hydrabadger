#! /bin/bash

export RUST_LOG=hbbft=debug,consensus_node=debug

cargo build

target/debug/hydrabadger --bind-address=127.0.0.1:5000 --remote-address=127.0.0.1:5001 --remote-address=127.0.0.1:5002 --remote-address=127.0.0.1:5003 --remote-address=127.0.0.1:5004 --broadcast-value Foo &
sleep 1
target/debug/hydrabadger --bind-address=127.0.0.1:5001 --remote-address=127.0.0.1:5000 --remote-address=127.0.0.1:5002 --remote-address=127.0.0.1:5003 --remote-address=127.0.0.1:5004 &
sleep 1
target/debug/hydrabadger --bind-address=127.0.0.1:5002 --remote-address=127.0.0.1:5000 --remote-address=127.0.0.1:5001 --remote-address=127.0.0.1:5003 --remote-address=127.0.0.1:5004 &
sleep 1
target/debug/hydrabadger --bind-address=127.0.0.1:5003 --remote-address=127.0.0.1:5000 --remote-address=127.0.0.1:5001 --remote-address=127.0.0.1:5002 --remote-address=127.0.0.1:5004 &
sleep 1
target/debug/hydrabadger --bind-address=127.0.0.1:5004 --remote-address=127.0.0.1:5000 --remote-address=127.0.0.1:5001 --remote-address=127.0.0.1:5002 --remote-address=127.0.0.1:5003 &
wait
