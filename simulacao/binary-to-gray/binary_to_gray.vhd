library ieee;
use ieee.std_logic_1164.all;

entity binary_to_gray is
port(
	a1, a2, a3: in std_logic;
	x, y, z: out std_logic
);
end entity;

-- Tabela verdade
-- a1	a2	a3	x	y	z
-- 0	0	0	0	0	0
-- 0	0	1	0	0	1
-- 0	1	0	0	1	1
-- 0	1	1	0	1	0
--	1	0	0	1	1	0
-- 1	0	1	1	1	1
-- 1	1	0	1	0	1
-- 1	1	1	1	0	0

-- x = a1
-- y = a1a2' + a1'a2
-- z = a2a3' + a2'a3


architecture arq of binary_to_gray is
begin
	x <= a1;
	y <= (a1 and not a2) or (not a1 and a2);
	z <= (a2 and not a3) or (not a2 and a3);
end architecture;