class Triangle
  def self.guess_shape(sides)
    return '引数はカンマ区切りで3つの辺の長さを与えてください' if sides.size != 3
    return '引数は正の整数を与えてください' if sides.any? { |side| side.to_s !~ /\A[1-9][0-9]*\z/ }

    # 配列内の「数値の文字列」を「数値」に変換
    sides.map!(&:to_i)
    return '三角形じゃないです＞＜' unless triange?(sides)
    return '正三角形ですね！' if sides.uniq.size == 1
    return '二等辺三角形ですね！' if sides.uniq.size == 2
    return '不等辺三角形ですね！' if sides.uniq.size == 3
  end

  # 三角形の成立条件の計算
  def self.triange?(sides)
    if (sides[0] + sides[1]) > sides[2] &&
       (sides[1] + sides[2]) > sides[0] &&
       (sides[2] + sides[0]) > sides[1]
      return true
    end

    false
  end
end

puts Triangle.guess_shape(ARGV.join.split(','))
