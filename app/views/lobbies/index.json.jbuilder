json.array!(@lobbies) do |lobby|
  json.extract! lobby, :id, :list
  json.url lobby_url(lobby, format: :json)
end
