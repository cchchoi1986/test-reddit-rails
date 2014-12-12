class PostsController < ApplicationController
  # shows all the posts
  def index
		# how do I get data from database and put it here???

		# this will store all the posts in an array into the variable @posts
    @posts = Post.all
  end

  # this is also function
  def new
    @post = Post.new
  end

  # this is also function
  def create
    # post = Post.new(title: params[:post][:title], url: params[:post][:title])
    post = current_user.posts.new(post_params)
    
    if post.save # this goes to the model and check all the validations before it gets saved
      # if validation passes, then it saves, and it returns true
      # otherwise, it returns false
      redirect_to posts_path
    else
      # if the record doesnt save because it didnt pass the validations
      # flash[:message] = post.errors.messages[:base]

      flash[:message] = post.errors.messages

      redirect_to :back
    end
  end

  # this only shows 1 post
  def show
    # params[:id] will look for the id in the URL

    # this basically retrieve the post with a specific id
    @post = Post.find(params[:id])

    # empty comment object
    @comment = Comment.new
  end

  # this is only for internal use
  private
    # def means I am defining a function. A function can also be called as a 'method' or an 'action'
    def post_params
      params.require(:post).permit(:title, :url)
    end
end
