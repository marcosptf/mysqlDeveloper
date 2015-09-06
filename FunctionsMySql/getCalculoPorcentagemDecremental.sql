
drop function if exists getCalculoPorcentagemDecremental;

delimiter $$
create function getCalculoPorcentagemDecremental(pValor varchar(25),pPorcentagem varchar(10))
returns varchar(25)
deterministic
begin

    declare resp varchar(25);

    set resp="-1";

    if(pValor>0) then
        set resp = (pValor - ((pPorcentagem/100) * (pValor)));
    end if;

    if(resp="-1") then
        set resp = "0.00";
    end if;

    return format(resp,2);

end;
$$

select getCalculoPorcentagemDecremental(10,25);

