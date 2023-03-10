library ieee;
use ieee.std_logic_1164.all;

entity comparator is
port(
    a, b: in std_logic;
    x: out std_logic
);
end comparator;

architecture arq of comparator is
begin
    x <= (not a and not b) or (a and b);
end arq