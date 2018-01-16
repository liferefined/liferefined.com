module YouTube
  module Filters
    def youtube(id, preview = nil)
      width, height = 854, 480
      width, height = 427, 240 if preview

      <<~IFRAME
        <iframe class="youtube" width="#{width}" height="#{height}"
          src="https://www.youtube.com/embed/#{id}" frameborder="0" allow="autoplay; encrypted-media"
          allowfullscreen></iframe>
      IFRAME
    end
  end
end

Liquid::Template.register_filter(YouTube::Filters)
