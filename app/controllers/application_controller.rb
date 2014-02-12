class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_filter do #https://github.com/ryanb/cancan/issues/835
	  resource = controller_name.singularize.to_sym
	  method = "#{resource}_params"
	  params[resource] &&= send(method) if respond_to?(method, true)
  end
  protect_from_forgery with: :exception
  rescue_from CanCan::AccessDenied do |exception| #https://github.com/ryanb/cancan/wiki/Exception-Handling
    redirect_to main_app.root_url, :alert => exception.message
  end

  before_filter :fetch_menu_items

  add_breadcrumb "Home", :root_path

  protected

  def fetch_menu_items
    @menu_items = Category.all
  end

end
