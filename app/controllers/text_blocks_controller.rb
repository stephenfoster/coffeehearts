class TextBlocksController < ApplicationController
  def create
    @text_block = TextBlock.new(params[:text_block])
    @conversation = Conversation.find(params[:conversation_id])

    @text_block.conversation_id = @conversation.id
    @text_block.user_id = current_user.id

    respond_to do |format|
      if @text_block.save
        flash[:notice] = 'Post was successfully created.'
        format.html { redirect_to(@conversation) }
        format.xml  { render :xml => @text_block, :status => :created, :location => [@text_block.conversation,@text_block ] }
      else
        format.html { render conversation_edit_path(@conversation) }
        format.xml  { render :xml => @text_block.errors, :status => :unprocessable_entity }
      end

    end
  end
end
