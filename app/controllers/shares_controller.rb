# encoding: utf-8
class ShareController < ApplicationController

   
  def index
     @interviews = Refinery::Interviews::Interview.all
  end
end