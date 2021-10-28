variable "project" {
  default = "pet-project"

}
variable "env" {
  default = "production"
}

variable "instance_type" {
  default = "t2.medium"
}

variable "volume_size" {
  default = "50"
}

variable "my_ip" {
  description = "My home ip address"
}