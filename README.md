# Publisher Microservice

This microservice is responsible for publishing messages to a RabbitMQ exchange using the Bunny gem.

## Table of Contents

- [Overview](#overview)
- [Installation](#installation)
- [Configuration](#configuration)
- [Usage](#usage)
- [Endpoints](#endpoints)
- [Docker Setup](#docker-setup)

## Overview

The Publisher Microservice is a Ruby on Rails application that uses the Bunny gem to establish a 
connection with a RabbitMQ message broker and publish messages to a specific exchange.
This is the [Publisher Microservice](https://github.com/PrimeRin/rabbitmq-publisher_ms), responsible for publishing messages to the 
[Consumer Microservice](https://github.com/PrimeRin/rabbitmq-consumer_ms), which then logs these messages


## Installation

To get started with the Publisher Microservice, follow these steps:

1. Clone the repository:

   ```bash
   git clone git@github.com:PrimeRin/rabbitmq-publisher_ms.git
   cd publisher_ms
   ```
2. Install bundle
    ```bash
       gem install bunny
    ```

## Configuration

In the MessagesController, configure the connection parameters for your RabbitMQ server.

 ```
 def publish
    connection = Bunny.new(hostname: 'localhost', port: 5672, username: 'guest', password: 'guest')
    # Add any other necessary configuration here
    # ... 
 end 
```
Make sure to replace the connection details with the actual settings of your RabbitMQ server.

## Usage
The publish action in the MessagesController publishes a message to a RabbitMQ exchange. You can use this action by sending a POST request to the /publish endpoint

```ruby
# config/routes.rb
Rails.application.routes.draw do
  post 'publish', to: 'messages#publish'
end
```

## Endpoints
The Publisher Microservice exposes the following endpoint:
- POST /publish: Publish a message to the RabbitMQ exchange.

## Docker Setup
To run RabbitMQ in a Docker container locally, you can use the following command:
```angular2html
docker run -it --rm --name rabbitmq -p 5672:5672 -p 15672:15672 rabbitmq:3.12-management
```
This command will start a RabbitMQ container with the management plugin enabled, allowing you to access the RabbitMQ web management interface at http://localhost:15672.