----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date:    23:38:39 01/27/2018 
-- Design Name:
-- Module Name:    datapath - Behavioral
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

entity datapath is
	Port ( Clock : in  STD_LOGIC;
           EN125 : in  STD_LOGIC;
           EN346 : in  STD_LOGIC;
           EN78 : in  STD_LOGIC;
           S : in  STD_LOGIC_VECTOR (1 downto 0);
			  S_T : in  STD_LOGIC_VECTOR (1 downto 0);
			  X1 : in  STD_LOGIC_VECTOR (15 downto 0);
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
           Y4 : out  STD_LOGIC_VECTOR (15 downto 0);
			  Y1_trafo : out  STD_LOGIC_VECTOR (15 downto 0);
           Y2_trafo : out  STD_LOGIC_VECTOR (15 downto 0);
           Y3_trafo : out  STD_LOGIC_VECTOR (15 downto 0);
           Y4_trafo : out  STD_LOGIC_VECTOR (15 downto 0));
end datapath;

architecture Behavioral of datapath is

--Declaring the Components being used in the Round module

Signal mulop_Out : STD_LOGIC_VECTOR (15 downto 0);
Signal addop_Out : STD_LOGIC_VECTOR (15 downto 0);
Signal xorop_Out : STD_LOGIC_VECTOR (15 downto 0);

Signal Mux1_Out : STD_LOGIC_VECTOR (15 downto 0);
Signal Mux2_Out : STD_LOGIC_VECTOR (15 downto 0);
Signal Mux3_Out : STD_LOGIC_VECTOR (15 downto 0);
Signal Mux4_Out : STD_LOGIC_VECTOR (15 downto 0);

Signal Reg1 : STD_LOGIC_VECTOR (15 downto 0);
Signal Reg2 : STD_LOGIC_VECTOR (15 downto 0);
Signal Reg3 : STD_LOGIC_VECTOR (15 downto 0);
Signal Reg4 : STD_LOGIC_VECTOR (15 downto 0);
Signal Reg5 : STD_LOGIC_VECTOR (15 downto 0);
Signal Reg6 : STD_LOGIC_VECTOR (15 downto 0);
Signal Reg7 : STD_LOGIC_VECTOR (15 downto 0);
Signal Reg8 : STD_LOGIC_VECTOR (15 downto 0);

--XOR
Component xorop Port ( xor_in_1 : in  STD_LOGIC_VECTOR (15 downto 0);
							  xor_in_2 : in  STD_LOGIC_VECTOR (15 downto 0);
							  xor_out : out  STD_LOGIC_VECTOR (15 downto 0));
end component;

--Adder
Component addop Port ( add_in_1 : in  STD_LOGIC_VECTOR (15 downto 0);
							  add_in_2 : in  STD_LOGIC_VECTOR (15 downto 0);
							  add_out : out  STD_LOGIC_VECTOR (15 downto 0));

end component;

--Modulo Multiplier
Component mulop Port ( mul_in_1 : in  STD_LOGIC_VECTOR (15 downto 0);
							  mul_in_2 : in  STD_LOGIC_VECTOR (15 downto 0);
							  mul_out : out  STD_LOGIC_VECTOR (15 downto 0));

end component;

--4to1mux
Component mux4x1 Port ( mux_in_0 : in  STD_LOGIC_VECTOR (15 downto 0);
								 mux_in_1 : in  STD_LOGIC_VECTOR (15 downto 0);
								 mux_in_2 : in  STD_LOGIC_VECTOR (15 downto 0);
								 mux_in_3 : in  STD_LOGIC_VECTOR (15 downto 0);
								 mux_sel : in  STD_LOGIC_VECTOR (1 downto 0);
								 mux_out : out  STD_LOGIC_VECTOR (15 downto 0));
end component;

component reg Port ( Clock : in  STD_LOGIC;
							Enable : in  STD_LOGIC;
							Input : in  STD_LOGIC_VECTOR (15 downto 0);
							Output : out  STD_LOGIC_VECTOR (15 downto 0));
end component;


begin

--INITIALIZING THE COMPONENTS
m411: mux4x1 PORT MAP (mux_in_0=>X1,mux_in_1=>X4,mux_in_2=>Z5,mux_in_3=>Z6,mux_sel=>S,mux_out=>Mux1_Out);
m412: mux4x1 PORT MAP (mux_in_0=>Z1,mux_in_1=>Z4,mux_in_2=>Reg5,mux_in_3=>Reg8,mux_sel=>S,mux_out=>Mux2_Out);
m413: mux4x1 PORT MAP (mux_in_0=>X3,mux_in_1=>X2,mux_in_2=>Reg6,mux_in_3=>Reg7,mux_sel=>S,mux_out=>Mux3_Out);
m414: mux4x1 PORT MAP (mux_in_0=>Z3,mux_in_1=>Z2,mux_in_2=>mulop_Out,mux_in_3=>mulop_Out,mux_sel=>S_T,mux_out=>Mux4_Out);

mul : mulop PORT MAP (mul_in_1 => Mux1_Out, mul_in_2 => Mux2_Out, mul_out => mulop_Out);
a1 : addop PORT MAP (add_in_1 => Mux3_Out, add_in_2 => Mux4_Out, add_out => addop_Out);
main_xor :xorop PORT MAP (xor_in_1 => mulop_Out, xor_in_2 => addop_Out, xor_out => xorop_Out);

R1: reg PORT MAP (Clock=>clock,Enable=>EN125,Input=>mulop_Out,Output=>Reg1);
R2: reg PORT MAP (Clock=>clock,Enable=>EN125,Input=>addop_Out,Output=>Reg2);
R3: reg PORT MAP (Clock=>clock,Enable=>EN346,Input=>addop_Out,Output=>Reg3);
R4: reg PORT MAP (Clock=>clock,Enable=>EN346,Input=>mulop_Out,Output=>Reg4);

R5: reg PORT MAP (Clock=>clock,Enable=>EN125,Input=>xorop_Out,Output=>Reg5);
R6: reg PORT MAP (Clock=>clock,Enable=>EN346,Input=>xorop_Out,Output=>Reg6);
R7: reg PORT MAP (Clock=>clock,Enable=>EN78,Input=>mulop_Out,Output=>Reg7);
R8: reg PORT MAP (Clock=>clock,Enable=>EN78,Input=>addop_Out,Output=>Reg8);

xorop1 :xorop PORT MAP (xor_in_1 => Reg1, xor_in_2 => mulop_Out, xor_out => Y1);
xorop2 :xorop PORT MAP (xor_in_1 => Reg2, xor_in_2 => mulop_Out, xor_out => Y2);
xorop3 :xorop PORT MAP (xor_in_1 => Reg3, xor_in_2 => addop_Out, xor_out => Y3);
xorop4 :xorop PORT MAP (xor_in_1 => Reg4, xor_in_2 => addop_Out, xor_out => Y4);

Y1_trafo<=Reg1;
Y2_trafo<=Reg2;
Y3_trafo<=Reg3;
Y4_trafo<=Reg4;


end Behavioral;
