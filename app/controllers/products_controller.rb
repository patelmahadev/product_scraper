class ProductsController < ApplicationController
  def index
        category = Category.where("name LIKE ?", "%#{params[:search]}%") if params[:search].present?
      if category.present?
           @products = category.map{|a| a.products}.flatten
      else
         flash[:alert] = "No results found for '#{params[:search]}'"
         @products = Product.all.reverse
      end
  end

    def create
      url = params[:url]
      
      scraped_data = ScraperService.new(url).scrape
      category = Category.find_or_create_by(name: scraped_data[:category])
      product = category.products.create(scraped_data.except(:category))

      # redirect_to products_path, notice: "Product '#{product.title}' scraped successfully!"
      redirect_to products_path,  status: 200, notice: "Product '#{product.title}' scraped successfully!"
    rescue StandardError => e
      redirect_to products_path, alert: "Failed to scrape product: #{e.message}"
    end
end
