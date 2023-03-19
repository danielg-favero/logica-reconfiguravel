library ieee;
use ieee.std_logic_1164.all;

entity half_adder is
port (
    a, b: in std_logic;
    s, c: out std_logic
);
end half_adder;

architecture arq of half_adder is
begin
    s <= (not A and B) or (A and not B);
    c <= a and b;
end arq;