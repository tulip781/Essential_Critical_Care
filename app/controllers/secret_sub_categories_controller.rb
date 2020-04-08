class SecretSubCategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_secret_sub_category, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
    @all_resources = @secret_sub_category.create_resources
  end

  def new
  end

  def edit
  end

  def update
  end

  def create
  end

  def destroy
  end

  private

  def set_secret_sub_category
    @secret_sub_category = SecretSubCategory.find(params[:id]).includes(:secret_category)
  end
end
