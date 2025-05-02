# frozen_string_literal: true

require "test_helper"

class Jekyll::TestTurbo < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Jekyll::Turbo::VERSION
  end

  def test_it_does_something_useful
    assert 1,1
  end
end
