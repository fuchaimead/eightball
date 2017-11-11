require 'pry'
require 'colorize'

answer1 = "Concentrate and try again."
answer2 = "Yes of course."
answer3 = "Absolutely not!"
answer4 = "Maybe."
answer5 = "The answer to life the universe and everything is 42."
answer6 = "That doesn't make sense. Ask again."

@array = [answer1, answer2, answer3, answer4, answer5, answer6]
@original_array = @array.clone

def eightball
  puts "Welcome to the Magic Eightball.".red
  puts "Type a question to get an answer, or type Quit to end the program.".green
  question = gets.strip
if question.downcase == "quit"
  exit
elsif question.downcase == "hooray!"
    easteregg
else
    puts @array.sample
    eightball
  end
end


def easteregg
  puts "================".blue
  puts "You found the Easter Egg!."
  puts "Add more answer options."
  new_answer = gets.strip
  if @array.include?(new_answer)
    puts "Sorry, that's already been added."
    option
  else 
    @array << new_answer
    puts "You added a new answer '#{new_answer}' option" 
    puts "================".blue
    option
  end
end

def remove_answers
  puts "You answers have been removed. Here are the original answers."
  @original_array.each do |word|
    puts " => #{word}"
end
option
end

def view_answers
  @array.each do |word| 
    puts "=> #{word}" 
  end
  option
end


def option
  menu
  option = gets.to_i
  case option
  when 1 
    easteregg
  when 2
    view_answers
  when 3 
    remove_answers
  when 4
    eightball
  else 
    puts "Not a valid option."
  end
end


def menu
puts "===================".green
puts "1) Add more answers.".green
puts "2) View all answer options.".green
puts "3) Remove Answers.".green
puts "4) Ask me another question.".green
puts "===================".green
end

eightball

if ARGV.any?
  easteregg = ARGV.first
else
 eightball
end






