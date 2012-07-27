# encoding: utf-8
class EventsController < ApplicationController

  def search
    @events = Events.new
  end

end