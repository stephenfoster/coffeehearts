class BlogLinksController < ApplicationController
  def create
    @blog_link = BlogLink.new(params[:blog_link])
    @conversation = Conversation.find(params[:conversation_id])

    @blog_link.conversation_id = @conversation.id
    @blog_link.user_id = current_user.id

    respond_to do |format|
      if @blog_link.save
        flash[:notice] = 'Post was successfully created.'
        format.html { redirect_to(@conversation) }
        format.xml  { render :xml => @blog_link, :status => :created, :location => [@blog_link.conversation,@blog_link ] }
      else
        format.html { render conversation_edit_path(@conversation) }
        format.xml  { render :xml => @blog_link.errors, :status => :unprocessable_entity }
      end

    end
  end

end
