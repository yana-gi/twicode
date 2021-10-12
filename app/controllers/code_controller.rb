# frozen_string_literal: true

class CodeController < ApplicationController
  before_action :set_code, only: %i[show update destroy]

  def index
    @code = Code.all
  end

  def show; end

  def new
    @code = Code.new
  end

  def create
    @code = Code.new(code_params)

    respond_to do |format|
      if @code.save
        format.html { redirect_to @code, notice: 'Code was successfully created.' }
        format.json { render :show, status: :created, location: @code }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @code.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @code.update(code_params)
        format.html { redirect_to @code, notice: 'Code was successfully updated.' }
        format.json { render :show, status: :ok, location: @code }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @code.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @code.destroy
    respond_to do |format|
      format.html { redirect_to code_index_url, notice: 'Code was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_code
    @code = Code.find(params[:id])
  end

  def code_params
    params.require(:code).permit(:body)
  end
end
