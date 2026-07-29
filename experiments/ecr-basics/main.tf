# Experiment: ecr-basics — a container image registry.
module "ecr" {
  source               = "../../modules/ecr"
  name                 = "my-app"
  image_tag_mutability = "IMMUTABLE"
  scan_on_push         = true
}
