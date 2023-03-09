# terraform-tencentcloud-ckafka
TencentCloud Ckafka Module for Terraform

A terraform module used to create TencentCloud Ckafka instance.**(Note: It only support create profession ckafka instance.)**

The following resources are included.

* [Ckafka](https://registry.terraform.io/providers/tencentcloudstack/tencentcloud/latest/docs/resources/ckafka_instance)
* [Ckafka Topic](https://registry.terraform.io/providers/tencentcloudstack/tencentcloud/latest/docs/resources/ckafka_topic)
* [Ckafka Acl](https://registry.terraform.io/providers/tencentcloudstack/tencentcloud/latest/docs/resources/ckafka_acl)

## Usage

There is a way to create simple ckafka using this module:

### Simple Ckafka instance

```hcl
module "ckafka" {
  source = "terraform-tencentcloud-modules/ckafka/tencentcloud"

  instance_name        = "tf-ckafka-grezs"
  instance_type        = 1
  kafka_version        = "2.4.1"
  band_width           = 40
  disk_size            = 500
  disk_type            = "CLOUD_BASIC"
  period               = 1
  msg_retention_time   = 1300
  partition            = 800
  renew_flag           = 0
  zone_id              = 100003
  vpc_id               = "${module.vpc.vpc_id}"
  subnet_id            = "${module.vpc.subnet_id[0]}"
}
```

## Inputs

| Name                     | Description                                                                                                                                                                                                                |     Type     |          Default          | Required |
|--------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:------------:|:-------------------------:|:--------:|
| instance_name            | Instance name.                                                                                                                                                                                                             |    string    | "ckafka-instance-tf-test" |    no    |
| vpc_id                   | Vpc id.                                                                                                                                                                                                                    |    string    |            ""             |   yes    |
| subnet_id                | Subnet id.                                                                                                                                                                                                                 |    string    |            ""             |   yes    |
| zone_id                  | Available zone id.                                                                                                                                                                                                         |    number    |           null            |   yes    |
| band_width               | Instance bandwidth in MBps.                                                                                                                                                                                                |    number    |            40             |    no    |
| disk_size                | Disk Size. Its interval varies with bandwidth, and the input must be within the interval, which can be viewed through the control. If it is not within the interval, the plan will cause a change when first created.      |    number    |            50             |    no    |
| disk_type                | Type of disk.(ssd: `CLOUD_SSD`; sata: `CLOUD_BASIC`)                                                                                                                                                                       |    string    |       "CLOUD_BASIC"       |    no    |
| period                   | Prepaid purchase time, such as 1, is one month.                                                                                                                                                                            |    number    |             1             |    no    |
| instance_type            | Description of instance type. profession: 1, standard: 1(general), 2(standard), 3(advanced), 4(capacity), 5(specialized-1), 6(specialized-2), 7(specialized-3), 8(specialized-4), 9(exclusive).                            |    number    |             1             |    no    |
| kafka_version            | Kafka version (0.10.2/1.1.1/2.4.1).                                                                                                                                                                                        |    string    |          "2.4.1"          |    no    |
| msg_retention_time       | The maximum retention time of instance logs, in minutes. the default is 10080 (7 days), the maximum is 30 days, and the default 0 is not filled, which means that the log retention time recovery policy is not enabled.   |    number    |           1300            |    no    |
| multi_zone_flag          | Indicates whether the instance is multi zones. NOTE: if set to true, zone_ids must set together.                                                                                                                           |     bool     |           false           |    no    |
| zone_ids                 | List of available zone id. NOTE: this argument must set together with `multi_zone_flag`.                                                                                                                                   | list(string) |           null            |    no    |
| partition                | Partition Size. Its interval varies with bandwidth, and the input must be within the interval, which can be viewed through the control. If it is not within the interval, the plan will cause a change when first created. |    number    |            800            |    no    |
| public_network           | Timestamp.                                                                                                                                                                                                                 |    number    |           null            |    no    |
| renew_flag               | Prepaid automatic renewal mark, 0 means the default state, the initial state, 1 means automatic renewal, 2 means clear no automatic renewal (user setting).                                                                |    number    |             0             |    no    |
| tag_set                  | Tag set of instance.                                                                                                                                                                                                       | map(string)  |           null            |    no    |
| config                   | Instance configuration.                                                                                                                                                                                                    |    object    |            {}             |    no    |
| dynamic_retention_config | Dynamic message retention policy configuration.                                                                                                                                                                            |    object    |            {}             |    no    |
| ckafka_topic             | Ckafka topic configuration, which allows you to create a ckafka topic.                                                                                                                                                     |    object    |            {}             |    no    |
| ckafka_acl               | Ckafka acl configuration, which allows you to create a ckafka acl.                                                                                                                                                         |    object    |            {}             |    no    |

### config

Ckafka instance configuration object.  The supported properties are as follows.（Note: Set it to null when you want to use the default value of the properties）

| Name                       | Description                                                                                      |  Type  | Default | Required |
|----------------------------|--------------------------------------------------------------------------------------------------|:------:|:-------:|:--------:|
| auto_create_topic_enable   | Automatic creation. true: enabled, false: not enabled.                                           |  bool  |  true   |   yes    |
| default_num_partitions     | Port of the CLB listener.                                                                        | number |    3    |   yes    |
| default_replication_factor | If auto.create.topic.enable is set to true and this value is not set, 3 will be used by default. | number |    3    |   yes    |

### dynamic_retention_config

Dynamic message retention policy configuration.  The supported properties are as follows.（Note: Set it to null when you want to use the default value of the properties）

| Name                    | Description                                                                                   |  Type  | Default | Required |
|-------------------------|-----------------------------------------------------------------------------------------------|:------:|:-------:|:--------:|
| bottom_retention        | Minimum retention time, in minutes.                                                           | number |    0    |    no    |
| disk_quota_percentage   | Disk quota threshold (in percentage) for triggering the message retention time change event.  | number |    0    |    no    |
| enable                  | Whether the dynamic message retention time configuration is enabled. 0: disabled; 1: enabled. | number |    1    |    no    |
| step_forward_percentage | Percentage by which the message retention time is shortened each time.                        | number |    0    |    no    |

### ckafka_topic

Ckafka topic configuration, which allows you to create a ckafka topic.The supported properties are as follows.（Note: Set it to null when you want to use the default value of the properties）

| Name                           | Description                                                                                                                                                                                                                                                                          |     Type     |   Default    | Required |
|--------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:------------:|:------------:|:--------:|
| topic_name                     | Name of the CKafka topic. It must start with a letter, the rest can contain letters, numbers and dashes(-).                                                                                                                                                                          |    string    |  "example"   |   yes    |
| note                           | The subject note. It must start with a letter, and the remaining part can contain letters, numbers and dashes (-).                                                                                                                                                                   |    string    | "topic note" |    no    |
| replica_num                    | The number of replica.                                                                                                                                                                                                                                                               |    number    |      2       |   yes    |
| partition_num                  | Percentage by which the message retention time is shortened each time.                                                                                                                                                                                                               |    number    |      1       |   Yes    |
| enable_white_list              | Whether to open the ip whitelist, `true`: open, `false`: close.                                                                                                                                                                                                                      |     bool     |     true     |    no    |
| ip_white_list                  | Ip whitelist, quota limit, required when enableWhileList=true.                                                                                                                                                                                                                       | list(string) |      []      |    no    |
| clean_up_policy                | Clear log policy, log clear mode, default is `delete`. `delete`: logs are deleted according to the storage time. `compact`: logs are compressed according to the key. `compact, delete`: logs are compressed according to the key and will be deleted according to the storage time. |    string    |   "delete"   |    no    |
| sync_replica_min_num           | Min number of sync replicas, Default is `1`.                                                                                                                                                                                                                                         |    number    |      1       |    no    |
| unclean_leader_election_enable | Whether to allow unsynchronized replicas to be selected as leader, default is `false`, `true:`allowed, `false`: not allowed.                                                                                                                                                         |     bool     |    false     |    no    |
| segment                        | Segment scrolling time, in ms, the current minimum is 3600000ms.                                                                                                                                                                                                                     |    number    |   3600000    |    no    |
| retention                      | Message can be selected. Retention time, unit is ms, the current minimum value is 60000ms.                                                                                                                                                                                           |    number    |    60000     |    no    |
| max_message_bytes              | Max message bytes. min: 1024 Byte(1KB), max: 8388608 Byte(8MB).                                                                                                                                                                                                                      |    number    |      0       |    no    |

### ckafka_acl

Ckafka acl configuration, which allows you to create a ckafka acl.The supported properties are as follows.（Note: Set it to null when you want to use the default value of the properties）


| Name            | Description                                                                                                                                                                                                                                           |  Type  |     Default     | Required |
|-----------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:------:|:---------------:|:--------:|
| resource_type   | ACL resource type. Valid values are `UNKNOWN`, `ANY`, `TOPIC`, `GROUP`, `CLUSTER`, `TRANSACTIONAL_ID`. and `TOPIC` by default. Currently, only `TOPIC` is available, and other fields will be used for future ACLs compatible with open-source Kafka. | string |     "TOPIC"     |    no    |
| resource_name   | ACL resource name, which is related to `resource_type`. For example, if `resource_type` is `TOPIC`, this field indicates the topic name; if `resource_type` is `GROUP`, this field indicates the group name.                                          | string | "topic-tf-test" |   yes    |
| operation_type  | ACL operation mode. Valid values: `UNKNOWN`, `ANY`, `ALL`, `READ`, `WRITE`, `CREATE`, `DELETE`, `ALTER`, `DESCRIBE`, `CLUSTER_ACTION`, `DESCRIBE_CONFIGS` and `ALTER_CONFIGS`.                                                                        | string |     "WRITE"     |   yes    |
| permission_type | ACL permission type. Valid values: `UNKNOWN`, `ANY`, `DENY`, `ALLOW`. and `ALLOW` by default. Currently, CKafka supports `ALLOW` (equivalent to allow list), and other fields will be used for future ACLs compatible with open-source Kafka.         | string |     "ALLOW"     |    no    |
| host            | IP address allowed to access. The default value is `*`, which means that any host can access.                                                                                                                                                         | string |       "*"       |    no    |
| principal       | User list. The default value is `*`, which means that any user can access. The current user can only be one included in the user list.                                                                                                                | string |       "*"       |    no    |

## Outputs

| Name                                  | Description                                                                                  |
|---------------------------------------|----------------------------------------------------------------------------------------------|
| ckafka_vpc_id                         | Vpc id.                                                                                      |
| ckafka_subnet_id                      | Subnet id.                                                                                   |
| ckafka_instance_id                    | Ckafka instance id.                                                                          |
| ckafka_instance_name                  | Ckafka instance name.                                                                        |
| ckafka_zone_id                        | Ckafka available zone id.                                                                    |
| ckafka_instance_vip                   | Vip of instance.                                                                             |
| ckafka_instance_vport                 | Type of instance.                                                                            |
| ckafka_acl_id                         | Ckafka acl id.                                                                               |
| ckafka_topic_id                       | Ckafka topic id.                                                                             |
| ckafka_topic_create_time              | Create time of the CKafka topic.                                                             |
| ckafka_topic_forward_cos_bucket       | Data backup cos bucket: the bucket address that is dumped to cos.                            |
| ckafka_topic_forward_interval         | Periodic frequency of data backup to cos.                                                    |
| ckafka_topic_forward_status           | Data backup cos status. Valid values: 0, 1. 1: do not open data backup, 0: open data backup. |
| ckafka_topic_message_storage_location | Message storage location.                                                                    |
| ckafka_topic_segment_bytes            | Number of bytes rolled by shard.                                                             |


## Authors

Created and maintained by [TencentCloud](https://github.com/terraform-providers/terraform-provider-tencentcloud)

## License

Mozilla Public License Version 2.0.
See LICENSE for full details.

