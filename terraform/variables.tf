# GCP контекст
variable "project_id" { type = string }
variable "region"     { type = string }
variable "zone"       { type = string }

# VPC + subnets
variable "vpc_name"            { type = string }
variable "subnet_public_name"  { type = string }
variable "subnet_public_cidr"  { type = string }
variable "subnet_private_name" { type = string }
variable "subnet_private_cidr" { type = string }
variable "router_name"         { type = string }
variable "nat_name"            { type = string }


# Firewall
variable "firewall_ssh_name"       { type = string }
variable "firewall_lb_name"        { type = string }
variable "firewall_internal_name"  { type = string }
variable "trusted_cidrs"           { type = list(string) }
variable "lb_ports"                { type = list(string) }   

#acc
variable "sa_account_id"           { type = string }
variable "sa_display_name"         { type = string }
variable "sa_scopes"               { type = list(string) }

#VM
variable "master_name"             { type = string }
variable "master_tag"              { type = string }
variable "worker_name_prefix"      { type = string }
variable "worker_tag"              { type = string }
variable "instance_machine_type"   { type = string }
variable "instance_count_workers"  { type = number }
variable "boot_disk_image"         { type = string }
variable "startup_script_path"     { type = string }
variable "ansible_pubkey_path"     { type = string }
