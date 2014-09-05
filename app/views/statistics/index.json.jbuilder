json.array!(@statistics) do |statistic|
  json.extract! statistic, :id, :user, :gameswon
  json.url statistic_url(statistic, format: :json)
end
