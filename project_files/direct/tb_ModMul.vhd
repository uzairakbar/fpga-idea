--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:31:22 11/21/2017
-- Design Name:   
-- Module Name:   /home/ge69foj/Downloads/UZAIR/submit/direct/tb_ModMul.vhd
-- Project Name:  direct
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ModMul
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_ModMul IS
END tb_ModMul;
 
ARCHITECTURE behavior OF tb_ModMul IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ModMul
    PORT(
         X : IN  std_logic_vector(15 downto 0);
         Z : IN  std_logic_vector(15 downto 0);
         O : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal X : std_logic_vector(15 downto 0) := "0000000000000000";
   signal Z : std_logic_vector(15 downto 0) := "0000000000000000";

 	--Outputs
   signal O : std_logic_vector(15 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant C_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ModMul PORT MAP (
          X => X,
          Z => Z,
          O => O
        );

   -- Clock process definitions
   inputs :process
   begin
		X <= "0000000000000001";
		Z <= "0000000000000001";
		wait for C_period/2;
		X <= "0000000000000001";
		Z <= "0000000000000001";
		wait for C_period/2;
  		X <= "0000000000000011";
  		Z <= "0000000000000110";
  		wait for C_period/2;
  		X <= "0000000000000001";
  		Z <= "1111111111111111";
  		wait for C_period/2;
  		X <= "0000111111111110";
  		Z <= "1111111111111111";
  		wait for C_period/2;
  		X <= "1111111111111111";
  		Z <= "0000000000000000";
		wait for C_period/2;
   end process;
 
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for C_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
