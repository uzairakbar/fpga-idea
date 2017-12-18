----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:56:49 11/21/2017 
-- Design Name: 
-- Module Name:    ModMul - Behavioral 
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

entity mulop_uzair is
    Port ( X : in  STD_LOGIC_VECTOR (15 downto 0);
           Z : in  STD_LOGIC_VECTOR (15 downto 0);
           O : out  STD_LOGIC_VECTOR (15 downto 0));
end mulop_uzair;

architecture Behavioral of mulop_uzair is

	signal product : std_logic_vector (33 downto 0);
	signal modulo : std_logic_vector (16 downto 0);
	signal quotient : std_logic_vector (16 downto 0);
	signal A, B : std_logic_vector (16 downto 0);
	--- signal temp : std_logic_vector (31 downto 0) := "00000000000000000000000000000000";

begin

	check_zeros: process(X, Z)
	begin
		if X = "0000000000000000" then
			A <= '1' & X;
		else
			A <= '0' & X;
		end if;
		if Z = "0000000000000000" then
			B <= '1' & Z;
		else
			B <= '0' & Z;
		end if;
	end process;
	
	product <= A * B;
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
		O <= temp(15 downto 0);
	end process;

end Behavioral;
