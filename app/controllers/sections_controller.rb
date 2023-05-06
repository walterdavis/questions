class SectionsController < ApplicationController
  before_action :set_questionnaire, only: %i[ new create ]

  # GET /sections/new
  def new
    @section = @questionnaire.sections.build
  end

  # POST /sections
  def create
    @section = @questionnaire.sections.build(section_params)

    respond_to do |format|
      if @section.save
        format.html { redirect_to @questionnaire, notice: "Section was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_questionnaire
      @questionnaire = Questionnaire.find(params[:questionnaire_id])
    end

    # Only allow a list of trusted parameters through.
    def section_params
      params.require(:section).permit(:name, questions_params: [:id, :question])
    end
end
