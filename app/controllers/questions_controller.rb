class QuestionsController < ApplicationController
  before_action :set_section, only: %i[ new create ]

  # GET /questions/new
  def new
    @question = @section.questions.build
  end

  # POST /questions
  def create
    @question = @section.questions.build(question_params)

    respond_to do |format|
      if @question.save
        format.html { redirect_to @section.questionnaire, notice: "Question was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_section
      @section = Section.find(params[:section_id])
    end

    # Only allow a list of trusted parameters through.
    def question_params
      params.require(:question).permit(:question)
    end
end
