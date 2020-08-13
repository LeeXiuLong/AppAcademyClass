class LikesController < ApplicationController
    def index
        if params[:user_id]
            @likes = Like.where("likes.user_id = #{params[:user_id]}")
        elsif params[:artwork_id]
            @likes = Like.where("likes.likeable_id = #{params[:artwork_id]} AND likes.likeable_type = 'Artwork'")
        elsif params[:comment_id]
            @likes = Like.where("likes.likeable_id = #{params[:comment_id]} AND likes.likeable_type = 'Comment'")
        else
            @likes = Like.all
        end

        render json: @likes

    end

    def create
        # if params[:artwork_id]
        #     like = Like.new(params.require(:like).permit(:user_id, :artwork_id, 'Artwork'))
        #     if like.save
        #         render json: like
        #     else
        #         render json: like.errors.full_messages, status: 422
        #     end
        # elsif params[:comment_id]
        #     like = Like.new(params.require(:like).permit(:user_id, :comment_id, 'Comment'))
        #     if like.save
        #         render json: like
        #     else
        #         render json: like.errors.full_messages, status: 422
        #     end
        # else
        #     render json: Like.all
    # end
        like = Like.new(like_params)
        if like.save
            render json: like
        else
            render json: @like.errors.full_messages, status: 422
        end
    end



    def destroy
        @like = Like.find(params[:id])
        @like.destroy
        render json: @like
    end
    

    private
    def like_params
        params
            .require(:like)
            .permit(:user_id, :likeable_id, :likeable_type)
    end
end