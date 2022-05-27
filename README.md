# cap-pipeline-config
Building ontology pipeline configurations for Cell Annotation Platform

## Deployment

To deploy initial version of index run the following command:

    ./solr_init.sh -h [HOSTNAME] -p [PORT] -c [COLLECTION]

e.g.

    ./solr_init.sh -h localhost -p 8983 -c ontology

To deploy fresh version of index run the following command:

    ./solr_index.sh -h [HOSTNAME] -p [PORT] -c [COLLECTION]

e.g.

    ./solr_index.sh -h localhost -p 8984 -c ontology


### CAP PRoject Environment

Auth into GCP:

    gcloud auth login

List available projects:

    gcloud projects list

Before running further commands connect to remote `solr` instance:

    export PROJECT_ID=[put_you_project_id_here]

e.g.

    export PROJECT_ID=capv2-322001 # for RC1 taken from `gcloud projects list`

    export PROJECT_ID=capv2-prod-332920 # for Prod taken from `gcloud projects list`

Connect to solr:

    ES_INSTANCE_NAME=$(gcloud compute instances list --project $PROJECT_ID | grep solr | awk '{ print $1 }')

    ES_INSTANCE_REGION=$(gcloud compute instances list --project $PROJECT_ID | grep solr | awk '{ print $2 }')

    gcloud compute ssh --project $PROJECT_ID --ssh-flag="-L 8984:localhost:8983" --zone $ES_INSTANCE_REGION $ES_INSTANCE_NAME

