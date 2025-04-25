variable "region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
  validation {
    condition     = can(regex("^[a-z]{2}-[a-z]+-\\d+$", var.region))
    error_message = "Region must be a valid AWS region identifier (e.g., us-east-1)."
  }
}

variable "vpc_name" {
  description = "Name tag for the VPC"
  type        = string
  default     = "main"
}

variable "subnet_name" {
  description = "Name tag for the main subnet"
  type        = string
  default     = "main"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
  validation {
    condition     = can(cidrnetmask(var.vpc_cidr))
    error_message = "Must be a valid IPv4 CIDR block."
  }
}

variable "subnet_cidr" {
  description = "CIDR block for the main subnet"
  type        = string
  default     = "10.0.1.0/24"
  validation {
    condition     = can(cidrhost(var.subnet_cidr, 0))
    error_message = "Must be a valid IPv4 CIDR block."
  }
}

variable "default_vpc" {
  description = "ID of the Default VPC in the region"
  type        = string
  sensitive   = true
}

variable "default_vpc_subnet_cidr" { # Fixed variable name to be consistent
  description = "CIDR block for the example subnet created in the Default VPC"
  type        = string
  default     = "10.0.1.0/26"
}

variable "tags" {
  description = "Common tags to apply to all resources"
  type        = map(string)
  default     = {}
}