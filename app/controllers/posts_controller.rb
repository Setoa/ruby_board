class PostsController < ApplicationController
    def index
        @posts=Post.all
    end
    def new
    end
    def show
        @post=Post.find_by(id: params[:id])
    end
    def edit
        @post=Post.find_by(id: params[:id])
    end
    def create
        post=Post.create(post_params)
        redirect_to post_path(post)
    end
    def update
        post=Post.find_by(id: params[:id])
        post.update(post_params)
        redirect_to post_path(post)
    end
    def destroy
        post=Post.find_by(id: params[:id])
        post.destroy
        redirect_to posts_path
    end
    private
    def post_params
        params.require(:post).permit(:title, :body, :author)
    end
end
