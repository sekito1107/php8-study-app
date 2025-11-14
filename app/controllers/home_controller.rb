# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    if current_user
      render :dashboard
    else
      render :landing
    end
  end
end
