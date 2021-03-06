# frozen_string_literal: true

class CodeController < ApplicationController
  before_action :set_code, only: %i[show destroy]
  skip_before_action :login_required, only: %i[show index]

  def index
    @user = User.find(params[:user_id] || current_user.id)
    @code = @user.code.order(created_at: 'DESC').page params[:page]
  end

  def show
    @tweet_url = tweet_url(code: @code)
  end

  def new
    @code = Code.new
    @selected_language = if current_user.code.empty?
                           Language.all.order(:name).first
                         else
                           current_user.code.last.language.name
                         end
  end

  def create
    @code = current_user.code.new(code_params)
    ## js側の処理の都合によりlanguageのparamsの値はidではなくname
    @code.language = Language.find_by(name: code_language)
    @code.attach_blob(image_data_url)

    if @code.save
      redirect_to @code, notice: '画像を作成しました！「Tweetする」ボタンからCodeを共有しよう'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @code.destroy
    redirect_to user_code_index_path(current_user.id), notice: '削除しました'
  end

  private

  def set_code
    @code = Code.find(params[:id])
  end

  def code_params
    params.require(:code).permit(:body, :title)
  end

  def code_language
    params.require(:code).permit(:language)[:language]
  end

  def image_data_url
    params.require(:code).permit(:image_data_url)[:image_data_url]
  end

  def tweet_url(code:)
    tweet_param = URI.encode_www_form(text: "\n",
                                      url: code_url(code.id),
                                      hashtags: 'TwiCode')
    "https://twitter.com/intent/tweet?#{tweet_param}"
  end
end
