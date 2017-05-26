class InFutureValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)
    if value.present? && value < Time.zone.today
      record.errors.add(attribute, (options[:message] || 'Date can not be in past'))
    end
  end

end
