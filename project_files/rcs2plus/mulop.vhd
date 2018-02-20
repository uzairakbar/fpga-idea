----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:     
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
use IEEE.std_logic_unsigned.all;
use IEEE.STD_LOGIC_ARITH.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mulop is
    Port ( mul_in_1 : in  STD_LOGIC_VECTOR (15 downto 0);
           mul_in_2 : in  STD_LOGIC_VECTOR (15 downto 0);
           mul_out : out  STD_LOGIC_VECTOR (15 downto 0));
end mulop;

architecture Behavioral of mulop is

	signal AB : std_logic_vector (33 downto 0);
	signal AB_mod : std_logic_vector (15 downto 0);
	signal AB_div : std_logic_vector (15 downto 0);
	signal A2,B2 : std_logic_vector (16 downto 0);
	
begin
	
	process(mul_in_1,mul_in_2)
	
	begin
	
		if mul_in_1 = "0000000000000000" then
		 A2 <= '1' & mul_in_1;
		else
		 A2 <= '0' & mul_in_1;
		end if;
		
		if mul_in_2 = "0000000000000000" then
		B2 <= '1' & mul_in_2;
		else
		B2 <= '0' & mul_in_2;
		end if;
		
	end process;
	
	AB <= A2*B2;
	AB_mod <= AB(15 downto 0);
	AB_div <= AB(31 downto 16);
	
	process(AB_mod, AB_div, mul_in_1, mul_in_2)
	
	variable Z2 : std_logic_vector(31 downto 0);
	
	begin
	
	Z2 := "0000000000000000" & (AB_mod - AB_div);
	
	if(AB_mod < AB_div) then
	 Z2 := Z2 + "00000000000000010000000000000001";
	elsif mul_in_1 = "0000000000000000" and mul_in_2 = "0000000000000000" then
	 Z2 := "00000000000000000000000000000001";
	end if;
	
	mul_out<= Z2(15 downto 0);
	
	end process;

end Behavioral;

