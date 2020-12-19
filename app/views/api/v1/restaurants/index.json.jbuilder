json.array! @restaurants do |restaurant|
  json.extract! restaurant, :id, :name, :address, :cuisine, :average_price
end
