require 'test_helper'

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

  def test_finds_one_game
    bgg = BoardGameGeek.new("Agricola")
    bgg.fetch_game_info

    refute_nil(Game.find_by_title("Agricola"))
  end

  def test_finds_one_game_when_many_would_have_matched
    bgg = BoardGameGeek.new("Carcassonne")
    bgg.fetch_game_info

    refute_nil(Game.find_by_title("Carcassonne"))
  end

  def test_does_not_error_out_if_searches_for_unexpected_characters
    bgg = BoardGameGeek.new("CO₂")
    expected_output = "Bad URL tried. Skipping... Tried CO₂\n"

    assert_output(expected_output) { bgg.fetch_game_info }
  end
end #end of class