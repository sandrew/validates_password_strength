require 'active_model/validator'
require 'validates_password_strength/checker'

class PasswordStrengthValidator < ActiveModel::EachValidator
  def validate_each(record, attr_name, value)
    options[:min]     ||= 5
    if ValidatesPasswordStrength::Checker.get_password_strength(value) < options[:min]
      record.errors.add(attr_name, :weak_password, options)
    end
  end
end