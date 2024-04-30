resource "aws_ecr_repository" "ecr_repo" {
  name = "ecr_repo"

}

resource "local_file" "ecr_url" {
  filename = "ecr_url"
  content  = aws_ecr_repository.ecr_repo.repository_url

}