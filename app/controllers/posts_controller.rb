class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update]
  before_action :verify_post_owner, only: [:edit, :update]
  before_action :set_reply, only: :show

  # GET /posts
  def index
    @posts = Post.all.sorted
  end

  # GET /posts/1
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  def create
    @post = Post.new(post_params.merge(author: current_identity, published_at: Time.now.utc))

    if @post.save
      redirect_to @post, notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /posts/1
  def update
    if @post.update(post_params)
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render :edit
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  def set_reply
    @reply = @post.replies.new
  end

  # Only allow a trusted parameter "white list" through.
  def post_params
    params.require(:post).permit(:title, :body)
  end

  def edit_allowed?(post)
    post.author == current_identity
  end
  helper_method :edit_allowed?

  def verify_post_owner
    unless edit_allowed?(@post)
      flash[:notice] = 'You do not have permission to do that'
      redirect_to @post
    end
  end
end
