json.array!(@statistics) do |statistic|
  json.extract! statistic, :id, :ranking
  json.url statistic_url(statistic, format: :json)
end
