----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:08:11 12/20/2017 
-- Design Name: 
-- Module Name:    round - Behavioral 
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

entity round is
    Port ( X1 : in  STD_LOGIC_VECTOR (15 downto 0);
           X2 : in  STD_LOGIC_VECTOR (15 downto 0);
           X3 : in  STD_LOGIC_VECTOR (15 downto 0);
           X4 : in  STD_LOGIC_VECTOR (15 downto 0);
			  
           Z1 : in  STD_LOGIC_VECTOR (15 downto 0);
           Z2 : in  STD_LOGIC_VECTOR (15 downto 0);
           Z3 : in  STD_LOGIC_VECTOR (15 downto 0);
           Z4 : in  STD_LOGIC_VECTOR (15 downto 0);
           Z5 : in  STD_LOGIC_VECTOR (15 downto 0);
           Z6 : in  STD_LOGIC_VECTOR (15 downto 0);
			  
           Y1 : out  STD_LOGIC_VECTOR (15 downto 0);
           Y2 : out  STD_LOGIC_VECTOR (15 downto 0);
           Y3 : out  STD_LOGIC_VECTOR (15 downto 0);
           Y4 : out  STD_LOGIC_VECTOR (15 downto 0));
end round;

architecture Behavioral of round is

	component xorop is
		Port ( A : in  STD_LOGIC_VECTOR (15 downto 0);
           B : in  STD_LOGIC_VECTOR (15 downto 0);
           C : out  STD_LOGIC_VECTOR (15 downto 0));
	end component xorop;
	
	component mulop is
		Port ( A : in  STD_LOGIC_VECTOR (15 downto 0);
           B : in  STD_LOGIC_VECTOR (15 downto 0);
           C : out  STD_LOGIC_VECTOR (15 downto 0));
	end component mulop;

	component addop is
		 Port ( A : in  STD_LOGIC_VECTOR (15 downto 0);
				  B : in  STD_LOGIC_VECTOR (15 downto 0);
				  C : out  STD_LOGIC_VECTOR (15 downto 0));
	end component addop;
	
	signal S1, S2, S3, S4, S5, S6, S7, S8, S9, S10 : STD_LOGIC_VECTOR (15 downto 0);

begin
	m_1 : mulop port map (A=>X1, 
									B=>Z1, 
									C=>S1);
	a_1 : addop port map (A=>X2, 
								B=>Z2, 
								C=>S2);
	a_2 : addop port map (A=>X3, 
								   B=>Z3, 
								   C=>S3);
	m_2 : mulop port map (A=>X4, 
								   B=>Z4, 
								   C=>S4);

	x_1 : xorop port map (A=>S1, 
								B=>S3, 
								C=>S5);
	x_2 : xorop port map (A=>S2, 
								B=>S4, 
								C=>S6);
								
	m_3 : mulop port map (A=>Z5, 
									B=>S5, 
									C=>S7);
	a_3 : addop port map (A=>S6, 
								B=>S7, 
								C=>S8);
	m_4 : mulop port map (A=>S8, 
									B=>Z6, 
									C=>S9);	
	a_4 : addop port map (A=>S7, 
								B=>S9, 
								C=>S10);
															
	x_3 : xorop port map (A=>S1, 
								B=>S9, 
								C=>Y1);
								
	x_4 : xorop port map (A=>S2, 
								B=>S10, 
								C=>Y3);
								
	x_5 : xorop port map (A=>S3, 
								B=>S9, 
								C=>Y2);
								
	x_6 : xorop port map (A=>S4, 
								B=>S10, 
								C=>Y4);
								

end Behavioral;
