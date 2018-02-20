----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date:    22:24:57 11/12/2017 
-- Design Name:
-- Module Name:    xorop - Behavioral
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

entity xorop is
    Port ( xor_in_1 : in  STD_LOGIC_VECTOR (15 downto 0);
           xor_in_2 : in  STD_LOGIC_VECTOR (15 downto 0);
           xor_out : out  STD_LOGIC_VECTOR (15 downto 0));
end xorop;

architecture Behavioral of xorop is

begin

process(xor_in_1, xor_in_2)

	begin
	xor_out <= xor_in_1 XOR xor_in_2;
	end process;

end Behavioral;
