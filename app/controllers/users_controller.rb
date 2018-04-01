class UsersController < ApplicationController
  before_action :require_authentication,
                only: [:index, :show, :edit, :update, :destroy]
  before_action :not_require_authentication,
                only: [:new, :create]
  before_action :set_user,
                only: [:show, :edit, :update, :destroy]

  # GET /users
  def index
    @users = User.all
  end

  # GET /users/1
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user, notice: 'User was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    redirect_to users_url, notice: 'User was successfully destroyed.'
  end

  def set_user
    is_current = authenticated_user? && current_user.id.eql?(params[:id].to_i)
    @user = is_current ? current_user : User.find(params[:id])
  rescue ActiveRecord::RecordNotFound => e
    redirect_to authenticated_user? ? users_path : root_path,
                notice: e.message
  end
  private :set_user

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
  private :user_params
end
