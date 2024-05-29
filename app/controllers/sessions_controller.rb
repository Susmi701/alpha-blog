class SessionsController < ApplicationController

  def new
  end

  def create
   @user =User.find_by(email: params[:session][:email].downcase)
   if @user && @user.authenticate(params[:session][:password])
    session[:user_id]=@user.id
    flash[:notice]="Login successfull"
    redirect_to @user
   else
    flash.now[:alert]="Login failed"
    render 'new', status: :unprocessable_entity
   end
  end

  def destroy
    session.delete(:user_id)
    flash[:notice]="Logged out"
    redirect_to login_path
  end
end
