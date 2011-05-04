class PostsController < ApplicationController
  before_filter :load_posts, :only => :index
  before_filter :load_post,  :only => [:show, :edit, :update, :destroy]
  before_filter :set_category_tree, :only => [:new, :edit]

  load_and_authorize_resource
  uses_tiny_mce :only => [:new, :edit]

  def index
  end

  def show
    @comments = @post.comments.arrange(:order => :created_at)
  end

  def new
    @post = current_user.posts.new
  end

  def edit
  end

  def create
    @post = current_user.posts.new(params[:post])

    respond_to do |format|
      if @post.save
        format.html { redirect_to(@post, :notice => 'Post was successfully created.') }
        format.xml  { render :xml => @post, :status => :created, :location => @post }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to(@post, :notice => 'Post was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.destroy

    respond_to do |format|
      format.html { redirect_to(posts_url) }
      format.xml  { head :ok }
    end
  end

  protected
    include Modules::CategorySelector

    def load_posts
      @posts = if params[:user_id].present?
        User.find(params[:user_id]).posts
      elsif params[:category_id].present?
        load_category.posts
      else
        Post
      end.page(params[:page]).per(10)

      @posts = @posts.where('title LIKE ? OR content LIKE ?', "%#{params[:search]}%", "%#{params[:search]}%") if params[:search].present?
      @posts = @posts.tagged_with(params[:tag]) if params[:tag].present?
    end

    def load_post
      #@post = load_category.post.find_by_url_name(params[:id]) || load_category.post.find(params[:id])
      @post = Post.find_by_url_name(params[:id]) || Post.find(params[:id])
    end

    def load_category
      @category ||= Category.find(params[:category_id])
    end
end
