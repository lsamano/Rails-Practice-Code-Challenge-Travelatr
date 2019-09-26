class PostsController < ApplicationController
    before_action :set_post, only: [:show, :edit, :update, :like]

    def new
        @post = Post.new
    end

    def create
        # byebug
        @post = Post.create(post_params)
        if @post.valid?
            # @post.save
            # flash a success message
            redirect_to post_path(@post)
        else
            flash[:errors] = @post.errors.full_messages
            redirect_to new_post_path
            # render :new
        end
    end

    def show
        # @post = Post.find(params[:id])
    end

    def edit
        # @post = Post.find(params[:id])
    end

    def update
        # @post = Post.find(params[:id])
        @post.update(post_params)
        redirect_to post_path(@post)
    end

    def like
        @post.likes += 1
        @post.save
        redirect_to post_path(@post)
    end

    private

    def post_params
        # 
        params.require(:post).permit(:title, :content, :likes, :blogger_id, :destination_id)
    end
    
    def set_post
        @post = Post.find(params[:id])
    end
end
