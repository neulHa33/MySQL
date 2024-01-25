select * 
from employees;

select first_name, salary
from employees;

select concat(first_name, ' ', last_name) as name,
       salary,
       salary*12
from employees;

select now()
from dual;

select now();

select first_name
from employees;

select first_name, '남' as '성 별';

-- where 절
select first_name, salary
from employees
where salary != 17000;

-- 비교연산자, 조건이 여러개일때, between, in
-- -----------------------------------------------
select *
from employees
where binary first_name = 'joHn';

select *
from employees
where binary first_name = 'Lex';

select first_name, 
       last_name,
       salary
from employees
where first_name like 'L%';

select first_name,
	   last_name,
       salary
from employees
where first_name like 'M%';

#이름에 am 을 포함한 사원의 이름과 월급을 출력하세요
select concat(first_name, last_name) as name,
	   salary
from employees
where first_name like '%am%';

#이름의 두번째 글자가 a 인 사원의 이름과 월급을 출력하세요
select concat(first_name, last_name) as name
from employees
where first_name like '_a%';

#이름의 네번째 글자가 a 인 사원의 이름을 출력하세요
select *
from employees
where first_name like '___a%';

#이름이 4글자인 사원중 끝에서 두번째 글자가 a인 사원의 이름을 출력하세요
select *
from employees
where first_name like '%a_';

select *
from employees
where first_name like '___';

select *
from employees
where first_name like '_a__';

-- null
select first_name, 
	   salary, 
       commission_pct, 
       salary*commission_pct
from employees
where salary between 13000 and 15000;

select *
from employees
where commission_pct is null;
# 주의 where commission_pct = null

select *
from employees
where commission_pct is not null;
#맨 아래줄은 아님

# 커미션비율이 있는 사원의 이름과 월급 커미션비율을 출력하세요
select first_name, salary, commission_pct
from employees
where commission_pct is not null;
# 담당매니저가 없고 커미션비율이 없는 직원의 이름과 매니저아이디 커미션 비율을 출력하세요
select first_name, manager_id, commission_pct
from employees;

-- ORDER BY
select first_name, salary
from employees
where salary >= 10000
order by salary desc; 
-- asc desc

select first_name, salary
from employees
where manager_id is null and commission_pct is null;

# 부서가 없는 직원의 이름과 월급을 출력하세요
select first_name, salary
from employees
where department_id is null;

select *
from employees
order by employee_id asc;

select first_name, salary
from employees
order by first_name asc;

select first_name, hire_date, salary
from employees
order by hire_date desc;

-- 1.최근 입사한 순, 2.입사일이 같으면 월급이 많은 사람부터
select first_name, hire_date, salary
from employees
order by hire_date desc, salary desc;

#부서번호를 오름차순으로 정렬하고 부서번호, 월급, 이름을 출력하세요
select department_id, salary, first_name
from employees
order by department_id asc;

#월급이 10000 이상인 직원의 이름 월급을 월급이 큰직원부터 출력하세요
select first_name, salary
from employees
where salary >= 10000
order by salary desc;

#부서번호를 오름차순으로 정렬하고 부서번호가 같으면 월급이 높은 사람부터 부서번호 월급 이름을 출력하세요
select department_id, salary, first_name
from employees
order by department_id asc, salary desc;

#직원의 이름, 급여, 입사일을 이름의 알파벳 올림차순으로 출력하세요
select first_name, salary, hire_date
from employees
order by first_name desc;

#직원의 이름, 급여, 입사일을 입사일이 빠른 사람 부터 출력하세요
select first_name, salary, hire_date
from employees
order by hire_date asc;

select first_name as name,
       hire_date,
       department_id
from employees
where department_id = 60
order by hire_date desc;

select first_name,
       hire_date date,
	   department_id
from employees
where department_id = 60 and
	  hire_date >= '2007-01-01'
order by hire_date desc;

/**********************************************************
* 02일차 수업
***********************************************************/
-- 단일행 함수
-- 단일행 함수 > 숫자함수

