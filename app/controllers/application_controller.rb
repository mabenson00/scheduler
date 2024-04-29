class ApplicationController < ActionController::Base
  layout :layout_by_resource

  private

  def layout_by_resource
    if devise_controller?
      "devise" # Assuming you have created a 'devise.html.erb' layout
    else
      "application"
    end
  end
end
