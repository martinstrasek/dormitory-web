json.array!(@comments) do |comment|
  json.extract! comment, :id, :body, :user, :article
  json.url comment_url(comment, format: :json)
end
