class EmailFormatValidator < ActiveModel::EachValidator

  REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  def validate_each(record, attribute, value)
    if value.match(REGEX).blank?
      record.errors.add(attribute, 'invalid email format')
    end
  end
end