#!/bin/bash
ans="/tmp/$$-ans"
result="/tmp/$$-result"

#引数が2つ渡されなかった場合
echo "エラーです。引数を２つ渡してください。" > $ans
./gcm.sh 2> $result && exit 1
diff $ans $result || exit 1

#第一引数が数字でない場合
echo "エラーです。１つ目の引数が数値ではありません。" > $ans
./gcm.sh aaa 4> $result && exit 1
diff $ans $result || exit 1

#第二引数が数字でない場合
echo "エラーです。２つ目の引数が数値ではありません。" > $ans
./gcm.sh 4 aaa> $result && exit 1
diff $ans $result || exit 1

#正常動作
#同じ数値の場合
echo "2が最大公約数です。" > $ans
./gcm.sh 2 2> $result
diff $ans $result || exit 1
#違う数値の場合
echo "2が最大公約数です。" > $ans
./gcm.sh 2 4> $result
diff $ans $result || exit 1

#後始末
rm /tmp/$$-*
