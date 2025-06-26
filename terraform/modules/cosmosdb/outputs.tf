output "cosmosdb_account_name" {
  value = azurerm_cosmosdb_account.main.name
}

output "database_name" {
  value = azurerm_cosmosdb_mongo_database.main.name
}

output "collection_name" {
  value = azurerm_cosmosdb_mongo_collection.main.name
}
