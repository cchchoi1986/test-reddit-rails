json.posts @posts do |post|
  json.title post.title
  json.url post.url
  json.link url_for(post_path(post))
end