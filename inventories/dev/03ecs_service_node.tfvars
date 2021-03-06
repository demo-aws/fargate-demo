
project_name = "aws-demo"
env = "dev"
instance_count = "1"
service_name = "node"
health_check_path = "/health"
container_port = "3000"
app_port = "3000"
priority = "1"
command = "npm start"
# Get after network infra created
aws_region = "us-east-1"
aws_account_id = "796157831759"
artifact_store = "claro-artifact-store-aws-demo-bucket"
artifact_name = "dev-aws-demo-node.zip"
tags = {
  ambiente        = "dev"
  torre           = "digital"
  marca           = "multimarca"
  centro-de-custo = "x"
  projeto         = "aws-demo"
  servico         = "node"
  conta           = "dev-ongoing"
  plataforma      = "aws"
  produto         = "demo"
}
# vpc_id = "vpc-0336229727d20a0b1"
# private_subnet1_id = "subnet-0e39a11025658a9aa"
# private_subnet2_id = "subnet-09408a66992e6baed"

container_vcpu = "256"
container_memory = "512"
container_min_capacity = "1"
container_max_capacity = "2"
node_path = "/app"

# backend config
aws_local_profile = "aws-demo"

github_branch = "master"
github_owner = "aws-demo"
github_token = "8671a265a98d1013881544aa04e8a257d50737d6"
github_repo = "https://github.com/demo-aws/fargate-demo.git"

domain = "darwinizando.com.br"
zone_id = "Z27WPZ5LRGYXF2"