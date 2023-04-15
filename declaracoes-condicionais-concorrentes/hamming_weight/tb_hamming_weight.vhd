library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_hamming_weight is
	generic(n: integer := 4);
end entity;

architecture arq of tb_hamming_weight is
	signal ta: std_logic_vector((n - 1) downto 0);
	signal ty: integer;
begin
	uut: entity work.hamming_weight(arq)
	generic map(n)
	port map(ta, ty);
	
	process
		variable i: integer range 0 to 2 ** n - 1;
	begin
		for i in 0 to 2 ** n - 1 loop
			ta <= std_logic_vector(to_unsigned(i, n));
			wait for 10 ns;
		end loop;
	end process;
end architecture;