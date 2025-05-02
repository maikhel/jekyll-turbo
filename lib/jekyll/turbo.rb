# frozen_string_literal: true
require "jekyll"

module Jekyll
  module Turbo
    class Injector
      CDN_URL = "https://cdn.jsdelivr.net/npm/@hotwired/turbo@8.0.4/dist/turbo.es2017-esm.js"

      # Hook into the post_render step for each page
      Jekyll::Hooks.register :pages, :post_render do |page|
        if page.output_ext == ".html" && page.output.include?("</head>")
          turbo_script = <<~HTML
            <script type="module" src="#{CDN_URL}"></script>
          HTML

          # Inject the Turbo script just before </head>
          page.output.gsub!("</head>", "#{turbo_script}\n</head>")
        end
      end
    end
  end
end
