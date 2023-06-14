library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter is 
port(
	clk, rst: in std_logic;
	hundredth, tenth, unit: out integer
);
end entity;

architecture arq of counter is
begin
	process(clk, rst)
		variable count: integer range 0 to 1000;
	begin
		if (rst = '0') then
			count := 0;
		elsif (clk'EVENT and clk = '1') then
			count := count + 1;
			
			if (count > 999) then
				count := 0;
			end if;
		end if;
		
		hundredth <= count / 100;
		tenth <= (count mod 100) / 10;
		unit <= (count mod 100) mod 10;
	end process;
end architecture;
