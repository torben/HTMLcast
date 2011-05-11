class PagesController < ApplicationController
  load_and_authorize_resource
  before_filter :set_page, :only => [:edit, :show, :destroy]
  before_filter :set_pages_tree, :only => [:edit, :new]

  def index
    @pages = Page.all
  end

  def new
    @page = Page.new
  end

  def create
    @page = current_user.pages.build(params[:page])
    if @page.save
      redirect_to @page, :notice => "Successfully created page."
    else
      render :action => 'new'
    end
  end

  def edit
    @page = Page.find(params[:id])
  end

  def update
    @page = Page.find(params[:id])
    if @page.update_attributes(params[:page])
      redirect_to @page, :notice  => "Successfully updated page."
    else
      render :action => 'edit'
    end
  end

  def show
    @comments = @page.comments.arrange(:order => :created_at)
  end

  def destroy
    @page = Page.find(params[:id])
    @page.destroy
    redirect_to pages_url, :notice => "Successfully destroyed page."
  end

  protected

    def set_page
      @page = Page.find(params[:id])
    end

    def set_pages_tree
      pages = @page.id.present? ? Page.where("id not in (?)", @page.subtree_ids) : Page.all
      @pages_tree = pages.each { |c|
          c.ancestry = c.ancestry.to_s + (c.ancestry != nil ? "/" : '') + c.id.to_s
        }.sort {|x,y|
          x.ancestry <=> y.ancestry
        }.map{ |c|
          [("&#0160;" * 2 * (c.depth - 1) + c.title).html_safe,c.id]
        }.unshift(["-- root --", nil])
    end
end
