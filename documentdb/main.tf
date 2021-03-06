module "documentdb" {

	source = "../modules/documentdb"

	name = "lab"

	vpc_id = "vpc-xxxxxxx"

	subnets = ["subnet-xxxxxxxx","subnet-xxxxxxxx","subnet-xxxxx"]

	docdb_family = "docdb3.6"

	docdb_instances = "1"

	docdb_instance_class = "db.t3.medium"

	# nao pode conter "@" ou "/"
	docdb_password = "****************"

	docdb_sg_cidrs = ["127.0.0.1/32"]

	tags = {
	    BU = "xxx"
	    Team = "xxx"
	    Description = "Test Document DB Database"
	    }
}
