require 'fileutils'

task default: [:build, :deploy]

desc 'build the site'
task :build do
  if production?
    puts `JEKYLL_ENV=production jekyll build`
  else
    puts `JEKYLL_ENV=production jekyll build --drafts`
    make_undiscoverable
  end
  puts `cat _site/robots.txt _site/sitemap.xml`
end

desc 'deploy'
task :deploy do
  puts `s3_website push`
end

def production?
  ENV['JEKYLL_ENV'] == 'production' || ENV['TRAVIS_BRANCH'] == 'master'
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
