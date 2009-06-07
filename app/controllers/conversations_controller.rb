class ConversationsController < ApplicationController
  layout "main"

  def index
    @relationship = Relationship.find(params[:relationship_id]) if params[:relationship_id]
    @user = User.find(params[:user_id]) if params[:user_id]

    @conversations = @relationship.conversations if @relationship
    @conversations = @user.conversations if @user
  end

  def show
    @conversation = Conversation.find(params[:id])
    @relationship = @conversation.relationship
  end

  def edit
    @conversation = Conversation.find(params[:id])
    @relationship = @conversation.relationship

    @picture = Picture.new
    @text_block = TextBlock.new
    @blog_link = BlogLink.new
  end
end
