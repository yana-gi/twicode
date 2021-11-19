# frozen_string_literal: true

module MetaTagsHelper
  # rubocop:disable Metrics/MethodLength
  def default_meta_tags
    {
      site: 'TwiCode',
      reverse: true,
      charset: 'utf-8',
      description: '読みやすいコード画像をツイートできるサービス',
      viewport: 'width=device-width, initial-scale=1.0',
      og: {
        title: :site,
        type: 'website',
        site_name: 'TwiCode',
        description: :description,
        # image: '',
        url: 'https://twicode.herokuapp.com/'
      },
      twitter: {
        card: 'summary_large_image',
        site: '@twicord_y',
        description: :description,
        image: page_twitter_image,
        domain: 'https://twicode.herokuapp.com/'
      }
    }
  end
  # rubocop:enable Metrics/MethodLength

  def page_twitter_image
    @page_image || image_url('') # rubocop:disable Rails/HelperInstanceVariable
  end
end
