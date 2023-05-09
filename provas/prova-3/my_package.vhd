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
	 
	 component adder is
		generic(N: integer := 4);
		port(
			 a, b: in std_logic_vector((N - 1) downto 0);
			 y: out std_logic_vector(N downto 0)
		);
    end component;
	 
	 component subtractor is
		generic(N: integer := 4);
		port(
			 a, b: in std_logic_vector((N - 1) downto 0);
			 y: out std_logic_vector(N downto 0)
		);
    end component;
	 
	 component op_seg_display is
		port(
			 x: in std_logic;
			 y: out std_logic_vector(0 to 6)
		);
    end component;
	 
	 component out_seg_display is
		generic(N: integer := 4);
		port(
			 x: in std_logic_vector(N downto 0);
			 op: in std_logic;
			 s1: out std_logic_vector(0 to 6);
			 s2: out std_logic_vector(0 to 6)
		);
    end component;
end package;