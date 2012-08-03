# encoding: utf-8
class HomesController < ApplicationController
 
  def index
     @events = Refinery::Events::Event.where("select_show = 1").order('position ASC, created_at DESC').limit(1)
     @shares = Refinery::Shares::Share.where("select_show = 1").order('position DESC, created_at ASC').limit(2)
  end

end