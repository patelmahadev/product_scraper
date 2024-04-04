# README


Product Scraping Web Application:-

Here we start with installation:-
	Versions used:
	    ruby - 3.0.0
	    rails - 7.1.3
	    redis
	1. Clone the repository: git clone https://github.com/your-username/product-scraping-app.git2. Navigate to the project directory: cd product-scraping-app
	3. Install dependencies: bundle install.
	4. Set up the database: rails db:create db:migrate
	5. Start the Rails server: rails server.6. In the new terminal start the sidekick server:- bundle exec sidekiq.
	Working:-Submit the below URL of a product detail page from Amazon to scrape product information.
	ex:- (https://www.amazon.in/CAPRESE-CHCLYLGCOR-Caprese-Cely-Coral/dp/B08ZJZZCT4/ref=sl_ob_desktop_dp_0_2_v2?_encoding=UTF8&pd_rd_w=pLWiS&content-id=amzn1.sym.cdbcd11c-3329-43cb-9547-fb297b2c655b&pf_rd_p=cdbcd11c-3329-43cb-9547-fb297b2c655b&pf_rd_r=FFP4S0HSFHJHEK673FWY&pd_rd_wg=bdA57&pd_rd_r=837a1fff-1329-47e3-bfed-3e26dc1d0d56)

Web Scraping & Data Storage:-
	It will try to grasp the product title, description, price, rating, and category information from the original page. And will the product and category in our database with the fetched details.

Product Display and Management:-
    Now above product after storing into the database it will come up on index page where we're showing all the details in a proper UI.

Search and Interaction:-
    Added search functionality to filter a product from the list of products using the category name.

Test case:-
    We also write test cases by using Rspec and factory_bot_rails for respective codes.


Note:- 
	1. Use Amazon products only as input.
	2. Amazon has put some restrictions on scrapping data and it's blocking our IP (for some time 5 -6 hours ) when making multiple requests.

	Reference for the complete flow please see the attached video click where I demonstrate complete working.