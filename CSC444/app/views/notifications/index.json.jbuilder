json.array! @notifications do |notice|
    json.actor_id notice.actor_id
    json.action notice.action
end    