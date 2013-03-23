require 'spec_helper'

describe ValidatesPasswordStrength::PasswordStrengthValidator do
  JSON.parse(File.open(File.expand_path('../../examples.json', __FILE__)).read).each do |pwd, score|
    it "gives #{score} for password '#{pwd}'" do
      ValidatesPasswordStrength::Checker.get_password_strength(pwd).should == score
    end
  end
end