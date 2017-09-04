class SessionsController < ApplicationController

  # Create a Session Cookie (Login)
  def create
    if user = User.authenticate_with_credentials(params[:email], params[:password])
      # Save the user id inside the browser cookie.
      session[:user_id] = user.id
      redirect_to '/'
    else
      # If user's login doesn't work, send them back to the login form.
        redirect_to '/login', notice: "Invalid username or password"
      end
    end

    # If the user exists AND the password entered is correct.
    # if user && user.authenticate(params[:password])
    #   # Save the user id inside the browser cookie.
    #   session[:user_id] = user.id
    #   redirect_to '/'
    # else
    # # If user's login doesn't work, send them back to the login form.
    #   redirect_to '/login', notice: "Invalid username or password"
    # end

  end

  # Destroy Session Cookie (Logout)
  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end

end