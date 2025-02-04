

class CommentsController < ApplicationController
    def create
      @article = Article.find(params[:article_id])
      @user = User.first
      
      
      @comment = @article.comments.create(comment_params)
      @comment.user_id=current_user.id if current_user
      @comment.save

      if @comment.save
        redirect_to article_path(@article)
      else
        render 'new'
      end

     # @article = Article.find(params[:article_id])
      #@comment = @article.comments.create(comment_params)
      #redirect_to article_path(@article)
    end
   
    def destroy
      @article = Article.find(params[:article_id])
      @comment = @article.comments.find(params[:id])
      @comment.destroy
      redirect_to article_path(@article)
    end
   
    private
      def comment_params
        params.require(:comment).permit(:nombre, :body)
      end
  end