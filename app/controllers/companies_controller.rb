class CompaniesController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  def index
    @companies = Company.all
    @company = Company.new
  end
    
  def create
    @company = Company.new(company_params)

    respond_to do |format|
      if @company.save
        format.js
      else
        format.html { redirect_to companies_path, alert: 'Error. Intente nuevamente' }
      end
    end
  end
    
  def destroy
    @company = Company.find(params[:id])

    respond_to do |format|
      if @company.destroy
        format.js
      else
        format.html { redirect_to companies_path, alert: 'Error. Intente nuevamente' }
      end 
    end
  end
    
  def edit
    @company = Company.find(params[:id])
    respond_to { |format| format.js }
  end

  def update
    @company = Company.find(params[:id])
    respond_to do |format|
      if @company.update(company_params)
        format.js
      else
        format.html { redirect_to companies_path, alert: 'Error. Intente nuevamente' }
      end
    end
  end

  def show
    @company = Company.find(params[:id])
    @claims = Claim.where(company: @company).order('created_at DESC')
    @claim  = Claim.new
  end
  
  private

  def company_params
    params.require(:company).permit(:name, :duns_number, :industry, :logo)
  end
end
