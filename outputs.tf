output "vpc_id" {
  description = "The ID of the created VPC"
  value       = aws_vpc.main.id
}

output "subnet_ids" {
  description = "IDs of all created subnets"
  value       = [aws_subnet.main.id, aws_subnet.example.id]
}

output "account_info" {
  description = "AWS account information"
  value = {
    account_id = data.aws_caller_identity.current.account_id
    user_id    = data.aws_caller_identity.current.user_id
    arn        = data.aws_caller_identity.current.arn
  }
  sensitive = true
}