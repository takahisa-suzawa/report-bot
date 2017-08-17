json.extract! article, :id, :url, :title, :opening, :Report_id, :created_at, :updated_at
json.url article_url(article, format: :json)
