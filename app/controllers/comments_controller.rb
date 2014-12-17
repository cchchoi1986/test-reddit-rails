class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    # comment = Comment.new(comment_params)
    @comment = current_user.comments.new(comment_params)

    if @comment.save
      # it tells the computer that it needs to render pages in the following formats
      respond_to do |format|
        # order matters here. It's going to show the javascript (json) response first

        # in Rails, the convention is that we need to create a file called 'create.js.erb' inside the comments view folder
        format.js { render 'create.js.erb' }
        format.html { redirect_to @myComment.post }
      end
    else
      respond_to do |format|
        format.js { render 'fail.js.erb' }
        format.html { redirect_to :back }
      end
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:content, :post_id)
    end
end
