class TestProductsController < ApplicationController
  before_action :authenticate_user!
  def index
    get_user_product
  end

  def new
    @product = TestProduct.new 
  end

  def create
    @product = current_user.test_products.build(product_params)
    if @product.save
      redirect_to root_path
    else  
      render :new, status: 422
    end
  end

  def edit
    find_product
  end

  def update
    find_product
    if @product.update(product_params)
      redirect_to root_path
    else
      render :edit, status: 422
    end
  end

  def destroy
    find_product
    @product.destroy
    redirect_to root_path
  end

  def all_products
    @products = TestProduct.all
  end

  private 

    def find_product
      @product = TestProduct.find(params[:id])
    end

    def get_user_product
      @products = TestProduct.where("user_id = ?", current_user.id)
    end

    def product_params
      params.require(:test_product)
      .permit( 
        :product_name, 
        :description, 
        :price,
      )
    end
end
