library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity op_seg_display is
port(
    x: in std_logic;
	 y: out std_logic_vector(0 to 6)
);
end entity;

architecture arq of op_seg_display is
begin
	y <= 	not("0110001") when x = '1' else
			not("0000001");
end architecture;