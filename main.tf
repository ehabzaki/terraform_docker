

module "app_staging" {
    source = "./modules/apps/"
      app_image_name="rate"
      mount_source="rate"
      db_name = "rate"
      db_port="5433"
      app_port="3001"
      env="staging"
}
module "app_prod" {
    source = "./modules/apps/"
      app_image_name = "rate"
      env = "prod"
      mount_source = "rate"
      db_name = "rate"
      db_port = "5432"
      app_port = "5000"
}