class SessionsController < Devise::SessionsController
	def create
		self.resource = warden.authenticate!(auth_options)
    set_flash_message(:notice, :signed_in) if is_flashing_format?
    sign_in(resource_name, resource)
    yield resource if block_given?
    respond_with resource, :location => user_projects_path
	end
end