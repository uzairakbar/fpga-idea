----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 		 Uzair Akbar
-- 
-- Create Date:    16:37:48 11/21/2017 
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
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity addop is
    Port ( A : in  STD_LOGIC_VECTOR (15 downto 0);
           B : in  STD_LOGIC_VECTOR (15 downto 0);
           C : out  STD_LOGIC_VECTOR (15 downto 0));
end addop;

architecture Behavioral of addop is
signal temp : STD_LOGIC_VECTOR (16 downto 0);
begin

  --temp <= ("0" & A ) +  B;
 temp <= ('0' & A ) + ('0' & B);
 
 C <= temp(15 downto 0);
 
 
end Behavioral;

