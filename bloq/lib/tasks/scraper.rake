namespace :scraper do
  desc "Fetch design posts from Wallpaper"
  task scrape: :environment do
    require 'open-uri'
    require 'nokogiri'
    require 'csv'

    url = "http://www.wallpaper.com/design"

    page = Nokogiri::HTML(open(url))

    details = []
    image = []
    link = []

    page.css('div.news').each do |line|
      details << line.text.strip
    end

    page.css('div.news img').each do |line|
      image << line.to_s.slice(25..-3)
    end

    link = page.css('div.newsText a').map {|link| "http://www.wallpaper.com" + link['href']}

    # store scraped design data to database
    details.length.times do |i|
      @design = Design.new
      @design.info = details[i].split(/\n            \n        \n/)[0]
      @design.img_url = image[i]
      @design.link_url = link[i]
      @design.save
    end


  end

  desc "TODO"
  task destroy_all_posts: :environment do
  end

end
