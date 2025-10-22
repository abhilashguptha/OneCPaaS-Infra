
variable "tags" {
  type = map(string)
  default = {}
}


variable "product" {
  description = "product name"
  type        = string
  default     = "cpaas"
}

variable "project" {
  description = "project name"
  type        = string
  default     = "One-CPaaS"
}
variable "env" {
  description = "env (e.g., dev, prod)"
  type        = string
  default     = "prod"
}

variable "region_short" {
  type        = string
  default     = "us"
}