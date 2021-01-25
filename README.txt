
Installation instructions
===========================
Assumptions:
  - Commands to be run on a Linux host
  - Docker is installed on host
  - Google Cloud toolkit is installed and configured for access to the appropriate
    GCP account
  - GCP project already provisioned
  - Container and containerregistry APIs are enabled in GCP project. If not run
        - gcloud services enable containerregistry.googleapis.com --project=<project name>
        - gcloud services enable container.googleapis.com --project=<project name>
  - Docker has been configured for use with GCP. If not, run
      - gcloud auth configure-docker
  - Python3 is installed on the host for the app test script 
    (tested with Python 3.8.5)

Notes:
  - No attempt is made to provision a remote-state store for Terraform, however this would
    be required if this app were to be productionised. 
  - No attempt has been made to setup namespaces
  - No attempt has been made to place the cluster on a specific VPC
  - No attempt has been made to secure this application in any manner
  

Install instructions:

  - cd into the directory holding the build files
  - export PROJECT_NAME=<gcp project name>
  - docker build -t paymentsense .
  - docker tag paymentsense eu.gcr.io/${PROJECT_NAME}/paymentsense
  - docker push eu.gcr.io/${PROJECT_NAME}/paymentsense
  - cd IAC 
  - curl https://releases.hashicorp.com/terraform/0.14.4/terraform_0.14.4_linux_amd64.zip >tf.zip
  - unzip tf.zip
  - Edit variables.tf and set the correct project ID for "gcp_project_id"
  - ./terraform init
  - ./terraform apply
          When prompted, review resources to be created and type "yes" if
          they appear correct.
          Note: The GCP eventual-consistency model can sometimes result
          in Terraform apply runs erroring, as the GCP API reports an
          operation is complete when it is not. If the run fails re-running
          the apply should be attempted before assuming an issue with the
          Terraform desription.
  - Test the deployment, and get the URL to the application, by running
        python3 test_app.py

Deinstall instructions:

Once you are ready to remove the infrastructure, run

  - ./terraform destroy
        - Review the resources to be deleted and type "yes" when ready.


