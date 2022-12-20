class Audition < ActiveRecord::Base

    belongs_to :role
    
    def call_back
      update(hired: true)
    end
  end
  
  # app/models/role.rb
  class Role < ApplicationRecord
    has_many :auditions
    
    def actors
      auditions.pluck(:actor)
    end
    
    def locations
      auditions.pluck(:location)
    end
    
    def lead
      audition = auditions.find_by(hired: true)
      if audition
        audition.actor
      else
        "no actor has been hired for this role"
      end
    end
    
    def understudy
      audition = auditions.where(hired: true).second
      if audition
        audition.actor
      else
        "no actor has been hired for understudy for this role"
      end
    end
  end