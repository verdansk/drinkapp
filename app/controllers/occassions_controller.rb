class OccassionsController < ApplicationController
  before_action :set_user

  def index
    if User.find(@user.id) || User.find(params[:user_id])
    @occassions = Occassion.where("user_id = ?", @user.id)
    else
      redirect_to root
    end
  end

  def show
    @occassion = Occassion.find(params[:id])
  end

  def new
    @occassion = Occassion.new
  end

  def create
    @occassion = Occassion.new(occassion_params)
    @occassion.user = @user
    @occassion.save!
    redirect_to user_occassion_path(@user, @occassion)
  end

  def edit
    @occassion = Occassion.find(params[:id])
  end

  def update
    @occassion = Occassion.find(params[:id])
    @occassion.update(occassion_params)
    redirect_to occassion_path(@occassion)
  end

  def increment
    @occassion = Occassion.find(params[:id])
    @occassion.increment!(:drink_num)
    redirect_to user_occassion_path(@user, @occassion)
  end

  def destroy
    @occassion = Occassion.find(params[:id])
    @occassion.destroy
    redirect_to user_occassions_path(@user)
  end

  private

  def occassion_params
    params.require(:occassion).permit(:occassion)
  end

  def set_user
    @user = current_user
  end

end
