# frozen_string_literal: true

channel = RabbitMq.consumer_channel
queue = channel.queue('geocoding', durable: true)

queue.subscribe(manual_ack: true) do |delivery_info, properties, payload|
  payload = JSON.parse(payload)
  puts payload.inspect
  coordinates = Geocoder.geocode(payload[:city])
  puts coordinates.inspect

  if coordinates.present?
    client = AdsService::RpcClient.fetch
    client.update_coordinates(payload[:id], coordinates)
  end

  channel.ack(delivery_info.delivery_tag)
end
