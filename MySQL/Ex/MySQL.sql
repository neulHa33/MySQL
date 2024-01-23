use hrdb;

-- select 문
# select 문
/* select 문 */

/*********************************************
select 문  (조회)
*********************************************/

#select ~ from절
-- 테이블 전체 조회하기
select * from employees;
select * from departments;
select * from locations;
select * from countries;
select * from regions;
select * from jobs;
select * from job_history;

-- select 절
select first_name, salary
from employees;

-- 모든 직원의 직원아이디(employee_id), 이름 (first_name), 성(lsat_name) 을 출력하세요
select employee_id, 
	   first_name, 
       last_name 
from employees;
-- 모든 직원의 이름(fisrt_name)과 전화번호 입사일 연봉을 출력하세요
select first_name, 
	   phone_number, 
       hire_date, salary 
from employees;
-- 모든 직원의 이름(first_name)과 성(last_name), 월급, 전화번호, 이메일, 입사일을 출력하세요
select first_name, 
       last_name, 
	   salary, 
       phone_number, 
       email, 
       hire_date 
from employees;

# 직원아이디, 이름, 월급을 출력하세요. 
# 단 직원아이디는 empNO, 이름은 "f-name", 월급은 "월 급" 으로 컬럼명을 출력하세요

select employee_id as empNO,
	   first_name as 'f-name',
       salary '월 급'
from employees;

select first_name as 이름,
	   phone_number as 전화번호,
	   hire_date as 입사일,
       salary as 월급
from employees;

select employee_id as '사 번',
       first_name as 이름,
       last_name as 성,
       salary as 월급,
       phone_number as 전화번호,
       email as 이메일,
	   hire_date as 입사일
from employees;

-- 산술 연산자 사용하기
select first_name,
	   salary 월급,
       salary-100 '월급-식대',
       salary*12 연봉,
       salary*12+5000 보너스포함,
       salary/30 일급,
       employee_id%3 '워크샵 팀'
from employees;

-- 문자열은 0으로 처리 --> 오류가 나지 않으므로 확인이 안될 수 있다
select job_id*12
from employees;

select first_name,
	   last_name,
       concat(first_name, ' ', last_name) name,
       concat(first_name, ' ', last_name, ' hire date is ', hire_date) name2
from employees;

-- 컬럼 합치기
select concat(first_name, ' ', last_name)
from employees;

select concat(first_name, '-', last_name) as 성명,
	   salary as 월급,
       salary*12 연봉,
       salary*12+5000 보너스,
       phone_number 전화번호
from employees;

-- 테이블의 컬럼명 테이블의 데이터, 문자열, 숫자는 그대로 출력
select first_name,
	   salary*12 as 연봉,
       '(주)개발자' company,
       3 상태
from employees;

-- 테이블 명 생략
select now()
from dual;

select 3+5;

-- where 절
select first_name
from employees
where department_id=10;

select first_name, salary
from employees
where salary >= 15000;

select first_name, hire_date
from employees 
where hire_date > '2007-01-01';

# 이름이 Lex인 직원의 이름과 월급을 출력하세요
# - 문자열 대소문자를 구별하지 않는다. 구별하려면 binary 사용
select first_name, salary
from employees
where first_name = 'Lex';

-- 조건이 2개 이상일 때 한 번에 조회하기
select first_name, salary
from employees
where salary >= 14000
and salary <= 17000;

select first_name, salary
from employees
where salary <= 14000
or salary >= 17000;

# 월급이 04/01/01 에서 05/12/31 사이의 사원의 이름과 입사일을 출력하세요
select first_name, salary
from employees
where hire_date >= '2004-01-01'
and hire_date <= '2005-12-31';

select first_name,
	   salary
from employees
where salary between 14000 and 17000;

select first_name,
       last_name,
       salary
from employees
where first_name = 'Neena'
or first_name = 'Lex'
or first_name = 'John';

select first_name, last_name, salary
from employees
where first_name in ('Neena', 'Lex', 'John');

select first_name, salary
from employees
where salary = 2100 
	  or salary = 3100
      or salary = 4100
      or salary = 5100;
 
 select first_name, salary
 from employees
 where salary in (2100, 3100, 4100, 5100);
 
 select first_name, last_name, salary
 from employees
 where first_name like 'L%';
