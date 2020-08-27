class SubsController < ApplicationController

    before_action :is_moderator?, only:[:edit, :update]
    before_action :require_login!, only:[:new, :create]

    def index
        @subs = Sub.all
        render :index
    end

    def show
        @sub = Sub.find(params[:id])
        render :show
    end

    def edit
        @sub = Sub.find(params[:id])
        render :edit
    end

    def update
        @sub = Sub.find(params[:id])
        if @sub.update_attributes(sub_params)
            redirect_to sub_url(@sub.id)
        else
            flash.now[:errors] = ["This is not a valid update"]
            render :edit
        end
    end
    
    def new
        @sub = Sub.new
        render :new
    end

    def create
        @sub = Sub.new(sub_params)
        @sub.moderator_id = current_user.id
        if @sub.save
            redirect_to sub_url(@sub.id)
        else
            flash.now[:errors] = ["Invalid sub parameters"]
            render :new
        end
    end

    private

    def sub_params
        params.require(:sub).permit(:title, :description)
    end
end