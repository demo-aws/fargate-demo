output "vpc_id" {
  value = "${module.network.vpc_id}"
}
output "public_subnet1_id" {
  value = "${module.network.public_subnet1_id}"
}
output "public_subnet2_id" {
  value = "${module.network.public_subnet2_id}"
}
output "private_subnet1_id" {
  value = "${module.network.private_subnet1_id}"
}
output "private_subnet2_id" {
  value = "${module.network.private_subnet2_id}"
}
