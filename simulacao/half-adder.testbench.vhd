library ieee;
use ieee.std_logic_1164.all;

entity tb_half_adder is
end tb_half_adder;

architecture arq of tb_half_adder is
signal ta, tb, ts, tc: std_logic;
begin
    uut: entity work.half_adder(arq)

    port map(a => ta, b => tb, s => ts, c => tc);

    process begin
        ta <= '0'; tb <= '0'; wait for 10 ns;
        ta <= '1'; tb <= '0'; wait for 10 ns;
        ta <= '0'; tb <= '1'; wait for 10 ns;
        ta <= '1'; tb <= '1'; wait for 10 ns;
    end process;
end arq;