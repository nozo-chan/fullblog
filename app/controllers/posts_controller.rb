class PostsController < ApplicationController
	def index 
		@posts = Post.all 
	end 

	def new
		@post = Post.new
	end 

	def create 
		@post = Post.new(params_posts)
		if @post.save
			redirect_to @post
		else 
			render 'new'
		end
	end 

	def show 
		@post = Post.find(params[:id])
	end

	def edit 
		@post = Post.find(params[:id])
	end 

	def update 
		@post = Post.find(params[:id])
		if @post.update(params_posts)
			redirect_to @post 
		else
			render 'edit'
		end
	end 

	def destroy
		@post = Post.find(params[:id])
		if @post.destroy
		redirect_to posts_path
		else
			flash[:notice] = "Your post couldn't be destroyed, we're sorry!"
		end

	end

private

def params_posts
 params.require(:post).permit(:title, :text)
end

end 