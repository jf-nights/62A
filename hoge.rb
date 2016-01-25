# coding: utf-8
all_damage = []
all_assist = []
all_sum = []

# 直近100戦の平均を返す
def average(arr)
  return arr.reverse[0..99].inject(:+)/arr.size
end

open("62A.txt") do |f|
  f.each_line do |line|
    data = line.chomp!.split(",")
    damage, assist = data[0].to_i, data[1].to_i
    assist = 0 if assist == "-"

    sum = damage + assist

    all_damage << damage
    all_assist << assist
    all_sum << sum
  end
end

open("62A_sums.txt", "w") do |f|
  f.write(all_sum.join("\n"))
end

open("62A_recent.txt", "w") do |f|
  aves = "#{average(all_damage)},#{average(all_assist)},#{average(all_sum)}"
  f.write(aves)
end