library  ieee;
use ieee.std_logic_1164.all;

entity freq_sel is
port(
	sw_freq: in std_logic_vector(1 downto 0);
	freq: out integer
);
end entity;

architecture arq of freq_sel is 
begin
	freq <= 1 when sw_freq = "00" else
			  5 when sw_freq = "01" else
			  10 when sw_freq = "10" else
			  50;	  
end architecture;