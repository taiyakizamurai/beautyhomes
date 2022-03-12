class Public::MakersController < ApplicationController
      before_action :authenticate_customer!,except: [:index]
  def index
    @makers = Maker.all
  end

  def show
    @maker = Maker.find(params[:id])
    @items = @maker.items

  end
end

