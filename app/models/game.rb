class Game < ActiveRecord::Base
  def self.smart_search(params)
    @search_hash = {}
    
    params.each do |key,value|
      if value != ""
        @search_hash[key] = value
      else
      end
    end

    Game.where(@search_hash)
  end  

end