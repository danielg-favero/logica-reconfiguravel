library ieee;
use ieee.std_logic_1164.all;

entity multiplexer is
port(
	i0, i1, i2, i3, a0, a1: in std_logic;
	s: out std_logic
);
end entity;

-- Tabela verdade do multiplexador
-- a0 a1 s
-- 0	0	i0
-- 0	1  i1
-- 1	0	i2
-- 1	1	i3

-- s = a0'a1'i0 + a0'a1i1 + a0a1'i2 + a0a1i3

architecture arq of multiplexer is
signal s0, s1, s2, s3: std_logic;
begin
	s0 <= not a0 and not a1 and i0;
	s1 <= not a0 and a1 and i1;
	s2 <= a0  and not a1 and i2;
	s3 <= a0 and a1 and i3;
	
	s <= s0 or s1 or s2 or s3;
end architecture;