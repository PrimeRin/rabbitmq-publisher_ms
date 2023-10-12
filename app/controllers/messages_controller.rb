class MessagesController < ApplicationController
  def publish
    connection = Bunny.new(hostname: 'localhost', port: 5672, username: 'guest', password: 'guest')
    connection.start

    channel = connection.create_channel
    exchange = channel.fanout('messages')

    # Create a queue and specify a name
    queue_name = 'messages'
    queue = channel.queue(queue_name, durable: true)

    # Bind the queue to the exchange
    queue.bind(exchange)

    message = 'Hello, Microservice 2!'
    exchange.publish(message)

    connection.close

    render json: { message: 'Message published' }
  end
end
