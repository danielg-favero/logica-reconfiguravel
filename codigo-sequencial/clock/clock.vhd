library ieee;
use ieee.std_logic_1164.all;

entity ccto is
    port(
        main_clk, reset: in std_logic; -- Entra-se com o clock de 50MHz
        clk: out std_logic; -- Sai com um clock de frequência variada
    );
end entity;

architecture arq of ccto is
    constant N: integer := 50_000_000;
begin
    process(main_clk, reset)
        variable i: integer range 1 to N := 1;
        variable v_clk: std_logic := '0';
    begin
        if(reset = '0') then 
            i := 1;
            v_clk := '0';
        elsif (main_clk'event and main_clk = '1') then
            i := i + 1;

            -- N / 2 -> 1Hz
            -- N / 4 -> 2Hz
            -- N / 8 -> 4Hz
            if (i = N / 2) then
                i := 1;
                v_clk := not(v_clk);
            end if;

            clk <= v_clk;
        end if;
    end process;
end architecture;