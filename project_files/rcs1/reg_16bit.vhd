----------------------------------------------------------------------------------
-- Company: 
-- Engineer:    Uzair Akbar
-- 
-- Create Date:    21:52:47 12/19/2017 
-- Design Name: 
-- Module Name:    reg_16bit - Behavioral 
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

entity reg_16bit is
    Port ( clock : in  STD_LOGIC;
           enable : in  STD_LOGIC;
           D : in  STD_LOGIC_VECTOR (15 downto 0);
           Q : out  STD_LOGIC_VECTOR (15 downto 0));
end reg_16bit;

architecture Behavioral of reg_16bit is

begin

	process (clock)
	begin
		if (clock='1' and clock'EVENT) then
			if (enable = '1') then
				Q <= D;
			end if;
		end if;
	end process;

end Behavioral;

