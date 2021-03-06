class DreamsController < ApplicationController
  before_action :set_dream, only: %i[ show edit update destroy report ]

  # GET /dreams or /dreams.json
  def index
    @dreams = Dream.published.limit(100).sample(100)
  end

  # GET /dreams/1 or /dreams/1.json
  def show
  end

  # GET /dreams/new
  def new
    @dream = Dream.new
  end

  # POST /dreams or /dreams.json
  def create
    @dream = Dream.new(dream_params)

    respond_to do |format|
      if @dream.save
        format.html { redirect_to dream_url(@dream), notice: "Dream was successfully created." }
        format.json { render :show, status: :created, location: @dream }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @dream.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dreams/1 or /dreams/1.json
  def destroy
    @dream.destroy

    respond_to do |format|
      format.html { redirect_to dreams_url, notice: "Dream was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def report
    @dream.status = "Reported"
    @dream.published = false
    @dream.save!
    redirect_to dreams_url, notice: "Dream was reported and unpublished."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dream
      @dream = Dream.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def dream_params
      params.require(:dream).permit(:description, :email)
    end
end
