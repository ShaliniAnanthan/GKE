variable "project" {
    type = string
    # default =
}
variable "gke_region" {
    type = string
}
variable "Terra_Auth" {
   type = string
   description = "Access Key for Terraform Service Account" 
}