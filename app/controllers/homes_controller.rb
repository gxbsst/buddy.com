# encoding: utf-8
class HomesController < ApplicationController
 
  def index
     @events = Refinery::Events::Event.where("select_show = 1").order('position ASC, created_at DESC').limit(1)
  end

end