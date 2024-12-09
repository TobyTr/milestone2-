# frozen_string_literal: true

class AddUserFkColToBuilds < ActiveRecord::Migration[7.0]
  def change
    add_reference :builds, :user, foreign_key: true
  end
end
