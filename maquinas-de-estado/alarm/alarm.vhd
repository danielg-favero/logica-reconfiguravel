library ieee;
use ieee.std_logic_1164.all;

entity alarm is
port (
    sensor, remote: in std_logic;
    clk, rst: in std_logic;
    siren, status: out std_logic;
);
end entity;

architecture arq of alarm is
    type states is (desarmed, armed, invasion);
    signal pr_st, nx_st: states;
begin
    process(rst, clk)
    begin
        if(rst = '1') then
            pr_st <= desarmed;
        elsif (clk'EVENT and clk = '1') then
            pr_st <= nx_st;
        end if;
    end process;

    ...
end architecture;