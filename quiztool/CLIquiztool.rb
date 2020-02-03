
# CLIquiztool || stencylxd (still in progress)

system("cls"); print "\nPlease enter the path of the quizfile: "
quizName = gets.chomp.to_s; raise "Quiz does not exist." if File.exist?(quizName) == false
t = 1; a = 0; File.open(quizName, "r").each_line { |line| line = line.strip; if line == ""
case t; when 1; raise "\aNo quiz name in file. | line1"
when 2; raise "\aNo dashsign. Rest of file blank? | line2"
end
else; ; end }
