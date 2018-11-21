class PrivateFundSnapshotsController < ApplicationController
  before_action :set_private_fund_snapshot, only: [:show, :edit, :update, :destroy]

  # GET /private_fund_snapshots
  # GET /private_fund_snapshots.json
  def index
    @private_fund_snapshots = PrivateFundSnapshot.all
  end

  # GET /private_fund_snapshots/1
  # GET /private_fund_snapshots/1.json
  def show
  end

  # GET /private_fund_snapshots/new
  def new
    @private_fund_snapshot = PrivateFundSnapshot.new
  end

  # GET /private_fund_snapshots/1/edit
  def edit
  end

  # POST /private_fund_snapshots
  # POST /private_fund_snapshots.json
  def create
    @private_fund_snapshot = PrivateFundSnapshot.new(private_fund_snapshot_params)

    respond_to do |format|
      if @private_fund_snapshot.save
        format.html { redirect_to @private_fund_snapshot, notice: 'Fund snapshot was successfully created.' }
        format.json { render :show, status: :created, location: @private_fund_snapshot }
      else
        format.html { render :new }
        format.json { render json: @private_fund_snapshot.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /private_fund_snapshots/1
  # PATCH/PUT /private_fund_snapshots/1.json
  def update
    respond_to do |format|
      if @private_fund_snapshot.update(private_fund_snapshot_params)
        format.html { redirect_to @private_fund_snapshot, notice: 'Fund snapshot was successfully updated.' }
        format.json { render :show, status: :ok, location: @private_fund_snapshot }
      else
        format.html { render :edit }
        format.json { render json: @private_fund_snapshot.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /private_fund_snapshots/1
  # DELETE /private_fund_snapshots/1.json
  def destroy
    @private_fund_snapshot.destroy
    respond_to do |format|
      format.html { redirect_to private_fund_snapshots_url, notice: 'Fund snapshot was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def import
    PrivateFundSnapshot.import(params[:file])
    redirect_to "/private_fund_snapshots"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_private_fund_snapshot
      @private_fund_snapshot = PrivateFundSnapshot.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def private_fund_snapshot_params
      params.require(:private_fund_snapshot).permit(:fund_id, :user_id, :nav_updated_at, :fund_code, :company_code, :company_name, :fund_name, :net_asset_value, :price_change, :surrender_price, :total_net_asset, :dividend, :standing, :registered_at, :spare_column, :holiday, :administration_flag, :accounting, :fund_profile_id, :public_flag, :is_latest)
    end
end
