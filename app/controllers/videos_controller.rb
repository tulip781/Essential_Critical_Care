class VideosController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_video, only: [:show, :edit, :update, :destroy]

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

  def set_video
    @video = Video.find(params[:id])
  end
end
