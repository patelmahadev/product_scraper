class MyFirstJob
  include Sidekiq::Job

  def perform(*args)
    Product.all.each do |product|
      new_scraped_data = ScraperService.new(product.url).scrape
      product.update(new_scraped_data.except(:category))
    end
  end
end
