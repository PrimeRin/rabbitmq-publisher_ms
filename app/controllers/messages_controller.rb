class MessagesController < ApplicationController
  def publish
    connection = Bunny.new
    connection.start

    channel = connection.create_channel
    exchange = channel.fanout('logs')

    message = 'Hello, Microservice 2!'
    exchange.publish(message)

    connection.close

    render json: { message: 'Message published' }
  end
end
