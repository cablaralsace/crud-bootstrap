class DogsController < ApplicationController
  before_action :set_dog, only: %i[ show edit update destroy ]

  def index
    @dogs = Dog.all
  end

  def show
    # @dog = Dog.find(params[:id])
  end

  def new
    @dog = Dog.new
  end

  def edit
    # @dog = Dog.find(params[:id])
  end

  def create
    @dog = Dog.new(dog_params)

    if @dog.save
      redirect_to root_path, notice: "Recipe was succesfully created."
    else
      render :new
    end
  end

  def update
    # dog = Dog.find(dog_params[:id])
    if @dog.update(dog_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @dog = Dog.find(params[:id])
    @dog.destroy

    redirect_to root_path
  end

  private
    def set_dog
      @dog = Dog.find(params[:id])
    end

    def dog_params
      params.require(:dog).permit(:name, :breed)
    end
end
