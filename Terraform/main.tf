provider "aws" {
    region = "us-east-1"
}


resource "aws_s3_bucket" "test_web_bucket" {
    bucket = "my-static-website-keith-ter-test"
    acl = "public-read"

    website {
        index_document = "index.html"
        error_document = "index.html"
    }
}

resource "aws_s3_bucket_object" "website_object" {
    bucket = aws_s3_bucket.test_web_bucket.bucket
    key = "index.html"
    source = "../index.html"
    acl = "public-read"
}