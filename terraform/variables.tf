variable "project_id"{ 
    type = string 
}
variable "region"{ 
    type = string  
    default = "europe-central2" 
}
variable "zone"{ 
    type = string  
    default = "europe-central2-a" 
}

#firewall
variable "firewall_name" {
  type        = string
}

variable "firewall_ports" {
  type        = list(string)
}

variable "firewall_source_ranges" {
  type        = list(string)
}

#instances
variable "instance_name_prefix" {
  type        = string
}

variable "instance_count" {
  type        = number
}

variable "machine_type" {
  type        = string
}

variable "instance_tags" {
  type        = list(string)
}

variable "boot_disk_image" {
  type        = string
}

variable "startup_script_path" {
  type        = string
}


variable "service_account_scopes" {
  type        = list(string)
}

#vpc
variable "vpc_name" {
  type        = string
}

variable "auto_create_subnetworks" {
  type        = bool
}

variable "subnet_name" {
  type        = string
}

variable "subnet_cidr_range" {
  type        = string
  default     = "10.0.0.0/24"
}

