class SubjectsController < ApplicationController

  # GET /professors/:professor_id/subjects
  def index
    @professor = Professor.find_by_id(params[:professor_id])
    if @professor
      @subjects = @professor.subjects
      respond_to do |format|
        format.html
        format.json { render json: @subjects }
      end
    end
  end

  # GET /professors/:professor_id/subjects/new
  def new
    @professor = Professor.find_by_id(params[:professor_id])
    if @professor
      @subject = @professor.subjects.build
      respond_to do |format|
        format.html
      end
    else
      redirect_to root_path
    end
  end

  # GET /professors/:professor_id/subjects/1/edit
  def edit
    @professor = Professor.find_by_id(params[:professor_id])
    if @professor
      @subject = Subject.find(params[:id])
      respond_to do |format|
        format.html
      end
    else
      redirect_to root_path
    end
  end

  # POST /professors/:professor_id/subjects
  def create
    professor = Professor.find_by_id(params[:professor_id])
    if professor
      respond_to do |format|
        if professor.subjects.create(subject_params)
          format.html { redirect_to root_path, notice: 'Subject was successfully created.' }
        else
          format.html { render action: "new" }
        end
      end
    else
      redirect_to root_path
    end
  end

  # PUT /professors/:professor_id/subjects/1
  def update
    professor = Professor.find_by_id(params[:professor_id])
    if professor
      @subject = Subject.find(params[:id])
      respond_to do |format|
        if @subject.update_attributes(subject_params)
          format.html { redirect_to professor_subjects_path(professor), notice: 'Subject was successfully updated.' }
        else
          format.html { render action: "edit" }
        end
      end
    else
      redirect_to root_path
    end
  end

  # DELETE /professors/:professor_id/subjects/1
  def destroy
    professor = Professor.find_by_id(params[:professor_id])
    if professor
      @subject = Subject.find(params[:id])
      @subject.destroy
      respond_to do |format|
        format.html { redirect_to professor_subjects_path(professor) }
      end
    end
  end

  # GET /new_global_subject
  def new_global_subject
    @subject = Subject.new
    respond_to do |format|
      format.html
    end
  end

  # POST /create_global_subjects
  def create_global_subjects
    professors = Professor.all
    respond_to do |format|
      begin
        professors.each do |professor|
          professor.subjects.create(subject_params)
        end
        format.html { redirect_to root_path, notice: 'Subject was successfully created.' }
      rescue
        format.html { render action: :create_global_subjects }
      end
    end
  end

  private
  def subject_params
    params.require(:subject).permit(:name)
  end
end
