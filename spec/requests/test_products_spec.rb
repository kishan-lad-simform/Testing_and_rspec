require "rails_helper"

RSpec.describe "TestProducts", type: :request do
  include Devise::Test::IntegrationHelpers

  let(:ok_status) { expect(response).to have_http_status(200) }

  before(:each) do
    @user = FactoryBot.create(:user)
    sign_in(@user)
    @product = FactoryBot.create(:test_product)
  end

  describe "GET index" do
    it "assigning user" do
      get "/"
      ok_status
    end
  end

  describe "GET new product" do
    it "create product" do
      get "/test_products/new"
      @product = FactoryBot.create(:test_product)
      ok_status
    end
  end

  describe "GET all product" do
    it "Show all product page" do
      get "/all_products"
      ok_status
      get "/"
      ok_status
    end
  end

  describe "GET logout" do
    it "redirect to login page" do
      delete "/users/sign_out"
      expect(response).to redirect_to(root_url)
      expect(session[:user_id]).to eq(nil)
    end
  end

  describe "GET product update page" do
    it "Edit the product" do
      get edit_test_product_path(@product)
      @product.update( product_name: "TestDemo" )
      ok_status
    end  
  end 

  describe "Delete Product" do
    it "select product" do 
      delete test_product_path(@product.id)
      expect(response).to redirect_to(root_path)
    end
  end

end
