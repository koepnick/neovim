#!/usr/bin/env python3
import os
from pprint import pprint
import json

filename = '/home/skoepnick/.config/nvim/coc-settings.json'

with open(filename, 'r') as fh:
    config = json.load(fh)

pprint(config)
