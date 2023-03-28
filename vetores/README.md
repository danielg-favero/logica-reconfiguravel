# Vetores

é o tipo de dado denominado `std_logic_vector`. É ideal para ser usado com estruturas que estão organizadas em agrupamentos.

## Exemplo 1

### Arquivo de implementação

```vhdl
entity gt_2b is
port(
    a, b: in std_logic_vector(1 downto 0);
    y: out std_logic
);
end gt_2b;

architecutre arq of gt_2b is
    signal s0, s1, s2: std_logic;
begin
    s0 <= a(1) and not b(1);
    s1 <= a(0) and not b(1) and not b(0);
    s2 <= a(1) and a(0) and not b(0);

    y <= s0 or s1 or s2;
end arq;
```

### Arquivo Testbench

```vhdl
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_gt_2b is
end tb_gt_2b;

architecture arq of tb_gt_2b is
    signal ta, tb: std_logic_vector(1 downto 0);
    signal ty: std_logic;
begin
    uut: entity work.gt_2b(arq)

    port map(ta, tb, ty);

    process
        variable i, j: integer := 0;
    begin
        for i in 0 to 3 loop
            for j in 0 to 3 loop
                ta <= std_logic_vector(to_unsigned(i, 2));
                tb <= std_logic_vector(to_unsigned(j, 2));
                wait for 10 ns;
            end loop;
        end loop;
    end process;
end arq;
```

> i e j são variáveis, diferente de ta, tb e ty que são sinais

## Atribuições com vetores

```vhdl
signal a1: std_logic;
signal s4: std_logic_vector(3 downto 0);
signal b8, c8, d8: std_logic(7 downto 0);

a1 <= '1';
a4 <= "1010";

-- Concatenação: "10101010"
b8 <= a4 & a4; 

-- Concatenação: "11101000"
c8 <= a1 & a1 & a4 & "00"; 

-- Receber partes de cada vetor
d8 <= b8(3 downto 0) & c8(7 downto 4);

-- Receber partes de cada vetor
a20 <= b8(3 downto 0) & c8(3 downto 0) & "111111111111";

-- Preencher todo o vetor
a20 <= "00000000000000000000";
-- ou...
a20 <= (others => '0');
```

## Operações com vetores

```vhdl
-- a ** b: exponenciação
-- a * b: multiplicação
-- a / b: divisão
-- a + b: adição
-- a - b: subtração
-- a & b: concatenação
-- a = b: igual á
-- a /= b: não igual á
-- a < b: menor que
-- a <= b: menor ou igual a
```

# Tipos Signed e Unsigned

Tem a mesma "aparência" que um vetor do tipo *std_logic_vector*, porém admitem operações aritméticas, sendo *signed* **com sinal** e *unsigned* **sem sinal**. Portanto, **podemos somar dois vetores signed ou unsigned**

## Função *to_unsigned*

Transforma um inteiro em um vetor *unsigned*. O inteiro declarado no primeiro argumento será convertido em um vetor unsigned com um número de bits igual ao segundo argumento.

```vhdl
    to_unsigned(int, numbits)
```

## Função *std_logic_vector*

Transforma um vetor unsigned ou signed em um vetor *std_logic_vector*.

## Exemplo 3

```vhdl
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity somador_2b is
port (
    a, b: in std_logic_vector(1 downto 0);
    s: out std_logic_vector(2 downto 0);
);
end entity;

architecture arq of somador_2b is
    signal ia, ib: integer range 0 to 3;
begin
    ia <= to_integer(unsigned(a));
    ib <= to_integer(unsigned(b));

    s <= std_logic_vector(to_unsigned(ia + ib, 3));
end architecture;

```