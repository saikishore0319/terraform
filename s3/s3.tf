resource "aws_s3_bucket" "remote_s3" {
    bucket = "state-bucket-2025-2025"
    tags = {
        Name = "state-bucket"
    }
    
}
# resource "aws_s3_bucket_cors_configuration" "sample_s3_cors" {
#         bucket = aws_s3_bucket.sample_s3.id
#         cors_rule {
#             allowed_headers = ["*"]
#             allowed_methods = [ "GET", "POST" ]
#             allowed_origins = [ "*" ]
#         }
# }

resource "aws_s3_bucket_public_access_block" "sample_s3_public_block" {
    bucket = aws_s3_bucket.remote_s3.id
    block_public_acls = true
    block_public_policy = true

}