########################
# 
# Start Create Resources
#
########################

# provider
provider "aws" {
}

# resources

# security_group
resource "aws_security_group" "documentdb_cluster" {
    name                  = "sg_docdb_${var.name}"
    description           = "Security group for docdb ${var.name}"
    vpc_id                = var.vpc_id

ingress {
        from_port           = 27017
        to_port             = 27017
        protocol            = "TCP"
        #security_groups    = ["${var.docdb_sg"]
        cidr_blocks         = var.docdb_sg_cidrs
    }

    egress {
        from_port           = 0
        to_port             = 0
        protocol            = "-1"
        cidr_blocks         = ["0.0.0.0/0"]
    }

    tags = var.tags
}


# subnet_group
resource "aws_docdb_subnet_group" "documentdb_cluster" {
  description = "Cluster subnet group for ${var.name}"
  name       = var.name
  subnet_ids = var.subnets
  tags = var.tags
}

# parameter group
resource "aws_docdb_cluster_parameter_group" "documentdb_cluster" {
  description = "Cluster parameter group for ${var.name}"
  family = var.docdb_family
  name = var.name
  tags = var.tags
}

# cluster
resource "aws_docdb_cluster_instance" "documentdb_cluster" {
  count              = var.docdb_instances
  identifier         = "${var.name}-${count.index}"
  cluster_identifier = aws_docdb_cluster.documentdb_cluster.id
  instance_class     = var.docdb_instance_class
  tags = var.tags
}

resource "aws_docdb_cluster" "documentdb_cluster" {
  skip_final_snapshot     = false
  final_snapshot_identifier = "${var.name}-final-snapshot"
  storage_encrypted	  = true
  db_subnet_group_name    = aws_docdb_subnet_group.documentdb_cluster.name
  cluster_identifier      = var.name
  engine                  = "docdb"
  master_username         = "${replace(var.name, "-", "_")}_admin"
  master_password         = var.docdb_password
  db_cluster_parameter_group_name = aws_docdb_cluster_parameter_group.documentdb_cluster.name
  vpc_security_group_ids = ["${aws_security_group.documentdb_cluster.id}"]
  tags = var.tags
}

