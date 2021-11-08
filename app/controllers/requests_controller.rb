class RequestsController < ApplicationController
  def index
    @requests = Request.all
  end

  def show
    @request = Request.find(params[:id])
  end

  def new
    @request = Request.new
  end

  def create
    @request = Request.new(request_params)
    @request.user = current_user
    @request.request_date = Time.now

    params_nested[:lab_analysis_attributes].each do |analysis|
      @request.lab_analysis << LabAnalysis.new(analysis.second.to_h.merge(sample_id: analysis.first)) if analysis.second.values.include?("1")
    end
    @request.sample_quantity = @request.lab_analysis.size

    if @request.save
      redirect_to request_path(@request)
    else
      render :new
    end
  end

  def destroy
    @request = Request.find(params[:id])
    @request.destroy

    redirect_to requests_path
  end

  private

  def request_params
    params.require(:request).permit(:project_name, :project_summary)
  end

  def params_nested
    all_options = params.require(:request)[:lab_analysis_attributes].try(:permit!)
    params.require(:request).permit(:project_name, :project_summary).merge(lab_analysis_attributes: all_options)
  end
end
