# frozen_string_literal: true

require "test_helper"

module Jekyll
  class TestTurbo < Minitest::Test
    TestPage = Struct.new(:output_ext, :output)

    def setup # rubocop:disable Metrics/MethodLength
      @html_input = <<~HTML
        <html>
          <head>
            <title>Test</title>
          </head>
          <body>
            <p>Hello World</p>
          </body>
        </html>
      HTML

      @expected_script = '<script type="module" src="https://cdn.jsdelivr.net/npm/@hotwired/turbo@8.0.4/dist/turbo.es2017-esm.js"></script>'
    end

    def test_that_it_has_a_version_number
      refute_nil ::Jekyll::Turbo::VERSION
    end

    def test_is_not_injected_into_non_html
      page = TestPage.new(".xml", @html_input)
      output = Jekyll::Turbo::Injector.add_script(page)

      assert_nil output
    end

    def test_script_is_injected_into_head
      page = TestPage.new(".html", @html_input)
      output = Jekyll::Turbo::Injector.add_script(page)

      assert_includes output, @expected_script
    end

    def test_script_comes_after_opening_head_tag
      page = TestPage.new(".html", @html_input)
      output = Jekyll::Turbo::Injector.add_script(page)
      index_of_head = output.index("<head>") + "<head>".length
      index_of_script = output.index(@expected_script)

      assert index_of_script > index_of_head, "Script should be injected right after <head>"
    end
  end
end
