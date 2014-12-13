namespace :scraper do
  desc "Fetch design posts from Wallpaper"
  task scrape: :environment do
    require 'open-uri'
    require 'nokogiri'
    require 'csv'

    # design data scrape
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

    # travel data scrape
    url_travel = "http://www.wallpaper.com/travel"
    page_travel = Nokogiri::HTML(open(url_travel))

    info_travel = []
    img_travel = []
    link_travel = []

    page_travel.css('div.news.span3 a').each do |line|
      info_travel << line.text.strip
    end

    page_travel.css('div.news img').each do |line|
      img_travel << line.to_s.slice(25..-3)
    end

    link_travel = page_travel.css('div.news.span3 a').map {|link| "http://www.wallpaper.com" + link["href"]}

    info_travel.reject!(&:empty?)
    link_travel.uniq!

    info_travel.length.times do |i|
      @travel = Travel.new
      @travel.title = info_travel[i]
      @travel.img_url = img_travel[i]
      @travel.link_url = link_travel[i*2]
      @travel.save
    end
  end

  desc "TODO"
  task destroy_all_posts: :environment do
  end

end
