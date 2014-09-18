class Website::WebsiteController < Website::ApplicationController
  before_action :set_categories
  def index
    @article = Article.all
  end
  def new_comment
   @comment = Comment.new(comment_params)
   if @comment.save
    flash[:notice] = "评论成功"
    redirect_to website_website_show_article_path action: :show_article
  else
    flash[:error] = "评论失败"
    redirect_to website_website_show_article_path
  end
end
  def show_article
    @article = Article.find(params[:website_id])
  end
  def show
    @category = Category.find(params[:id])
  end
  private
  def comment_params
    params.require(:comment).permit(:content,:article_id)
  end
end
