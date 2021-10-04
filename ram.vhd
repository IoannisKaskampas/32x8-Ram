LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY RAM IS
    PORT (clk: IN std_logic;
          address: IN integer range 0 to 4;
          wr: IN std_logic;
          dataIN: IN std_logic_vector(7 downto 0);
          dataOUT: OUT std_logic_vector(7 downto 0));
END RAM;

ARCHITECTURE dataflow OF RAM IS
TYPE memory IS ARRAY (0 to 31) OF STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL myram: memory;
ATTRIBUTE ram_init_file: STRING;
ATTRIBUTE ram_init_file OF myram: SIGNAL IS "ram.cgf";
    BEGIN
        PROCESS (clk)
        BEGIN
            IF rising_edge(clk) THEN
                IF (wr='1') THEN
                    myram(address) <= dataIN;
                END IF;
            END IF;
        END PROCESS;
    dataOUT <= myram(address);
END dataflow;