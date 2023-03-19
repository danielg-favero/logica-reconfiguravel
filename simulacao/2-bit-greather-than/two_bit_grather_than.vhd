library ieee;
use ieee.std_logic_1164.all;

entity two_bit_grather_than is
port(
	a1, a2, b1, b2: in std_logic;
	x, y, z: out std_logic
);
end entity;

-- Tabela verdade do circuito greather than
-- A1	A2	B1	B2	X(A>B)	Y(A=B)	z(A<B)	
-- 0	0	0	0		0			1			0
-- 0	0	0	1		0			0			1
-- 0	0	1	0		0			0			1
-- 0	0	1	1		0			0			1
-- 0	1	0	0		1			0			0
-- 0	1	0	1		0			1			0
-- 0	1	1	0		0			0			1
-- 0	1	1	1		0			0			1
-- 1	0	0	0		1			0			0
-- 1	0	0	1		1			0			0
-- 1	0	1	0		0			1			0
-- 1	0	1	1		0			0			1
-- 1	1	0	0		1			0			0
-- 1	1	0	1		1			0			0
-- 1	1	1	0		1			0			0
-- 1	1	1	1		0			1			0

-- X = A1B1' + A2B1'B2' + A1A2B2'
-- Y = A1'A2'B1'B2' + A1'A2B1'B2	+ A1A2B1B2 + A1A2'B1B2'
-- Z = A1'B1 + A2'B1B2 + A1'A2'B2

architecture arq of two_bit_grather_than is
begin
	x <= (a1 and not b1) or (a2 and not b1 and not b2) or (a1 and a2 and not b2);
	y <= (not a1 and not a2 and not b1 and not b2) or (not a1 and a2 and not b1 and b2) or (a1 and a2 and b1 and b2) or (a1 and not a2 and b1 and not b2);
	z <= (not a1 and b1) or (not a2 and b1 and b2) or (not a1 and not a2 and b2);
end architecture;