class TasController < ApplicationController
  # GET /ta
  # GET /ta.json
  def index
    @tas = Ta.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ta }
    end
  end

  # GET /ta/1
  # GET /ta/1.json
  def show
    @ta = Ta.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ta }
    end
  end

  # GET /ta/new
  # GET /ta/new.json
  def new
    @ta = Ta.new 
    
    respond_to do |format|
      format.html
    end



  end

  # GET /ta/1/edit
  def edit
    @ta = Ta.find(params[:id])
  end

  # POST /ta
  # POST /ta.json
  def create
    @ta = Ta.new(ta_params)

    respond_to do |format|
      if @ta.save
        format.html { redirect_to @ta, notice: 'Ta was successfully created.' }
        format.json { render json: @ta, status: :created, location: @ta }
      else
        format.html { render action: "new" }
        format.json { render json: @ta.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ta/1
  # PATCH/PUT /ta/1.json
  def update
    @ta = Ta.find(params[:id])

    respond_to do |format|
      if @ta.update_attributes(Ta_params)
        format.html { redirect_to @ta, notice: 'Ta was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ta.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ta/1
  # DELETE /ta/1.json
  def destroy
    @ta = Ta.find(params[:id])
    @ta.destroy

    respond_to do |format|
      format.html { redirect_to ta_url }
      format.json { head :no_content }
    end
  end

  private

    # Use this method to whitelist the permissible parameters. Example:
    # params.require(:person).permit(:name, :age)
    # Also, you can specialize this method with per-user checking of permissible attributes.
    def Ta_params
      params.require(:Ta).permit(:name, :professor_id, :subject_id)
    end
end
