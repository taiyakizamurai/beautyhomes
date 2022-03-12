class Public::HomesController < ApplicationController
    before_action :authenticate_customer!,except: [:top, :about]
  def top
    @troubles = Trouble.all
   @items = Item.all.order("created_at DESC ")
  end


end

