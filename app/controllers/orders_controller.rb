class OrdersController < ApplicationController
  def index
    @orders = Order.all.order(created_at: :desc).page(params[:page]).per(20)
  end

  def show
    @product = Product.find_by( id: params[:product_id] )
    @user = current_user
  end

  def create
    product = Product.find_by( id: params[:product_id])
    quantity = 1
    Order.create(
      product_id: product.id,
      quantity: quantity,
      quantity_price: product.price * quantity,
      user_id: current_user.id,
      user_name: current_user.name,
      user_mail: current_user.email,
      user_phonenumber: current_user.phone_number,
      user_addres: current_user.address
      )
    redirect_to(products_path)
  end

end