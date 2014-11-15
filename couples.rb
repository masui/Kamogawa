# -*- coding: utf-8 -*-
#
#
#
couples = []
couples[0] = 0.0
couples[1] = 1000.0

#
# あいてる場所をみつけて中間に座る
#
def insert(couples)
  len = couples.length
  # 最も広い場所をみつける
  widestind = 0
  maxwidth = 0
  (0...len-1).each { |i|
    width = couples[i+1] - couples[i]
    if width > maxwidth then
      maxwidth = width
      widestind = i
    end
  }
  newpos = (couples[widestind+1] + couples[widestind]) / 2.0

  couples2 = []
  (0..widestind).each { |i|
    couples2[i] = couples[i]
  }
  couples2[widestind+1] = newpos
  (widestind+1...len).each { |i|
    couples2[i+1] = couples[i]
  }
  couples = couples2
end

# ランダムに動く
def move(couples)
  # 動く人を選ぶ
  len = couples.length
  return if len <= 2
  ind = rand(len-2) + 1
  couples[ind] = (couples[ind-1] + couples[ind+1]) / 2.0
  couples
end

couples = insert(couples)
couples = insert(couples)
couples = insert(couples)
couples = insert(couples)
couples = insert(couples)

(0..1000).each {
  couples = move(couples)
}
puts couples




