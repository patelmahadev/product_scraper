require 'open-uri'
require 'nokogiri'
require 'net/http'
require 'httparty'

class ScraperService
  def initialize(url)
    @url = url
  end

  def scrape
    response = RestClient.get(@url) || HTTParty.get(@url) 
    html = response.body
    doc = Nokogiri::HTML(html)
    title = doc.at_css('title')&.text || doc.title
    description = doc&.at_css('meta[name="description"]').nil? ? "Not availiable" : doc&.at_css('meta[name="description"]')['content'] || doc&.at_css('div.a-expander-content.a-expander-partial-collapse-content')&.at_css('div.a-section.a-spacing-small.a-spacing-top-small')&.text&.gsub(/\s+/, ' ')&.gsub(/\s*:\s*/, ': ')&.strip ||  doc.at_css('div.a-expander-content.a-expander-partial-collapse-content')&.text&.gsub(/\s+/, ' ')&.gsub(/\s*:\s*/, ': ')&.strip
    price = doc.at_css('span.a-price-whole')&.children&.first&.text&.gsub(',','')&.to_i || doc.at_css('.price') || doc.at_css('div.PriceColorWrapper--1lnr9cq.eANBFZ')&.children&.first&.children&.first&.children&.first&.children&.last&.text&.to_i || doc&.at_css('span.a-price-whole')&.text&.gsub(/[,.\n]/, '')&.to_f
    size = doc.at_css('span.a-icon-alt')&.children&.text || doc&.at_css('span.a-icon-alt')&.text
    category = doc&.at_css("ul.a-unordered-list.a-horizontal.a-size-small")&.text&.gsub(/[,.\n]\s+/, '')&.split('›')&.last || doc.at_css('.category')&.text || doc.at_css('.a-link-normal a-color-tertiary')&.text || "others"
    # doc.at_css('.a-unordered-list.a-horizontal.a-size-small')&.children&.text&.gsub(" ","")&.gsub("\n",'')&.split('›')&.last || doc.at_css('.category')&.text || doc.at_css('.a-link-normal a-color-tertiary')&.text || "others"
    image_urls = JSON.parse(doc&.at_css("div#imgTagWrapperId")&.children[1]&.attribute("data-a-dynamic-image")&.value)&.keys.first

    { title: title, description: description, price: price, size: size, url: @url,category: category, image_urls: image_urls }
  end
  
end