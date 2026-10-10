variable "prefix" {
  description = "Ordered list of prefix segments applied to every generated name, e.g. [\"contoso\", \"corp\"]. Passed straight through to Azure/naming."
  type        = list(string)
  default     = []
}

variable "suffix" {
  description = "Ordered list of suffix segments applied to every generated name, e.g. [\"app1\", \"prod\", \"eus\"]. Passed straight through to Azure/naming."
  type        = list(string)
  default     = []
}

variable "unique_seed" {
  description = "Seed string used to derive the deterministic random suffix Azure/naming appends when a resource type requests uniqueness (e.g. storage accounts). Leave empty to let Azure/naming derive its own seed."
  type        = string
  default     = ""
}

variable "unique_length" {
  description = "Length of the random unique suffix Azure/naming generates for resource types that require global uniqueness."
  type        = number
  default     = 4
}

variable "unique_include_numbers" {
  description = "Whether the generated unique suffix may include numbers."
  type        = bool
  default     = true
}