-- round() : 반올림
select round(123.123, 2),
	   round(123.126, 2),
       round(123.1256, 3),
       round(123.567, 0),
       round(123.456, 0),
       round(123.456), #0일 때는 안써도 됨
       round(123.456, -1),
       round(123.456, -2),
       round(123.456, -3)
from dual;

select round(123.123, -2)
from dual;

-- 올림
select ceil(123.456), -- 124
	   ceil(123.789), -- 124
	   ceil(123.7892313), -- 124
       ceil(987.1234); -- 988
       
-- truncate(): 소수점 m 자리까지 표현
select truncate(1234.34567, 2),
	   truncate(1234.34567, 3),
       truncate(1234.34567, 0),
       truncate(1234.34567, -2);

select first_name,
       salary,
       ceil(salary/30)
from employees
order by salary desc;

select pow(12, 2), power(12, 2);

-- SQRT : 제곱근
select sqrt(44);

-- SIGN: 숫자가 음수이면 -1, 0이면 0, 양수이면 1
select sign(123),
       sign(0),
       sign(-123);
       
-- ABS(숫자): 절대값
select abs(123),
	   abs(0),
	   abs(-123)
;

-- GREATEST(x, y, z, ...): 괄호안의 값중 가장 큰값
select greatest(2, 0, -2), 
	   greatest(4, 3.2, 5.25), 
	   greatest('B', 'A', 'C', 'c')
;

-- LEAST(x, y, z, ...): 괄호안의 값중 가장 작은값
select least(2, 0, -2),
	   least(4, 3.2, 5.25), 
	   least('B', 'A', 'C', 'c')
from dual;

select *
from employees;

select greatest(salary)
from employees;

select  employee_id,
	    manager_id,
        department_id,
		greatest(employee_id, manager_id, department_id), # 한 줄에 있는 숫자에서 가장 큰 걸 반환
        least(employee_id, manager_id, department_id)
from employees;

select max(salary)
from employees;

select * from employees;

-- 단일행 함수 > 문자함수
-- CONCAT_WS(s, str1, str2, .., strn을 연결)
select concat_ws('*', 'abc', '123', '가나다')
from dual;

select concat_ws('-', 'abc', '123', '가나다')
from dual;

select concat('안녕', '하세요')
from dual;

select concat('안녕', '-', '하세요')
from dual;

select concat(first_name, '-', last_name)
from employees;

-- LCASE(str) 또는 LOWER(str): str의 모든 대문자를 소문자로 변환
select first_name,
       lcase(first_name),
       lower(first_name),
       lower('ABCabc!@#$'),
       lower('가나다라마바사')
from employees;

-- UCASE(str) 또는 UPPER(str): str의 모든 소문자를 대문자로 변환
select first_name,
       ucase(first_name),
       upper(first_name),
       upper('ABCabc!#$'),
       upper('가나다라마바사')
from employees;

-- 문자갯수
select first_name,
       length(first_name),
	   char_length(first_name),
	   character_length(first_name)
from employees;

select length('a'),
       char_length('a'),
	   character_length('a')
from dual;

select length('가'),
       char_length('가'),
	   character_length('가')
from dual;

# SUBSTRING(str, pos, len) 또는 SUBSTR(str, pos, len): 
# str의 pos 위치에서 시작하여 len 길이의 문자열 반환
select first_name,
	   substr(first_name,1,3),
       substr(first_name,2,3),
       substr(first_name,-3,2)
from employees
where department_id = 100;

select substr('000329-12345678', 8, 1),
       substr('901112-4234567', 8, 1),
       substr('901112-4234567', -7, 1),
       substr('901112-4234567', 1, 2),
       substr('901112-4234567', 3, 2),
       substr('901112-4234567', 5, 2)
from dual;

-- LPAD(str, len, padstr): RPAD(str, len, padstr)
select first_name,
	   lpad(first_name, 10, '**')
from employees;

-- TRIM(str)
select concat('|', '          안녕하세요          ', '|'),
       concat('|', trim('          안녕하세요          '), '|'),
       concat('|', ltrim('          안녕하세요          '), '|'),
       concat('|', rtrim('          안녕하세요          '), '|'),
       trim('          안녕하세요          ')
from dual;

