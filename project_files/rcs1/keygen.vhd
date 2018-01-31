----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:50:14 12/20/2017 
-- Design Name: 
-- Module Name:    keygen - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity keygen is
    Port ( round_counter : in  STD_LOGIC_VECTOR (3 downto 0);
           Key : in  STD_LOGIC_VECTOR (127 downto 0);
           Z1 : out  STD_LOGIC_VECTOR (15 downto 0);
           Z2 : out  STD_LOGIC_VECTOR (15 downto 0);
           Z3 : out  STD_LOGIC_VECTOR (15 downto 0);
           Z4 : out  STD_LOGIC_VECTOR (15 downto 0);
           Z5 : out  STD_LOGIC_VECTOR (15 downto 0);
           Z6 : out  STD_LOGIC_VECTOR (15 downto 0));
end keygen;

architecture Behavioral of keygen is

begin
	process(Key,round_counter)
	
	variable temp_key : std_logic_vector(127 downto 0);
	
	begin
	
	temp_key := Key;
	
	case round_counter is
	
	when "0000" =>
		
		temp_key := Key;
		Z1 <= temp_key(127 downto 112);
		Z2 <= temp_key(111 downto 96);
		Z3 <= temp_key(95 downto 80);
		Z4 <= temp_key(79 downto 64);
		Z5 <= temp_key(63 downto 48);
		Z6 <= temp_key(47 downto 32);
		
	when "0001" =>
		
		Z1 <= temp_key(31 downto 16);
		Z2 <= temp_key(15 downto 0);
		temp_key := Key(102 downto 0) & Key(127 downto 103);
		Z3 <= temp_key(127 downto 112);
		Z4 <= temp_key(111 downto 96);
		Z5 <= temp_key(95 downto 80);
		Z6 <= temp_key(79 downto 64);
		
	when "0010" =>
		
		temp_key := Key(102 downto 0) & Key(127 downto 103);
		Z1 <= temp_key(63 downto 48);
		Z2 <= temp_key(47 downto 32);
		Z3 <= temp_key(31 downto 16);
		Z4 <= temp_key(15 downto 0);
		temp_key := temp_key(102 downto 0) & temp_key(127 downto 103);
		Z5 <= temp_key(127 downto 112);
		Z6 <= temp_key(111 downto 96);	
		
	when "0011" =>
		
		temp_key := Key(102 downto 0) & Key(127 downto 103);
		temp_key := temp_key(102 downto 0) & temp_key(127 downto 103);
		Z1 <= temp_key(95 downto 80);
		Z2 <= temp_key(79 downto 64);
		Z3 <= temp_key(63 downto 48);
		Z4 <= temp_key(47 downto 32);
		Z5 <= temp_key(31 downto 16);
		Z6 <= temp_key(15 downto 0);
	
	when "0100" =>
		
		temp_key := Key(102 downto 0) & Key(127 downto 103);
		temp_key := temp_key(102 downto 0) & temp_key(127 downto 103);
		temp_key := temp_key(102 downto 0) & temp_key(127 downto 103);
		Z1 <= temp_key(127 downto 112);
		Z2 <= temp_key(111 downto 96);
		Z3 <= temp_key(95 downto 80);
		Z4 <= temp_key(79 downto 64);
		Z5 <= temp_key(63 downto 48);
		Z6 <= temp_key(47 downto 32);
		
	when "0101" =>
		
		temp_key := Key(102 downto 0) & Key(127 downto 103);
		temp_key := temp_key(102 downto 0) & temp_key(127 downto 103);
		temp_key := temp_key(102 downto 0) & temp_key(127 downto 103);
		Z1 <= temp_key(31 downto 16);
		Z2 <= temp_key(15 downto 0);
		temp_key := temp_key(102 downto 0) & temp_key(127 downto 103);
		Z3 <= temp_key(127 downto 112);
		Z4 <= temp_key(111 downto 96);
		Z5 <= temp_key(95 downto 80);
		Z6 <= temp_key(79 downto 64);
		
	when "0110" =>
		
		temp_key := Key(102 downto 0) & Key(127 downto 103);
		temp_key := temp_key(102 downto 0) & temp_key(127 downto 103);
		temp_key := temp_key(102 downto 0) & temp_key(127 downto 103);
		temp_key := temp_key(102 downto 0) & temp_key(127 downto 103);
		Z1 <= temp_key(63 downto 48);
		Z2 <= temp_key(47 downto 32);
		Z3 <= temp_key(31 downto 16);
		Z4 <= temp_key(15 downto 0);
		temp_key := temp_key(102 downto 0) & temp_key(127 downto 103);
		Z5 <= temp_key(127 downto 112);
		Z6 <= temp_key(111 downto 96);
	
	when "0111" =>
		
		temp_key := Key(102 downto 0) & Key(127 downto 103);
		temp_key := temp_key(102 downto 0) & temp_key(127 downto 103);
		temp_key := temp_key(102 downto 0) & temp_key(127 downto 103);
		temp_key := temp_key(102 downto 0) & temp_key(127 downto 103);
		temp_key := temp_key(102 downto 0) & temp_key(127 downto 103);
		Z1 <= temp_key(95 downto 80);
		Z2 <= temp_key(79 downto 64);
		Z3 <= temp_key(63 downto 48);
		Z4 <= temp_key(47 downto 32);
		Z5 <= temp_key(31 downto 16);
		Z6 <= temp_key(15 downto 0);
		
	when "1000" =>
		
		temp_key := Key(102 downto 0) & Key(127 downto 103);
		temp_key := temp_key(102 downto 0) & temp_key(127 downto 103);
		temp_key := temp_key(102 downto 0) & temp_key(127 downto 103);
		temp_key := temp_key(102 downto 0) & temp_key(127 downto 103);
		temp_key := temp_key(102 downto 0) & temp_key(127 downto 103);
		temp_key := temp_key(102 downto 0) & temp_key(127 downto 103);
		Z1 <= temp_key(127 downto 112);
		Z2 <= temp_key(111 downto 96);
		Z3 <= temp_key(95 downto 80);
		Z4 <= temp_key(79 downto 64);
		Z5 <= temp_key(63 downto 48);
		Z6 <= temp_key(47 downto 32);
		
	when others =>
		temp_key:= Key;
		Z1 <= "0000000000000000";
		Z2 <= "0000000000000000";
		Z3 <= "0000000000000000";
		Z4 <= "0000000000000000";
		Z5 <= "0000000000000000";
		Z6 <= "0000000000000000";
	
	end case;
	end process;

end Behavioral;

