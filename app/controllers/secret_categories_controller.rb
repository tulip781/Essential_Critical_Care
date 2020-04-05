class SecretCategoriesController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_secret_category, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
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

  def set_secret_category
    @secret_category = SecretCategory.find(params[:id])
  end
end
