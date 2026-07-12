#!/bin/bash

cd ztimer/
make librelane && make copy-final
cd ..
make librelane
