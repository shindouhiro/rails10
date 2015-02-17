class IssuesController < ApplicationController
  def show
  	@issue = Issue.find(params[:id])
  	@comments = @issue.comments
  end

  def new
  	@issue = Issue.new
  end

  def destroy
    issue = Issue.find(params[:id])
    issue.destroy
    redirect_to :root
  end

  def create 
  	Issue.create(issue_params)
    redirect_to :root
  end
   
  def edit
    @issue = Issue.find(params[:id])
  end

  def update
  	issue = Issue.find(params[:id])
  	issue.update_attributes(issue_params)
  	redirect_to :root
  end
  private
     def issue_params
     	params.require(:issue).permit(:title, :content)
     end
end
