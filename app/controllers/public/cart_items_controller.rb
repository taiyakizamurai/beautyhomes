class Public::CartItemsController < ApplicationController
    before_action :authenticate_customer!
  def index
    @cart_items = current_customer.cart_items

  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    @cart_items = current_customer.cart_items
    @cart_item2 = @cart_items.find_by(item_id: @cart_item.item_id)
    if @cart_items.find_by(item_id: @cart_item.item_id)
     amount = @cart_item2.amount + @cart_item.amount
     @cart_item2.update(amount: amount)
     redirect_to cart_items_path
    elsif
    @cart_item.save
    redirect_to cart_items_path
    else
    redirect_to items_path
    end

  end

  def update
    @cart_items = CartItem.find(params[:id])
    if @cart_items.update(cart_item_params)
    redirect_to cart_items_path
    else
      render 'index'
    end
  end

  def destroy
    @cart_items = CartItem.find(params[:id])
    if @cart_items.destroy
    redirect_to items_path
    else
      render 'index'
    end
  end

  def destroy_all
    @cart_items = current_customer.cart_items
    if @cart_items.destroy_all
    redirect_to cart_items_path
    else
      render 'index'
    end
  end

    def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount )
    end
end
