#The below are the variables to be used for the paymentsense tech
#assessment. Note no effort has been made to validate the values 
#that are put in here.

variable "gcp_project_id" {
  type =  string
  description = "The ID number of the GCP project"
  default = "1234567890"          # <== REPLACE THIS
}


variable "gcp_region" {
  type = string
  description = "The region on GCP where resources should be created"
  default = "europe-west1"
}

variable "gcp_zone" {
  type = string
  description = "Zone where GKE nodes will be placed"
  default = "europe-west1-b"
}
