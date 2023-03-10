# VHDL

Abreviação para *[V]ery High Speed Integrated Circuit [H]ardware [D]escription [L]anguage*

## Partes constituintes de um código VHDL

- Bibliotecas
- Entity
- Architecture

### Exemplo 1

Porta `AND` de 3 entradas e uma saída

```vhdl
-- Bibliotecas
library ieee;
use ieee.std_logic_1164.all;

-- Entity
entity and_port is
port(
    a, b, c: in std_logic;
    x: out std_logic
);
end and_port;

-- Architecture
architecture arq of and_port is
begin
    x <= a and b and c;
end arq;
```

### Exemplo 2

```vhdl
library ieee;
use ieee.std_logic_1164.all;

entity basic_ccto is 
port(
    a, b, c: in std_logic;
    x: out std_logic
);
end basic_ccto;

architecture arq of basic_ccto is
begin
    x <= not (not (a) or not (b)) and b and c;
end arq;
```

Podemos reescrever o código de uma maneira mais limpa e menos complicada


```vhdl
library ieee;
use ieee.std_logic_1164.all;

entity basic_ccto is 
port(
    a, b, c: in std_logic;
    x: out std_logic
);
end basic_ccto;

architecture arq of basic_ccto is
signal s0, s1, s2, s3: std_logic;
begin
    s0 <= not a;
    s1 <= not b;
    s2 <= s0 or s1;
    s3 <= not s2;

    x <= s3 and b and c;
end arq;
```

### Exemplo 4