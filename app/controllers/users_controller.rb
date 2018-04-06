class UsersController < ApplicationController
  before_action :require_authentication,
                only: [:index, :show, :edit, :update, :destroy]
  before_action :not_require_authentication,
                only: [:new, :create]
  before_action :set_user,
                only: [:show, :edit, :update, :destroy]

  # GET /users
  def index
    @users = User.preload(:roles).all
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
    @user = User.new(user_new_params)

    if @user.save
      redirect_to root_path, notice: 'User was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_edit_params)
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

  private

  def set_user
    is_current = current_user.id.eql? params[:id].to_i
    @user = is_current ? current_user : User.find(params[:id])
  rescue ActiveRecord::RecordNotFound => e
    redirect_to users_path, notice: e.message
  end

  def user_new_params
    params.require(:user).permit :email, :virtual_role, :password, :password_confirmation
  end

  def user_edit_params
    params.require(:user).permit :email, :phone, :first_name, :middle_name, :last_name, :biography, :country_id, :city_id, :birthday, :password, :password_confirmation, :virtual_role
  end
end
