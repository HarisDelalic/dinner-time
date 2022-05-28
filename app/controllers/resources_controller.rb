class ResourcesController < ApplicationController
  before_action :set_resource, only: [:show, :edit, :update, :destroy]
  before_action :force_json, only: :search

  def index
    @resources = Resource.all
  end

  def search
    search_string = params[:q].downcase
    @resources = Resource.where("name LIKE ?", "%#{search_string}%")
  end

  def show
  end

  def new
    @resource = Resource.new
  end

  def edit
  end

  def create
    @resource = Resource.new(resource_params)

    respond_to do |format|
      if @resource.save
        format.html { redirect_to resources_url, notice: "Resource was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @resource.update(resource_params)
        format.html { redirect_to resource_url(@resource), notice: "Resource was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @resource.destroy

    respond_to do |format|
      format.html { redirect_to resources_url, notice: "Resource was successfully destroyed." }
    end
  end

  private

  def force_json
    request.format = :json
  end

  def set_resource
    @resource = Resource.find(params[:id])
  end

  def resource_params
    params.require(:resource).permit(:name, :quantity, :unit_of_measurement)
  end

  def exists_with_same_name(resource)
    !Resource.find_by(name: resource.name).nil?
  end
end
