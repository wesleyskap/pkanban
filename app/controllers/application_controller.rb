class ApplicationController < ActionController::Base
 
  protect_from_forgery
  #layout :layout_by_resource

  def after_sign_in_path_for(resource_or_scope)
    resource_or_scope.is_a?(User) ? sprints_path : super
  end

  #def layout_by_resource
  #  devise_controller? ? 'site' : 'application'
  #end

end
