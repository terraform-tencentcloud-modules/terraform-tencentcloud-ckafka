output "ckafka_instance_id" {
  description = "Ckafka instance id."
  value       = module.ckafka.ckafka_instance_id
}
output "ckafka_vip" {
  value       = module.ckafka.ckafka_instance_vip
  description = "Vip of instance."
}
output "ckafka_vport" {
  value       = module.ckafka.ckafka_instance_vport
  description = "Type of instance."
}
output "vpc_id" {
  description = "Vpc id."
  value       = module.vpc.vpc_id
}
output "subnet_id" {
  description = "Subnet id."
  value       = module.vpc.subnet_id
}