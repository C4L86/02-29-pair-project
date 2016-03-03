require 'test_helper'

class GameTest < Minitest::Test
  def setup
    super

    @game             = Game.new
    @game.title       = "Test Title"
    @game.genre       = "Test Genre"
    @game.age_group   = "8"
    @game.min_players = "1"
    @game.max_players = "2"
    @game.play_time   = "90"
    @game.description = "Test Description"
    @game.publisher   = "Test Publisher"
    @game.price       = "49.99"
    @game.save
  end

  def test_smart_search
    assert_includes(Game.smart_search({"genre"=>"Test Genre","title"=>""}), @game)
    assert_includes(Game.smart_search({"title"=>"Test Title","genre"=>""}), @game)
    assert_includes(Game.smart_search({"age_group"=>"8","genre"=>""}), @game)
    assert_includes(Game.smart_search({"min_players"=>"1","age_group"=>""}), @game)
    assert_includes(Game.smart_search({"max_players"=>"2","min_players"=>""}), @game)
    assert_includes(Game.smart_search({"play_time"=>"90","max_players"=>""}), @game)
    assert_includes(Game.smart_search({"description"=>"Test Description","play_time"=>""}), @game)
    assert_includes(Game.smart_search({"publisher"=>"Test Publisher","description"=>""}), @game)
    assert_includes(Game.smart_search({"price"=>"49.99","publisher"=>""}), @game)
    refute_includes(Game.smart_search({"price"=>"Dinosaur","publisher"=>"49.99"}), @game)
    refute_includes(Game.smart_search({"title"=>"90","play_time"=>"Dinosaur"}), @game)
  end
end