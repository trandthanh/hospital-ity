class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @hospitals = Hospital.all.map{ |h| h.hospital_name }
  end
end
