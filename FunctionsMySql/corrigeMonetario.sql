drop function if exists corrigeMonetario;

delimiter $$
create function corrigeMonetario(pDados varchar(25))
returns varchar(25)
deterministic
begin

    return replace(replace(pDados,'.',''),',','.');

end;
$$

