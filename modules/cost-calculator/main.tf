locals {
  pricing = {
    "t3.micro"  = 0.0104
    "t3.small"  = 0.0208
    "t3.medium" = 0.0416
  }

  costs = {
    for name, config in var.instances :
    name => config.count * config.hours * lookup(local.pricing, config.type, 0)
  }

  total_cost = sum(values(local.costs))
}

resource "local_file" "cost_report" {
  filename = "cost-report.json"

  content = jsonencode({
    instances  = var.instances
    costs      = local.costs
    total_cost = local.total_cost
  })
}
