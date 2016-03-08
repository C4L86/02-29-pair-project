require 'test_helper'

# Tests the BoardGameGeek service.
class BoardGameGeekTest < Minitest::Test
  def test_finds_one_game
    bgg = BoardGameGeek.new
    bgg.fetch_game_info("Agricola")

    refute_nil(Game.find_by_title("Agricola"))
  end

  def test_finds_one_game_when_many_would_have_matched
    bgg = BoardGameGeek.new
    bgg.fetch_game_info("Carcassonne")

    refute_nil(Game.find_by_title("Carcassonne"))
  end

  def test_does_not_error_out_if_searches_for_unexpected_characters
    bgg = BoardGameGeek.new
    expected_output = "Bad URL tried. Skipping... Tried CO₂\n"

    assert_output(expected_output) { bgg.fetch_game_info("CO₂") }
  end
end