require "rails_helper"

RSpec.describe TestProduct, type: :model do
  context "validation" do
    before do
      @user = User.new(
        id: rand(1..1000),
        email: "tom@gmail.com",
        password: 123456,
      )
      expect(@user.save!).to eq(true)

      @product = TestProduct.new(
        product_name: "Test rspec product2",
        price: 1002,
        description: "Description of rspec2",
        user_id: @user.id,
      )
      expect(@product.save).to eq(true)
    end

    it "ensure product should be save" do
      product = TestProduct.new(
        product_name: "Test rspec product1",
        price: 1001,
        description: "Description of rspec1",
        user_id: @user.id,
      )
      expect(product.save!).to eq(true)
    end

    it "check product name field must be present" do
      product2 = TestProduct.new(
        price: 1001,
        description: "Description of rspec1",
        user_id: @user.id,
      )
      expect(product2).not_to eq(true)
    end

  
  end
end
