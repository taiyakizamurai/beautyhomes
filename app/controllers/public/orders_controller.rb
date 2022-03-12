class Public::OrdersController < ApplicationController
    before_action :authenticate_customer!
  def index
    @orders = current_customer.orders
    @cart_items = current_customer.cart_items

  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details

  end

  def new
    if current_customer.cart_items.blank?
      redirect_to request.referer
    else
    @addresses = current_customer.addresses
    @order = Order.new
  end
  end

  def confirm
  @cart_items = current_customer.cart_items
  @order_new = Order.new
  @order = Order.new(order_params)
  @order.shipping_cost = 800

  if params[:order][:select_address] == "1"

    @order.postal_code = current_customer.postal_code
    @order.address = current_customer.address
    @order.name = current_customer.last_name+current_customer.first_name


  elsif params[:order][:select_address] == "2"
      @order.name = Address.find(params[:order][:address_id]).name
      @order.address = Address.find(params[:order][:address_id]).address
      @order.postal_code = Address.find(params[:order][:address_id]).postal_code
      p @order
  end
  end

  def create
    @cart_items = current_customer.cart_items
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save
     @cart_items.each do |cart_item|
    OrderDetail.create({
      amount: cart_item.amount,
      order_id: @order.id,
      item_id: cart_item.item.id,
      price: ((cart_item.item.price*1.08)*(cart_item.amount)).to_i
    })
    end
     @cart_items.destroy_all
    redirect_to orders_complete_path
  end

  def complete
  end

   private
   def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :shipping_cost, :total_payment, :status, :payment_method )

   end
end
