# Development Machine setting

[ ] CloudFormation으로 cli로 작성하는거
[ ] ip주소 가져온다음
[ ] ssh -i "oiojin831_free_micro.pem" ubuntu@ec2-52-78-88-148.ap-northeast-2.compute.amazonaws.com
[ ] init.sh까지 실행시키는 script작성
[ ] https://alestic.com/2009/06/ec2-user-data-scripts/ startup떄 실행하는 기능이 있음

## Run init.sh command
```sh -c "$(wget https://raw.githubusercontent.com/oiojin831/laptop/master/init.sh -O -)"```

