output "cluster_id" {
  value = aws_rds_cluster.this.id
}

output "cluster_arn" {
  value = aws_rds_cluster.this.arn
}

output "writer_endpoint" {
  value = aws_rds_cluster.this.endpoint
}

output "reader_endpoint" {
  value = aws_rds_cluster.this.reader_endpoint
}

output "instance_endpoints" {
  value = concat(
    [aws_rds_cluster_instance.writer.endpoint],
    [for r in aws_rds_cluster_instance.readers : r.endpoint]
  )
}

output "cluster_resource_id" {
  value = aws_rds_cluster.this.cluster_resource_id
}
