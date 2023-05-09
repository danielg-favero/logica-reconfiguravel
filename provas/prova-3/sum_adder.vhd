-- Cinglair Augusto Capello (2157110)
-- Daniel Gustavo Favero (2157128)

-- P3 LÓGICA RECONFIGURÁVEL

library ieee;
use ieee.std_logic_1164.all;
use work.my_package.all;

entity sum_adder is
generic(N: integer := 3);
port(
	a, b: in std_logic_vector((N - 1) downto 0);
	op: in std_logic;
	y: out std_logic_vector(N downto 0);
	a_7seg: out std_logic_vector(0 to 6);
	b_7seg: out std_logic_vector(0 to 6);
	op_7seg: out std_logic_vector(0 to 6);
	y1_7seg: out std_logic_vector(0 to 6);
	y2_7seg: out std_logic_vector(0 to 6)
);
end entity;

architecture arq of sum_adder is
	signal add, subtract: std_logic_vector(N downto 0);
	signal output: std_logic_vector(N downto 0);
begin

	adder: entity work.adder(arq)
	generic map(N)
   port map(a, b, add);
	
	subtractor: entity work.subtractor(arq)
	generic map(N)
   port map(a, b, subtract);
	
	multiplexer: entity work.multiplexer(arq)
	generic map(N)
	port map(add, subtract, op, output);
	
	-- Exibir entrada A
	a_7seg_map: entity work.seven_seg_display(arq)
	generic map(N)
   port map(a, a_7seg);
	
	-- Exibir entrada B
	b_7seg_map: entity work.seven_seg_display(arq)
	generic map(N)
   port map(b, b_7seg);
	
	-- Exibir operação
	op_seg_map: entity work.op_seg_display(arq)
   port map(op, op_7seg);
	
	-- Exibir Saída
	y_7seg_map: entity work.out_seg_display(arq)
	generic map(N)
   port map(output, op, y1_7seg, y2_7seg);
	
	y <= output;
	
end architecture;