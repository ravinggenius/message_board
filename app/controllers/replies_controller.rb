class RepliesController < ApplicationController
  before_action :set_post
  before_action :set_reply, only: [:new, :create]

  # GET /replies/1
  def show
  end

  # GET /replies/new
  def new
    @reply = Reply.new
  end

  # POST /replies
  def create
    @reply = Reply.new(reply_params.merge(author: current_identity, post: @post, published_at: Time.now.utc))

    if @reply.save
      redirect_to @post, notice: 'Reply was successfully created.'
    else
      render :new
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_reply
    @reply = @post.replies.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def reply_params
    params.require(:reply).permit(:body)
  end
end
