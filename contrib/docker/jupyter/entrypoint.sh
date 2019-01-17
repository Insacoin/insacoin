#!/bin/bash

pip install --upgrade -r /requirements.txt

exec tini -g -- $@
