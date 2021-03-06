class PostsController < ApplicationController
	
	before_action :require_user, only: [:index]

	def index
		@posts = current_user.posts.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
		@user = current_user
	end

	def edit
		@post = Post.find(params[:id])
	end

	def create
		@post = current_user.posts.new(post_params)

		if @post.save
			current_user.update({nPost: current_user.nPost + 1})
			redirect_to user_path(current_user)
  	else
  		redirect_to error_path
  	end
	end

	def update
		@post = Post.find(params[:id])

		if @post.update(post_params)
			redirect_to posts_path
		else
			render :edit
		end
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to user_path(current_user)
	end

	private
		def post_params
			params[:post][:sell_to] = -1
			params.require(:post).permit(:title, :description, :price, :image, :sell_to)
		end
end
