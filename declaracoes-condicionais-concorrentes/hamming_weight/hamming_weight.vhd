library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity hamming_weight is 
generic(
	n: integer := 4
);
port(
	a: in std_logic_vector((n - 1) downto 0);
	y: out integer range 0 to n
);
end entity;

architecture arq of hamming_weight is
	type integer_array is array (n - 1 downto 0) of integer range 0 to n;
	signal one_detector, ones: integer_array;
begin
	-- Preencher o vetor de detecção de números 1's
	detect_ones: for i in 0 to n - 1 generate
		one_detector(i) <= 1 when a(i) = '1' else 0;
	end generate;
	
	-- O Vetor 'ones' é responsável por acumular a quantidade de 1's do vetor 'one_detector' do último para a primeira posição do vetor
	ones(n - 1) <= one_detector(n - 1);
	
	count_ones: for i in n - 2 downto 0 generate
		ones(i) <= ones(i + 1) + one_detector(i);
	end generate;
	
	-- O número de zeros se encontra na primeira posição do vetor 'ones'
	y <= ones(0);
end architecture;