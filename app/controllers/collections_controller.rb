class CollectionsController < ApplicationController
  respond_to :json, :html

  def index
    @collections = Collection.paginate(:page=>params[:page], per_page: 10).all
    respond_with @collections
  end

  def show
    @collection = Collection.find(params[:id]) || Collection.find_by_name(params[:id]) || Collection.find_by_external_id(params[:id])
    respond_with @collection
  end

end
