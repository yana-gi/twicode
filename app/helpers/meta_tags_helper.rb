# frozen_string_literal: true

module MetaTagsHelper
  # rubocop:disable Metrics/MethodLength
  def default_meta_tags
    {
      site: 'TwiCode',
      reverse: true,
      charset: 'utf-8',
      description: 'TwitterでちょっとしたCodeを共有しよう',
      viewport: 'width=device-width, initial-scale=1.0',
      og: {
        title: page_twitter_title,
        type: 'website',
        site_name: 'TwiCode',
        description: :description,
        image: 'https://twicode.herokuapp.com/ogp/ogp.png',
        url: 'https://twicode.herokuapp.com/'
      },
      twitter: {
        title: page_twitter_title,
        card: 'summary_large_image',
        site: '@twicode_y',
        description: :description,
        image: page_twitter_image,
        domain: 'https://twicode.herokuapp.com/'
      }
    }
  end
  # rubocop:enable Metrics/MethodLength

  def page_twitter_image
    @page_image || 'https://twicode.herokuapp.com/ogp/ogp.png' # rubocop:disable Rails/HelperInstanceVariable
  end

  def page_twitter_title
    @page_title || 'TwiCode' # rubocop:disable Rails/HelperInstanceVariable
  end
end
