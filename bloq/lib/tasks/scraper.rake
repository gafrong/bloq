# Scrapes Resources for database

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

    # food data scrape
    url_food = "http://www.theworlds50best.com/"
    page_food = Nokogiri::HTML(open(url_food))
        

    info_food = []
    img_food = []
    link_food = []

    page_food.css('li.lead').each do |line| 
      info_food << line.text
    end

    page_food.css('div.he-pos-one img').each do |line|
      img_food << "http://www.theworlds50best.com" +line.to_s.slice(10..-3)
    end

    link_food = page_food.css('div.he-pos-one a').map {|link| "http://www.theworlds50best.com" + link["href"]}

    info_food.length.times do |i|
      @food = Food.new
      @food.title = info_food[i]
      @food.img_url = img_food[i]
      @food.link_url = link_food[i]
      @food.save
    end

    # tech data scrape
    url_tech = "http://www.techlife.net/"
    page_tech = Nokogiri::HTML(open(url_tech))
        

    info_tech = []
    img_tech = []
    link_tech = []

    page_tech.css('header h2').each do |line|
      info_tech << line.text
    end

    img_tech = page_tech.css('header a img.wp-post-image').map {|link| link['src']}

    link_tech = page_tech.css('header h2 a').map {|link| link['href']}


    info_tech.length.times do |i|
      @tech = Tech.new
      @tech.title = info_tech[i]
      @tech.img_url = img_tech[i]
      @tech.link_url = link_tech[i]
      @tech.save
    end
  end

  desc "TODO"
  task destroy_all_posts: :environment do
  end

end
