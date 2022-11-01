-- 결제관리 목록
select JE.EXNO, 
  JT.CCDATE, 
  JT.CRDATE, 
  JM.PNUM, 
  JT.EXTKNO, 
  JT.PURDATE, 
  JE.EXNAME, 
  JT.CNT, 
  JE.PRICE
from jang_ticket JT
join jang_exhibition JE
  on JT.EXNO = JE.EXNO
join jang_member JM
  on JT.ID = JM.ID;

-- 회원관리 (회원 목록)
select ID, EMAIL, NAME, PNUM, SIDATE, NNAME
from jang_member
order by SIDATE desc;

-- 회원관리 (회원 상태 팝업창)
select STATUS
from jang_member 
where ID = #{value};

-- 신고/삭제 관리 목록
select JR.RPNO, 
  JSR.TITLE, 
  JSR.ID, 
  COUNT(JR.RECONO) as COUNT, 
  JR.RSTDATE
from jang_report JR, jang_so_recommendation JSR
  where JR.RECONO=JSR.RECONO
group by JR.RECONO
order by COUNT desc;

-- 제재된 사용자 목록
select JM.ID, JM.STATUS, JR.RSTDATE
from jang_member JM
  join jang_so_recommendation JSR
on JM.ID=JSR.ID
  join jang_report JR
on JSR.RECONO=JR.RECONO
  where JM.STATUS = 'A'
group by JM.ID;


