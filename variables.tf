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
  default     = "arn:aws:cognito-idp:us-east-1:574057705739:userpool/us-east-1_rhuGkKFvG"
}

variable "product_url" {
  description = "url da api de produto"
  type        = string
  default     = "http://example.com/"
}
