# frozen_string_literal: true

require 'google/apis/customsearch_v1'
require 'csv'
require 'pry'

searcher = Google::Apis::CustomsearchV1::CustomSearchAPIService.new
searcher.key = ENV.fetch('GOOGLE_API_KEY')

user_profile = {
  name: 'たけし',
  interests: %w[奈良 学生],
  preferred_domains: ['yamatoji.nara-kankou.or.jp', 'ritsumei.ac.jp']
}

search_query = '明日の天気'

result = searcher.list_cses(
  cx: ENV.fetch('CUSTOM_SEARCH_ENGINE_ID'),
  q: "#{search_query} #{user_profile[:interests].join(' ')}",
  lr: 'lang_ja'
)
result.search_information.formatted_total_results

CSV.open('./data/result.csv', 'w') do |csv|
  csv << %w[
    title
    display_link
    link
    snippet
  ]

  result.items.each do |item|
    csv << [
      item.title,
      item.display_link,
      item.link,
      item.snippet
    ]
  end
end
