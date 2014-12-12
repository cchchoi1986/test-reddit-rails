class CommentsController < ApplicationController

	def create
		# comment = Comment.new(comment_params)
		comment = current_user.comments.new(comment_params)

		if comment.save
			redirect_to comment.post
		else
			redirect_to :back
		end
	end

	private
		def comment_params
			params.require(:comment).permit(:content, :post_id)
		end
end
