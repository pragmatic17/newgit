class UsersController < ApplicationController
	def new
		@user=User.new
	end
	def create
		@user = User.new(user_params) # Create new user
		if @user.save
			#@current_user = @user
			#session[:login_id] = @current_user.id
			redirect_to home_path # Redirect to Newsfeed
		else # An error was found
			flash[:error]="errors in this page"
			logger.info "errors in Create"
			#flash[:error] = @new_user.errors.full_messages()[0] # Display error to user
			redirect_to new_path # Redirect to make new account
		end
	end
	def user_params
    	params.require(:user).permit(:username, :first_name, :last_name, :password, :password_confirmation)
  	end
end
