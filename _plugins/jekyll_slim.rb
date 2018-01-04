require 'slim'

module Jekyll
  class SlimConverter < Converter
    def matches(ext)
      ext =~ /\.slim$/
    end

    def output_ext(ext)
      HTML
    end

    def convert(content)
      Slim::Template.new { content }.render
    end

    private

    HTML = '.html'.freeze
  end

  module SlimFilters
    def slimify(input)
      Slim::Template.new { input }.render
    end
  end
end

Liquid::Template.register_filter(Jekyll::SlimFilters)
