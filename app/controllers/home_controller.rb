# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    render layout: "application"
  end
end
