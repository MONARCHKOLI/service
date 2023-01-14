class WorkersController < ApplicationController
    def new 
        @worker = Worker.new
    end

    def create
        byebug

        @task = Task.find(params[:id])
        @user = User.find(params[:user_id])
        @worker = @user.workers.create(worker_params)
        if @worker.save
            redirect_to root_path
        else
            render :new, status: :unprocessable_entity
        end
    end


    private

    def worker_params
        params.require(:worker).permit(:name,:email,:address,:age,:mobileno)
    end

end
