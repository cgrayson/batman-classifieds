class Classifieds.AdsController extends Batman.Controller
  routingKey: 'ads'
  messageSendSuccess: null
  searchQueryError: false

  ads: null
  adsByUser: Classifieds.Ad.get('all').indexedBy('user_id')

  @accessor 'otherAds', ->
    userId = @get('ad.user_id')
    @get('adsByUser').get(userId)

  index: (params) ->
    Classifieds.Ad.load (err) -> throw err if err

    switch params.filter
      when 'free', 'trade'
        @set 'ads', Classifieds.Ad.get('all').indexedBy('sale_type').get(params.filter)
      when 'previous'
        @set 'ads', Classifieds.Ad.get('all').indexedBy('active').get(false)
      else
        @set 'ads', Classifieds.Ad.get('all')

  show: (params) ->
    @set 'ad', Classifieds.Ad.find parseInt(params.id, 10), (err) ->
      throw err if err
    @set 'otherAd', Classifieds.Ad.get('all')

  new: (params) ->
    @set 'ad', new Classifieds.Ad()

  create: (params) =>
    @get('ad').save (err) =>
      if err
        throw err unless err instanceof Batman.ErrorsSet
      else
        Classifieds.set "flash.success", "Ad #{@get('ad.title')} created successfully!"
        @redirect Classifieds.get('routes.ads.path')

  edit: (params) ->
    @set 'ad', Classifieds.Ad.find parseInt(params.id, 10), (err) ->
      throw err if err

  update: ->
    @get('ad').save (err) =>
      if err
        throw err unless err instanceof Batman.ErrorsSet
      else
        Classifieds.set "flash.success", "Ad #{@get('ad.title')} updated successfully!"
        #@redirect Classifieds.get('routes.ads.path')

  submitSearch: (form) =>
    @redirect "/search?q=#{@get('searchQuery')}"

  search: (params) ->
    if params.q && (params.q = params.q.replace(/^\s+|\s+$/g,"")).length > 0
      @set 'searchQueryError', false
      @set 'searchQuery', params.q
      @set 'searchAds', null

      Classifieds.Ad.load {url: "/ads/search.json?q=#{params.q}"}, (error, records) =>
        throw error if error
        @set 'searchAds', records
    else
      @set 'searchQueryError', true

  sendMessage: () ->
    message = @get('ad.message')
    message.sendToOwner (err, message) =>
      if err
        throw err unless err instanceof Batman.ErrorsSet
      else
        @set('messageSendSuccess', "Your message about ad #{@get 'ad.title'} has been sent!")
        setTimeout =>
          @set('messageSendSuccess', null)
        , 3000

        ad = @get('ad')
        ad.set('message', ad.buildMessage())

