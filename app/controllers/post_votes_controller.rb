class PostVotesController < ApplicationController
  # ignore authenticity token
  # skip_before_filter :verify_authenticity_token

  def create
    # finds the post, given an url with right format
    # '/post_votes/:id'
    post = Post.find(params[:id])
    # puts "this is params: " + params.to_json
    # puts "this is params[:id] " + params[:id].to_json
    # puts "this is post: " + post.to_json

    # new_vote = PostVote.new({
    #   :user => current_user, 
    #   :post => post
    # })

    # :key => :value

    new_vote = PostVote.new(:user => current_user, :post => post)

    # new_vote = current_user.post_votes.new(:post => post)

    # new_vote = PostVote.new(:user_id => current_user.id, :post_id => post.id)

    if new_vote.save
      # this single already did the view for us
      render json: new_vote, status: 201
      # 404
      # 500
    end
  end
end
