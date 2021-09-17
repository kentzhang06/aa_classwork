json.partial! 'party', party: @party

json.guests @party.guests do |guest|
  json.extract! guest, :name
  json.gifts guest.gifts do |gift|
    json.extract! gift, :title, :description
  end
end