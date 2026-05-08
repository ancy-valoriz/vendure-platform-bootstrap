resource "railway_service" "backend" {
  name       = "vendure-backend"
  project_id = var.railway_project_id
}

resource "railway_service" "storefront" {
  name       = "vendure-storefront"
  project_id = var.railway_project_id
}