class SearchesController < ApplicationController
  #before_action :set_search, only: [:show, :edit, :update, :destroy]

  # GET /searches
  # GET /searches.json
  def index
    @searches = Event.search(search_params) if !search_params.to_h.map { |k,v| v.empty? }.all?
    @inserted_data = search_params

    Rails.logger.info "*" * 50
    Rails.logger.info params
    Rails.logger.info search_params[:search_start_beg].class

  end

  # GET /searches/1
  # GET /searches/1.json
  def show
    search_params_of_filtr = Search.find(search_params[:id]).attributes.except("id", "user_id", "created_at", "updated_at" ).map {|key, object| {"#{key}": object.to_s}}.reduce(:merge)

    @searches = Event.search(search_params_of_filtr) if !search_params.to_h.map { |k,v| v.empty? }.all?

    Rails.logger.info "*" * 50
    Rails.logger.info search_params_of_filtr
    Rails.logger.info search_params_of_filtr[:search_start_beg].class
  end
#
#  # GET /searches/new
#  def new
#    @search = Search.new
#  end
#
#  # GET /searches/1/edit
#  def edit
#  end
#
  # POST /searches
  # POST /searches.json
  def create

    @search = Search.new(search_params)

    #respond_to do |format|
      if @search.save
        #format.html { redirect_to @search, notice: 'Search was successfully created.' }
        #format.json { render :show, status: :created, location: @search }
      else
        #format.html { render :new }
        #format.json { render json: @search.errors, status: :unprocessable_entity }
      #end
    end
  end
#
#  # PATCH/PUT /searches/1
#  # PATCH/PUT /searches/1.json
#  def update
#    respond_to do |format|
#      if @search.update(search_params)
#        format.html { redirect_to @search, notice: 'Search was successfully updated.' }
#        format.json { render :show, status: :ok, location: @search }
#      else
#        format.html { render :edit }
#        format.json { render json: @search.errors, status: :unprocessable_entity }
#      end
#    end
#  end
#
#  # DELETE /searches/1
#  # DELETE /searches/1.json
#  def destroy
#    @search.destroy
#    respond_to do |format|
#      format.html { redirect_to searches_url, notice: 'Search was successfully destroyed.' }
#      format.json { head :no_content }
#    end
#  end
#
  private
    # Use callbacks to share common setup or constraints between actions.
#    def set_search
#      @search = Search.find(params[:id])
#    end
#
    # Never trust parameters from the scary internet, only allow the white list through.
    def search_params
      params.permit(:id, :user_id,:search_place, :search_start_beg, :search_start_end,:search_subject)
    end
end
