--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   23:42:11 12/19/2017
-- Design Name:   
-- Module Name:   /nfs/TUEIEDA/LabHDL/2017w/ge69foj/submit/rcs1/tb_key_gen.vhd
-- Project Name:  idea_rcs1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: key_gen
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
 
ENTITY tb_key_gen IS
END tb_key_gen;
 
ARCHITECTURE behavior OF tb_key_gen IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT key_gen
    PORT(
         round : IN  std_logic_vector(3 downto 0);
         key : IN  std_logic_vector(127 downto 0);
         out1 : OUT  std_logic_vector(15 downto 0);
         out2 : OUT  std_logic_vector(15 downto 0);
         out3 : OUT  std_logic_vector(15 downto 0);
         out4 : OUT  std_logic_vector(15 downto 0);
         out5 : OUT  std_logic_vector(15 downto 0);
         out6 : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal round : std_logic_vector(3 downto 0) := (others => '0');
   signal key : std_logic_vector(127 downto 0) := (others => '0');

 	--Outputs
   signal out1 : std_logic_vector(15 downto 0);
   signal out2 : std_logic_vector(15 downto 0);
   signal out3 : std_logic_vector(15 downto 0);
   signal out4 : std_logic_vector(15 downto 0);
   signal out5 : std_logic_vector(15 downto 0);
   signal out6 : std_logic_vector(15 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: key_gen PORT MAP (
          round => round,
          key => key,
          out1 => out1,
          out2 => out2,
          out3 => out3,
          out4 => out4,
          out5 => out5,
          out6 => out6
        );

   -- Clock process definitions
   clock_process :process
   begin
		-- IMPLEMENT TEST BENCH !!!
		wait for clock_period/2;
		-- IMPLEMENT TEST BENCH !!!
		wait for clock_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clock_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
