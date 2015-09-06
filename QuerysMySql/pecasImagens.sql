/* Nova estrutura de tabela para armazenar imagens e croqui de fornecedores */

drop table is exists pecas_imagens;
create table pecas_imagens(

    /*chaves da tabela, vinculo por pu/marca_id e fornecedor_id */
    pu                   varchar(100)     not null,
    marca_id             int(6)           unsigned not null,
    fornecedor_id        int(6)           unsigned not null,   
      
    /* valor gerado automaticamente */
    imagem_id            int(6)           not null auto_increment,      

    /* itens de imagens e croqui podendo ser null */
    eh_croqui            int(1)           not null default 0,
    imagem               varchar(255),

    /* pode setar a ordem que a imagem aparecera na galeria e se pode ser publicada */
    ordem                int(1)           not null default 100,
    publicar             int(1)           not null default 1,
    PRIMARY KEY (pu,marca_id,fornecedor_id,imagem_id)
)ENGINE=MyISAM DEFAULT CHARSET=utf8; 