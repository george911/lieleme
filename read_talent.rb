File.open("ActionScript_china","r") do |f|
  f.each_line do |line|
    line.split(/t/).each do |t|
      puts t
     end
  end
end
