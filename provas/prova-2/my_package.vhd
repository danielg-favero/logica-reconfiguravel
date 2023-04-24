library ieee;
use ieee.std_logic_1164.all;

package my_package is
    component seven_seg_display is
		generic(N: integer := 4);
		port(
			 x: in std_logic_vector((N - 1) downto 0);
			 y: out std_logic_vector(0 to 6)
		);
    end component;
end package;