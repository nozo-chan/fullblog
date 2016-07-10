class CommentsController < ApplicationController

def index 
	@comments= Comment.all
end 

def new 

end 

def create 
	@post = Post.find(params[:post_id])
	@comment=
	@post.comments.create(params[:comment].permit(:commenter, :text))
	redirect_to post_path(@post)
end 

 def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end
 
 

end


