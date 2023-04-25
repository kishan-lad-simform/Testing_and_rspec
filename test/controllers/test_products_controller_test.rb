require "test_helper"

class TestProductsControllerTest < ActionDispatch::IntegrationTest
  

  setup do 
    sign_in users(:john)
    @product = test_products(:one)
  end

  test "should get index page" do
    get "/"
    assert_response :success
  end

  test "should go to new product page" do
    get new_test_product_url
    assert_response :success
    assert_select "h1", "Product"
  end

  test "should create product" do 
    assert_difference('TestProduct.count') do 
      post test_products_url, params: {
        test_product: {
          product_name: "New Product",
          price: 1000,
          description: "New Desc",
          user_id: users(:john).id
        }
      }
    end
    assert_redirected_to root_path
  end

  test "should go to all product page" do
    get all_products_url
    assert_response :success
    assert_select "th", "Product name"
  end

  test "should go to edit product page" do
    get edit_test_product_url(@product)
    assert_response :success
  end

  test "should logout the user" do
    sign_out users(:john)
    get "/users/sign_in"
    assert_response :success
  end

  
end
