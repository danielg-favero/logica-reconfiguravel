library ieee;
use ieee.std_logic_1164.all;

entity tb_comparator is
end tb_comparator;

architecture arq of tb_comparator is
signal ta, tb, ty: std_logic;
begin
    -- Fazer o estrelaçamento entre o código do circuito e esse código de testes
    uut: entity work.comparator(arq)

    -- Mapear entradas e saídas a um conjunto de sinais nesse arquivo
    -- Pode ser reescrito como part map(a, b, y);
    port map(a => ta, b => tb, y => ty);

    -- Tudo em VHDL é paralelo, menos dentro do process
    process begin
        ta <= '0'; tb <= '0'; wait for 10 ns;
        ta <= '0'; tb <= '1'; wait for 10 ns;
        ta <= '1'; tb <= '0'; wait for 10 ns;
        ta <= '1'; tb <= '1'; wait for 10 ns;
    end process;
end arq;