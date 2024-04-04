# spec/controllers/products_controller_spec.rb

require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  describe "GET #index" do
   it "should give list of products" do
    get :index, params: { search: "honey"}
     expect(response.status).to eq(200)
   end
   it 'should not present parans' do
     get :index
     expect(response.status).to eq(200)
   end
  end

  describe "POST #create" do
   it "should create products" do
    post :create, params: { url: "https://www.amazon.in/dp/B0CQPGG8KG/ref=sspa_dk_detail_3?pd_rd_i=B0CQPGG8KG&pd_rd_w=pkXdC&content-id=amzn1.sym.2575ab02-73ff-40ca-8d3a-4fbe87c5a28d&pf_rd_p=2575ab02-73ff-40ca-8d3a-4fbe87c5a28d&pf_rd_r=277JP01P23S374DP8PZ5&pd_rd_wg=LfYZJ&pd_rd_r=10cb2cf7-3003-4897-9ada-437f5bdf9331&s=electronics&sp_csd=d2lkZ2V0TmFtZT1zcF9kZXRhaWw&th=1 "}
     expect(response.status).to eq(200)
   end

   it "should throw error when url is not given" do
    post :create
     expect(response.status).to eq(302)
   end
  end
end
