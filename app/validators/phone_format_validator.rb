class PhoneFormatValidator < ActiveModel::EachValidator

  REGEX = /\A(?:\+?\d{1,3}\s*-?)?\(?(?:\d{3})?\)?[- ]?\d{3}[- ]?\d{4}\z/i

  def validate_each(record, attribute, value)
    if value.match(REGEX).blank?
      record.errors.add(attribute, 'invalid format')
    end
  end
end