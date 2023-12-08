data "archive_file" "lambda_zip" {
  type        = "zip"
  output_path = "${path.module}/zip/lambda.zip"
  source_dir  = "${path.module}/src"
}
