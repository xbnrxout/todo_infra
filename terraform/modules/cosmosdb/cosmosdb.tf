resource "azurerm_cosmosdb_account" "main" {
  name                = var.database_name
  location            = var.location
  resource_group_name = var.resource_group_name
  offer_type          = "Standard"
  kind                = "MongoDB"
  consistency_policy {
    consistency_level = "Session"
  }

  geo_location {
    location          = var.location
    failover_priority = 0
  }

  capabilities {
    name = "EnableMongo"
  }

  public_network_access_enabled = true
}

resource "azurerm_cosmosdb_mongo_database" "main" {
  name                = var.database_name
  resource_group_name = var.resource_group_name
  account_name        = azurerm_cosmosdb_account.main.name
  throughput          = 400
}

resource "azurerm_cosmosdb_mongo_collection" "main" {
  name                = var.collection_name
  resource_group_name = var.resource_group_name
  account_name        = azurerm_cosmosdb_account.main.name
  database_name       = azurerm_cosmosdb_mongo_database.main.name
  shard_key           = "_id"
  throughput          = 400

  index {
    keys   = ["_id"]
    unique = true
  }
}

