#!/bin/bash
ans="/tmp/$$-ans"
result="/tmp/$$-result"
err="/tmp/$$-error"

#1 引数が2つ渡されなかった場合
echo "エラーです。引数を２つ渡してください。" > $ans
./gcm.sh 3 > $result
diff $ans $result || echo "error in 1" >> $err

#2 第一引数が数字でない場合
echo "エラーです。１つ目の引数が数値ではありません。" > $ans
./gcm.sh "aaa" 4 > $result
diff $ans $result || echo "error in 2" >> $err

#3 第二引数が数字でない場合
echo "エラーです。２つ目の引数が数値ではありません。" > $ans
./gcm.sh 4 "aaa" > $result
diff $ans $result || echo "error in 3" >> $err

#正常動作
#4 同じ数値の場合
echo "2が最大公約数です。" > $ans
./gcm.sh 2 2 > $result
diff $ans $result || echo "error in 4" >> $err
#5 違う数値の場合
echo "2が最大公約数です。" > $ans
./gcm.sh 2 4 > $result
diff $ans $result || echo "error in 5" >> $err

if [ -f $err ]; then
    cat $err
    rm /tmp/$$-*
    exit 1
fi

