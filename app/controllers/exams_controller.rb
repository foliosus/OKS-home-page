class ExamsController < ApplicationController
  # GET /exams
  # GET /exams.xml
  def index
    @exams = Exam.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @exams }
    end
  end

  # GET /exams/new
  # GET /exams/new.xml
  def new
    member = Member.find_by_id(params[:member_id])
    respond_to do |format|
      if member
        @exam = Exam.new(:member => member)
        format.html # new.html.erb
        format.xml  { render :xml => @exam }
      else
        format.html { redirect_to(members_path, :flash => {:error => 'You must select a member to create an exam for'}) }
        format.xml do
          @exam = Exam.new
          @exam.errors.add(:member, "can't be blank")
          render :xml => @exam.errors, :status => :unprocessable_entity
        end
      end
    end
  end

  # GET /exams/1/edit
  def edit
    @exam = Exam.find(params[:id])
  end

  # POST /exams
  # POST /exams.xml
  def create
    @exam = Exam.new(params[:exam])

    respond_to do |format|
      if @exam.save
        format.html { redirect_to(exams_path, :notice => 'Exam was successfully created.') }
        format.xml  { render :xml => @exam, :status => :created, :location => @exam }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @exam.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /exams/1
  # PUT /exams/1.xml
  def update
    @exam = Exam.find(params[:id])

    respond_to do |format|
      if @exam.update_attributes(params[:exam])
        format.html { redirect_to(exams_path, :notice => 'Exam was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @exam.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /exams/1
  # DELETE /exams/1.xml
  def destroy
    @exam = Exam.find(params[:id])
    @exam.destroy

    respond_to do |format|
      format.html { redirect_to(exams_path) }
      format.xml  { head :ok }
    end
  end
end
