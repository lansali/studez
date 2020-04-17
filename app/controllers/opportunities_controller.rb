class OpportunitiesController < ApplicationController
  include OpportunitiesHelper
  before_action :set_opportunity, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_request, only: [:index, :show]

  def index
    @opportunities = build_opportunities_object_from_params(params)
  end

  def show
  end

  def new
    @business_id = params[:business_id]
    @opportunity = Opportunity.new
  end

  def edit
  end

  def create
    @opportunity = Opportunity.new(opportunity_params)

    respond_to do |format|
      if @opportunity.save
        format.html { redirect_to @opportunity, notice: 'Opportunity was successfully created.' }
        format.json { render :show, status: :created, location: @opportunity }
      else
        format.html { render :new }
        format.json { render json: @opportunity.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @opportunity.update(opportunity_params)
        format.html { redirect_to @opportunity, notice: 'Opportunity was successfully updated.' }
        format.json { render :show, status: :ok, location: @opportunity }
      else
        format.html { render :edit }
        format.json { render json: @opportunity.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @opportunity.destroy
    respond_to do |format|
      format.html { redirect_to opportunities_url, notice: 'Opportunity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_opportunity
      @opportunity = Opportunity.find(params[:id])
    end

    def opportunity_params
      params.require(:opportunity).permit(:name, :business_id, :description, :location, :requirements, :other, :deadline, :category)
    end
end
