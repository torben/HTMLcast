class CommentsController < ApplicationController
  def index
    @commentable = find_commentable
    @comments = @commentable.comments
  end

  def show
    @comment = Comment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @comment }
    end
  end

  def new
    authorize!(:comment, @comment)
    @comment = Comment.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @comment }
    end
  end

  def create
    @commentable = find_commentable
    authorize!(:comment, @commentable)
    @comment = @commentable.comments.build(params[:comment])
    @comment.user = current_user if current_user.present?

    if @comment.save
      flash[:notice] = I18n.t(:success, :scope => :"flash.comments.create")
    else
      flash[:error] = I18n.t(:failure, :scope => :"flash.comments.create")
    end
    redirect_to(find_commentable)
  end

  def destroy
    @comment = Comment.find(params[:id])
    authorize!(:destroy, @comment)
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to(@comment.commentable) }
      format.xml  { head :ok }
    end
  end

  private
    #permissions_url(params[:resource_type], params[:resource_id])

    def find_commentable
      params.each do |name, value|
        if name =~ /(.+)_id$/
          return $1.classify.constantize.find(value)
        end
      end
      nil
    end
end
