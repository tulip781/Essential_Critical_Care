class SubCategoriesController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_sub_category, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
    @all_resources = @sub_category.create_resources
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

  def set_sub_category
    @sub_category = SubCategory.includes(:category, :translations).find(params[:id])
  end
end
