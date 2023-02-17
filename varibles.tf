## Azure config variables ##
variable "location" {
  default = "UAE North"
}

## Resource group variables ##
variable "resource_group_name" {
  default = "aksdemo-rg"
}

## AKS kubernetes cluster variables ##
variable "cluster_name" {
  default = "aksdemo1"
}

variable "agent_count" {
  default = 2
}

variable "vm_size" {
  default = "Standard_B2s"
}

variable "dns_prefix" {
  default = "aksdemo"
}

variable "admin_username" {
  default = "Olegch"
}

variable "namespace" {
  default = "aks-demo"
}

##Not the best practice - good for POC
variable "service_principal_app_id" {
  default = ""
}

##Not the best practice - good for POC
variable "service_principal_password" {
  default = ""
}
