reduce = (arr, init, cb) ->
  for item in arr
    init = cb(init, item)
  init

map = (arr, cb) ->
  cb(x) for x in arr

uniq = (arr) ->
  reduce arr, [], (memo, x) ->
    memo.push(x) if memo.indexOf(x) == -1
    memo

@PasswordStrengthValidator =
  getPasswordStrength: (pwd) ->
    @__normalizeResult [
      [1, pwd.match(/[a-z]/)],
      [1, pwd.match(/[A-Z]/)],
      [1, pwd.match(/[0-9]/)],
      [1, pwd.match(/[^a-zA-Z0-9]/)],
      [3, pwd.length > 7],
      [1, pwd.length > 9],
      [2, uniq(pwd.split('')).length > 5]
    ]

  __normalizeResult: (result) ->
    reduce(result, 0, (strength, res) ->
      if res[1] then strength + res[0] else strength
    ) * (10/reduce(map(result, (x) -> x[0]), 0, (memo, x) -> memo + x))

