----------------------------------------------------------------------------------
-- Company: 
-- Engineer:  		 Uzair Akbar
-- 
-- Create Date:    12:45:07 11/22/2017 
-- Design Name: 
-- Module Name:    mulop - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mulop is
 Port ( A : in  STD_LOGIC_VECTOR (15 downto 0);
        B : in  STD_LOGIC_VECTOR (15 downto 0);
        C : out  STD_LOGIC_VECTOR (15 downto 0));
end mulop;

architecture Behavioral of mulop is
signal product : std_logic_vector (33 downto 0);
	signal modulo : std_logic_vector (16 downto 0);
	signal quotient : std_logic_vector (16 downto 0);
	signal A1, B1 : std_logic_vector (16 downto 0);
	--- signal temp : std_logic_vector (31 downto 0) := "00000000000000000000000000000000";
begin
check_zeros: process(A, B)
	begin
		if A = "0000000000000000" then
			A1 <= '1' & A;
		else
			A1 <= '0' & A;
		end if;
		if B = "0000000000000000" then
			B1 <= '1' & B;
		else
			B1 <= '0' & B;
		end if;
	end process;
	
	product <= A1 * B1;
	modulo <= ('0' & product(15 downto 0));
	quotient <= product(32 downto 16);
	
	low_high: process(modulo, quotient)
	variable temp : std_logic_vector (31 downto 0) := "00000000000000000000000000000000";
	begin
		temp := "000000000000000" & (modulo - quotient);
		if modulo < quotient then
			temp := temp + "00000000000000010000000000000001";
		else
			temp := temp;
		end if;
		C <= temp(15 downto 0);
	end process;


end Behavioral;

