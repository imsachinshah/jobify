class MakeSkillToPolymorphic < ActiveRecord::Migration[7.0]
  def change
    add_reference :skills, :skillable, polymorphic: true
  end
end
