class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :settings, :update, :destroy]
  before_action only: [:show, :edit, :settings, :update, :destroy] {authorize @user}
  before_action only: [:index, :new, :create] {authorize User}

  # GET /users
  def index
    @users = User.order(created_at: :desc).all
    render :index, locals: {users: @users}
  end

  # GET /users/1
  def show
    user = UserPresenter.new @user
    render :show, locals: {user: user}
  end

  # GET /users/new
  def new
    render :new, locals: {user: User.new}
  end

  # GET /users/1/edit
  def edit
    render :edit, locals: {user: @user}
  end

  # GET /users/1/settings
  def settings
    render :settings, locals: {user: @user}
  end

  # POST /users
  def create
    @user = User.new user_new_params
    @user.save!
    redirect_to root_path, flash: {success: 'Аккаунт успешно создан'}
  rescue
    render :new, locals: {user: @user}
  end

  # PATCH/PUT /users/1
  def update
    @user.update! user_edit_params
    redirect_to @user, flash: {success: 'Аккаунт успешно обновлен'}
  rescue
    render :edit, locals: {user: @user}
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
    params.require(:user)
        .permit :email, :phone,
                :password, :password_confirmation
  end

  def user_edit_params
    params.require(:user)
        .permit :email, :phone,
                :image, :remove_image,
                :first_name, :last_name,
                :biography, :birthday,
                :password, :password_confirmation,
                :itn, :inoial
  end
end
