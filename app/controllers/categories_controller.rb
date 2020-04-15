class CategoriesController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
    @all_resources = @category.create_resources
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

  def set_category
    @category = Category.includes(:sub_categories, :navbar_base_folder, :translations).find(params[:id])
  end
end
