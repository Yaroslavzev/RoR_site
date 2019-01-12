class SearchesController < ApplicationController
  before_action :authenticate_user!

  # GET /searches
  # GET /searches.json
  def index
    @searches = Event.search(search_params) unless search_params.to_h.map { |_k, v| v.empty? }.all?
    @inserted_data = search_params
  end

  # GET /searches/1
  # GET /searches/1.json
  def show
    search_params_of_filtr = Search.find(search_params[:id]).params_of_filtr
    @searches = Event.search(search_params_of_filtr) unless search_params.to_h.map { |_k, v| v.empty? }.all?
  end

  def create
    @search = Search.new(search_params)

    respond_to do |format|
      if @search.save
        format.html { redirect_to @search, notice: "Search was successfully created." }
        format.json { render :show, status: :created, location: @search }
      else
        format.html { render :new }
        format.json { render json: @search.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def search_params
    params.permit(:id, :user_id, :search_place, :search_start_beg, :search_start_end, :search_subject)
  end
end
