# frozen_string_literal: true

require "jekyll"

module Jekyll
  module Turbo
    # Jekyll::Turbo::Injector is a Jekyll plugin that injects a <script> tag
    # for Hotwire Turbo into the HTML <head> of each generated page.
    #
    # It enables Turbo Drive functionality in static Jekyll sites by automatically
    # including the Turbo JavaScript via CDN.
    #
    # This class is designed to be used as part of the jekyll-turbo gem.
    #
    # Usage:
    # - Add `jekyll-turbo` to your Gemfile and `_config.yml` plugins list
    class Injector
      CDN_URL = "https://cdn.jsdelivr.net/npm/@hotwired/turbo@8.0.4/dist/turbo.es2017-esm.js"

      def self.add_script(page)
        return unless page.output_ext == ".html" && page.output.include?("</head>")

        turbo_script = <<~HTML
          <script type="module" src="#{CDN_URL}"></script>
        HTML

        # Inject the Turbo script just before </head>
        page.output = page.output.sub("</head>", "#{turbo_script}\n</head>")
      end

      # Hook into the post_render step for each page
      Jekyll::Hooks.register :pages, :post_render do |page|
        Jekyll::Turbo::Injector.add_script(page)
      end
    end
  end
end
