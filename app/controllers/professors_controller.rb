class ProfessorsController < ApplicationController

  # GET /professors
  def index
    @professors = Professor.all

    respond_to do |format|
      format.html
    end
  end

  # GET /professors/1
  # GET /professors/1.json
  def show
    @professor = Professor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @professor }
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
        format.html { redirect_to @professor, notice: 'Professor was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /professors/1
  def update
    @professor = Professor.find(params[:id])

    respond_to do |format|
      if @professor.update_attributes(professor_params)
        format.html { redirect_to @professor, notice: 'Professor was successfully updated.' }
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

  private
  def professor_params
    params.require(:professor).permit(:name)
  end
end
