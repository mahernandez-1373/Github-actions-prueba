################################################################################
# RDS Module
################################################################################
variable "pg_ha_name" {
  description = ""
  type        = string
  default     = "mydatabaseinstance"
}

variable "pg_random_instance_name" {
  description = ""
  type        = string
  default     = true
}

variable "pg_project_id" {
  description = ""
  type        = string
  default     = ""
}

variable "pg_database_version" {
  description = ""
  type        = string
  default     = "POSTGRES_9_6"
}

variable "pg_region" {
  description = ""
  type        = string
  default     = "us-central1"
}

variable "pg_tier" {
  description = ""
  type        = string
  default     = "db-custom-1-3840"
}

variable "pg_zone" {
  description = ""
  type        = string
  default     = "us-central1-c"
}

variable "pg_availability_type" {
  description = ""
  type        = string
  default     = "ZONAL"
}

variable "pg_deletion_protection" {
  description = ""
  type        = bool
  default     = false
}

variable "pg_db_charset" {
  description = ""
  type        = string
  default     = "UTF8"
}

variable "pg_db_collation" {
  description = ""
  type        = string
  default     = "en_US.UTF8"
}

variable "pg_user_name" {
  description = ""
  type        = string
  default     = "user"
}

variable "pg_user_password" {
  description = ""
  type        = string
  default     = "pasword"
}
