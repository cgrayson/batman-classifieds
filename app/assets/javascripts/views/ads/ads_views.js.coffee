class Classifieds.AdsShowView extends Batman.View
  @accessor 'adOwnedByCurrentUser', ->
    @get('context.ad.user.id') == @get('context.currentUser.id')

  @::on 'appear', ->
    $('html, body')
      .stop()
      .animate({scrollTop: 0}, 600, 'easeInOutExpo')

class Classifieds.AdsFormView extends Batman.View
  @accessor 'isSubmitting', -> @get('context.ad')?.get('lifecycle.isSaving')
  constructor: ->
    super
    @observe 'isSubmitting', (currentlySaving) =>
      inputs = $(@get('node')).find('input')
      form = $(@get('$node')).find('form')
      if currentlySaving
        inputs.attr('disabled', true)
        form.spin()
      else
        form.spin(false) # cancels spinner
        inputs.attr('disabled', false)

class Classifieds.AdsCreateView extends Classifieds.AdsFormView
class Classifieds.AdsEditView extends Classifieds.AdsFormView

