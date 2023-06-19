variable "deployment_tag" {
  # can be overriden at apply time with `-var "deployment_tag=<insert-new-val-here>`
  description = "Value of the deployment tag for resources"
  type = string
  default = "deploymentTagVal"
}
