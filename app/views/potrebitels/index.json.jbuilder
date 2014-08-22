json.array!(@potrebitels) do |potrebitel|
  json.extract! potrebitel, :id, :login, :password, :email, :win, :lost, :success_cat_id, :failure_cat_id, :time_online, :reiting_pos
  json.url potrebitel_url(potrebitel, format: :json)
end
