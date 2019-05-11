require File.expand_path(File.dirname(__FILE__) + '/../triangle')

describe Triangle do
  specify '辺の長さが3個以外の場合は「引数はカンマ区切りで3つの辺の長さを与えてください」と返すこと' do
    expect(Triangle.guess_shape([1, 2])).to eq '引数はカンマ区切りで3つの辺の長さを与えてください'
  end
  specify '辺の長さが整数以外の場合は「引数は正の整数を与えてください」と返すこと' do
    expect(Triangle.guess_shape([1, 2, 'a'])).to eq '引数は正の整数を与えてください'
  end
  context '三角形の成立条件を満たさない場合' do
    specify '辺A = 辺B + 辺Cの場合は「三角形じゃないです＞＜」と返すこと' do
      expect(Triangle.guess_shape([4, 2, 2])).to eq '三角形じゃないです＞＜'
    end
    specify '辺A > 辺B + 辺Cの場合は「三角形じゃないです＞＜」と返すこと' do
      expect(Triangle.guess_shape([5, 2, 2])).to eq '三角形じゃないです＞＜'
    end
    specify '辺B = 辺A + 辺Cの場合は「三角形じゃないです＞＜」と返すこと' do
      expect(Triangle.guess_shape([2, 4, 2])).to eq '三角形じゃないです＞＜'
    end
    specify '辺B > 辺A + 辺Cの場合は「三角形じゃないです＞＜」と返すこと' do
      expect(Triangle.guess_shape([2, 5, 2])).to eq '三角形じゃないです＞＜'
    end
    specify '辺C = 辺A + 辺Bの場合は「三角形じゃないです＞＜」と返すこと' do
      expect(Triangle.guess_shape([2, 2, 4])).to eq '三角形じゃないです＞＜'
    end
    specify '辺C > 辺A + 辺Bの場合は「三角形じゃないです＞＜」と返すこと' do
      expect(Triangle.guess_shape([2, 2, 5])).to eq '三角形じゃないです＞＜'
    end
  end
  specify 'すべての辺の長さが等しい場合は「正三角形ですね！」と返すこと' do
    expect(Triangle.guess_shape([2, 2, 2])).to eq '正三角形ですね！'
  end
  specify '三角形の成立条件を満たし、2つの辺の長さが等しい場合は「二等辺三角形ですね！」と返すこと' do
    expect(Triangle.guess_shape([2, 2, 3])).to eq '二等辺三角形ですね！'
  end
  specify '三角形の成立条件を満たし、3つの辺の長さがすべて異なる場合は「不等辺三角形ですね！」と返すこと' do
    expect(Triangle.guess_shape([2, 3, 4])).to eq '不等辺三角形ですね！'
  end
end