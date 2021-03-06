class CompaniesController < ApplicationController
  before_action :find_company, only: [:show, :edit]

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    @company.user_id = current_user.id
    if @company.save
      redirect_to @company
    else
      render 'new'
    end
  end

  def edit
  end

  def show
    @company = Company.find(params[:id])
  end

  def index
    @companies = Company.where(user_id: current_user.id)
  end

  private

  def company_params
    params.require(:company).permit(:name, :industry)
  end

  def find_company
    @company = Company.find(params[:id])
  end

end
