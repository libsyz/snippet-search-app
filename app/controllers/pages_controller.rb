class PagesController < ApplicationController
  def home
    if params[:query].present?
      @snippet = "This is a nice snippet we are returning!"
    end
  end
end
