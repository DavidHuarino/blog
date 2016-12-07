#json.array! @comments, partial: 'comments/comment', as: :comment
json.array!(@comments) do |comment|
  json.extract! comment, :id, :user_id, :article_id, :body
  json.url comment_url(comment, format: :json)
end
