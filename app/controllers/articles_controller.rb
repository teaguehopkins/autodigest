class ArticlesController < ApplicationController
http_basic_authenticate_with :name => "admin", :password => "password" #, :only => :destroy

  def create
    @issue = Issue.find(params[:issue_id])
    @article = @issue.articles.create(params[:article])
    redirect_to issue_path(@issue)
  end

  # GET /issues/1/articles/51
  def edit
    @issue = Issue.find(params[:issue_id])
    @article = Article.find(params[:id]) 
    #@issue.articles.find(params[:id])
  end

  # PUT /issues/1/articles/1
  # PUT /issues/1/articles/1.json
  def update
    @issue = Issue.find(params[:issue_id])
    @article = Article.find(params[:id]) 
    @article.update_attributes(params[:article])
    #@article = @issue.articles.find(params[:id])

    # respond_to do |format|
    #     if @article.update_attributes(params[:issue])
    #      format.html { redirect_to @issue, notice: 'Article was successfully updated.' }
    #      format.json { head :no_content }
    #    else
    #      format.html { render action: "edit" }
    #      format.json { render json: @issue.errors, status: :unprocessable_entity }
    #    end
    # end
        redirect_to issue_path(@issue)
  end

  def destroy
  	@issue = Issue.find(params[:issue_id])
  	@article = @issue.articles.find(params[:id])
  	@article.destroy
  	redirect_to issue_path(@issue)
  end

end
