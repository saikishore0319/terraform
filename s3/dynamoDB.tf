resource "aws_dynamodb_table" "state_table" {
  name = "state_table"
  billing_mode = "PAY_PER_REQUEST"
  hash_key = "lockID"

  attribute {
    name = "lockID"
    type = "S"
  }

  tags = {
    Name = "state_table_tag"
  }
}