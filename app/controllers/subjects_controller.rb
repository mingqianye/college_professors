class SubjectsController < ApplicationController

  # GET /professors/:professor_id/subjects
  def index
    professor = Professor.find_by_id(params[:professor_id])
    if professor
      subjects = professor.subjects
      respond_to do |format|
        format.json { render json: subjects }
      end
    end
  end

  # GET /subjects/1
  # GET /subjects/1.json
  def show
    @subject = Subject.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @subject }
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

  # GET /subjects/1/edit
  def edit
    @subject = Subject.find(params[:id])
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

  # PUT /subjects/1
  # PUT /subjects/1.json
  def update
    @subject = Subject.find(params[:id])

    respond_to do |format|
      if @subject.update_attributes(params[:subject])
        format.html { redirect_to @subject, notice: 'Subject was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subjects/1
  # DELETE /subjects/1.json
  def destroy
    @subject = Subject.find(params[:id])
    @subject.destroy

    respond_to do |format|
      format.html { redirect_to subjects_url }
      format.json { head :no_content }
    end
  end

  private
  def subject_params
    params.require(:subject).permit(:name)
  end
end
