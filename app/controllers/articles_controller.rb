class ArticlesController < ApplicationController
def create
    @issue = Issue.find(params[:issue_id])
    @article = @issue.articles.create(params[:article])
    redirect_to issue_path(@issue)
  end
end
