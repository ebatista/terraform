########################
# 
# Setup Variables
#
########################
variable "name" {
}

variable "vpc_id" {
}

variable "subnets" { 
	type = list
}

variable "docdb_family" {
}

variable "docdb_instances" {
}

variable "docdb_instance_class" { 
}

variable "docdb_password" {
}

variable "docdb_sg_cidrs" {
	type = list
}

variable "tags" {
}


