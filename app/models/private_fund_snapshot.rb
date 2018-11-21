# == Schema Information
#
# Table name: fund_snapshots
#
#  id                                :integer          not null, primary key
#  fund_id                           :integer
#  user_id                           :integer
#  nav_updated_at                    :date
#  fund_code                         :string(255)
#  company_code                      :string(255)
#  company_name                      :string(255)
#  fund_name                         :string(255)
#  net_asset_value                   :integer
#  price_change                      :integer
#  surrender_price                   :integer
#  total_net_asset                   :integer
#  dividend                          :integer
#  standing                          :integer
#  registered_at                     :date
#  spare_column                      :string(255)
#  holiday                           :boolean
#  administration_flag               :integer
#  accounting                        :integer
#  fund_profile_id                   :integer
#  public_flag                       :integer
#  is_latest                        :integer
#  created_at                        :datetime         not null
#  updated_at                        :datetime         not null
#
require 'csv'

class PrivateFundSnapshot < ApplicationRecord
  after_create :check_company_name

  def check_company_name
  end

  def name
  end

  def nav_read
    head, tail = self.net_asset_value.to_s.split(/\./)
    if tail.to_i > 0
      [head, tail].join('.')
    else
      head
    end
  end

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|

      obj = new
      #puts(row)
      obj.attributes = row.to_hash.slice(*updatable_attributes)
      #puts(obj.attributes)

      obj.save!
    end
  end

  def self.updatable_attributes
    ["fund_id", "user_id", "nav_updated_at", "fund_code", "company_code", "company_name", "fund_name", "net_asset_value", "price_change", "surrender_price", "total_net_asset", "dividend", "standing", "registered_at", "spare_column", "holiday", "administration_flag", "accounting", "fund_profile_id", "public_flag", "is_latest"]
  end

end
