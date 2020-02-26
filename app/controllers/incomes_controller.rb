class IncomesController < MainTemplateController
  before_action :set_income, only: [:show, :edit, :update, :destroy]

  # GET /incomes
  # GET /incomes.json
  def index
    @title = t("menu_title.income.title")
    @incomes = Income.all
  end

  # GET /incomes/1
  # GET /incomes/1.json
  def show
    @title = t("menu_title.income.detail")
  end

  # GET /incomes/new
  def new
    @title = t("menu_title.income.new")
    @income = Income.new
  end

  # GET /incomes/1/edit
  def edit
    @title = t("menu_title.income.edit")
  end

  # POST /incomes
  # POST /incomes.json
  def create
    @income = Income.new(income_params)
    @income.created_by = current_user.id

    respond_to do |format|
      if @income.save
        format.html { redirect_to @income, notice: 'Income was successfully created.' }
        format.json { render :show, status: :created, location: @income }
      else
        format.html { render :new }
        format.json { render json: @income.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /incomes/1
  # PATCH/PUT /incomes/1.json
  def update
    respond_to do |format|
      if @income.update(income_params)
        format.html { redirect_to @income, notice: 'Income was successfully updated.' }
        format.json { render :show, status: :ok, location: @income }
      else
        format.html { render :edit }
        format.json { render json: @income.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /incomes/1
  # DELETE /incomes/1.json
  def destroy
    @income.destroy
    respond_to do |format|
      format.html { redirect_to incomes_url, notice: 'Income was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_income
      @income = Income.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def income_params
      params.require(:income).permit(:date, :description, :price)
    end
end
