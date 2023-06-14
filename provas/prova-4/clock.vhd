library ieee;
use ieee.std_logic_1164.all;

entity clock is
port(
	freq: in integer;
	main_clk, rst: in std_logic;
	clk: out std_logic
);
end entity;

architecture arq of clock is
	constant N: integer := 50_000_000;
begin
	process(main_clk, rst)
        variable i: integer range 1 to N := 1;
        variable v_clk: std_logic := '0';
    begin
        if(rst = '0') then 
            i := 1;
            v_clk := '0';
        elsif (main_clk'EVENT and main_clk = '1') then
            i := i + 1;
	
            if (i = N / (2 * freq)) then
                i := 1;
                v_clk := not(v_clk);
            end if;

            clk <= v_clk;
        end if;
    end process;
end architecture;