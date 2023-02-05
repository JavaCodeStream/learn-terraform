# Using Generic GIT Repository
module "demomodule1" {
  source = "git::https://github.com/zealvora/tmp-repo.git"
}


# Generic GIT Repository with Specific branch
module "demomodule2" {
  source = "git::https://github.com/zealvora/tmp-repo.git?ref=development"
}


# Using GitHub Source:
module "demomodule3" {
  source = "github.com/zealvora/tmp-repo"
}