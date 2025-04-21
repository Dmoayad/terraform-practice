variable "resource_group_name" {

  type        = string
  description = "This variable holds the value of the resource group name"

}

variable "azurerm_linux_web_app_name" {
  type        = set(string)
  description = "This variable holds the value of the webapp name"
}

variable "azurerm_service_plan_name" {
  type        = set(string)
  description = "This variable holds the value of the service plan name"

}

variable "webapp_to_plan" {
  type        = map(string)
  description = "Map of web app name to service plan name"
}

variable "vm_name" {
  type        = string
  description = "This variable holds the name of the virtual machine"
}

variable "username" {
  type        = string
  description = "The username for the Linux VM"
}

variable "password" {
  type        = string
  description = "The password for the Linux VM"
  sensitive   = true
}

variable "vm_size" {
  type        = string
  description = "The size of the Virtual Machine (e.g., Standard_B1s)"
  default     = "Standard_D2s_v3"
}

variable "storage_account_type" {
  type        = string
  description = "The type of storage account to use for the OS disk (e.g., Standard_LRS, Premium_LRS)"
  default     = "Standard_LRS"
}

variable "virtual_network_name" {
  type        = string
  description = "The name of the virtual network"
}

variable "address_space" {
  type        = list(string)
  description = "The address space that is used by the virtual network"
}

variable "nic_name" {
  type        = string
  description = "The name of the network interface"
}
variable "subnet_name" {

  type = string

}

variable "address_prefixes" {

  type = list(string)

}


variable "public_ip_name" {
  type        = string
  description = "The name of the public IP address"
}

variable "nsg_name" {
  type        = string
  description = "The name of the Network Security Group"
}


variable "sql_server_name" {
  type        = string
  description = "The name of the SQL Server"
}

variable "sql_admin_username" {
  type        = string
  description = "The administrator username for the SQL Server"
}

variable "sql_admin_password" {
  type        = string
  description = "The administrator password for the SQL Server"
  sensitive   = true
}

variable "sql_database_name" {
  type        = string
  description = "The name of the SQL Database"
}


variable "location" {

  type        = string
  description = "This variable holds the value of the location"

  default = "Central US"
}

variable "tags" {

  type        = any
  description = "Tags"

  default = "development"

}