module ApplicationHelper

def active_menu_item
  #current_uri = request.env['PATH_INFO']
  #path = ActionController::Routing::Routes.recognize_path "/your/path/here/"
  
  path = Rails.application.routes.recognize_path('current_uri')
  controller = path[:controller]
action = path[:action]

:active_menu_item if params[:controller] == controller && params[:action] == action
end

end
