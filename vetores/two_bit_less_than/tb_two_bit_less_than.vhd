library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_two_bit_less_than is
end entity;

architecture arq of tb_two_bit_less_than is
	signal ta, tb: std_logic_vector(1 downto 0);
	signal ts: std_logic;
begin
	uut: entity work.two_bit_less_than(arq)
	
	port map(ta, tb, ts);
	
	process
		variable i, j: integer := 0;
	begin
		for i in 0 to 3 loop
			for j in 0 to 3 loop
				ta <= std_logic_vector(to_unsigned(i, 2));
				tb <= std_logic_vector(to_unsigned(j, 2));
				wait for 10 ns;
			end loop;
		end loop;
	end process;
	
end architecture;