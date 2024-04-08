#!/bin/bash

# Authenticate with GCP
gcloud auth login

# Set default project
PROJECT_ID="your-project-id"
gcloud config set project $PROJECT_ID

# Create a virtual machine instance
gcloud compute instances create example-instance \
    --machine-type=n1-standard-1 \
    --zone=us-central1-a \
    --image=debian-10-buster-v20220315 \
    --tags=http-server,https-server

# Create a Cloud Storage bucket
BUCKET_NAME="example-bucket"
gsutil mb gs://$BUCKET_NAME

# Create a Cloud Storage bucket for backups
gsutil mb gs://$BUCKET_NAME-backups

# Deploy a Cloud Run service
gcloud run deploy $SERVICE_NAME --image=gcr.io/$PROJECT_ID/$SERVICE_NAME --platform=managed --region=$REGION --allow-unauthenticated

# Output success message
echo "Web application resources provisioned successfully!"

