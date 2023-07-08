variable "region" {
  description = "aws region"
  default     = "us-east-1"
  type        = string

}

variable "certificate_arn" {
  description = "certificste arn"
  default     = "arn:aws:acm:us-east-1:732025887430:certificate/fe172d4a-7b60-4928-99f7-91fa4a83be08"
  type        = string
}

variable "image_id" {
  description = "ec2 ami"
  default     = "ami-09e0cf8dede3e542a"
  type        = string

}

variable "my_key" {
  description = "ec2 key"
  default     = "mykey"
  type        = string

}
