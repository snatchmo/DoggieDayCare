class AddOwneridToDog < ActiveRecord::Migration
  def change
    add_reference :dogs, :owner, index: true
    add_foreign_key :dogs, :owners
  end
end
