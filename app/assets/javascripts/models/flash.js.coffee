class Classifieds.Flash extends Batman.Object
  @accessor
    get: (key) -> @[key]
    set: (key, value) ->
      @[key] = value
      if value isnt ''
        setTimeout =>
          @["hide#{Batman.helpers.capitalize(key)}"]()
        , 2000
      value

  hideSuccess: => @unset 'success'
  hideError: => @unset 'error'
