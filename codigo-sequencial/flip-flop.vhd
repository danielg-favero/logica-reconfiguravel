library ieee;
use ieee.std_logic_1164.all;

entity ff_d id
port (
    clk, d, reset: in std_logic;
    q: out std_logic;
);
end entity;

architecture arq of ff_d is
begin
    process(clk, d)
    begin 
        if (reset = '1') then q <= '0';
        elsif (clk'event and clk = '1') then q <= d;
        end if;
    end process;
end architecture;