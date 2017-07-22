class ProductsController < ApplicationController
  def index
    @products = Product.all.order(created_at: :desc).page(params[:page]).per(20)
  end

  def show
    @product = Product.find_by( id: params[:id] )
    add_breadcrumb @product.title
  end

  def new
    @product = Product.new
  end
end