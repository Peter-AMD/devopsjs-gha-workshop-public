data "aws_iam_policy_document" "website_policy" {
  statement {
    actions = [
      "s3:GetObject"
    ]
    principals {
      identifiers = ["*"]
      type        = "AWS"
    }
    resources = [
      "arn:aws:s3:::${local.fe_bucket_name}/*"
    ]
  }
}

resource "aws_s3_bucket" "front_end_app" {
  bucket        = local.fe_bucket_name
  force_destroy = true
}

resource "aws_s3_bucket_website_configuration" "example" {
  bucket = aws_s3_bucket.front_end_app.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

resource "aws_s3_bucket_acl" "acl" {
  bucket = aws_s3_bucket.front_end_app.id
  acl    = "public-read"
}

resource "aws_s3_bucket_policy" "public_access_website" {
  bucket = aws_s3_bucket.front_end_app.id
  policy = data.aws_iam_policy_document.website_policy.json
}
