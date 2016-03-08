require 'test_helper'

# Tests the Spielbound service.
class SpielboundTest < Minitest::Test
  def setup
    super
  end

  def test_something
    fetch_titles_from_spielbound(1)
    titles_in_file = open("titles.txt", 'r').read

    assert_includes(titles_in_file, "7 Wonders: Duel\n")
    assert_includes(titles_in_file, "Acquire\n")
  end
end