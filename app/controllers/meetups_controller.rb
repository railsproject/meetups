class MeetupsController < ApplicationController
  before_action :set_meetup, only: [:show, :edit, :update, :destroy, :home]

  # GET /meetups
  # GET /meetups.json
  def index
    @meetups = Meetup.all
  end


  def home 

	redirect_to :controller => "meetups_controller", :action => "home"
 	return
  end

 

  # GET /meetups/1
  # GET /meetups/1.json
  def show
   @join=Usermeetup.where("user_id = ? AND meetup_id = ?",session[:user_id],params[:id]).exists?
   
     render "show"
  end

  # GET /meetups/new
  def new
    @meetup = Meetup.new
  end

  # GET /meetups/1/edit
  def edit
  end

  # POST /meetups
  # POST /meetups.json
  def create
    @meetup = Meetup.new(meetup_params)

    respond_to do |format|
      if @meetup.save
        format.html { redirect_to @meetup, notice: 'Meetup was successfully created.' }
        format.json { render :show, status: :created, location: @meetup }
      else
        format.html { render :new }
        format.json { render json: @meetup.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /meetups/1
  # PATCH/PUT /meetups/1.json
  def update
    respond_to do |format|
      if @meetup.update(meetup_params)
        format.html { redirect_to @meetup, notice: 'Meetup was successfully updated.' }
        format.json { render :show, status: :ok, location: @meetup }
      else
        format.html { render :edit }
        format.json { render json: @meetup.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meetups/1
  # DELETE /meetups/1.json
  def destroy
    @meetup.destroy
    respond_to do |format|
      format.html { redirect_to meetups_url, notice: 'Meetup was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

 def join

    @meetup=Meetup.find(params[:id])
    
    @usermeetup = Usermeetup.new(meetup_id:params[:id],  user_id:  session[:user_id])
    respond_to do |format|
      @usermeetup.save
      format.html { redirect_to meetup_path(@meetup) }
       
  end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meetup
      @meetup = Meetup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def meetup_params
      params.require(:meetup).permit(:title, :user_id, :disc, :lat, :long)
    end

   
  


    
end
