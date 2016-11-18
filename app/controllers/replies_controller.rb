class RepliesController < ApplicationController
  before_action :set_post

  # POST /replies
  def create
    @reply = Reply.new(reply_params.merge(author: current_identity, post: @post, published_at: Time.now.utc))

    if @reply.save
      redirect_to @post, notice: 'Reply was successfully created.'
    else
      redirect_to @post
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  # Only allow a trusted parameter "white list" through.
  def reply_params
    params.require(:reply).permit(:body)
  end
end
