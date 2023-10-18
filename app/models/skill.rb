class Skill < ApplicationRecord
  belongs_to :skillable, polymorphic: true
end
