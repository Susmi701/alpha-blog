class UsersController < ApplicationController
  before_action :set_user,only: [:edit,:show,:update, :destroy]
  before_action :require_user,only: [:edit, :update, :destroy]
  before_action :require_same_user,only:[:edit, :update, :destroy]

  def index
    @users=User.paginate(page: params[:page], per_page: 5)
  end

  def new
    @user = User.new
  end

  def edit   
  end

  def show   
    @articles =@user.articles.paginate(page: params[:page], per_page: 5)
  end

  def update
    if(@user.update(user_params))
      flash[:notice] ="Edit Successfull"
      redirect_to user_path(@user)
    else
      render :edit,status: :unprocessable_entity
    end
  end

  def create
    @user=User.new(user_params)
    if @user.save
      session[:user_id]=@user.id
      flash[:notice]="Welcome #{@user.username}"
      redirect_to @user
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy 
    @user.destroy
    session[:user_id]=nil if @user == current_user
    flash[:notice]="Account and all associated articles deleted successfully"
    redirect_to articles_path
end

  private
  def user_params
    params.require(:user).permit(:username,:email,:password)
  end

  def set_user
    @user =User.find(params[:id])
  end

  def require_same_user
    if current_user != @user && !current_user.admin?
        flash[:notice]="You cannot edit or delete this user "
        redirect_to @user
    end
  end
end
