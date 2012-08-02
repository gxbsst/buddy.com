# encoding: utf-8
class SharesController < ApplicationController

   
  def index
     @interviews = Refinery::Interviews::Interview.all
  end
end