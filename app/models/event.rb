class Event < ActiveRecord::Base
  belongs_to :meetup
   has_many:comments
end
