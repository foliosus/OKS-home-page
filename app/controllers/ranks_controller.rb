class RanksController < ApplicationController
  before_filter :determine_rank_class
  
  # GET /ranks
  # GET /ranks.xml
  def index
    @ranks = @rank_class.rank_order.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ranks }
    end
  end

  # GET /ranks/new
  # GET /ranks/new.xml
  def new
    @rank = @rank_class.new(params[:rank])
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @rank }
    end
  end

  # GET /ranks/1/edit
  def edit
    @rank = @rank_class.find(params[:id])
  end

  # POST /ranks
  # POST /ranks.xml
  def create
    @rank = @rank_class.new(params[:rank])

    respond_to do |format|
      if @rank.save
        format.html { redirect_to(send("#{@rank_path}s_path"), :notice => 'Rank was successfully created.') }
        format.xml  { render :xml => @rank, :status => :created, :location => @rank }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @rank.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ranks/1
  # PUT /ranks/1.xml
  def update
    @rank = @rank_class.find(params[:id])

    respond_to do |format|
      if @rank.update_attributes(params[:rank])
        format.html { redirect_to(send("#{@rank_path}s_path"), :notice => 'Rank was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @rank.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ranks/1
  # DELETE /ranks/1.xml
  def destroy
    @rank = @rank_class.find(params[:id])
    @rank.destroy
    flash[:info] = "Rank has been destroyed"

    respond_to do |format|
      format.html { redirect_to(send("#{@rank_path}s_url")) }
      format.xml  { head :ok }
    end
  end
  
  private
  
  def determine_rank_class
    @rank_class = if params[:type] == 'AikidoRank'
      AikidoRank
    else
      KiRank
    end
    @rank_path = @rank_class.to_s.underscore
    @rank_label = @rank_path.split('_').first.capitalize
  end
end
