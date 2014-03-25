#!/bin/bash

docker build -t="gomezd/storm" storm
docker build -t="gomezd/storm-nimbus" storm-nimbus
docker build -t="gomezd/storm-supervisor" storm-supervisor
docker build -t="gomezd/storm-ui" storm-ui
