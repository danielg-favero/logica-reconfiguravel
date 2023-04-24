library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.my_package.all;

entity barrel_shifter is
generic(N: integer := 4);
port(
	x: in std_logic_vector((N - 1) downto 0);
	y: out std_logic_vector((N - 1) downto 0);
	x_led: out std_logic_vector((N - 1) downto 0);
	x_7seg: out std_logic_vector(0 to 6);
	y_7seg: out std_logic_vector(0 to 6)
);
end entity;

architecture arq of barrel_shifter is
	type integer_array is array ((N - 1) downto 0) of integer range 0 to n;
	signal one_detector, ones: integer_array;
	signal number_of_ones: integer := 0;
	signal ordered_array: std_logic_vector((N - 1) downto 0);
begin
	-- Preencher o vetor de detecção de números 1's
	detect_ones: for i in 0 to N - 1 generate
		one_detector(i) <= 1 when x(i) = '1' else 0;
	end generate;
	
	-- O Vetor 'ones' é responsável por acumular a quantidade de 1's do vetor 'one_detector' do último para a primeira posição do vetor
	ones(N - 1) <= one_detector(N - 1);
	
	count_ones: for i in N - 2 downto 0 generate
		ones(i) <= ones(i + 1) + one_detector(i);
	end generate;
	
	number_of_ones <= ones(0);
	
	order_vector: for i in N - 1 downto 0 generate
		ordered_array(i) <= '1' when i >= N - number_of_ones else '0';
	end generate;
	
	-- Exibir Conteúdo de X
	x_7seg_map: entity work.seven_seg_display(arq)
	generic map(N)
   port map(x, x_7seg);
	
	x_led <= x;
	
	-- Exibir Conteúdo de y
	y_7seg_map: entity work.seven_seg_display(arq)
	generic map(N)
   port map(ordered_array, y_7seg);
	
	y <= ordered_array;

end architecture;
