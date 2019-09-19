resource "aws_s3_bucket" "public" {
  bucket = "${var.bucket_name}"
  acl    = "${var.bucket_acl}"
  region = "us-east-1"
  tags = {
    Name        = "${var.bucket_name}"
  }
   versioning {
    enabled = true
  }
  
}

output "bucket_id" {
  value = "${aws_s3_bucket.public.id}"
}

output "bucket_arn" {
  value = "${aws_s3_bucket.public.arn}"
}
output "bucket_domain_name" {
  value = "${aws_s3_bucket.public.bucket_domain_name}"
}