class PicturesController < ApplicationController
  # GET /pictures
  # GET /pictures.xml
  def index
    @pictures = Picture.find(:all, :conditions => ["relationship_id = ?", params[:relationship_id]])

    @relationship = Relationship.find(params[:relationship_id])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @pictures }
    end
  end

  # GET /pictures/1
  # GET /pictures/1.xml
  def show
    @picture = Picture.find(params[:id])
    @relationship = Relationship.find(params[:relationship_id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @picture }
    end
  end

  # GET /pictures/new
  # GET /pictures/new.xml
  def new
    @picture = Picture.new
    @relationship = Relationship.find(params[:relationship_id])

    @picture.relationship_id = @relationship.id

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @picture }
    end
  end

  # GET /pictures/1/edit
  def edit
    @picture = Picture.find(params[:id])
    @relationship = Relationship.find(params[:relationship_id])
  end

  # POST /pictures
  # POST /pictures.xml
  def create
    @picture = Picture.new(params[:picture])
    @relationship = Relationship.find(params[:relationship_id])

    @picture.relationship_id = @relationship.id
    
    

    respond_to do |format|
      if @picture.save
        flash[:notice] = 'Picture was successfully created.'
        format.html { redirect_to(@picture.relationship, @picture) }
        format.xml  { render :xml => @picture, :status => :created, :location => [@picture.relationship,@picture ] }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @picture.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /pictures/1
  # PUT /pictures/1.xml
  def update
    @picture = Picture.find(params[:id])

    respond_to do |format|
      if @picture.update_attributes(params[:picture])
        flash[:notice] = 'Picture was successfully updated.'
        format.html { redirect_to(@picture.relationship,@picture) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @picture.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /pictures/1
  # DELETE /pictures/1.xml
  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy

    respond_to do |format|
      format.html { redirect_to(relationship_pictures_url) }
      format.xml  { head :ok }
    end
  end
end
