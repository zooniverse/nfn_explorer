class SubjectsController < ApplicationController
  respond_to :json, :html

  def index
    respond_with Subject.paginate(:page=>params[:page], per_page: 10).all
  end

  def show
    @subject = Subject.find(params[:id]) || Subject.find_by_external_id(params[:id])
    if request.format =="html"
      @collected_annotations = @subject.collect_annotations
    end 
    respond_with @subject
  end

end
