class CommentsController < ApplicationController
  before_action :set_comment, only: [:update, :destroy, :show]
  before_action :set_article
  before_action :authenticate_user!
  #respond_to :html, :json
  def show
  end
  #POST/comments.json
  def create
    @comment = current_user.comments.new(comment_params)
    @comment.article = @article
    #@comment.save
    #respond_with(@comment.article)
    respond_to do |format|
      if @comment.save
        format.html {redirect_to @comment.article, notice: 'Comment was successfully created'}
        format.json {render :show, status: :created, location: @comment.article}
      else
        format.html {render :new}
        format.json {render json: @comment.errors, status: :unprocessable_entity}
      end
    end
  end

  def update
    #@comment.update(comment_params)
    #respond_with(@comment.article)
    respond_to do |format|
      if @comment.update(comment_params)
        format.html {redirect_to @comment.article, notice: 'Comment was successfully created'}
        format.json {render :show, status: :ok, location: @comment}
      else
        format.html {render :edit}
        format.json {render json: @comment.errors, status: :unprocessable_entity}
      end
    end
  end

  def destroy
    #@comment.destroy
    #respond_with(@comment.article)
    @Comment.destroy
    respond_to do |format|
      format.html { redirect_to @article, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_article
      @article = Article.find(params[:article_id])
    end

    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:user_id, :article_id, :body)
    end
end
