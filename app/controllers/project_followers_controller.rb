class ProjectFollowersController < ApplicationController
  before_action :set_project_follower, only: [:show, :edit, :update, :destroy]

  # GET /project_followers
  # GET /project_followers.json
  def index
    @project_followers = ProjectFollower.all
  end

  # GET /project_followers/1
  # GET /project_followers/1.json
  def show
  end

  # GET /project_followers/new
  def new
    @project_follower = ProjectFollower.new
  end

  # GET /project_followers/1/edit
  def edit
  end

  # POST /project_followers
  # POST /project_followers.json
  def create
    @project_follower = ProjectFollower.new(project_follower_params)

    respond_to do |format|
      if @project_follower.save
        format.html { redirect_to @project_follower, notice: 'Project follower was successfully created.' }
        format.json { render action: 'show', status: :created, location: @project_follower }
      else
        format.html { render action: 'new' }
        format.json { render json: @project_follower.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /project_followers/1
  # PATCH/PUT /project_followers/1.json
  def update
    respond_to do |format|
      if @project_follower.update(project_follower_params)
        format.html { redirect_to @project_follower, notice: 'Project follower was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @project_follower.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_followers/1
  # DELETE /project_followers/1.json
  def destroy
    @project_follower.destroy
    respond_to do |format|
      format.html { redirect_to project_followers_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project_follower
      @project_follower = ProjectFollower.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_follower_params
      params.require(:project_follower).permit(:user_id, :project_id)
    end
end
