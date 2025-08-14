resource local_file sample {
  filename = "sample.txt"
  content = "hello world"
  file_permission = "700"
}

resource aws_s3_bucket my_bucket {
    bucket = "my_bucket"
}