library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_with_select_multiplexer is
end entity;

architecture arq of tb_with_select_multiplexer is
	signal ta: std_logic_vector(1 downto 0);
	signal ti: std_logic_Vector(3 downto 0);
	signal ty: std_logic;
begin
	uut: entity work.with_select_multiplexer(arq)
	
	port map(ta, ti, ty);
	
	process
		variable i, j: integer := 0;
	begin
		for i in 0 to 15 loop
			for j in 0 to 3 loop
				ta <= std_logic_vector(to_unsigned(j, 2));
				ti <= std_logic_vector(to_unsigned(i, 4));
				wait for 10 ns;
			end loop;
		end loop;
	end process;
end architecture;