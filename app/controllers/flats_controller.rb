class FlatsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index, :search]

  def index
  end

  def search
  end

  def new
    @flat = Flat.new
    authorize @flat
  end

  def create
  end
end
