#  TBL_REPLY 생성

create table tbl_reply(
    rno number(10,0),
    bno NUMBER(10,0) not null,
    reply varchar2(1000) not null,
    replyer varchar2(50) not null,
    replyDate date default sysdate,
    updateDate date default sysdate    
);

create SEQUENCE seq_reply;

alter table tbl_reply add constraint pk_reply primary key(rno);

alter table tbl_reply  add constraint fk_reply_board 
FOREIGN key(bno) REFERENCES tbl_board (bno);# Springframework-Study-
