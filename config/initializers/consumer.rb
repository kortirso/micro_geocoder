# frozen_string_literal: true

channel = RabbitMq.consumer_channel
queue = channel.queue('geocoding', durable: true)

queue.subscribe(manual_ack: true) do |delivery_info, properties, payload|
  payload = JSON.parse(payload)
  coordinates = Geocoder.geocode(payload['city'])

  client = AdsService::Client.new
  client.update_coordinates(payload['id'], coordinates, properties[:correlation_id])

  channel.ack(delivery_info.delivery_tag)
end
