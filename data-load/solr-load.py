#!/usr/bin/env python3
import json
import uuid
import os
import pysolr

dir = "/Users/amanda/geoblacklight-archive/geoblacklight-docker/data-load/geojson"

def list_files(dir):
    r = []
    for root, dirs, files in os.walk(dir):
        for file in files:
            index_data(root, file)
    return r

def index_data(path, file_name): 
    solr = pysolr.Solr('http://localhost:8983/solr/blacklight-core', timeout=10)

    file = path+"/"+file_name
    file = open(file,'r')

    data = file.read()
    data = json.loads(data)

    print(data)
    response = solr.add([
        data,
    ], commit=True)

list_files(dir)
