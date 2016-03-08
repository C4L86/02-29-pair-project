require 'test_helper'

# Tests the Spielbound service.
class SpielboundTest < Minitest::Test
  def test_single_page_of_results
    fetch_titles_from_spielbound(1)
    titles_in_file = open("titles.txt", 'r').read

    assert_includes(titles_in_file, "7 Wonders: Duel\n")
    assert_includes(titles_in_file, "Acquire\n")
  end

  def test_multiple_pages_of_results
    fetch_titles_from_spielbound(2)
    titles_in_file = open("titles.txt", 'r').read

    assert_includes(titles_in_file, "7 Wonders: Duel\n")
    assert_includes(titles_in_file, "Acquire\n")
    assert_includes(titles_in_file, "Agricola\n")
    assert_includes(titles_in_file, "Alchemists\n")
  end
end