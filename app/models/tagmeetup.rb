class Tagmeetup < ActiveRecord::Base
  belongs_to :tag
  belongs_to :meetup
end