# REPLACE(str, from_str, to_str): str에서 from_str을 to_str로 변경
select department_id, first_name, 
	   replace(first_name, 'a', '*'),
       substr(first_name, 2, 3),
       replace(first_name, substr(first_name, 2, 3), '***')
from employees
where department_id = 100;

-- 단일형 함수 > 날짜함수
select current_date(),  curdate(), current_timestamp(), current_time(), now();

select adddate('2021-06-20 00:00:00', INTERVAL 1 YEAR),
	   adddate('2021-06-20 00:00:00', INTERVAL -1 YEAR), # 음수를 쓰면 빼기 효과
	   adddate('2021-06-20 00:00:00', INTERVAL 1 MONTH), 
	   adddate('2021-06-20 00:00:00', INTERVAL 1 WEEK), 
	   adddate('2021-06-20 00:00:00', INTERVAL 1 DAY), 
	   adddate('2021-06-20 00:00:00', INTERVAL 1 HOUR), 
	   adddate('2021-06-20 00:00:00', INTERVAL 1 MINUTE), 
	   adddate('2021-06-20 00:00:00', INTERVAL 1 SECOND)
; 

-- DATEDIFF(): TIMEDIFF():
select datediff('2021-06-21 01:05:05', '2021-06-21 01:00:00'),
	   timediff('2021-06-21 01:05:05', '2021-06-20 01:00:00'),
       timediff('2021-06-21 01:05:05', '2021-06-21 01:00:00')
from dual;

select first_name,
	   now(),
	   hire_date,
       round(datediff(now(), hire_date)/365, 2) workday
from employees
order by workday desc;

-- 변환함수
-- DATE_FORMAT(date, format): date를 format형식으로 변환
select now(),
	   date_format(now(), '%y'),
       date_format(now(), '%Y'),
       date_format(now(), '%m'),
       date_format(now(), '%M')
from dual;

select now(),
	   date_format(now(), '%y-%m-%d %H:%i:%s'),
       date_format(now(), '%y/%m/%d %H:%i:%s') 
from dual;

select first_name, ifnull(commission_pct, '없음')
from employees;

/****************************************************************************
* 03일차 수업
****************************************************************************/
-- 그룹함수

-- 단일행 함수
select first_name,
	   salary,
       round(salary, 2)
from employees;

-- 오류
select first_name,
	   salary,
       sum(salary)
from employees;
-- -------------------------------------------------------------------
select *
from employees;

select count(*) # 한 줄의 합
from employees;

select count(first_name)
from employees;

select count(manager_id)
from employees;

select count(commission_pct)
from employees;

select count(*), count(commission_pct)
from employees;

-- 월급이 16000 초과 되는 직원의 수는?
select count(*)
from employees
where salary > 16000;

select first_name, salary
from employees
where salary > 16000;

select count(commission_pct)
from employees
where salary > 16000;

-- -----------------------------------------------------
# sum()
-- -----------------------------------------------------
select sum(salary), count(*)
from employees
;

select count(*), 
       sum(salary),
       sum(employee_id)
from employees;

-- -----------------------------------------------------
# avg()
-- -----------------------------------------------------
select count(*),
	   sum(salary),
       avg(salary)
from employees
;  

-- null 포함여부 주의
-- -----------------------------------------------------
# max() / min()
-- -----------------------------------------------------
select count(*),
	   max(salary),
       min(salary)
from employees
;

-- -----------------------------------------------------
# groupby()
-- -----------------------------------------------------
select department_id, count(salary)
from employees
group by department_id;

select department_id, max(salary)
from employees
group by department_id;

select department_id, count(*), sum(salary)
from employees
group by department_id;

select first_name, department_id
from employees;

select department_id, job_id, count(*)
from employees
group by department_id, job_id
;
-- -----------------------------------------------------
# HAVING 절
-- -----------------------------------------------------
# where 과 group by는 함께 올 수 없다.
# 월급(salary)의 합계가 20000 이상인 부서의 부서 번호와, 인원수, 월급합계를 출력하세요.
select department_id, count(*), sum(salary)
from employees
group by department_id
having sum(salary) >= 20000;

