class CollectionsController < ApplicationController
  respond_to :json, :html

  def index
    @collections = Collection.all
    respond_with @collections
  end

  def show
    @collection = Collection.find(params[:id]) || Collection.find_by_name(params[:id]) || Collection.find_by_external_id(params[:id])
    respond_with @collection
  end

end
