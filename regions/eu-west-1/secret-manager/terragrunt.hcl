include {
  path = find_in_parent_folders()
}

terraform {
  source = "${replace(get_repo_root(), "\\", "/")}/modules/secret-manager"
}


inputs = {
    aws_region = "us-west-1"
    secret_name        = "onecpaas-prod-eu-viber-secret"
    secret_description = "Viber Application Values"
    secret_values = {
      DB_USERNAME="viber"
      RABBITMQ_BROKER_URL="amqp://viber:viber@172.31.0.6:5672/viber"
      DB_PASSWORD="viber"
      DB_HOST="172.31.0.6"
      DB_PORT="5432"
      DB_NAME="viber_usage"
      REDIS_HOST="172.31.0.6"
      REDIS_PORT="6379"
      REDIS_DB="0"
      SQLALCHEMY_DATABASE_URI="postgresql://viber:viber@172.31.0.6:5432/viber_usage"
      RMQ_PASSWORD="viber"
      RMQ_USER="viber"
      VIBER_URL="https://services.viber.com/vibersrvc/1/send_message"
  }
}
