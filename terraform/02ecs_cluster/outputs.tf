# output "alb_listener_arn_ssl" {
#   value = "${module.ecs_cluster.alb_listener_arn_ssl}"
# }

output "ecs_service_role_arn" {
  value = "${module.ecs_cluster.ecs_service_role_arn}"
}

output "alb_arn" {
  value = "${module.ecs_cluster.ecs_cluster_alb_arn}"
}

output "alb_name" {
  value = "${module.ecs_cluster.ecs_cluster_alb_arn_suffix}"
}

output "alb_listener_arn" {
  value = "${module.ecs_cluster.alb_listener_arn}"
}

output "ecs_cluster_arn" {
  value = "${module.ecs_cluster.ecs_cluster_arn}"
}

output "ecs_cluster_name" {
  value = "${module.ecs_cluster.ecs_cluster_name}"
}

output "alb_target_group_arn_suffix" {
  value = "${module.ecs_cluster.alb_target_group_arn_suffix}"
}

output "ecs_cluster_sg_id" {
  value = "${module.ecs_cluster.ecs_cluster_sg_id}"
}
output "ecs_cluster_alb_dns_name" {
  value = "${module.ecs_cluster.ecs_cluster_alb_dns_name}"
}
