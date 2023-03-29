library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_equation is
end entity;

architecture arq of tb_equation is
	signal ta, tb: std_logic_vector(2 downto 0);
	signal ty: std_logic_vector(6 downto 0);
begin
	uut: entity work.equation(arq)
	
	port map(ta, tb, ty);
	
	process 
		variable i, j: integer := 0;
	begin
		for i in 0 to 7 loop
			for j in 0 to 7 loop
				ta <= std_logic_vector(to_unsigned(i, 3));
				tb <= std_logic_vector(to_unsigned(j, 3));
				wait for 10 ns;
			end loop;
		end loop;
	end process;
end architecture;