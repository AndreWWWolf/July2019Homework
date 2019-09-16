class SessionsController < ApplicationController
    def new
    end
  
    def create
      @user = User.find_by_email params[:email]
      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to root_path, notice: "Nice, you in!"
      else
        flash[:alert] = "Nah, that ain't it."
        render :new
      end
    end
  
    def destroy
        session[:user_id] = nil
        redirect_to root_path, notice: "Peace out Homeslice!"
      end
end
