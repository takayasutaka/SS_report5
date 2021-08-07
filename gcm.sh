#!/bin/bash
if [ $# -ne 2 ]; then
    echo エラーです。引数を２つ渡してください。
    exit 1;
fi

expr "$1" + 1 > /dev/null 2>&1
if [ $? -ge 2 ]; then
    echo エラーです。１つ目の引数が数値ではありません。
    exit 1;
fi

expr "$2" + 1 > /dev/null 2>&1
if [ $? -ge 2 ]; then
    echo エラーです。２つ目の引数が数値ではありません。
    exit 1;
fi

if [ $1 -eq $2 ]; then
    echo $1が最大公約数です。
    exit 0;
elif [ $1 -gt $2 ]; then
    VALUE1=$1
    VALUE2=$2
elif [ $1 -lt $2 ]; then
    VALUE1=$2
    VALUE2=$1
else
    :
fi

REM=$(( $VALUE1 % $VALUE2 ))
while [ $REM -ne 0 ]
do
    VALUE1=$VALUE2
    VALUE2=$REM
    REM=$(( $VALUE1 % $VALUE2 ))
done
echo $VALUE2が最大公約数です。
exit 0
