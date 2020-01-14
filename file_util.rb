
# file_util | by stencylxd

require "fileutils"; Process.setproctitle("file_util"); Dir.chdir("/")
puts nil; puts "Note: You may encounter errors if you are not root."
puts "file_util (;"; puts "Type 'use' for help!"

while true do # err layback loop
while true do # main program loop

  c = ""
  ch = { }
  cu = { }
  ca = [ ]
  ta = [ ]
  tmp = ""
  tmpb = 0
  num = 0
  tg = { }

  puts " "
  print ">>"
  c = gets.chomp
  ch = c.split(" ")
  if ch[0] == nil
    puts "err: No command."
    break
  end
  ch[0] = ch[0].downcase

  # Console minipulation commands

  if ch[0] == "help"
    puts "Please type 'use' instead."
    break
  end

  if ch[0] == "use"
    puts "\nHow to use: Commands"
    puts "\nrm [files/dirs (put spaces between files/dirs)] | Delete things."
    puts "\nld | Display contents of current directory."
    puts "\nmf [files (put spaces between files)] | Make files."
    puts "\nmd [folders (put spaces between dirs)] | Make folders."
    puts "\ncd | Print current directory."
    puts "\ncd [path/folder_in_dir] | Go into a folder."
    puts "\ncl | Clear console."
    puts "\nspit [file] | Display contents of a file."
    puts "\nabout | Display information about file_util."
    puts "\nuse | Display help."
    puts "\nfind [keyword(s)] | Find files/dirs using keyword. WILL match case of the keyword."
    puts "\nexit | Exit file_util."
    break
  end

  if ch[0] == "about"
    puts "file_util by stencylxd"
    puts "simple command line tool to use with files/dirs"
    puts "https://www.stencylxd.github.io/website"
    break
  end

  if ch[0] == "cl"
    100.times do
      puts nil
    end
    break
  end

  abort "\nBye bye!" if ch[0] == "exit"

  # Dir/File commands

  if ch[0] == "find"
    if ch[1] == nil
      puts "err: No keyword."
      break
    end
    ch.each { |val, num|
      if num != 0
        ta = Dir.entries(".")
        if ta[0] == nil
          puts "err: Directory has nothing inside."
          break
        end
        ta.each { |thing|
          if thing.include?(val)
            tg[thing] = "dir" if File.directory?(thing)
            tg[thing] = "file" if File.file?(thing)
          end
        }
      end
    }
    tg.each { |namee, type|
      puts namee + " >" << type
    }
    break
end

  if ch[0] == "ld"
    ta = Dir.entries(".")
    ta.each { |thing|
      puts thing << " >file" if File.file?(thing) && thing != "." && thing != ".."
      puts thing << " >dir" if File.directory?(thing) && thing != "." && thing != ".."
    }
    break
  end

  if ch[0] == "md"
    if ch[1] == nil
      puts "err: Please specify name."
      break
    else
      ch.each { |data|
        if num != 0
            if File.exists?(data)
              puts "err: ##{num .to_s} Dir in command already exists."
              puts "^ dir/file #{data} already exists."
              tmp = 1
              break
            end
          Dir.mkdir(data) unless tmp == 1
          num += 1
          break if tmp == 1
        else
          num += 1
        end
      }
    end
    puts "Made #{(num - 1)} dir(s)."
    break
  end

  if ch[0] == "mf"
    if ch[1] == nil
      puts "err: Please specify name."
      break
    else
      ch.each {
        ta = Dir.entries(".")
        if num != 0
          ta.each { |file|
            if file == ch[num]
              puts "err: ##{num.to_s} file in command already exists."
              puts "^ dir/file #{ch[num]} already exists."
              tmp = 1
              break
            end
          }
          new = File.open(ch[num], "w") unless tmp == 1
          new.close unless tmp == 1
          num += 1
        elsif tmp == 1
          break
        else
          num += 1
        end
      }
    end
    puts "Made #{(num - 1)} file(s)." unless tmp == 1
    puts "Made 0 file(s)." if tmp == 1
    break
  end

  if ch[0] == "rm"
    if ch[1] == nil
      puts "err: Please specify something."
      break
    end
      puts "Are you sure you want to remove this/these?"
      print "y/n: "
      c = gets.chomp.downcase
      ch.each {
      num += 1
      if num != 0
        if ch[num] == nil
          puts "Removed #{(num - 1)} object(s)."
          break
        end
        if File.exists?(ch[num]) == false
          puts "err: dir/file ##{num} in command doesn't exist."
          puts "Removed #{(num - 1)} object(s)."
          break
        else
          if c == "y"
            File.delete(ch[num]) if File.file?(ch[num])
            FileUtils.rm_rf(ch[num]) if File.directory?(ch[num])
          end
          puts "\nAbort by user." if c == "n"
        end
      end
      }
      break
    end

  if ch[0] == "cd"
    if ch[1] == nil
      puts "cd: " << Dir.pwd
    else
      if File.directory?(ch[1])
        if Dir.pwd == "/" && (ch[1] == ".." || ch[1] == ".")
          puts "err: You tried to CD out of /. Stop."
          break
        end
        Dir.chdir(ch[1])
      else
        puts "err: Not a directory."
        break
      end
    end
    break
  end

  if ch[0] == "spit"
      if ch[1] == nil
        puts "err: Please specify file."
        break
      end
      if File.exists?(ch[1]) == false
        puts "err: File does not exist."
        break
      end
      if File.directory?(ch[1])
        puts "err: Can't spit a dir."
        break
      end
      if File.file?(ch[1])
        puts nil
        File.foreach(ch[1]) { |line| puts line }
     end
     break
   end
   puts "err: Invalid command."
  end
end
