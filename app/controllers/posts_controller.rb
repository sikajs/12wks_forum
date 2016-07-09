class PostsController < ApplicationController
	before_action :find_post, only: [:show, :edit, :update, :destroy]

	def index
		@posts = Post.all.order("created_at DESC")
	end

	def show
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(posts_params)

		if @post.save
			redirect_to @post
		else
			render :new
		end
	end

	def edit
	end

	def update
		if @post.update(posts_params)
			redirect_to @post
		else
			render :edit
		end
	end

	def destroy
		@post.destroy
		redirect_to root_path
	end

	private
		def posts_params
			params.require(:post).permit(:title, :content)
		end

		def find_post
			@post = Post.find(params[:id])
		end
end
