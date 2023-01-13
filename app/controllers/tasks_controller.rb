class TasksController < ApplicationController

    def show
        @user = User.find(params[:user_id])
        
    end

    def create
        @user = User.find(params[:user_id])
        @task = @user.tasks.create(task_params)
        redirect_to user_path(@user)
        
    end
    
    def new

    end

    def destroy
        @user = User.find(params[:user_id])

        @task = @user.tasks.find(params[:id])
        
        @task.destroy
        
        redirect_to user_path(@user), status: :see_other
    end

    def edit
        @user = User.find(params[:user_id])
        @task = @user.tasks.find(params[:id])   
        render :edit  
    end

    def update
        @user = User.find(params[:user_id])
        @task = @user.tasks.find(params[:id])
        if @task.update(task_params)
            flash[:success] = "task updated successfully"
            redirect_to @user
          else
            flash.now[:error] = "task could not be updated"
            render :edit
          end

        
    end
    private
    def task_params
        params.require(:task).permit!
    end
end
