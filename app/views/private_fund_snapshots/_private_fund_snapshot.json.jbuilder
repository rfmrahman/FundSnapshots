json.extract! private_fund_snapshot, :id, :fund_id, :user_id, :nav_updated_at, :fund_code, :type_code, :company_code, :company_name, :fund_name, :net_asset_value, :price_change, :surrender_price, :total_net_asset, :dividend, :standing, :registered_at, :spare_column, :holiday, :administration_flag, :accounting, :created_at, :updated_at
json.url private_fund_snapshot_url(private_fund_snapshot, format: :json)