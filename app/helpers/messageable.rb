module Messageable
  def send_and_delete_any_messages
    @messages = session[:messages] || []
    session[:messages] = []
    binding.pry
  end

  def create_message(content, intent="info")
    session[:messages] ||= []

    # intent = ( great (green) | info (default (white)) | notice (yellow) | warning (orange) | error (red) )
    session[:messages] << {content: content, intent: intent}
  end
end