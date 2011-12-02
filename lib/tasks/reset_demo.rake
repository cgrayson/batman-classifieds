require 'open-uri'

namespace :demo do
   def download_remote_image(image_url)
    io = open(URI.parse(image_url))
    def io.original_filename; base_uri.path.split('/').last; end
    io.original_filename.blank? ? nil : io
  end

  task :reset => :environment do
    Rake::Task['db:reset'].invoke
    ENV['CLASS'] = 'Image'
    Rake::Task['paperclip:clean'].invoke
    Rake::Task['search_index:flush'].invoke if ENV['INDEXTANK_API_URL'].present?

    harry = User.create!(uid: "158950", email: "harry.brundage@gmail.com", first_name: "Harry", last_name: "Brundage")

    ad = harry.ads.build({
      :title => "Cheap Kitten",
      :description => "Listens to the name <em>TIGER</em>. Ideal for breeding. Somehwat tame, willing to trade for expensive dog or bag o' coffee or videogames.",
      :price => 10.00,
      :sale_type => 'fixed'
    })
    ad.activate
    #ad.images.create!(:image => download_remote_image("http://www.webdesign.org/img_articles/7072/BW-kitten.jpg"))
    ad = harry.ads.build({
      :title => "Robust Metal Coathanger",
      :description => "I have one robust metal coathanger perfect for, well, hanging your coat. Willing to trade for something a little less sterile, maybe something wooden.",
      :price => 1000.00,
      :best_offer => true,
      :sale_type => 'fixed'
    })
    ad.activate
    #ad.images.create!(:image => download_remote_image("http://media.photobucket.com/image/coathanger/NoFroBro/coathanger.jpg"))

  end
end
