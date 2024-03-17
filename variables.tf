# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "cognito_arn" {
  description = "arn cognito"
  type        = string
  default     = "arn:aws:cognito-idp:us-east-1:574057705739:userpool/us-east-1_aoSV3duKf"
}

variable "product_url" {
  description = "url da api de produto"
  type        = string
  default     = "a23c0f487518541d8b496fa93e8bf6c8-1796424073.us-east-1.elb.amazonaws.com:3000/products"
}

variable "oauthurl" {
  description = "url da api de autenticacao com cognito"
  type        = string
  default     = "arn:aws:lambda:us-east-1:574057705739:function:oauth-cognito-dev-signUpClient"
}
