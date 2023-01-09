module "vpc" {
  source = "terraform-tencentcloud-modules/vpc/tencentcloud"

  vpc_name = "simple-vpc-grezs-test"
  vpc_cidr = "10.0.0.0/16"

  subnet_name  = "simple-vpc-grezs-test"
  subnet_cidrs = ["10.0.0.0/24"]
  availability_zones = ["ap-guangzhou-3"]

  destination_cidrs = ["1.0.1.0/24"]
  next_type         = ["EIP"]
  next_hub          = ["0"]

  tags = {
    module = "vpc"
  }

  vpc_tags = {
    test = "vpc"
  }

  subnet_tags = {
    test = "subnet"
  }
}

module "ckafka" {
  source = "../../"

  instance_name        = "tf-ckafka-grezs"
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
  
  tag_set              = {
    key                = "test"
    value              = "test"
  }
}


