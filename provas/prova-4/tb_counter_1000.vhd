library ieee;
use ieee.std_logic_1164.all;

entity tb_counter_1000 is
end entity;

architecture arq of tb_counter_1000 is
   signal main_clk, rst: std_logic := '0';
	signal tb_sw_clk: std_logic_vector(1 downto 0);
	signal ty: integer;
	signal tsec_clk: std_logic := '0';
   constant main_clk_period: time := 20ns;
begin
   uut: entity work.counter_1000(arq)
   port map(main_clk, tb_sw_clk, rst, ty, tsec_clk);

   process
   begin
		main_clk <= '0'; wait for main_clk_period / 2;
      main_clk <= '1'; wait for main_clk_period / 2;
   end process;

   rst <= '1', '0' after main_clk_period / 2;
end architecture; 