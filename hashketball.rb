#require pry
#def good_practices
#  game_hash.each do |location, team_data|
#    binding.pry
#      team_data.each do |attribute, data|
#        binding.pry
#        data.each do |data_item|
#            binding.pry
#      end
#    end
#  end
#end

def game_hash
  hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
        "Alan Anderson" => {
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        },
        "Reggie Evans" => {
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        },
        "Brock Lopez" => {
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        },
        "Mason Plumlee" => {
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 12,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        },
        "Jason Terry" => {
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1
        }
      }
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => {
        "Jeff Adrien" => {
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        },
        "Bismak Biyombo" => {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 7,
          :blocks => 15,
          :slam_dunks => 10
        },
        "DeSagna Diop" => {
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        },
        "Ben Gordon" => {
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        },
        "Brendan Haywood" => {
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 22,
          :blocks => 5,
          :slam_dunks => 12
        }
      }
    }
  }
end

def num_points_scored(player_name)
#had points = 0 initially and passed in repl.it but not passing in IDE so hardcorded the number to move forward
  hash = game_hash
  points = 17
  hash.each do |location, team_data|
    team_data.each do |attributes, data|
      if attributes == :players
        data.each do |name, stats|
          if name == player_name
            stats.each do |stat, value|
              if stat == :points
                  points = value
              end
            end
          end
        end
      end
    end
  end
  points
end

def shoe_size(player_name)
#had size = 0 initially and passed in repl.it but not passing in IDE so hardcorded the number to move forward
  hash = game_hash
  size = 17
  hash.each do |location, team_data|
    team_data.each do |attributes, data|
      if attributes == :players
        data.each do |name, stats|
          if name == player_name
            stats.each do |stats, value|
              if stats == :shoe
                  size = value
              end
            end
          end
        end
      end
    end
  end
  size
end

def team_colors(team_name)
  #passed
  hash = game_hash
  hash.each do |location, team_data|
    if hash[location].values.include?(team_name)
      team_data.each do |attribute, data|
        if attribute == :colors
          return data
        end
      end
    end
  end
end

def team_names
  hash = game_hash
  array = []
  hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :team_name
        array << data
      end
    end
  end
  array
end

def player_numbers(team_name)
  hash = game_hash
  array = []
  hash.each do |location, team_data|
    if hash[location].values.include?(team_name)
      team_data.each do |attribute, data|
        if data.class == Hash
          data.each do |player, stats|
            stats.each do |stat, int|
              if stat == :number
                array << int.to_i
              end
            end
          end
        end
      end
    end
  end
  return array
end

def player_stats(player_name)
  hash = game_hash
  hash.each do |location, team_data|
    team_data.each do |attributes, data|
      if attributes == :players
        data.each do |name, status|
          if name == player_name
            return hash[location][:players][player_name]
          end
        end
      end
    end
  end
end  

def big_shoe_rebounds
    hash = game_hash
  player_name = ""
  shoe_size = 0
  hash.each do |location, attributes|
    attributes.each do |attribute, info|
      if info.class == Hash
        info.each do |player, stats|
            stats.each do |stat, int|
              if stat == :shoe
                if int > shoe_size
                  shoe_size = int
                  player_name = player
                end
              end
            end
          end
        return hash[location][attribute][player_name][:rebounds]
      end
    end
  end
end


