project_name = "linuxtips-ecs-cluster"

region = "us-east-1"

ssm_vpc_id = "/linuxtips-vpc/vpc/vpc_id"

ssm_public_subnet_1 = "/linuxtips-vpc/vpc/linuxtips-vpc-public-subnet-1a"
ssm_public_subnet_2 = "/linuxtips-vpc/vpc/linuxtips-vpc-public-subnet-1b"
ssm_public_subnet_3 = "/linuxtips-vpc/vpc/linuxtips-vpc-public-subnet-1c"

ssm_private_subnet_1 = "/linuxtips-vpc/vpc/linuxtips-vpc-private-subnet-1a"
ssm_private_subnet_2 = "/linuxtips-vpc/vpc/linuxtips-vpc-private-subnet-1b"
ssm_private_subnet_3 = "/linuxtips-vpc/vpc/linuxtips-vpc-private-subnet-1c"

load_balancer_internal = false

load_balancer_type = "application"

nodes_ami = "ami-0a5f593ecaa0f722d"

node_instance_type = "t3a.large"

node_volume_size = "50"

node_volume_type = "gp3"

cluster_on_demand_min_size = 2

cluster_on_demand_max_size = 4

cluster_on_demand_desired_size = 3

cluster_spot_min_size = 2

cluster_spot_max_size = 4

cluster_spot_desired_size = 3