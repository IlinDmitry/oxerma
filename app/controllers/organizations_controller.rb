class OrganizationsController < ApplicationController
  before_action :set_organization, only: [:show, :edit, :update, :destroy]
  before_action only: [:show, :edit, :update, :destroy] {authorize @organization}
  before_action only: [:index, :new, :create] {authorize Organization}

  # GET /organizations
  def index
    @organizations = Organization.includes(:organization_type).all
  end

  # GET /organizations/1
  def show
  end

  # GET /organizations/new
  def new
    @organization = Organization.new
  end

  # GET /organizations/1/edit
  def edit
  end

  # POST /organizations
  def create
    @organization = current_user.organizations.build organization_new_params
    if @organization.save
      current_user.add_role :admin, @organization
      redirect_to @organization, flash: {notice: 'Organization was successfully created.'}
    else
      render :new
    end
  end

  # PATCH/PUT /organizations/1
  def update
    if @organization.update organization_edit_params
      redirect_to @organization, flash: {notice: 'Organization was successfully updated.'}
    else
      render :edit
    end
  end

  # DELETE /organizations/1
  def destroy
    @organization.destroy
    redirect_to organizations_url, flash: {notice: 'Organization was successfully destroyed.'}
  end

  private

  def set_organization
    @organization = Organization.includes(:organization_type).find(params[:id])
  rescue ActiveRecord::RecordNotFound => e
    redirect_to organizations_path, flash: {alert: e.message}
  end

  def organization_new_params
    params.require(:organization).permit :name, :type_id, :email, :phone
  end

  def organization_edit_params
    params.require(:organization).permit :name, :type_id, :email, :phone, :biography
  end
end
