drop function if exists corrigeDadosItens;
create function corrigeDadosItens()
RETURNS varchar(255)
deterministic
BEGIN

      /* correcao de partnumber */  
      update pecas                          set partnumber=replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(partnumber,'*',''),'"',''),'@',''),'#',''),'$',''),'%',''),'.',''),'&',''),'(',''),')',''),'--',''),'+',''),'=',''),'§',''),'ª',''),'.',''),',',''),'[',''),'{',''),'}',''),']',''),'?','');
      update fornecedor_estoque_historico   set partnumber=replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(partnumber,'*',''),'"',''),'@',''),'#',''),'$',''),'%',''),'.',''),'&',''),'(',''),')',''),'--',''),'+',''),'=',''),'§',''),'ª',''),'.',''),',',''),'[',''),'{',''),'}',''),']',''),'?','');

      /* correcao de pu */  
      update pecas                          set pu=replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(pu,'*',''),'"',''),'@',''),'#',''),'$',''),'%',''),'.',''),'&',''),'(',''),')',''),'--','-'),'+',''),'=',''),'§',''),'ª',''),',',''),'°',''),'[',''),'{',''),'}',''),']',''),'?','');
      update fornecedor_estoque_historico   set pu=replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(pu,'*',''),'"',''),'@',''),'#',''),'$',''),'%',''),'.',''),'&',''),'(',''),')',''),'--','-'),'+',''),'=',''),'§',''),'ª',''),',',''),'°',''),'[',''),'{',''),'}',''),']',''),'?','');


return 'Correcao Finalizada!';
end;


