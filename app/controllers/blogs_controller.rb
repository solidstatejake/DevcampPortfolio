# frozen_string_literal: true

class BlogsController < ApplicationController
  # This line allows the set_blog() method below to be accessed
  # by the four methods in the array. Basically, the code in
  # set_blog() is dumped into each of said methods.
  before_action :set_blog, only: %i[show edit update destroy
                                    toggle_status]
  layout "blog"

  # `all:` means that anyone visiting the site can access the specified
  #        methods/pages
  # `user:` means anyone with an account has access to the specified
  #         methods/pages
  # `site_admin:` means the owner of the site can access everything
  # (since we put :all)
  access all:        [:show, :index],
         user:       { except: [:destroy, :new, :create, :update, :edit, :toggle_status] },
         site_admin: :all

  # GET /blogs
  # GET /blogs.json
  #
  # This method controls how many blog posts are shown
  # on the main page
  # e.g. if we wrote `@blogs = Blog.limit(1)`, then only one
  #      blog post would be shown.
  def index
    @blogs      = Blog.page(params[:page]).per(5)
    @page_title = 'My Portfolio Blog'
  end

  # GET /blogs/1
  # GET /blogs/1.json
  #
  # NOTICE how we use @blog. The reason we have access to this instance variable
  #        is because of `before_action :set_blog`. This gives up access to the
  #        `@blog` instance variable.
  def show
    @blog = Blog.includes(:comments).friendly.find(params[:id])
    @comment = Comment.new
    @page_title = @blog.title

  end

  # GET /blogs/new
  #
  # This method maps to `new.html.erb` in `/views`. It doesn't
  # create a new blog post itself; rather, it is linked to the
  # `create()` method below, which actually processes the data
  # input into the forms on the /new page in the browser.
  def new
    @blog = Blog.new
  end

  # GET /blogs/1/edit
  #
  # This method works like `new()` and `create()` do. That is,
  # `edit()` is to `new()` as `create()` is to `update()`.
  def edit
  end

  # POST /blogs
  # POST /blogs.json
  #
  # This method grabs the data from the forms on the /new page
  # of the website and processes it to create a new blog post
  def create
    @blog = Blog.new(blog_params)

    respond_to do |format|
      if @blog.save
        format.html { redirect_to @blog, notice: 'Your post is now live.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /blogs/1
  #
  # PATCH/PUT /blogs/1.json
  def update
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to @blog, notice: "#{@blog.title} was successfully updated." }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /blogs/1
  # DELETE /blogs/1.json
  #
  # This method allows us to delete a record. In this case,
  # it deletes a blog post.
  def destroy
    @blog.destroy
    respond_to do |format|
      format.html { redirect_to blogs_url, notice: "#{@blog.title} was removed." }
    end
  end

  def toggle_status
    @blog.draft? ? @blog.published! : @blog.draft!
    redirect_to blogs_path,
                notice: "#{@blog.title} status is now #{@blog.status}."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_blog
    @blog = Blog.friendly.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def blog_params
    params.require(:blog).permit(:title, :body)
  end
end
