# Require the version of batman in batman-rails
#= require batman/batman
#= require batman/batman.jquery
#= require batman/batman.rails

# If you would like to run on Batman master, make a symlink in vendor/assets/javascripts/batman_dev to your git checkout of batman,
# and remove the slashes before the = below, and add them to the lines above which require batman from batman-rails.
#/= require batman_dev/batman
#/= require batman_dev/batman.jquery
#/= require batman_dev/extras/batman.rails

#= require_self

#= require_tree ./models
#= require_tree ./controllers
#= require_tree ./helpers

window.Classifieds = class Classifieds extends Batman.App

  Batman.View::prefix = 'assets/views'

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
