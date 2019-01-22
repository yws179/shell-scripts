#!/bin/bash

hostname=('127.0.0.1:8080' '127.0.0.1:8000' '127.0.0.1:80')
email_from=****@qq.com
email_pwd=***
email_smtp=smtp.qq.com
to_mail='yws179@gmail.com,563098030@qq.com'

for h in ${hostname[@]}
do
	result=`echo -e "\n" | telnet ${h//:/' '} 2>/dev/null | grep Connected | wc -l`
	if [ $result == 0 ]; then
		sendemail -f ${email_from} -s ${email_smtp} -u "端口检测异常" -t ${to_mail} -o message-charset=utf8 -xu ${email_from} -xp ${email_pwd} -m "端口检测失败： ${h}"
	fi
done
