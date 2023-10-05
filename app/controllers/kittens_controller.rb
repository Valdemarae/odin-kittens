class KittensController < ApplicationController
  def index
    @kittens = Kitten.all
  end

  def show
    @kitten = Kitten.find(params[:id])
  end

  def new
    @kitten = Kitten.new
  end

  def create
    @kitten = Kitten.new(kitten_params)
    if @kitten.save
      redirect_to kitten_path(@kitten.id), notice: 'Kitten has been created!'
    else
      flash.now[:alert] = 'Fields cannot be blank!'
      render :new
    end
  end
  
  def update
    @kitten = Kitten.find(params[:id])
    if @kitten.update(kitten_params)
      redirect_to kitten_path(@kitten.id), notice: 'Kitten has been updated!'
    else
      flash.now[:alert] = 'Fields cannot be blank!'
      render :edit
    end
  end

  def edit
    @kitten = Kitten.find(params[:id])
  end

  def destroy
    @kitten = Kitten.find(params[:id])
    @kitten.destroy
    redirect_to root_path, notice: 'Kitten has been deleted!'
  end

  def kitten_params
    params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end
end
