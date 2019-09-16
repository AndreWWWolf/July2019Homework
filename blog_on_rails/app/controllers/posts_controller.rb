class PostsController < ApplicationController

    before_action :authenticate_user!, except: [:index, :show]
    before_action :find_product, only: [:show, :edit, :update, :destroy]
    before_action :authorize!, only: [:edit, :update, :destroy]
    def new 
        @post = Post.new
    end

    def create

        @post = Post.new post_params
        @post.user = current_user
        
        if @post.save
            flash[:notice] = "Oh, you done it now!"
            # if question is saved successfully redirect to question show page
            redirect_to post_path(@post)
          else
            # render views/questions/new.html.erb
            render :new
          end

    end

    def show

        @comment= Comment.new
        @comments = @post.comments.order(created_at: :desc)
          

    end

    
    def index

        @post = Post.order(created_at: :DESC)

    end


    def edit

    end


    def update 

       

        if @post.update post_params
            redirect_to post_path(@post)
          else
            render :edit
          end
    end


    def destroy



        @post.destroy
        redirect_to posts_path
    end


    private


    def post_params

        params.require(:post).permit(:title, :body)


    end

    def find_product
         @post = Post.find params[:id]
    end

    def authorize!
        redirect_to root_path, alert: "Nah, that ain't working. Try something else." unless can?(:crud, @post)
      end
end
