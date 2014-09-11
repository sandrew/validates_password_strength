module ValidatesPasswordStrength::Checker
  TOP_100_PASSWORDS = %w(password 123456 12345678 1234 qwerty 12345 dragon pussy baseball football letmein monkey 696969 abc123 mustang michael shadow master jennifer 111111 2000 jordan superman harley 1234567 fuckme hunter fuckyou trustno1 ranger buster thomas tigger robert soccer fuck batman test pass killer hockey george charlie andrew michelle love sunshine jessica asshole 6969 pepper daniel access 123456789 654321 joshua maggie starwars silver william dallas yankees 123123 ashley 666666 hello amanda orange biteme freedom computer sexy nicole thunder ginger heather hammer summer corvette taylor fucker austin 1111 merlin matthew 121212 golfer princess cheese martin chelsea patrick richard diamond yellow bigdog secret asdfgh sparky cowboy)

  def self.get_password_strength(pwd)
    if TOP_100_PASSWORDS.index(pwd)
      1
    else
      result = normalize_result [
        [1, pwd =~ /[a-z]/],
        [1, pwd =~ /[A-Z]/],
        [1, pwd =~ /[0-9]/],
        [1, pwd =~ /[^a-zA-Z0-9]/],
        [3, pwd.length > 7],
        [1, pwd.length > 9],
        [2, pwd.split('').uniq.length > 5]
      ]
      TOP_100_PASSWORDS.any? { |str| pwd.index(str) } ? result / 2 : result
    end
  end

  private

  def self.normalize_result(result)
    result.reduce(0) do |strength, res|
      res[1] ? strength + res[0] : strength
    end.to_f * (10.0/result.map(&:first).reduce(&:+))
  end
end
