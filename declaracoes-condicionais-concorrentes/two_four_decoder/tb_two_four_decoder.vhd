library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_two_four_decoder is
end entity;

architecture arq of tb_two_four_decoder is
	signal ta: std_logic_vector(1 downto 0);
	signal ten: std_logic;
	signal ty: std_logic_vector(3 downto 0);
begin
	uut: entity work.two_four_decoder(arq)
	
	port map(ta, ten, ty);
	
	process
		variable i: integer := 0;
	begin
		ten <= '0';
		for i in 0 to 3 loop
			ta <= std_logic_vector(to_unsigned(i, 2));
			wait for 10 ns;
		end loop;
		
		ten <= '1';
		for i in 0 to 3 loop
			ta <= std_logic_vector(to_unsigned(i, 2));
			wait for 10 ns;
		end loop;
	end process;
end architecture;