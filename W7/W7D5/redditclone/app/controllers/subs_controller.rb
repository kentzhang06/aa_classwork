class SubsController < ApplicationController

    before_action :require_logged_in, only: [:create, :update]

    def index 
        if logged_in?
            @subs = current_user.subs 
            render :index 
        else 
            redirect_to new_session_url
        end
    end 

    def show 
        @sub = Sub.find_by(id: params[:id])
        render :show
    end

    def new
        @sub = Sub.new
        render :new    
    end

    def create 
        @sub = Sub.new(sub_params)
        @sub.user_id = current_user.id
        if @sub.save!
            redirect_to sub_url(@sub)
        else  
            flash[:errors] = @sub.errors.full_messages
            redirect_to user_url(@sub.moderator)
        end 
    end

    def edit 
        @sub = Sub.find_by(id: params[:id])
        render :edit 
    end

    def update 
        @sub = Sub.find_by(id: params[:id])
        if @sub.user_id == current_user.id
            if @sub.update(sub_params)
                redirect_to sub_url(@sub)
            else  
                flash.now[:errors] = @sub.errors.full_messages
                render :edit
            end
        else 
            flash[:errors] = ["Unauthorized User"] 
            redirect_to sub_url(@sub)
        end
    end

    def sub_params 
        params.require(:sub).permit(:title, :description)
    end
end
