include {
  path = find_in_parent_folders()
}

terraform {
  source = "${replace(get_repo_root(), "\\", "/")}/modules/secret-manager"
}


inputs = {
    aws_region = "us-west-1"
    secret_name        = "OneCPaaS-prod-us-viber"
    secret_description = "Viber Application Values"
    secret_values = {
      DB_USERNAME="viber"
      RABBITMQ_BROKER_URL="amqp://viber:viber@172.16.26.181:5672/viber"
      DB_PASSWORD="viber"
      DB_HOST="one-cpaas-postgres-stg-us-db.cluster-cogcvcf33adg.us-east-1.rds.amazonaws.com"
      DB_PORT="5432"
      DB_NAME="viber_usage"
      REDIS_HOST="one-cpaas-stg-redis.zpzk3m.ng.0001.use1.cache.amazonaws.com"
      REDIS_PORT="6379"
      REDIS_DB="0"
      SQLALCHEMY_DATABASE_URI="postgresql://viber:viber@one-cpaas-postgres-stg-us-db.cluster-cogcvcf33adg.us-east-1.rds.amazonaws.com:5432/viber_usage"
      RMQ_PASSWORD="viber"
      RMQ_USER="viber"
      VIBER_URL="https://services.viber.com/vibersrvc/1/send_message"
  }
}
