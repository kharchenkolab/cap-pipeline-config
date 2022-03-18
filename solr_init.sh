#!/usr/bin/env bash
#
# This script will be used at the end of pipeline deployment
# It indexes the solr.json which is generated by dumps data pipeline, configures
# the ontology schema by using solr_config.sh for partial search capability.
# Re-indexing is also takes place in order to generate newly added fields in the
# solr collection



echo "Indexing ontology collection in server localhost:8993"
curl --location --request POST 'http://localhost:8993/solr/ontology/update/json?commit=true' --header 'Content-Type: application/json' --data-binary '@solr.json'

echo "Configuring ontology schema in server localhost:8993"
bash solr_config.sh -h localhost -p 8993

echo "Re-indexing ontology collection in server localhost:8993"
curl --location --request POST 'http://localhost:8993/solr/ontology/update/json?commit=true' --header 'Content-Type: application/json' --data-binary '@solr.json'
