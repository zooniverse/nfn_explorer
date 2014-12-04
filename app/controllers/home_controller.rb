class HomeController < ApplicationController
  def index
    @need_consensus = Subject.complete.random(10)
  end
end
