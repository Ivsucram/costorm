class IdeaKeywordsController < ApplicationController
  before_action :set_idea_keyword, only: [:show, :edit, :update, :destroy]

  # GET /idea_keywords
  # GET /idea_keywords.json
  def index
    @idea_keywords = IdeaKeyword.all
  end

  # GET /idea_keywords/1
  # GET /idea_keywords/1.json
  def show
  end

  # GET /idea_keywords/new
  def new
    @idea_keyword = IdeaKeyword.new
  end

  # GET /idea_keywords/1/edit
  def edit
  end

  # POST /idea_keywords
  # POST /idea_keywords.json
  def create
    @idea_keyword = IdeaKeyword.new(idea_keyword_params)

    respond_to do |format|
      if @idea_keyword.save
        format.html { redirect_to @idea_keyword, notice: 'Idea keyword was successfully created.' }
        format.json { render action: 'show', status: :created, location: @idea_keyword }
      else
        format.html { render action: 'new' }
        format.json { render json: @idea_keyword.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /idea_keywords/1
  # PATCH/PUT /idea_keywords/1.json
  def update
    respond_to do |format|
      if @idea_keyword.update(idea_keyword_params)
        format.html { redirect_to @idea_keyword, notice: 'Idea keyword was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @idea_keyword.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /idea_keywords/1
  # DELETE /idea_keywords/1.json
  def destroy
    @idea_keyword.destroy
    respond_to do |format|
      format.html { redirect_to idea_keywords_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_idea_keyword
      @idea_keyword = IdeaKeyword.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def idea_keyword_params
      params.require(:idea_keyword).permit(:idea_id, :keyword_id)
    end
end
