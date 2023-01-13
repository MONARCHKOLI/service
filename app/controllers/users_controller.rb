class UsersController < ApplicationController

    skip_before_action :require_login, only: [:new, :create]

    def show
      $count =1
        @user = User.find(params[:id])
    end

    def index
    end
  
    def new
      @user = User.new
    end
  
    def create
      @user = User.create(user_params)
      if @user.valid?
        session[:user_id] = @user.id
        redirect_to new_session_path
      else
        flash[:error] = "Error- please try to create an account again."
        redirect_to new_user_path
      end
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])

        if @user.update(user_params)
            flash[:notice] = "Updating Profile Sucessfully"
            redirect_to @user
        else
            redirect_to :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy

        redirect_to new_session_path, status: :see_other
    end
  
    private 

    def user_params
      params.require(:user).permit(:email, :password,:name,:mobileno,:state,:pincode,:city,:address)
    end
end
