variable "count_n" {}
variable "name_instance" {}

variable "ami" {}
variable "source_dest_check" {
  type = string
  default = null
}
variable "instance_profile" {
  type = string
  default = null
}
variable "key_name" {}
variable "subnet_id" {
  type = list
}
variable "vpc_security_group_ids" {}
variable "monitoring" {
    type = "string"
    default = false
}
variable "instance_type" {
  type = "string"
  default = "t2.micro"
}
variable "ebs_optimized" {
    type = "string"
    default = false
}

variable "disable_api_termination" {
    type = "string"
    default = false

}
variable "user_data" {
  type = "string"
  default = " "
}

variable "root_block_device" {
  type        = list(map(string))
  default     = []
}

variable "ebs_block_device" {
  type        = list(map(string))
  default     = []
}