library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.my_package.all;

entity counter_1000 is
port(
	sw_freq: in std_logic_vector(1 downto 0);
	main_clk, rst: in std_logic;
   y1_7seg, y2_7seg, y3_7seg: out std_logic_vector (0 to 6)
);
end entity;

architecture arq of counter_1000 is
	signal freq: integer;
	signal clk: std_logic;
	signal hundredth, tenth, unit: integer;
begin
	map_freq: entity work.freq_sel(arq)
	port map(sw_freq, freq);
	
	map_clock: entity work.clock(arq)
	port map(freq, main_clk, rst, clk);
	
	map_counter: entity work.counter(arq)
	port map(clk, rst, hundredth, tenth, unit);
	
	-- Exibir unidades
	map_seven_seg_unit: entity work.seven_seg_disp(arq)
	port map(unit, y1_7seg);
	
	-- Exibir dezenas
	map_seven_seg_tenth: entity work.seven_seg_disp(arq)
	port map(tenth, y2_7seg);
	
	-- Exibir centenas
	map_seven_seg_hundredth: entity work.seven_seg_disp(arq)
	port map(hundredth, y3_7seg);
end architecture;