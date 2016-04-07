class ConferencesController < ApplicationController
  before_action :set_conference, only: [:show, :edit, :update, :destroy]

  # GET /conferences
  # GET /conferences.json
  def index
    @conferences = Conference.all
    @topics = Topic.order(name: :asc) 
  end

  # GET /conferences/1
  # GET /conferences/1.json
  def show
  end

  # GET /conferences/new
  def new
    @conference = Conference.new
  end

  # GET /conferences/1/edit
  def edit
  end

  # POST /conferences
  # POST /conferences.json
  def create
    @conference = Conference.new(conference_params)
    # @conference.topic = Topic.find(params[:conference][:topic])
    topics = params[:topic_list].to_s.split(',')
    topics.each do |topic_id|
      @conference.topics << Topic.find(topic_id)
    end    
    if @conference.save
      redirect_to conferences_path, :notice => "Conference created"
    else
      render :new
    end

    # respond_to do |format|
    #   if @conference.save
    #     format.html { redirect_to @conference, notice: 'Conference was successfully created.' }
    #     format.json { render :show, status: :created, location: @conference }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @conference.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /conferences/1
  # PATCH/PUT /conferences/1.json
  def update
    @conference.update(conference_params)
    topics = params[:topic_list].to_s.split(',')
    @conference.topics.clear
    topics.each do |topic_id|
      @conference.topics << Topic.find(topic_id)
    end    
    if @conference.save
      redirect_to conferences_path, :notice => "Conference updated"
    else
      render :edit
    end

    # respond_to do |format|
    #   if @conference.update(conference_params)
    #     format.html { redirect_to @conference, notice: 'Conference was successfully updated.' }
    #     format.json { render :show, status: :ok, location: @conference }
    #   else
    #     format.html { render :edit }
    #     format.json { render json: @conference.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # DELETE /conferences/1
  # DELETE /conferences/1.json
  def destroy
    @conference.destroy
    respond_to do |format|
      format.html { redirect_to conferences_url, notice: 'Conference was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_conference
      @conference = Conference.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def conference_params
      params.require(:conference).permit(:title, :url, :from_date, :to_date, :venue_city, :venue_country, :cfp_opens_on, :cfp_closes_on, :created_by, :created_by_email)
    end
end