select department_id, count(*), sum(salary)
from employees
-- where sum(salary) >= 20000
group by department_id
having sum(salary) >= 20000
and department_id = 100
;

select first_name,
       salary,
	   commission_pct,
       if(commission_pct is null , 0 , 1 ) as state
from employees;

/* 
직원아이디, 월급, 업무아이디, 실제월급(realSalary)을 출력하세요.
실제월급은 job_id 가 'AC_ACCOUNT' 면 월급 + 월급 * 0.1,
				  'SA_REP' 월급 + 월급 * 0.2,
                  'ST_CLERL' 면 원급 + 월급 * 0.3
                  그외에는 월급으로 계산하세요.
*/

select employee_id,
       salary,
       job_id,
       case when job_id = 'AC_ACCOUNT' then salary + salary * 0.1
            when job_id = 'SA_REP' then salary + salary * 0.2
            when job_id = 'ST_CLERL' then salary + salary * 0.3
		    else salary
	   end as realSalary
from employees;

select *
from employees;

/*
직원의 이름, 부서번호, 팀을 출력하세요
팀은 코드로 결정하며 부서코드가
     10~50이면 'A-TEAM'
     60~100이면 'B-TEAM'
     110~150이면 'C-TEAM'
     나머지는 '팀없음'으로
출력하세요
*/
select first_name,
       department_id,
       case when department_id >= 10 and department_id <=50 then 'A-TEAM'
            when department_id >= 60 and department_id <=100 then 'B-TEAM'
            when department_id >= 110 and department_id <=150 then 'C-TEAM'
            else '팀없음'
	   end as '팀이름'
from employees;

select first_name,
       department_id,
       case when department_id between 10 and 50 then 'A-TEAM'
            when department_id between 60 and 100 then 'B-TEAM'
            when department_id between 110 and 150 then 'C-TEAM'
       else '팀없음'
	   end as '팀이름'
from employees;

-- -----------------------------------------------------
# join
-- -----------------------------------------------------
-- 사원이름, 부서번호
select first_name, department_id
from employees;

-- 직원
select *
from employees;

-- 부서명
select *
from departments;

-- join
select *
from employees, departments;

select employees.first_name, 
       departments.department_name,
       employees.department_id,
       departments.department_id
from employees, departments
;

select e.first_name,
       d.department_name,
       e.department_id,
       d.department_id
from employees e, departments d;

select count(*)
from employees, departments;

select 107*27
from dual;

-- 테이블 별명쓰기
-- 겹치지 않는 컬럼명은 테이블 별명을 쓰지 않아도 된다
-- 하지만 써도 된다
-- 겹치는 컬럼명은 꼭 써야 된다
select e.first_name,
       d.department_name,
       e.department_id,
       d.department_id
from employees e, departments d
where e.department_id = d.department_id
;

select e.first_name,
	   d.department_name,
       d.department_id,
       e.department_id
from employees e 
inner join departments d
on e.department_id = d.department_id
;

select e.first_name,
	   d.department_name,
       d.department_id,
       e.department_id
from employees e 
join departments d
on e.department_id = d.department_id
;

select count(*)
from employees e 
inner join departments d
on e.department_id = d.department_id
;

-- 모든 직원이름, 부서이름, 업무명을 출력하세요  *3개의 테이블
select e.first_name, 
       d.department_name,
       j.job_title
from employees e, departments d, jobs j
where e.department_id = d.department_id
	  and e.job_id = j.job_id;
      
select count(*)
from employees e, departments d, jobs j
where e.department_id = d.department_id
	  and e.job_id = j.job_id;

/****************************************************************************
* 04일차 수업
****************************************************************************/

select e.first_name,
       e.department_id,
       d.department_id,
       d.department_name,
       e.job_id,
       j.job_id,
       j.job_title,
       d.location_id,
       l.location_id,
       l.city
from employees e, departments d, locations l, jobs j
where e.department_id = d.department_id
and d.location_id = l.location_id
and e.job_id = j.job_id
;

