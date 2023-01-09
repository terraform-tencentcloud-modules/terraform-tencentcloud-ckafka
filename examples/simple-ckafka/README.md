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
