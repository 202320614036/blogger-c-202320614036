posts = YAML.load_file(Rails.root.join("db/data/posts.json"), symbolize_names: 
true)
 posts.each do |post|
  puts "Find or Creating Post #{post[:title]}"
  Post.find_or_create_by(title: post[:title], article: post[:article], status: 
post[:status])
 end