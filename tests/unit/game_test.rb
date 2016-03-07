require 'test_helper'

#GameTest is responsible for testing addition of a new game to the games table in the spielbound_search database.  self.smart_search queries the games table based on user inputs. 
#
#Inputs: Data in the games table has two sources. 1 - game titles are scraped from the Spielbound database using nokogiri. 2 - other records are captured based on the game title using the free API available from Board Game Geek.


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

  # def test_smart_search
  #   assert_includes(Game.smart_search({"genre"=>"Test Genre","title"=>""}), @game)
  #   assert_includes(Game.smart_search({"title"=>"Test Title","genre"=>""}), @game)
  #   assert_includes(Game.smart_search({"age_group"=>"8","genre"=>""}), @game)
  #   assert_includes(Game.smart_search({"min_players"=>"1","age_group"=>""}), @game)
  #   assert_includes(Game.smart_search({"max_players"=>"2","min_players"=>""}), @game)
  #   assert_includes(Game.smart_search({"play_time"=>"90","max_players"=>""}), @game)
  #   assert_includes(Game.smart_search({"description"=>"Test Description","play_time"=>""}), @game)
  #   assert_includes(Game.smart_search({"publisher"=>"Test Publisher","description"=>""}), @game)
  #   assert_includes(Game.smart_search({"price"=>"49.99","publisher"=>""}), @game)
  #   refute_includes(Game.smart_search({"price"=>"Dinosaur","publisher"=>"49.99"}), @game)
  #   refute_includes(Game.smart_search({"title"=>"90","play_time"=>"Dinosaur"}), @game)
  # end

  def test_smart_search_1
    assert_includes(Game.smart_search({"genre"=>"Test Genre","title"=>""}), @game)
    assert_includes(Game.smart_search({"title"=>"Test Title","genre"=>""}), @game)
    assert_includes(Game.smart_search({"age_group"=>"8","genre"=>""}), @game)
    refute_includes(Game.smart_search({"title"=>"90","play_time"=>"Dinosaur"}), @game)
  end

  def test_smart_search_2
    assert_includes(Game.smart_search({"min_players"=>"1","age_group"=>""}), @game)
    assert_includes(Game.smart_search({"max_players"=>"2","min_players"=>""}), @game)
    assert_includes(Game.smart_search({"play_time"=>"90","max_players"=>""}), @game)
  end

  def test_smart_search_3
    assert_includes(Game.smart_search({"description"=>"Test Description","play_time"=>""}), @game)
    assert_includes(Game.smart_search({"publisher"=>"Test Publisher","description"=>""}), @game)
    assert_includes(Game.smart_search({"price"=>"49.99","publisher"=>""}), @game)
    refute_includes(Game.smart_search({"price"=>"Dinosaur","publisher"=>"49.99"}), @game)
  end
end