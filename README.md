# ValidatesPasswordStrength

This gem was created with following ideas in my head:

1. Password should not be validated against regexp. When you try to set formal requirements to password, user still can make the worst: `qQ1!qQ1!qQ1!`
2. Password strength should be estimated with some metric. When it is, you can set your own requirements to this metric in your app.
3. Same metrics algorithm should be implemented both on server side and client side, so you can show user that password is weak when it has not been sent to server yet.

## Warning

Algorithm implemented for password strength measurement is simple because I have no cryptography skills. Your help in enhancing it with pull requests or at least formal algorithm description (so I can implement it) will be strongly appreciated.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'validates_password_strength'
```

Add this line to your model with password:

```ruby
validates :password, password_strength: { min: 5 }
```

`:min` option is a minimum value for password strength measured from `0` to `10`. If password strength will be measured less than that value, and error will be added and your model will be invalid. Default value is `5`.

Following lines are an example of usage on client-side:

```coffee
#= require jquery-validates_password_strength

$ ->
  $('input[type=password]').validatesPasswordStrength (i) ->
    $('.strength-indicator.progress-bar .filler').css 'width', (10 * i)+'%'

# or

PasswordStrengthValidator.getPasswordStrength 's0me_p4ssw0rd'
```

## Contributing

Ruby specs:

    $ rake spec

CoffeeScript specs:

    $ rake jasmine

Both specs are run against the same suite of password-estimates pairs defined at `spec/examples.json`.

## Any help in enhancing algorithm is appreciated.
