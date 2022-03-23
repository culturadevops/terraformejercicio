variable "env" {}
variable "name_rds" {
    type = "string"
    default = 10
}
variable "allocated_storage" {
    type = "string"
    default = 20
}
variable "storage_type" {
    type = "string"
    default = "gp2"
}
variable "engine" {}
variable "engine_version" {}
variable "instance_class" {
    type = "string"
    default = "db.t2.micro"
}
variable "username" {
    type = "string"
    default = "root"
}
variable "password" {}
variable "db_subnet_group_name" {}
variable "vpc_security_group_ids" {
    type = "list"
}
variable "skip_final_snapshot" {
    type = "string"
    default = true
}
variable "timeouts" {
    type = "string"
    default = "30m"
}