class CommentsController < ApplicationController


  # POST /comments
  # POST /comments.json
  def create

    @comment = Comment.new(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment.commentable, notice: 'Commment was successfully created.' }

      else
        format.html { redirect_to @comment.commentable,  notice: "Commment can't be empty."  }

      end

    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.permit(:user_id, :body, :commentable_id, :commentable_type)
    end
end
