class UsersController < ApplicationController
  
  def new
    @user = User.new
  end


  def show
    @user = User.find(params[:id])
  end


  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = "Welcome to the sample app!"
      redirect_to @user
    else
      flash[:error] = "check your errors please"
      render 'new'
    end
  end





end
