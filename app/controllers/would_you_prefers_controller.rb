class WouldYouPrefersController < ApplicationController
  
  before_filter :login_required, :only => [:destroy]
  
  # GET /would_you_prefers
  # GET /would_you_prefers.xml
  def index
    @would_you_prefers = WouldYouPrefer.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @would_you_prefers }
    end
  end

  # GET /would_you_prefers/1
  # GET /would_you_prefers/1.xml
  def show
    @would_you_prefer = WouldYouPrefer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @would_you_prefer }
    end
  end

  # GET /would_you_prefers/new
  # GET /would_you_prefers/new.xml
  def new
    @would_you_prefer = WouldYouPrefer.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @would_you_prefer }
    end
  end

  # GET /would_you_prefers/1/edit
  def edit
    @would_you_prefer = WouldYouPrefer.find(params[:id])
  end

  # POST /would_you_prefers
  # POST /would_you_prefers.xml
  def create
    @would_you_prefer = WouldYouPrefer.new(params[:would_you_prefer])

    respond_to do |format|
      if @would_you_prefer.save
        flash[:notice] = 'WouldYouPrefer was successfully created.'
        format.html { redirect_to(@would_you_prefer) }
        format.xml  { render :xml => @would_you_prefer, :status => :created, :location => @would_you_prefer }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @would_you_prefer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /would_you_prefers/1
  # PUT /would_you_prefers/1.xml
  def update
    @would_you_prefer = WouldYouPrefer.find(params[:id])

    respond_to do |format|
      if @would_you_prefer.update_attributes(params[:would_you_prefer])
        flash[:notice] = 'WouldYouPrefer was successfully updated.'
        format.html { redirect_to(@would_you_prefer) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @would_you_prefer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /would_you_prefers/1
  # DELETE /would_you_prefers/1.xml
  def destroy
    @would_you_prefer = WouldYouPrefer.find(params[:id])
    @would_you_prefer.destroy

    respond_to do |format|
      format.html { redirect_to(would_you_prefers_url) }
      format.xml  { head :ok }
    end
  end

protected

  def authorized?(action)
    if action == 'destroy'
      logged_in? && current_user.admin?
    else
      logged_in?
    end
  end
  
end
