class UsersController < ApplicationController
  layout 'authenticated', except: [:new, :create]

  before_action :set_user, only: [:show, :edit, :settings, :update, :destroy]
  before_action only: [:show, :edit, :settings, :update, :destroy] {authorize @user}
  before_action only: [:index, :new, :create] {authorize User}

  # GET /users
  def index
    @users = User.preload(:roles).all
  end

  # GET /users/1
  def show
    @user = UserPresenter.new @user
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # GET /users/1/settings
  def settings
  end

  # POST /users
  def create
    @user = User.new user_new_params
    @user.save!
    redirect_to root_path, flash: {success: 'Аккаунт успешно создан'}
  rescue
    render :new
  end

  # PATCH/PUT /users/1
  def update
    @user.update! user_edit_params
    redirect_to @user, flash: {success: 'Аккаунт успешно обновлен'}
  rescue
    render :edit
  end

  # DELETE /users/1
  def destroy
    @user.destroy!
    session[:user_id] = nil if @user.id.eql? current_user.id
    redirect_to root_path, flash: {success: 'Аккаунт успешно уничтожен'}
  rescue ActiveRecord::RecordNotDestroyed => e
    redirect_to @user, flash: {alert: e.message}
  end

  private

  def set_user
    user_id = params[:id].to_i
    @user = current_user&.id.eql?(user_id) ? current_user : User.find(user_id)
  rescue ActiveRecord::RecordNotFound => e
    redirect_to users_path, flash: {alert: e.message}
  end

  def user_new_params
    params.require(:user).permit :email, :phone, :virtual_role, :password, :password_confirmation
  end

  def user_edit_params
    params.require(:user).permit :email, :phone, :image, :remove_image, :first_name, :middle_name, :last_name, :biography, :birthday, :password, :password_confirmation, :virtual_role
  end
end
