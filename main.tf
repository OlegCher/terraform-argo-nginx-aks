## Azure resource group for the kubernetes cluster ##
resource "azurerm_resource_group" "aks_demo" {
  name     = var.resource_group_name
  location = var.location

  tags = {
    environment = "Development"
    owner       = "OlegCher"
  }
}

## AKS kubernetes cluster ##
resource "azurerm_kubernetes_cluster" "aks_demo" {
  name                = var.cluster_name
  resource_group_name = azurerm_resource_group.aks_demo.name
  location            = azurerm_resource_group.aks_demo.location
  dns_prefix          = var.dns_prefix

  # linux_profile {
  #   admin_username = var.admin_username

  #   ## SSH key is generated using "tls_private_key" resource
  #   ssh_key {
  #     key_data = "${trimspace(tls_private_key.key.public_key_openssh)} ${var.admin_username}@azure.com"
  #   }
  # }

  default_node_pool {
    name       = "default"
    node_count = var.agent_count
    vm_size    = var.vm_size
  }

  service_principal {
    client_id     = var.service_principal_app_id
    client_secret = var.service_principal_password
  }

  role_based_access_control {
    enabled = true
  }

  # identity {
  #   type = "SystemAssigned"
  # }

  tags = {
    Environment = "Development"
  }
}

## Private key for the kubernetes cluster ##
# resource "tls_private_key" "key" {
#   algorithm = "RSA"
# }

# ## Save the private key in the local workspace ##
# resource "null_resource" "save-key" {
#   triggers = {
#     key = tls_private_key.key.private_key_pem
#   }

#   provisioner "local-exec" {
#     command = <<EOF
#       mkdir -p ${path.module}/.ssh
#       echo "${tls_private_key.key.private_key_pem}" > ${path.module}/.ssh/id_rsa
#       chmod 0600 ${path.module}/.ssh/id_rsa
# EOF
#   }
# }

output "configure" {
  value = <<CONFIGURE

Run the following commands to configure kubernetes client:

$ export KUBECONFIG=~/.kube/aksconfig

Test configuration using kubectl

$ kubectl get nodes
CONFIGURE
}
