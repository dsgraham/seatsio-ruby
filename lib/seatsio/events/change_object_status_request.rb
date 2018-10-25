def create_change_object_status_request(object_or_objects, status, hold_token, order_id, event_key_or_keys)
  result = {}
  result[:objects] = normalize(object_or_objects)
  result[:status] = status
  result[:holdToken] = hold_token if hold_token != nil
  result[:orderId] = order_id if order_id != nil
  if event_key_or_keys.is_a? Array
    result[:events] = event_key_or_keys
  else
    result[:events] = [event_key_or_keys]
  end

  result
end

def normalize(object_or_objects)
  if object_or_objects.is_a? Array
    if object_or_objects.length == 0
      []
    end

    result = []
    object_or_objects.each do |object|
      result.append(object)
    end
    return result

  end
  normalize([object_or_objects])
end
