require 'fileutils'

desc 'release to production'
task :release do
  ENV['JEKYLL_ENV'] = 'production'
  deploy
end

desc 'release to staging'
task :stage do
  ENV['JEKYLL_ENV'] = 'development'
  deploy
end

def deploy
  build
  puts `s3_website push && cat _site/robots.txt _site/sitemap.xml`
end

def build
  if production?
    `jekyll build`
  else
    `jekyll build --drafts`
    make_undiscoverable
  end
end

def production?
  ENV['JEKYLL_ENV'] == 'production'
end

def make_undiscoverable
  File.open('_site/robots.txt', 'w') do |f|
    f.puts <<~ROBOTS
             User-agent: *
             Disallow: /
           ROBOTS
  end

  FileUtils.rm '_site/sitemap.xml'
end
