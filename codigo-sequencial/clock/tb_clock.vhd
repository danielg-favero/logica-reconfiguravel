library ieee;
use ieee.std_logic_1164.all;

entity tb_ccto is
end tb_ccto;

architecture td_arq of tb_ccto is
    signal main_clk, reset, clk: std_logic := '0';
    constant main_clk_period: time := 1000ms;
begin
    uut: entity work.ccto(arq)
    port map(main_clk, reset, clk);

    process
    begin
        main_clk <= '0'; wait for main_clk_period / 2;
        main_clk <= '1'; wait for main_clk_period / 2;
    end process;

    reset <= '1', '0' after main_clk_period / 2;
end architecture; 