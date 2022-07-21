library IEEE;
use IEEE.STD_LOGIC_1164.all;
 
entity MUX_4_3BIT is
 	generic(input_width: integer := 3);
	port(
			A, B, C, D: in std_logic_vector(input_width-1 downto 0) := (others => '0');
			S1,S0: in std_logic;
			Z: out std_logic_vector(input_width-1 downto 0));
end entity;
 
architecture MUX4 of MUX_4_3BIT is
begin
process (A,B,C,D,S1,S0) is
begin
  if (S0 ='0' and S1 = '0') then
      Z <= A;
  elsif (S0 ='0' and S1 = '1') then
      Z <= B;
  elsif (S0 ='1' and S1 = '0') then
      Z <= C;
  else
      Z <= D;
  end if;
end process;
end architecture;

