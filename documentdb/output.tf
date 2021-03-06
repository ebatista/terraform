########################
# 
# Output 
#
########################

output "cluster_name" {
  value       = module.documentdb.cluster_name
  description = "DocumentDB Cluster Identifier"
}

output "master_username" {
  value       = module.documentdb.master_username
  description = "DocumentDB Username for the master DB user"
}

 
output "arn" {
  value       = module.documentdb.arn
  description = "Amazon Resource Name (ARN) of the DocumentDB cluster"
}

output "endpoint" {
  value       = module.documentdb.endpoint
  description = "Endpoint of the DocumentDB cluster"
}

output "reader_endpoint" {
  value       = module.documentdb.reader_endpoint
  description = "Read-only endpoint of the DocumentDB cluster, automatically load-balanced across replicas"
}

