----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date:    23:18:08 11/12/2017
-- Design Name:
-- Module Name:    addop - Behavioral
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
use IEEE.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity addop is
    Port ( add_in_1 : in  STD_LOGIC_VECTOR (15 downto 0);
           add_in_2 : in  STD_LOGIC_VECTOR (15 downto 0);
           add_out : out  STD_LOGIC_VECTOR (15 downto 0));
end addop;

architecture Behavioral of addop is

begin
process(add_in_1, add_in_2)
	begin
	add_out <= add_in_1 + add_in_2;
end process;

end Behavioral;
