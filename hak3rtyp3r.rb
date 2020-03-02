
# hackertyper.rb || stencylxd 2020

puts "Stack Data: (numbers should not be matching)"
require "ruby2d"; set width: 1000, height: 600, title: "hackertyper - stencylxd";
$fileNum = 1; Text.new("HAX_FILE_#{$fileNum}.bin", color: "red", size: 15, x: 450, y: 10)
$textHandle = []; $currentY = 56; require "SecureRandom"
$beforeRand = 0; $randomNum = 0; $spaces = " "
on :key_down do |key|; $textHandle.push(generateText); end
public; def generateText; $currentY += 28;
  if $currentY > 560; $fileNum += 1
    clear; Text.new("HAX_FILE_#{$fileNum}.bin", color: "red", size: 15, x: 450, y: 10)
    $currentY = 56; $spaces = "       "; end; case rand(0..5); when (1 || 2 || 3 || 4 || 5);
  $spaces = $spaces + "    "; when 0; $spaces.chop!; end
  until $spaces.length < 17; $spaces.chop!; end; until $spaces.length > 1
  $spaces = $spaces + " "; end
  until $randomNum != $beforeRand; $randomNum = rand(1..10)
  end; puts "#{$randomNum.to_s} #{$beforeRand.to_s} PRK #{$currentY} #{$spaces.length.to_s}"
  $beforeRand = $randomNum; case $randomNum
  when 1; return txtGen("tcp_telent >> PRT #{rand(1..1000000)} <> KEY #{rndSec(2)}")
  when 2; return txtGen("import_destruct_id << '#{rndSec(1)}'")
  when 3; return txtGen("init_lnx64_cmd >> #{rand(1..6)} << OUTNET #{rndSec(1)}")
  when 4; return txtGen("open_crack_soft ( current_id[  #{rndSec(2)}  ] )")
  when 5; return txtGen("fullproof-encrypt (  #{rndSec(2)}  )")
  when 6; return txtGen("automate_prss_id {<< [#{rndSec(2)}] }")
  when 7; return txtGen("define VictimADRR as double [EQU #{rand(1..99)}.#{rand(1..99)}]")
  when 8; return txtGen("define StackPointer as string [EQU #{rndSec(2)}]")
  when 9; return txtGen("pswrd_sniffr_crawl (TRS VictimADRR #{rand(1..1000)})")
  when 10; return txtGen("get_pgb_key (USE_HEX EQU #{rndSec(1)})")
  end; end; def txtGen(txt)
  return Text.new(($spaces + txt), size: 14, color: "green", y: $currentY); end
  def rndSec(num); return SecureRandom.hex if num == 1
    return SecureRandom.alphanumeric if num == 2; end; show
