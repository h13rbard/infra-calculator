variable "instances" {
  type = map(object({
    count = number
    type  = string
    hours = number
  }))
}
