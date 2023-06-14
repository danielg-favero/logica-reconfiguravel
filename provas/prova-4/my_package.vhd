library ieee;
use ieee.std_logic_1164.all;

package my_package is
	component clock is
		port(
			freq: in integer;
			main_clk, rst: in std_logic;
			clk: out std_logic
		);
	end component;
	
	component freq_sel is
	port(
		sw_freq: in std_logic_vector(1 downto 0);
		freq: out integer
	);
	end component;
	
	component counter is 
	port(
		clk, rst: in std_logic;
		unit, tenth, hundredth: out integer
	);
	end component;
	
	component seven_seg_disp is 
	port(
		n: in integer range 0 to 9;
		disp: out std_logic_vector(0 to 6)
	);
	end component;
end package;