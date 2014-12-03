class SubjectsController < ApplicationController
  respond_to :json, :html

  def index
    respond_with Subject.all
  end

  def show
    @subject = Subject.find(params[:id]) || Subject.find_by_external_id(params[:id])

    respond_with @subject
  end

end
