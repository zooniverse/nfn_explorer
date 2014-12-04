class HomeController < ApplicationController
  def index
    @collections    = Collection.all
    @need_consensus = Subject.complete.random(10)
  end
end
