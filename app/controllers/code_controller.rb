# frozen_string_literal: true

class CodeController < ApplicationController
  before_action :set_code, only: %i[show destroy]

  def index
    @code = Code.all
  end

  def show; end

  def new
    @code = Code.new
  end

  def create
    @code = Code.new(code_params)
    @code.attach_blob(image_data_url)

    if @code.save
      redirect_to @code, notice: 'Code was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @code.destroy
    redirect_to code_index_url, notice: 'Code was successfully destroyed.'
  end

  private

  def set_code
    @code = Code.find(params[:id])
  end

  def code_params
    params.require(:code).permit(:body, :language)
  end

  def image_data_url
    params.require(:code).permit(:image_data_url)[:image_data_url]
  end
end
