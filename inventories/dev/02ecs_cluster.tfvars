aws_region = "us-east-1"
project_name = "aws-demo"
aws_account_id = "578658211177"
artifact_store = "claro-artifact-store-aws-demo-bucket"
app_port = "3000"
env = "dev"
tags = {
  ambiente        = "dev"
  torre           = "digital"
  marca           = "multimarca"
  centro-de-custo = "x"
  projeto         = "aws-demo"
  servico         = "aws-demo"
  conta           = "dev-ongoing"
  plataforma      = "aws"
  produto         = "demo"
}
# backend config
aws_local_profile = "aws-demo"
cidr_blocks_whitelist = [ "0.0.0.0/0" ]