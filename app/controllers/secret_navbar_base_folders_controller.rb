class SecretNavbarBaseFoldersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_secret_navbar_base_folder, only: [:show, :edit, :update, :destroy]

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

  def set_secret_navbar_base_folder
    @secret_navbar_base_folder = SecretNavbarBaseFolder.includes(:secret_categories, :translations).find(params[:id])
  end
end
