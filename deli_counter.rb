require_relative "../technical_admissions/customer_view.rb"


class DeliCounter
  include CustomerView

  attr_accessor :deli_name
  attr_reader :date, :deli_line, :longest_line, :total_customers, :busiest_hour

  # Are the arguments after "deli_name" needed? I will not ever be writing to them (like "@date").
  def initialize(deli_name = "GD's Deli", deli_line = [],longest_line = 0, total_customers = 0, busiest_hour = "No Customers Yet")
    @deli_name = deli_name
    @deli_line = deli_line
    @longest_line = longest_line
    @total_customers = total_customers
    @busiest_hour = busiest_hour
    @date = Time.now.strftime("%m/%d/%Y")
  end

# decouple position & name to increase usability --- return value example ["1. Greg", "2. Kurt", "3. Jake"]
  def line
    current_line =[]

    if @deli_line.length > 0
      @deli_line.each_with_index {|n, i| current_line << "#{i + 1}. #{n}"}
    end

    line_view(current_line)
  end

  def take_a_number(name)
    @deli_line << name
    longest_line(@deli_line)
    take_a_number_view(name)
  end

  def now_serving
    @total_customers += 1
    now_serving_view
    @deli_line.shift
    line
  end

# Is an argument needed? Could just use the instance variable @deli_line
  def longest_line(line)
    if line.length > @longest_line
      @busiest_hour = Time.now.strftime("%H:%M")
      @longest_line = line.length
    end
  end

end




# Command Line Fun

puts "Type your Deli's name to start the Day!"
today = gets.chomp
today = DeliCounter.new(today)
print "#{today.line} Type your name for a place in line. "
$current_name = gets.chomp
today.take_a_number($current_name)
print "#{today.line} Type your name for a place in line. "
$current_name = gets.chomp
today.take_a_number($current_name)
print "#{today.line} Type your name for a place in line. "
$current_name = gets.chomp
today.take_a_number($current_name)
puts "/////////////////////////////////////////////// Serving //////////////////////////////////////////////////////////"
today.now_serving
today.now_serving
puts "------------------------------------------------------------------------------------------------------------------"
today.day_overview
puts "------------------------------------------------------------------------------------------------------------------"
print "#{today.line} Type your name for a place in line. "
$current_name = gets.chomp
today.take_a_number($current_name)
print "#{today.line} Type your name for a place in line. "
$current_name = gets.chomp
today.take_a_number($current_name)
print "#{today.line} Type your name for a place in line. "
$current_name = gets.chomp
today.take_a_number($current_name)
print "#{today.line} Type your name for a place in line. "
$current_name = gets.chomp
today.take_a_number($current_name)
puts "------------------------------------------------------------------------------------------------------------------"
today.day_overview
puts "------------------------------------------------------------------------------------------------------------------"
puts "//////////////////////////////////////////////// Serving //////////////////////////////////////////////////////////"
today.now_serving
today.now_serving
today.now_serving
today.now_serving
today.now_serving
puts "------------------------------------------------------------------------------------------------------------------"
today.day_overview
puts "------------------------------------------------------------------------------------------------------------------"




####### Improvments
# add data
# what was the longest line of the day?
# how many people entered the deli on any given day?
# Hour was the busiest?
# timer per order?
  # Then calculate average time per order.

#attr_accessor
# attr_reader = :date, :longest_line, :average_time_per_order, :total_customers, :deli_name
