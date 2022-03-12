class Admins::TroubleController < ApplicationController
  def index
    @troubles = Trouble.all
    @trouble = Trouble.new
  end


  def create
    @trouble = Trouble.new(genre_params)
    @trouble.save
    redirect_to admins_trouble_index_path
  end

  def edit
  @trouble = Trouble.find(params[:id])

  end

    def update
    @trouble = Trouble.find(params[:id])
    if @trouble.update(genre_params)
    redirect_to admin_troubles_path
    else
      render 'edit'
    end
    end
    def trouble_params
     params.require(:trouble).permit(:name)
    end

end

