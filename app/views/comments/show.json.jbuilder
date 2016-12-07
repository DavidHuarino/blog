#json.partial! "comments/comment", comment: @comment
#json.extract! @comment, :id, :user_id, :article_id, :body, :created_at, :update_at
#json.user do
#  json.email @comment.user.email
#end
json.extract! @comment, :id, :user_id, :article_id, :body, :created_at, :updated_at
json.user do
  json.email @comment.user.email
end
