class UsersController < ApplicationController
 

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    email = params['email']
    password = params['password']
    
    user = User.new
    user.email = email
    user.crypted_password = password
    
    if user.save
      flash[:success] = "Bem-vindo ao BikeGuide!"
      render '/perfil'
    else
      render 'new'
      
    end
  end

  
end