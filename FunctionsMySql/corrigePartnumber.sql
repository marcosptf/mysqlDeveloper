drop function if exists corrigePartnumber;
create function corrigePartnumber()
returns varchar(255)
deterministic

begin
declare count,count1,count2 int default 0;
declare dado,dado1,dado2,dado3,dado4,dado5,dado6,dado7,dado8,dado9,ueba char(60);
       
    /* retira os zeros á esquerda */
    /* select a,substring(a,2,(length(a)-1)) from interchange_debug where a regexp '^[^1-9]|[a-z]'; */
    update interchange_debug set a=substring(a,2,(length(a)-1)) where a regexp '^[^1-9]|[a-z]';

return '';
end;