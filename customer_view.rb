
module CustomerView

  def line_view(current_line)
    puts current_line.length > 0 ? "\nThe line is currently: #{current_line.join(" ")}" : "\nThe line is currently empty."
  end

  def take_a_number_view(name)
    puts @deli_line.length == 1 ? "Welcome #{name}, you are first in line." : "Welcome #{name}, you are number #{@deli_line.length} in line."
  end

  def now_serving_view
   puts "Now serving #{@deli_line[0]}" if @deli_line.length > 0
  end


  def day_overview
    puts "REPORT: On #{@date} #{@deli_name} served #{@total_customers} customers. The busiest time of day was #{@busiest_hour} with #{@longest_line} people in line."
  end

end
