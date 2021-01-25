#Following is a DATA type, not resource, and is only used to make
#the project settings available

data "google_project" "project" {

} 

output "project_name" {
  value = data.google_project.project.name
}


