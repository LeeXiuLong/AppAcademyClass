class PostsController < ApplicationController

    before_action :is_author?, only:[:edit, :update]
    before_action :require_login!, only:[:new, :create]

    def show
        @post = Post.find(params[:id])
        render :show
    end

    def new
        @post = Post.new
        render :new
    end


    #1,2,3
    def create
        @post = Post.new(post_params)
        @post.author_id = current_user.id
        @post.sub_ids = [1,2]
        debugger
        if @post.save
            redirect_to post_url(@post.id)
        else
            flash.now[:errors] = ["Not a valid post"]
            render :new
        end
    end

    def edit
        @post = Post.find(params[:id])
        render :edit
    end

    def update
        @post = Post.find(params[:id])
        if @post.update_attributes(post_params)
            redirect_to(post_url(@post.id))
        else
            flash.now[:errors] = ["This is an invalid update to post"]
            render :edit
        end
    end

    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        redirect_to sub_url(@post.sub_id)
    end

    private

    def post_params
        params.require(:post).permit(:title, :url, :content)
    end
end
