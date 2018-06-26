module Messageable
  def send_and_delete_any_messages
    @messages = session[:messages] 
    session[:messages]
  end

  def create_message(message, intent="info")
    session[:messages] ||= []

    # intent = ( great (green) | info (default (white)) | notice (yellow) | warning (orange) | error (red) )
    session[:messages] << {message: message, intent: intent}
  end
end