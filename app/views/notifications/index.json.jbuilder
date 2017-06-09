json.array! @notifications do |n|
  json.reciepient n.reciepient
  json.actor n.actor
  json.action n.action
  json.notifiable n.notifiable

  json.url stores_path(n.notifiable.store, anchor: dom_if(n.notifiable)
end
