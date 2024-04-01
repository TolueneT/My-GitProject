# This script provisions essential resources for a basic web application on Google Cloud Platform (GCP).

# It creates a virtual machine instance, sets up a firewall rule, and installs necessary software.

# Usage: ./testscript.sh <toluene98> <US-central>

# Create a virtual machine instance

'gcloud compute instances create'example-instance \
 --machine-type=n1-standard-1 \
 --zone=us-central1-a \
 --image=debian-10-buster-v20220315 \
 --tags=http-server,https-server

# Create a Cloud Storage bucket

BUCKET_NAME="example-bucket"
gsutil mb gs://$BUCKET_NAME
