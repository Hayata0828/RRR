class AdminProductsController < ApplicationController
  def index
    @products = Product.all.order(created_at: :desc).page(params[:page]).per(20)
  end

  def show
    @product = Product.find_by( id: params[:id] )
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(product_params)
    redirect_to( admin_products_index_path )
  end

  def edit
    @product = Product.find_by(id: params[:id])
  end

  def update
    @product = Product.find_by(id: params[:id])
    @product.update(product_params)
    redirect_to(admin_product_path)
  end

  def destroy_check
    
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to(admin_products_index_path)
  end


  private

  def product_params
    params.require(:product).permit(:title, :description, :price, :category, :image_main, :image_sub1, :image_sub2, :admin_id, :order_id)
  end
end