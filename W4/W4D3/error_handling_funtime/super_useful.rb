# PHASE 2
def convert_to_int(str)
  Integer(str)
end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]


def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  else
    raise StandardError
  end
end

def feed_me_a_fruit
  begin
    puts "Hello, I am a friendly monster. :)"
    puts "Feed me a fruit! (Enter the name of a fruit:)"
    maybe_fruit = gets.chomp
    reaction(maybe_fruit)
  rescue
    retry if maybe_fruit == 'coffee'
    puts "Not a fruit or coffee"
  end
end  

# PHASE 4
class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    @name = name
    @fav_pastime = fav_pastime
    @yrs_known = yrs_known
    begin
      yrs_known_valid(yrs_known)
      name_valid(name)
      pastime(fav_pastime)
    rescue ArgumentError => e
      puts "#{e.message}"
    ensure
      puts "You aren't my best friend."
    end
    #raise ArgumentError.new('Name must be one char or greater') if name.length < 1
  end

  def yrs_known_valid(yrs)
    raise ArgumentError.new('Years known is less than 5') if yrs < 5
  end

  def name_valid(name)
    raise ArgumentError.new('Not a valid name') if name.length <= 0
  end

  def pastime(pastime)
    raise ArgumentError.new('Not a valid pastime') if pastime.length <= 0
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

# reaction('cherry')
# reaction('coffee')


