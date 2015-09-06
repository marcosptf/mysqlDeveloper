/*
        public function getCalculoPorcentagemIncremental($pValor,$pPorcentagem){
            return (($pValor>0) ? ((($pPorcentagem/100) * ($pValor)) + $pValor) : ($pValor));            
        }

*/

drop function if exists getCalculoPorcentagemIncremental;

delimiter $$
create function getCalculoPorcentagemIncremental(pValor varchar(25),pPorcentagem varchar(10))
returns varchar(25)
deterministic
begin

    declare resp varchar(25);

    set resp="-1";

    if(pValor>0) then
        set resp = (((pPorcentagem/100) * (pValor)) + pValor);
    end if;

    if(resp="-1") then
        set resp = "0.00";
    end if;

    return format(resp,2);

end;
$$

select getCalculoPorcentagemIncremental(10,25);

