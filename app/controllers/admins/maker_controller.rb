class Admins::MakerController < ApplicationController
  def new
    @maker = Maker.new
  end

def create
    @maker = Maker.new(maker_params)
    @maker.save
    redirect_to admin_maker_path(@maker.id)
end

  def index
    @makers = Maker.all
  end

  def show
    @maker = Maker.find(params[:id])
  end

  def edit
   @maker = Maker.find(params[:id])

  end

    def update
    @maker = Maker.find(params[:id])
    if @maker.update(maker_params)
    redirect_to admin_maker_path(@maker.id)
    else
      render 'edit'
    end
    end

    def item_params
    params.require(:maker).permit(:name, :introduction, :image, :is_active)
    end
end
