# frozen_string_literal: true

require "test_helper"

module Jekyll
  class TestTurboAcceptance < Minitest::Test
    def setup
      @fixtures_dir = File.expand_path("../fixtures/test_site", __dir__)
      @dest_dir = File.expand_path("../fixtures/test_site/_site", __dir__)

      # Clean destination directory if it exists
      FileUtils.rm_rf(@dest_dir)
    end

    def teardown
      # Clean up destination directory after testing
      FileUtils.rm_rf(@dest_dir)
    end

    def test_turbo_is_added_to_html_output
      site = build_site
      site.process

      # Check generated file
      index_path = File.join(@dest_dir, "index.html")
      assert File.exist?(index_path), "Site did not build index.html"
      content = File.read(index_path)

      # Test for Turbo script inclusion
      assert_includes content, "turbo.es2017-esm.js", "Turbo script was not injected"

      # Test that Turbo is in the document's head
      assert content.match(%r{<head>.*?turbo\.es2017-esm\.js.*?</head>}m), "Turbo script not injected in head"
    end

    private

    def build_site
      options = {
        "source" => @fixtures_dir,
        "destination" => @dest_dir,
        "quiet" => true
      }

      Jekyll::Site.new(Jekyll::Configuration.from(options))
    end
  end
end
