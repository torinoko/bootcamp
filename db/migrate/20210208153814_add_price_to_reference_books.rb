# frozen_string_literal: true

class AddPriceToReferenceBooks < ActiveRecord::Migration[6.0]
  def change
    change_table :reference_books, bulk: true do |t|
      t.integer :price, null: false
    end

    remove_column :reference_books, :asin, :string
    remove_column :reference_books, :image_url, :string
  end
end
