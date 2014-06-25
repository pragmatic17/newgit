class LoginController < ApplicationController
 #before_filter :redirect_if_not_logged_in, only: [:friends, :preferences, :update, :clear_wall]

  def login
    if session.has_key?(:login_id) # If logged in already
      @current_user = User.find(session[:login_id]) # Set current user for header
    end
  end

  def login_check #Check if supplied data (from params) is actually a username/password combo
    @potential_users = User.find(:all, :conditions => {:username => params[:login][:username]})
    if @potential_users.length != 1 # No user found
      flash[:notice] = "Username not found!"
      redirect_to login_path
    elsif @potential_users[0].password == params[:login][:password] # Only one user found and it was the right password
      session[:login_id] = @potential_users[0].id
      @current_user = @potential_users[0]
      flash[:notice] = "dub tee brah"
      redirect_to home_path
    else # Password was wrong
      flash[:notice] = "Wrong password!"
      redirect_to login_path
    end
  end

  def logout
    session[:login_id] = nil # Clear session variable to logout
    redirect_to login_path
  end

  def new # Page with form to create a new user
    @user=User.new
    if session.has_key?(:login_id) # If logged in already
      @current_user = User.find(session[:login_id]) # Set current user for header
    end
  end
  def create # Creates a new user, no view associated with it
      @user = User.new(user_params) # Create new user
      if @user.save
        @current_user = @user
        session[:login_id] = @current_user.id
        redirect_to home_path # Redirect to Newsfeed
      else # An error was found
        flash[:error]="errors in this bitch"
        logger.info "errors in Create"
        #flash[:error] = @new_user.errors.full_messages()[0] # Display error to user
        redirect_to new_path # Redirect to make new account
      end
  end
 
  

end
