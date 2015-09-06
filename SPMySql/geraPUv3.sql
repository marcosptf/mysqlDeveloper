drop function if exists geraPU;
create function geraPU(param char(60))
RETURNS varchar(255)
deterministic
BEGIN
declare count,count1,count2   INT default 0;
declare dado,dado1,dado2,dado3,dado4,dado5,dado6,dado7,dado8,dado9,ueba char(60);

set count1  = length(param);
set dado1   = (select lower(substring(param,1,1)));
set dado2   = (select lower(substring(param,2,1)));
set ueba    = '';

while count <= count1 do

      set count = count + 1;            
      set count2= count + 1;    
        
      set dado3 = (select lower(substring(param,count,1)));
      set dado4 = (select lower(substring(param,count2,1)));                    
      set dado3 = if((dado3 regexp "[0-9]"=1) or (dado3 regexp "[a-z]"=1),dado3,'');                              
      set dado5 = if((dado3 regexp "[0-9]"=1) and (dado4 regexp "[0-9]"=1),'','-');                        
      set dado5 = if((count=count1 or dado4 is null or dado4='' or dado4='/' or dado4='*' or dado4='.' or dado4='-'),'',dado5);      
      set ueba =  replace((replace((replace((replace((replace(replace(ueba,'"',''),'?','')),' ','')),'*','')),'.','')),'/','');
      set ueba = (select concat(ueba,dado3,dado5));

end while;

return ueba;

END;
