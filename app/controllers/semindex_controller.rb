class SemindexController < ApplicationController

before_action :set_user, only: [:show, :edit, :update, :destroy,:list]

def list

#@events = Event.where("date >= ?", params[:date]+' 00:00:00')
#@events= Event.all
end

def listevent
@events = Event.where("date >= ?", params[:date]+' 00:00:00')
end


end
