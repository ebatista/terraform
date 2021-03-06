########################
# 
# Output 
#
########################

output "cluster_name" {
  value       = aws_docdb_cluster.documentdb_cluster.cluster_identifier
  description = "DocumentDB Cluster Identifier"
}

output "master_username" {
  value       = aws_docdb_cluster.documentdb_cluster.master_username
  description = "DocumentDB Username for the master DB user"
}

 
output "arn" {
  value       = aws_docdb_cluster.documentdb_cluster.arn
  description = "Amazon Resource Name (ARN) of the DocumentDB cluster"
}

output "endpoint" {
  value       = aws_docdb_cluster.documentdb_cluster.endpoint
  description = "Endpoint of the DocumentDB cluster"
}

output "reader_endpoint" {
  value       = aws_docdb_cluster.documentdb_cluster.reader_endpoint
  description = "Read-only endpoint of the DocumentDB cluster, automatically load-balanced across replicas"
}

