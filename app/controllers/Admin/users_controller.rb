class Admin::UsersController < ApplicationController

 before_action do
    unless current_user.admin? || is_impersonating?
      flash[:notice] = "You don't have admin access!"
      redirect_to '/'
    end
  end

  def index
    @users = User.all.page(params[:page]).per(5)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to admin_users_path
    else
      render edit_admin_user_path(@user.id)
    end
  end

  def new
    @user = User.new
    render "admin/users/new" 
  end

  def create
    @user = User.new(user_params)
    @user.password_confirmation = user_params[:password]
    if @user.save
      UserMailer.admin_created(@user).deliver
      redirect_to admin_users_path, notice: "Created new user: #{@user.firstname}!"
    else
      redirect_to new_admin_user_path
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    UserMailer.admin_deleted(@user).deliver
    redirect_to admin_users_path, notice: "Succesfully deleted user: #{@user.id}!"
  end

  def impersonate
    @user = User.find(params[:id])
    session[:admin_id] = current_user.id
    session[:user_id]= @user.id
    redirect_to movies_path
  end

  def end_impersonating
    session[:user_id] = session[:admin_id]
    session[:admin_id] = nil
    redirect_to admin_users_path, notice: "finished impersonating"
  end

  protected

  def user_params
    params.require(:user).permit(:email, :firstname, :lastname, :password, :admin)
  end

end
