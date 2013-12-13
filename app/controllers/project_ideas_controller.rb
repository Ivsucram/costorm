class ProjectIdeasController < ApplicationController
  before_action :set_project_idea, only: [:show, :edit, :update, :destroy]

  # GET /project_ideas
  # GET /project_ideas.json
  def index
    @project_ideas = ProjectIdea.all
  end

  # GET /project_ideas/1
  # GET /project_ideas/1.json
  def show
  end

  # GET /project_ideas/new
  def new
    @project_idea = ProjectIdea.new
  end

  # GET /project_ideas/1/edit
  def edit
  end

  # POST /project_ideas
  # POST /project_ideas.json
  def create
    @project_idea = ProjectIdea.new(project_idea_params)

    respond_to do |format|
      if @project_idea.save
        format.html { redirect_to @project_idea, notice: 'Project idea was successfully created.' }
        format.json { render action: 'show', status: :created, location: @project_idea }
      else
        format.html { render action: 'new' }
        format.json { render json: @project_idea.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /project_ideas/1
  # PATCH/PUT /project_ideas/1.json
  def update
    respond_to do |format|
      if @project_idea.update(project_idea_params)
        format.html { redirect_to @project_idea, notice: 'Project idea was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @project_idea.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_ideas/1
  # DELETE /project_ideas/1.json
  def destroy
    @project_idea.destroy
    respond_to do |format|
      format.html { redirect_to project_ideas_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project_idea
      @project_idea = ProjectIdea.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_idea_params
      params.require(:project_idea).permit(:idea_id, :project_id)
    end
end
