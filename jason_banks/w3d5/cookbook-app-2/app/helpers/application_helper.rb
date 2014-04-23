module ApplicationHelper

    def active_menu_item(link_path)

    # current_uri = request.env['PATH_INFO']
    # # If you are browsing http://example.com/my/test/path, 
    # then above line will yield current_uri as "/my/test/path"

    #path = ActionController::Routing::Routes.recognize_path "/your/path/here/"

    # ...or newer Rails versions:
    #
    path = Rails.application.routes.recognize_path(link_path)

    controller = path[:controller]

    :active_menu_item if controller == params[:controller]

  end

end
