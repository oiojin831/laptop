# Development Machine setting
init.sh은 linux에 docker, vim등 기본적인 설정들을 설정해주는 shell script이다.



개발 머신 ec2만들기 -> 개발머신 init.sh -> rails project create script -> deploy
script로 그냥 서버 deploy까지만.  

나중에 ci 공부하고 자동화하자.  
일단 ci는 빼고 하자.  
수동으로 local에서 rspec 돌리고 github maste에 merge하면 staging으로 올라 가는거
까지만 하자.  
 -> push to github -> merge pull request -> serverless로 deploy script 실행



- [ ] 개발 머신은 cloudformation -> ec2 instance(자동 run init.sh)
- [x] cloudformation cli로 실행하기
- [x] 자동 script하기
- [ ] 프로제트 종류 별로 docker 설정 
- [ ] option을 정할수있는 script
- [ ] 프로젝트 종류에 따라 docker-compose하는 파일 만들기
- [ ] 배포까지 자동으로 다 설정되게끔 만들기
- [x] CloudFormation으로 cli로 작성하는거
- [ ] ip주소 가져온다음
- [ ] ssh -i "oiojin831_free_micro.pem" ubuntu@ec2-52-78-88-148.ap-northeast-2.compute.amazonaws.com
- [ ] init.sh까지 실행시키는 script작성
- [ ] https://alestic.com/2009/06/ec2-user-data-scripts/ startup떄 실행하는 기능이 있음

## Run init.sh command
```sh -c "$(wget https://raw.githubusercontent.com/oiojin831/laptop/master/init.sh -O -)"```

