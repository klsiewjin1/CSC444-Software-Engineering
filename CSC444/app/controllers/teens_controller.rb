class TeensController < ApplicationController
  before_action :set_teen, only: [:show, :edit, :update, :destroy]

  # GET /teens
  # GET /teens.json
  def index
    @teens = Teen.all
  end

  # GET /teens/1
  # GET /teens/1.json
  def show
  end

  # GET /teens/new
  def new
    @teen = Teen.new
  end

  # GET /teens/1/edit
  def edit
  end

  # POST /teens
  # POST /teens.json
  def create
    @teen = Teen.new(teen_params)

    respond_to do |format|
      if @teen.save
        format.html { redirect_to @teen, notice: 'Teen was successfully created.' }
        format.json { render :show, status: :created, location: @teen }
      else
        format.html { render :new }
        format.json { render json: @teen.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teens/1
  # PATCH/PUT /teens/1.json
  def update
    respond_to do |format|
      if @teen.update(teen_params)
        format.html { redirect_to @teen, notice: 'Teen was successfully updated.' }
        format.json { render :show, status: :ok, location: @teen }
      else
        format.html { render :edit }
        format.json { render json: @teen.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teens/1
  # DELETE /teens/1.json
  def destroy
    @teen.destroy
    respond_to do |format|
      format.html { redirect_to teens_url, notice: 'Teen was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_teen
      @teen = Teen.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def teen_params
      params.fetch(:teen, {})
    end
end
