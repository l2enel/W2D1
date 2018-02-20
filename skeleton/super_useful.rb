require 'byebug'
# PHASE 2
def convert_to_int(str)
  begin
    Integer(str)
  rescue StandardError
    return nil
  end
end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]

def reaction(maybe_fruit)
  if
    FRUITS.include?(maybe_fruit)
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  elsif maybe_fruit == "coffee"
    raise CoffeeError
  else
    raise StandardError
  end
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"

  puts "Feed me a fruit! (Enter the name of a fruit:)"
  maybe_fruit = gets.chomp
  begin
    reaction(maybe_fruit)
  rescue CoffeeError
    feed_me_a_fruit
  end
end

class CoffeeError < StandardError
end


# PHASE 4
class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    raise ArgumentError.new "I need to know your name" if name.length <= 0
    @name = name
    raise ArgumentError.new "We barely know each other" if yrs_known < 5
    @yrs_known = yrs_known
    raise ArgumentError.new "I don't know how to do that" if fav_pastime.length <=0
    @fav_pastime = fav_pastime
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me."
  end
end

# class FriendError <
# end
