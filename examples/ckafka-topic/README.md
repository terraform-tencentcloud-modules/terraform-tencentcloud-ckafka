# CLB Module Example

This module will create a new Ckafka instance, Vpc, Subnet and Route table.

## Usage

To run this example, you need first replace the configuration like `zone_id`, `instance_name`, `vpc_id`, `subnet_id` etc, and then execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Note, this example may create resources which cost money. Run `terraform destroy` if you don't need these resources.

## Outputs

| Name | Description |
|------|-------------|
| ckafka_instance_id   | Ckafka instance id.  |
| ckafka_vip | Vip of instance. |
| ckafka_vport | Type of instance. |
| vpc_id | Vpc id. |
| subnet_id | Subnet id. |
| ckafka_topic_id | Ckafka topic id. |
| ckafka_topic_create_time | Create time of the CKafka topic. |
| ckafka_topic_forward_cos_bucket | Data backup cos bucket: the bucket address that is dumped to cos. |
| ckafka_topic_forward_interval | Periodic frequency of data backup to cos. |
| ckafka_topic_forward_status | Data backup cos status. Valid values: 0, 1. 1: do not open data backup, 0: open data backup. |
| ckafka_topic_message_storage_location | Message storage location. |
| ckafka_topic_segment_bytes | Number of bytes rolled by shard. |
