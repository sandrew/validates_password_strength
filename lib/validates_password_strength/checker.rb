module ValidatesPasswordStrength::Checker
  def self.get_password_strength(pwd)
    normalize_result [
      [1, pwd =~ /[a-z]/],
      [1, pwd =~ /[A-Z]/],
      [1, pwd =~ /[0-9]/],
      [1, pwd =~ /[^a-zA-Z0-9]/],
      [3, pwd.length > 7],
      [1, pwd.length > 9],
      [2, pwd.split('').uniq.length > 5]
    ]
  end

  private

  def self.normalize_result(result)
    result.reduce(0) do |strength, res|
      res[1] ? strength + res[0] : strength
    end.to_f * (10.0/result.map(&:first).reduce(&:+))
  end
end