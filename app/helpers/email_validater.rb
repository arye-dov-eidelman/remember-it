class EmailValidator < ActiveModel::EachValidator
  # I dont have a clue how, but this validates emails
  # add this to a model to use:
  #   validates :email, email: true

  def validate_each(record, attribute, value)
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors[attribute] << (options[:message] || "is not an email")
    end
  end
end
