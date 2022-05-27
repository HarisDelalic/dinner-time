class ResourcesController < ApplicationController
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

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end

  private
  def force_json
    request.format = :json
  end
end
