# == Schema Information
#
# Table name: restaurant_snapshots
#
#  id                                :integer          not null, primary key
#  restaurant_code                   :string(255)
#  restaurant_name                   :string(255)
#  description                       :string(255)
#  address                           :string(255)
#  phone                             :string(255)
#  email                             :string(255)
#  location                          :string(255)
#  review_link                       :string(255)
#  created_at                        :datetime         not null
#  updated_at                        :datetime         not null
#
require 'csv'

class Restaurant < ApplicationRecord
  def self.to_csv
    attributes = %w{id restaurant_code restaurant_name description address location phone_number email review_link}

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |restaurant|
        csv << attributes.map{ |attr| restaurant.send(attr) }
      end
    end
  end
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|

      obj = new
      obj.attributes = row.to_hash.slice(*updatable_attributes)

      obj.save!
    end
  end

  def self.updatable_attributes
    ["restaurant_code", "restaurant_name", "description", "address", "location", "phone_number", "email", "review_link"]
  end

end
