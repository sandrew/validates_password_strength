#= require validates_password_strength

$.fn.validatesPasswordStrength = (cb) ->
  @each ->
    callback = (e) ->
      cb.call @, PasswordStrengthValidator.getPasswordStrength(item.val()), e
    (item = $(@)).change(callback).keyup(callback)