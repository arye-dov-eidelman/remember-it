module Messageable
  
  def create_message(content, intent="info")
    session[:messages] ||= []

    # intent = ( successful (green) | info (default (white)) | notice (yellow) | warning (orange) | failure (red) )
    session[:messages] << {content: content, intent: intent}
  end

  def get_messages
    session[:messages] ||= []
  end

  def clear_messages
    session[:messages] = []
  end

  def recieve_messages
    result = get_messages
    clear_messages
    result
  end
end