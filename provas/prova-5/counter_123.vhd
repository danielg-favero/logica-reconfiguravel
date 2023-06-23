library ieee;
use ieee.std_logic_1164.all;

entity counter_123 is
port (
	clk, rst: in std_logic;
	x: in std_logic_vector(1 downto 0);
	y: out std_logic_vector(1 downto 0)
);
end entity;

architecture arq of counter_123 is
	type state is (zero, one, two, three);
	signal current_state, next_state: state;
	
	constant N: integer 					:= 50_000_000;
	constant one_second: integer 		:= N;
	constant three_seconds: integer 	:= 3 * N;

	signal not_x: std_logic_vector(1 downto 0);
	signal not_rst: std_logic;
	signal current_time: integer range 0 to three_seconds;
begin
	-- Os push botão é ativo na borda de decida
	not_x <= not(x);
	not_rst <= not(rst);

	process (clk, rst)
		variable count: integer range 0 to three_seconds;
	begin
		if(not_rst = '1') then
			current_state <= zero;
			count := 0;
		elsif (clk'EVENT and clk = '1') then
			count := count + 1;
			
			if(count >= current_time) then
				current_state <= next_state;
				count := 0;
			end if;
		end if;
	end process;
	
	process (current_state, not_x)
	begin
		case current_state is
			when zero =>
				y <= "00";
				current_time <= 1;
				
				if(not_x = "01") then
					next_state <= one;
				else 
					next_state <= zero;
				end if;
			when one =>
				y <= "01";

				if(not_x = "01") then
					current_time <= one_second;
				elsif (not_x = "10") then
					next_state <= two;
					current_time <= one_second;
				else
					next_state <= zero;
					current_time <= three_seconds;
				end if;
			when two =>
				y <= "10";
				
				if (not_x = "11") then
					next_state <= three;
					current_time <= one_second;
				elsif (not_x = "01") then
					next_state <= one;
					current_time <= one_second;
				else
					next_state <= zero;
					current_time <= three_seconds;
				end if;
			when three =>
				y <= "11";
				
				if(not_x = "01") then
					next_state <= one;
					current_time <= one_second;
				else 
					current_time <= three_seconds;
					next_state <= zero;
				end if;
			end case;
	end process;
end architecture;