class CreateAdds < ActiveRecord::Migration[5.2]
  def change
    create_table :adds do |t|
      t.references :user, foreign_key: {to_table: :users}
      t.references :song, foreign_key: {to_table: :songs}

      t.timestamps
    end
  end
end
