## 중고비

#### 1주차

박성하 조신성 정동준 신진수 이중봉

- develop -> master로 변경중
- 

mysql연동시 사용
- pip install mysqlclient


mysql에서 테이블 생성 후 Django에 model 생성시키기
- python manage.py inspectdb > ./api/models.py
- python manage.py makemigrations
- python manage.py migrate