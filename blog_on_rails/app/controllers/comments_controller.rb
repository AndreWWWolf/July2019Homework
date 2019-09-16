class CommentsController < ApplicationController

    before_action :authenticate_user!
    

    def create
        @post = Post.find params[:post_id]
        comment_params = params.require(:comment).permit(:body)
        @comment   = Comment.new comment_params
        @comment.post = @post
        @comment.user = current_user
        if @comment.save
        redirect_to post_path(@post), notice: 'Talk that talk, yo!'
       else
        @comments = @post.comments.order(created_at: :desc)
        render '/posts/show'
       end
    end


    def destroy
        
        @comment = Comment.find params[:id]

        if can?(:crud, @comment)
            @comment.destroy
            redirect_to post_path(@comment.post), notice: 'That thang is gone.'
        else
            head :unauthorized
        end
    
    end


      private


      def authorize!
        redirect_to root_path, alert: "you can't do that!" unless can? :crud, @comment
      end

end
