class CategoriesController < ApplicationController
  before_filter :load_categories, :only => :index
  before_filter :load_category,  :only => [:show, :edit, :update, :destroy]
  before_filter :set_category_tree, :only => [:new, :edit]
  before_filter :admin?, :except => [:show]

  def index
  end

  def show
  end

  def new
    @category = Category.new
  end

  def edit
  end

  def create
    @category = Category.new(params[:category])

    respond_to do |format|
      if @category.save
        format.html { redirect_to(@category, :notice => 'Category was successfully created.') }
        format.xml  { render :xml => @category, :status => :created, :location => @category }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @category.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @category.update_attributes(params[:category])
        format.html { redirect_to(@category, :notice => 'Category was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @category.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @category.destroy

    respond_to do |format|
      format.html { redirect_to(categories_url) }
      format.xml  { head :ok }
    end
  end

  protected
    include Modules::CategorySelector

    def load_categories
      @categories = Category.all
    end

    def load_category
      @category = Category.find(params[:id])
    end

    def admin?
      redirect_to root_url unless authenticate_user! && current_user.admin?
    end
end
