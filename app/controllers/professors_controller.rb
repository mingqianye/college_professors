class ProfessorsController < ApplicationController

  # GET /professors
  def index
    @professors = Professor.includes(:subjects).all

    respond_to do |format|
      format.html
    end
  end

  # GET /professors/new
  def new
    @professor = Professor.new

    respond_to do |format|
      format.html
    end
  end

  # GET /professors/1/edit
  def edit
    @professor = Professor.find(params[:id])
  end

  # POST /professors
  def create
    @professor = Professor.new(professor_params)

    respond_to do |format|
      if @professor.save
        format.html { redirect_to root_path, notice: 'Professor was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /professors/1
  def update
    professor = Professor.find(params[:id])

    respond_to do |format|
      if professor.update_attributes(professor_params)
        format.html { redirect_to root_path, notice: 'Professor was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /professors/1
  def destroy
    @professor = Professor.find(params[:id])
    @professor.destroy

    respond_to do |format|
      format.html { redirect_to professors_url }
    end
  end

  # POST /professors/1/global_subject/
  def global_subject

  end

  private
  def professor_params
    params.require(:professor).permit(:name)
  end
end
