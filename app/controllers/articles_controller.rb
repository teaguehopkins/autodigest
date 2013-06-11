class ArticlesController < ApplicationController
http_basic_authenticate_with :name => "cth", :password => "teague" #, :only => :destroy

def create
    @issue = Issue.find(params[:issue_id])
    @article = @issue.articles.create(params[:article])
    redirect_to issue_path(@issue)
  end

  def destroy
  	@issue = Issue.find(params[issue_id])
  	@article = @issue.articles.find(params[:id])
  	@article.destroy
  	redirect_to issue_path(@issue)
  end
end
