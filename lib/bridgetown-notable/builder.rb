# frozen_string_literal: true

module BridgetownNotable
  class Builder < Bridgetown::Builder
    LINK_PATTERN = %r{\[\[([^\]]+)\]\]}

    def build
      generator :attachments
      generator :backlinks
      generator :wikilinks
    end

    def attachments
      notable_pages.each do |page|
        page.content.gsub!('(@attachment/', '(/attachments/')
      end
    end

    def backlinks
      notable_pages.each do |page|
        pagename = page.data[:title]
        backlinks = site.pages.select {|pg| pg.content =~ /\[\[#{pagename}\]\]/i }
        page.data[:backlinks] = backlinks if backlinks.any?
      end
    end

    def wikilinks
      notable_pages.each do |page|
        page.content.gsub!(LINK_PATTERN) do |match_string|
          title = match_string.match(LINK_PATTERN)[1]
          link = site.pages.detect {|pg| pg.data[:title] == title}
          if link
            %(<a href="#{link.url}" class="wikilink">#{link.data[:title]}</a>)
          else
            title
          end
        end
      end
    end

  private
    def notable_pages
      site.pages.select { |page| notable?(page) }
    end

    def notable?(page)
      page.data[:notable]
    end

    def slugify(title)
      title.downcase.gsub(/[^a-z0-9]+/, '-')
    end
  end
end

BridgetownNotable::Builder.register
