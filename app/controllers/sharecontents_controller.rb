# encoding: utf-8
class SharecontentsController < ApplicationController

  def  show
  	@interview = Refinery::Interviews::Interview.find(params[:id])
    
  end
end