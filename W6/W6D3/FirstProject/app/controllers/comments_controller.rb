class CommentsController < ApplicationController

    def index
        # @comments = Comment.all
        # render json: @comments
        if params.has_key?(params[:user_id])

        elsif params.has_key?(:artwork_id)

        else
    end

    def create
        @comment = Comment.new(comment_params)
        if @comment.save
            # redirect_to comment_url(@comment)
            render json: @comment
        else
            render json: @comment.errors.full_messages, status: 422
        end
    end

    def destroy
        @comment = Comment.find_by(id: params[:id])
        if @comment.destroy
            # @comment.destroy
            render json: @comment
        else
            render json: {error: "Comment not found"}, status: 404
        end
    end

    private

    def comment_params
        params.require(:comment).permit(:body, :user_id, :artwork_id)
    end
end
