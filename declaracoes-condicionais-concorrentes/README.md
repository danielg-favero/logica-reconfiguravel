# Declarações condicionais concorrentes

## When / Else

Similar ao if / else

### Exemplo 1

```vhdl
sinal <= expressao_valor_1 when condicao_1 else
         expressao_valor_2 when condicao_2 else
         .
         .
         .
         expressao_valor_n;
```

### Exemplo 2

```vhdl
sinal <= a or b or c when d = e else
         .
         .
         .
```

### Exemplo 3

```vhdl
entity address_decoder is
port(
    x: in bit_vector(1 downto 0);
    y: out bit_vector(3 downto 0)
);
end address_decoder;

architecture address_decoder of address_decoder is
begin
    y <= "0001" when x = "00" else
         "0010" when x = "01" else
         "0100" when x = "10" else
         "1000";
end address_decoder;
```

## With / Select

Similar ao Switch / Case

### Exemplo 1

```vhdl
with sinal_select select
    sinal <= exp_val_1 when escolha_1,
            exp_val_2 when escolha_2,
            .
            .
            .
            exp_val_n when others;
```

> With só admite sinais, não expressões.

# Generic

### Exemplo 1

```vhdl
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity address_decoder is
    generic (n: integer := 3);
    port(
        x: in std_logic_vector((n - 1) downto 0)
        y: out std_logic_vector((2 ** n) - 1 down to 0)
    );
end entity;

architecture address_decoder of address_decoder is
begin
    gen: for i in y'range generate
        y(i) <= '1' when ((std_logic_vector(to_unsigned(i , n))) = x) else '0';
    end generate;
end achitecture;
```

```vhdl
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_ccto is
    generic(n : integer := 3);
end entity;

architecture arq of tb_ccto is
    signal tx: std_logic_vector((n-1) downto 0);
    signal ty: std_logic_vector((2 ** n) - 1 down to 0);
begin
    uut: entity work.address_decoder(address_decoder)

    port map(tx, ty);

    process
        variable i: integer;
    begin
        for i in 0 to 2 ** n - 1 loop
            tx <= std_logic_vector(to_unsigned(1 , n));
            wait for 10 ns;
        end loop;
    end process
```

### Exemplo 2

Circuito Zero-Weight

```vhdl
library ieee;
use ieee.std_logic_1164.all;

entity zero_weight is
    generic(n: integer := 4);
    port(
        x: in std_logic_vector(n - 1 downto 0);
        y: out integer range 0 to n
    );
end entity;

architecture arq of zero_weight is
    type vet_int is array (n - 1 downto 0) of integer range 0 to n;
    signal zero_det, zeros: vet_int;
begin
    gen_1: for i in 0 to n - 1 generate
        zero_det(i) <= when x(i) = '0' else 0;
    end generate;

    zeros(n - 1) <= zero_det(n - 1);

    gen_2: for i in n - 2 downto 0 generate
        zeros(i) <= zeros(i + 1) + zero_det(i);
    end generate;

    y <= zeros(0);
end architecture;
```