/*
select e.first_name,
       e.department_id,
       d.department_id,
       d.department_name,
       e.job_id,
       j.job_id,
       j.job_title,
       d.location_id,
       l.location_id,
       l.city
from employees e inner join departments d on e.department_id = d.deparments 

 departments d, locations l, jobs j

inner join 
inner join 
*/

-- -----------------------------------------------------
# left outer join
-- -----------------------------------------------------
select e.department_id,
       e.first_name,
       d.department_name
from employees e 
left outer join departments d
    on e.department_id = d.department_id
;

-- -----------------------------------------------------
# right outer join
-- -----------------------------------------------------
select *
from employees e
right outer join departments d
	on e.department_id = d.department_id
;

-- -----------------------------------------------------
# right outer join과 left outer join을 바꿀 수 있다
-- -----------------------------------------------------
select first_name, e.department_id, d.department_id
from employees e
right outer join departments d
	on e.department_id = d.department_id
;

(select e.first_name,
	    e.employee_id,
        d.department_name
from employees e
left outer join departments d
	on e.department_id = d.department_id
)
union
(select e.first_name,
	    e.employee_id,
        d.department_name
from employees e
right outer join departments d
	on e.department_id = d.department_id
);

select e.first_name,
	    e.department_id,
        d.department_name
from employees e
right outer join departments d
	on e.department_id = d.department_id;
    
(select e.first_name,
	    e.department_id,
        d.department_name
from employees e
left outer join departments d
	on e.department_id = d.department_id
)
union
(select e.first_name,
	    e.department_id,
        d.department_name
from employees e
right outer join departments d
	on e.department_id = d.department_id
);

(select *
from employees e
left outer join departments d
	on e.department_id = d.department_id
)
union
(select *
from employees e
right outer join departments d
	on e.department_id = d.department_id
);

select *
from departments d
right outer join employees e
	on e.department_id = d.department_id
;

select *
from employees;

select e.manager_id,
       e.employee_id,
       e.first_name,
       m.first_name manger_name
from employees e, employees m
where e.manager_id = m.employee_id;

select e.first_name,
       d.department_name
from employees e, departments d
where e.manager_id = d.department_id;

select e.first_name,
	   e.salary,
       l.location_id,
       l.street_address,
       l.city
from employees e, locations l
where e.salary = l.location_id;

select *
from employees;

-- Den의 월급을 구한다
select first_name,
	   salary
from employees
where first_name = 'Den'; -- Den, 11000

-- 전체
select *
from employees
where salary >= 11000;

-- 합치기
select first_name,
	   salary
from employees
where salary >= (select salary
                 from employees
				 where first_name = 'Den');
                 
/****************************************************************************
* 05일차 수업
****************************************************************************/
-- -------------------------------------------------------------------------
# SubQuery 
-- -------------------------------------------------------------------------
/*
-- 'Den'보다 월급을 많이 받는 사람의 월급은?
1. 'Den'의 월급을 구한다.
2. 직원테이블에서 월급이 11000보다 많은 사람을 구한다.
3. 두 개를 합친다.
*/
select *
from employees
where first_name = 'Den'; -- 11000

select *
from employees
where salary >= 11000;

# Den보다 월급이 많은 사람
select first_name,
       salary
from employees
where salary > (select salary
			   from employees
               where first_name = 'Den');           

/*
# 월급을 가장 적게 받는 사람의 이름, 월급, 사원번호는?
1. 직원테이블에서 1000원을 받는 사람을 구한다.
2. 1000<-- 직원테이블에서 최소월급
3. 두 개를 합친다.
*/
select first_name,
	   salary,
       employee_id
from employees
where salary = (select min(salary)
                from employees);

# 평균 월급보다 적게 받는 사람의 이름, 월급을 출력하세요.
select first_name,
       salary
from employees
where salary < (select avg(salary)
                from employees);

-- -------------------------------------------------------------------------
# SubQuery IN
-- -------------------------------------------------------------------------
/*
부서번호가 110인 직원의 급여와 같은 월급을 받는 모든 직원의 사번, 이름, 급여를 출력하세요.
*/
select employee_id,
       first_name,
       salary,
       department_id
from employees
where salary in (select salary
				from employees
                where department_id = 110);
                
