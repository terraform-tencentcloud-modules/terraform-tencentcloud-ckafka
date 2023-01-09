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

output ckafka_topic_id {
  value       = module.ckafka.ckafka_topic_id
  description = "Ckafka topic id."
}
output ckafka_topic_create_time {
  value       = module.ckafka.ckafka_topic_create_time
  description = "Create time of the CKafka topic."
}
output ckafka_topic_forward_cos_bucket {
  value       = module.ckafka.ckafka_topic_forward_cos_bucket
  description = "Data backup cos bucket: the bucket address that is dumped to cos."
}
output ckafka_topic_forward_interval {
  value       = module.ckafka.ckafka_topic_forward_interval
  description = "Periodic frequency of data backup to cos."
}
output ckafka_topic_forward_status {
  value       = module.ckafka.ckafka_topic_forward_status
  description = "Data backup cos status. Valid values: 0, 1. 1: do not open data backup, 0: open data backup."
}
output ckafka_topic_message_storage_location {
  value       = module.ckafka.ckafka_topic_message_storage_location
  description = "Message storage location."
}
output ckafka_topic_segment_bytes {
  value       = module.ckafka.ckafka_topic_segment_bytes
  description = "Number of bytes rolled by shard."
}
