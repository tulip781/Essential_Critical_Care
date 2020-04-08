class PdfsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_pdf, only: [:show, :edit, :update, :destroy]

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

  def set_pdf
    @pdf = Pdf.with_attached_document.find(params[:id])
  end
end
