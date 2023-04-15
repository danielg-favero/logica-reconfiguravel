library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_generic_subtractor is
	generic(n: integer := 3);
end entity;

architecture arq of tb_generic_subtractor is
	signal ta, tb: std_logic_vector((n - 1) downto 0);
	signal ty: std_logic_vector(n downto 0);
begin
	uut: entity work.generic_subtractor(arq)
	generic map(n)
	port map(ta, tb, ty);
	
	process
		variable i, j: integer;
	begin
		for i in 0 to 2 ** n - 1 loop
			for j in 0 to 2 ** n - 1 loop
				ta <= std_logic_vector(to_unsigned(i, n));
				tb <= std_logic_vector(to_unsigned(j, n));
				wait for 10 ns;
			end loop;
		end loop;
	end process;
end architecture;