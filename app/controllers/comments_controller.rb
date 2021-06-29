class CommentsController < ApplicationController
    def create
        @comment = Comment.new(comment_params)
        if @comment.save
            redirect_to blogs_path
        end
    end

    private 

    def comment_params
        params.require(:comment).permit(:content)
    end
end
