# frozen_string_literal: true

class CodeController < ApplicationController
  before_action :set_code, only: %i[show update destroy]

  # GET /code or /code.json
  def index
    @code = Code.all
  end

  # GET /code/1 or /code/1.json
  def show; end

  # GET /code/new
  def new
    @code = Code.new
  end

  # POST /code or /code.json
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

  # PATCH/PUT /code/1 or /code/1.json
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

  # DELETE /code/1 or /code/1.json
  def destroy
    @code.destroy
    respond_to do |format|
      format.html { redirect_to code_index_url, notice: 'Code was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_code
    @code = Code.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def code_params
    params.require(:code).permit(:body)
  end
end
