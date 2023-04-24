library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity barrel_shifter is
generic(N: integer := 4);
port(
	x: in std_logic_vector((N - 1) downto 0);
	y: out std_logic_vector((N - 1) downto 0)
);
end entity;

architecture arq of barrel_shifter is
	type integer_array is array ((N - 1) downto 0) of integer range 0 to n;
	signal one_detector, ones: integer_array;
	signal number_of_ones: integer := 0;
	signal ordered_array, ones_array, zeros_array: std_logic_vector((N - 1) downto 0);
begin
	-- Preencher o vetor de detecção de números 1's
	detect_ones: for i in 0 to N - 1 generate
		one_detector(i) <= 1 when x(i) = '1' else 0;
	end generate;
	
	-- O Vetor 'ones' é responsável por acumular a quantidade de 1's do vetor 'one_detector' do último para a primeira posição do vetor
	ones(N - 1) <= one_detector(N - 1);
	
	-- Acumular a quantidade de 1's na primeira posição do vetor
	count_ones: for i in N - 2 downto 0 generate
		ones(i) <= ones(i + 1) + one_detector(i);
	end generate;
	
	number_of_ones <= ones(0);
	
	-- Utilizar a quantidade 1's para ordenar o vetor
	order_vector: for i in N - 1 downto 0 generate
		y(i) <= '1' when i >= N - number_of_ones else '0';
	end generate;
end architecture;