/*
각 부서별로 최고급여를 받는 사원의 이름과 
*/
select employee_id,
       first_name,
       salary,
       department_id
from employees
where salary in (select max(salary)
                 from employees
                 group by department_id
                 order by department_id asc);

select max(salary),
       department_id
from employees
group by department_id
order by department_id asc;

select first_name,
       salary,
       department_id
from employees
where (department_id, salary) in (select department_id, max(salary)
								  from employees
								  group by department_id
                                 )
order by department_id asc
;

# 부서별 최고월급, 이름
select first_name, 
       department_id,
       salary
from employees
where (department_id, salary) in (select department_id, max(salary)
								  from employees
								  group by department_id)
order by department_id asc
;

/*                                  
부서별 최저월급, 이름 --> 
*/
select first_name, 
       department_id,
       salary
from employees
where (department_id, salary) in (select department_id, min(salary)
								  from employees
								  group by department_id)
order by department_id asc
;

# 월급 최저인 직원의 월급과 이름
select first_name, 
       department_id,
       salary
from employees
where salary = (select min(salary)
				from employees)
;

-- -------------------------------------------------------------------------
# SubQuery ANY
-- -------------------------------------------------------------------------
-- 부서번호가 110인 직원의 월급
select salary
from employees
where department_id = 110;

-- 부서번호가 110인 직원의 급여보다 큰 모든 직원의 이름, 급여를 출력하세요.(or 연산 --> 8300보다 큰)
select first_name,
       salary
from employees
where salary > any (select salary
                    from employees
                    where department_id = 110)
;
                
-- 월급이 11000보다 큰 직원의 이름, 급여를 출력하세요.
select first_name,
       salary
from employees
where salary > 11000;

-- -------------------------------------------------------------------------
# SubQuery ALL
-- -------------------------------------------------------------------------
/*
부서번호가 110인 직원의 급여 보다 큰 모든 직원의 이름, 급여를 출력하세요.(and연산--> 12008보다 큰)
*/
select salary
from employees
where department_id = 110
;

select first_name, salary
from employees 
where salary > all (select salary
                    from employees
					where department_id = 110)
;

select salary
from employees
where first_name = 'Den';

select employee_id, first_name, salary
from employees
where salary > (select salary
                from employees
                where first_name = 'Den')
;

select *
from employees
where salary > 15000
;

select *
from employees e, departments d
;

select department_id, max(salary)
from employees
group by department_id;

# 각 부서별로 최고급여를 받는 사원을 출력하세요
select first_name,
       department_id,
       salary     
from employees
where (department_id, salary) in (select department_id, max(salary)
								  from employees
								  group by department_id)
order by department_id asc;

-- -------------------------------------------------------------------------
# SubQuery 테이블에서 조인
-- -------------------------------------------------------------------------
-- 각 부서별로 최고급여를 받는 사원을 출력하세요
-- 107 rows
select *
from employees;

-- 12 rows
select department_id, max(salary) salary
from employees
group by department_id
order by department_id asc;

-- 11 rows
select e.department_id, e.employee_id, e.first_name, e.salary
from employees e, (select department_id, max(salary) salary
                   from employees
				   group by department_id) s
where e.department_id = s.department_id
and e.salary = s.salary
order by department_id asc;

-- -------------------------------------------------------------------------
# limit
-- -------------------------------------------------------------------------
select employee_id, first_name, salary
from employees
order by employee_id asc
limit 0, 5;

select employee_id, first_name, salary
from employees
order by employee_id asc
limit 5 offset 0;

# 07년에 입사한 직원중 급여가 많은 직원중 3에서 7등의 이름 급여 입사일은?
select first_name 이름,
       hire_date 입사일,
       salary 급여
from employees
where date_format(hire_date, '%y') = 07
order by salary desc
limit 2, 5;

select first_name 이름,
       hire_date 입사일,
       salary 급여
from employees
where date_format(hire_date, '%y') = 07
order by salary desc
limit 5 offset 2;

select first_name 이름,
	   hire_date 입사일,
       salary 급여
from employees
where date_format(hire_date, '%y') = 07
order by salary desc;
