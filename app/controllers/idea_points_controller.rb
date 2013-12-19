class IdeaPointsController < ApplicationController
  before_action :set_idea_point, only: [:show, :edit, :update, :destroy]

  # GET /idea_points
  # GET /idea_points.json
  def index
    @idea_points = IdeaPoint.all
  end

  # GET /idea_points/1
  # GET /idea_points/1.json
  def show
  end

  # GET /idea_points/new
  def new
    @idea_point = IdeaPoint.new
  end

  # GET /idea_points/1/edit
  def edit
  end

  # POST /idea_points
  # POST /idea_points.json
  def create
    @idea_point = IdeaPoint.new(idea_point_params)

    respond_to do |format|
      if @idea_point.save
        format.html { redirect_to @idea_point, notice: 'Idea point was successfully created.' }
        format.json { render action: 'show', status: :created, location: @idea_point }
      else
        format.html { render action: 'new' }
        format.json { render json: @idea_point.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /idea_points/1
  # PATCH/PUT /idea_points/1.json
  def update
    respond_to do |format|
      if @idea_point.update(idea_point_params)
        format.html { redirect_to @idea_point, notice: 'Idea point was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @idea_point.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /idea_points/1
  # DELETE /idea_points/1.json
  def destroy
    @idea_point.destroy
    respond_to do |format|
      format.html { redirect_to idea_points_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_idea_point
      @idea_point = IdeaPoint.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def idea_point_params
      params.require(:idea_point).permit(:idea_id, :user_id, :vote)
    end
end
