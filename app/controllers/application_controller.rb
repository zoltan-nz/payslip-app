class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  add_crumb "Home", '/'

  #def render_csv(filename = nil)
  #  filename ||= params[:action]
  #  filename += '.csv'
  #
  #  if request.env['HTTP_USER_AGENT'] =~ /msie/i
  #    headers['Pragma'] = 'public'
  #    headers["Content-type"] = "text/plain"
  #    headers['Cache-Control'] = 'no-cache, must-revalidate, post-check=0, pre-check=0'
  #    headers['Content-Disposition'] = "attachment; filename=\"#{filename}\""
  #    headers['Expires'] = "0"
  #  else
  #    headers["Content-Type"] ||= 'text/csv'
  #    headers["Content-Disposition"] = "attachment; filename=\"#{filename}\""
  #  end
  #
  #  render :layout => false
  #end

end
