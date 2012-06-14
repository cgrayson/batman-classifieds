class Classifieds.Message extends Batman.Model
  @storageKey: 'messages'
  @encode "body", "ad_id"
  @persist Batman.RailsStorage
  @validate 'body', {presence: true}

  sendToOwner: (callback) -> @save(callback)
