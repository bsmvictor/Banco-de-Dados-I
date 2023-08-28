create view qtd_compras as(
	select id, preco, pagamento
    from compra
    where preco >=10
);
select * from qtd_compras;

create view qtd_estoque as (
    select i.qtd 'Querem comprar', e.qtd_disponivel 'Podem Vender' 
    from estoque e, itens_solicitacao i
    where i.nome like "Resistor%" and e.cod_item = i.cod_item
);

DELIMITER $$
create trigger atualizar_estoque
after insert on itens_venda
for each row
begin 
	update produtos
    set estoque = estoque - new.quantidade
    where id = new.id_produto;
end; $$
DELIMITER ;

DELIMITER $$
create trigger fazer_reestoque
after delete on itens_venda
for each row
begin 
	update produtos
    set estoque = estoque + old.quantidade
    where id = old.id_produto;
end; $$
DELIMITER ;