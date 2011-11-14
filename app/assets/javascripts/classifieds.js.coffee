#= require batman_dev/batman
#= require batman_dev/batman.jquery
#= require batman_dev/extras/batman.rails

#= require_self

#= require_tree ./models
#= require_tree ./controllers
#= require_tree ./helpers

window.Classifieds = class Classifieds extends Batman.App

  @navLinks: [
    {href: "#!/ads?filter=all", text: "All Listings"},
    {href: "#!/ads?filter=free", text: "Free"},
    {href: "#!/ads?filter=trade", text: "Trade"},
    {href: "#!/ads?filter=previous", text: "Previous Listings"}
  ]

  @resources 'ads'
  @root 'ads#index'
  @route '/search', 'ads#search', resource: 'ads', action: 'search'

  @on 'run', ->
    user = new Classifieds.User()
    user.url = '/sessions/current'
    user.load (err) -> throw err if err
    @set 'currentUser', user

  @on 'ready', ->
    console.log "Classifieds ready for use."

  @flash: Batman()
  @flash.accessor
    get: (k) -> @[k]
    set: (k, v) ->
      @[k] = v
      if v isnt ''
        setTimeout =>
          @set(k, '')
        , 2000
      v

  @flashSuccess: (message) -> @set 'flash.success', message
  @flashError: (message) ->  @set 'flash.error', message
