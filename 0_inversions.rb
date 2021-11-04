class Line_inv_counter
  def initialize(); @a = []; end;
  def set_line_from_cli() 
    @a = gets.split.map{|i| i.to_i} 
  end;
  def set_line_from_string(string)
    @a = string.split.map{|i| i.to_i}
  end;
  def get_invs_num()
    invs = 0; last_invs = 0;
    for i in 0..(@a.length-1) do
      for j in (i)..(@a.length-1) do
        if(@a[i]>@a[j]) then invs+=1; end;
      end;
      print @a[i], "\t", invs-last_invs, "\t", invs; puts; last_invs = invs;
    end;
    return invs; 
  end;
end


counter = Line_inv_counter.new();
puts "Вводите значения. "
line = "9 25 3 15 18 21 24 14 1 5 8 23 17 19 2 26 30 28 7 20 11 29 27 13 10 22 6 12 4 16"
counter.set_line_from_string(line);
print "Инверсий: ", counter.get_invs_num(), "\n";


