task :release do
  ENV['JEKYLL_ENV'] = 'production'
  deploy
end

task :stage do
  ENV['JEKYLL_ENV'] = 'development'
  deploy
end

def deploy
  puts `jekyll build && s3_website push && cat _site/sitemap.xml`
end
