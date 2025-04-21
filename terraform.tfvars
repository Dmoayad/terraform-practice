resource_group_name        = "devops2-moayad-rg"
azurerm_linux_web_app_name = ["devops2-moayad-frontend-webapp", "devops2-moayad-backend-webapp"]
azurerm_service_plan_name  = ["devops2-moayad-frontend-webapp-asp", "devops2-moayad-backend-webapp-asp"]
webapp_to_plan = {
  "devops2-moayad-frontend-webapp" = "devops2-moayad-frontend-webapp-asp"
  "devops2-moayad-backend-webapp"  = "devops2-moayad-backend-webapp-asp"
}


vm_name  = "devops2-moayad-sonarqube-vm"
username = "moayad"
password = "putyourpasswordhere"

virtual_network_name = "devops2-week7-vnet-moayad"
address_prefixes     = ["10.0.2.0/24"]
address_space        = ["10.0.0.0/16"]
subnet_name          = "internal"
nic_name             = "devops2-week7-nic-moayad"
nsg_name             = "devops2-moayad-sonarqube-vm-nsg"
public_ip_name       = "sonarqube-vm-public-ip"

sql_server_name    = "devops2-moayad-db-server"
sql_admin_username = "moayad"
sql_admin_password = "putyourpasswordhere"
sql_database_name  = "devops2-moayad-db"


location = "Central US"