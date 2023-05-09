library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_sum_adder is
generic(N: integer := 3);
end entity;

architecture arq of tb_sum_adder is
	signal ta, tb: std_logic_vector((N - 1) downto 0);
	signal top: std_logic;
	signal ty: std_logic_vector(N downto 0);
begin

	uut: entity work.sum_adder(arq)
	generic map(N)
	port map(ta, tb, top, ty);
	
	process
		variable i, j: integer range 0 to 2 ** N - 1;
		variable k: std_logic;
	begin
		top <= '1';
		
		for i in 0 to 2 ** n - 1 loop
			for j in 0 to 2 ** n - 1 loop
				ta <= std_logic_vector(to_unsigned(i, n));
				tb <= std_logic_vector(to_unsigned(j, n));
				wait for 10 ns;
			end loop;
		end loop;
		
		top <= '0';
		
		for i in 0 to 2 ** n - 1 loop
			for j in 0 to 2 ** n - 1 loop
				ta <= std_logic_vector(to_signed(i, n));
				tb <= std_logic_vector(to_signed(j, n));
				wait for 10 ns;
			end loop;
		end loop;
	end process;
	
end architecture;