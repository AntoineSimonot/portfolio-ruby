class AddPositionToPorfolios < ActiveRecord::Migration[6.1]
  def change
    add_column :portfolios, :position, :integer
  end
end
