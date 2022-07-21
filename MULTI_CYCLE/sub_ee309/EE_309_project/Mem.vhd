library ieee;
use ieee.std_logic_1164.all;
use ieee.math_real.all;
use ieee.numeric_std.all;

entity Mem is
port (	
	rst, clk, MW, MR: in std_logic;
	addr, WD : in std_logic_vector (15 downto 0);
	RD: out std_logic_vector (15 downto 0)
	);
end entity;

architecture Mem_logic of Mem is
	
type memtype is array(0 to 3) of std_logic_vector(15 downto 0);
signal ram_block : memtype;

begin
    process (clk)
    begin
        if (rising_edge(clk)) then
            if rst ='1' then
                ram_block(0) <= "0001100011110000";
				ram_block(1) <= "1011000001010001";
				
            else
                if (MW = '1') then
                    ram_block(to_integer(unsigned(addr))) <= WD;
                end if;
                if (MR = '1') then
                    RD <= ram_block(to_integer(unsigned(addr)));
                end if;
            end if;
        end if;
    end process;
end architecture;