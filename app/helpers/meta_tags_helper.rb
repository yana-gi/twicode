# frozen_string_literal: true

module MetaTagsHelper
  # rubocop:disable Metrics/MethodLength
  def default_meta_tags
    {
      site: 'TwiCode',
      reverse: true,
      charset: 'utf-8',
      description: 'TwitterでCodeを共有しよう',
      viewport: 'width=device-width, initial-scale=1.0',
      og: {
        title: :site,
        type: 'website',
        site_name: 'TwiCode',
        description: :description,
        image: 'https://twicode.herokuapp.com/ogp/ogp.png',
        url: 'https://twicode.herokuapp.com/'
      },
      twitter: {
        card: 'summary_large_image',
        site: '@twicode_y',
        description: page_twitter_title,
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
    @page_title || 'TwitterでCodeを共有しよう' # rubocop:disable Rails/HelperInstanceVariable
  end
end
