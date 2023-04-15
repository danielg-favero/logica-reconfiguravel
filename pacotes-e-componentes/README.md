# Pacotes e Componentes

Em geral um projeto que utiliza pacotes e componentes usa a seguinte estrutura:

### Exemplo 1

Construindo um multiplexador 4x2 com 2 2x1.

- top.vhd: top level entity

```vhdl
library ieee;
use ieee.std_logic_1164.all;
use work.meu_pacote.all;

entity top is
port(
    a: in std_logic_vector(1 downto 0);
    i: in std_logic_vector(3 downto 0);
    y: out std_logic
);
end entity;

architecture arq of top is
begin
    map_1: entity work.mux_2x1(arq)
           port map(a(0), i(1 downto 0), s(0));

    map_2: entity work.mux_2x1(arq)
           port map((a0), i(3 downto 2), s(1));

    map_3: entity work.mux_2x1(arq)
           port (a(1), s, y);
end architecture;
```

- meu_pacote.vhd: apenas as definições do componente (entity)

```vhdl
library ieee;
use ieee.std_logic_1164.all;

package meu_pacote is
    component mux_2x1 is
        port(
            a: in std_logic_vector(1 downto 0);
            i: in std_logic_vector(3 downto 0);
            y: out std_logic
        );
    end component;
end package;
```

- component_1.vhd: entity + architecture

```vhdl
library ieee;
use ieee.std_logic_1164.all;

entity mux_2x1 is
port(
    a: in std_logic_vector(1 downto 0);
    i: in std_logic_vector(3 downto 0);
    y: out std_logic
);
end entity;

architecture arq of mux_2x1 is
begin
end architecture;
```