--------------------------------------------------------------------------------
-- Company: 
-- Engineer: 		Uzair Akbar
--
-- Create Date:   12:53:11 11/22/2017
-- Design Name:   
-- Module Name:   /nfs/TUEIEDA/LabHDL/2017w/ge69foj/submit/direct/tb_mulop.vhd
-- Project Name:  idea
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: mulop
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
 
ENTITY tb_mulop IS
END tb_mulop;
 
ARCHITECTURE behavior OF tb_mulop IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mulop
    PORT(
         A : IN  std_logic_vector(15 downto 0);
         B : IN  std_logic_vector(15 downto 0);
         C : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(15 downto 0) := (others => '0');
   signal B : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal C : std_logic_vector(15 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant C_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mulop PORT MAP (
          A => A,
          B => B,
          C => C
        );

   -- Clock process definitions
   C_process :process
	begin
	
		A <= x"0000";
		B <= x"0000";
		wait for C_period/2;
		A <= x"0001";
		B <= x"0000";
		wait for C_period/2;
		A <= x"0001";
		B <= x"0001";
		wait for C_period/2;
		A <= x"0003";
		B <= x"0001";
		wait for C_period/2;
		A <= x"0003";
		B <= x"0003";
		wait for C_period/2;
		A <= x"7fff";
		B <= x"0003";
		wait for C_period/2;
		A <= x"7fff";
		B <= x"7fff";
		wait for C_period/2;
		A <= x"ffff";
		B <= x"7fff";
		wait for C_period/2;
		A <= x"ffff";
		B <= x"ffff";
		wait for C_period/2;
		A <= x"8000";
		B <= x"ffff";
		wait for C_period/2;
		A <= x"8000";
		B <= x"8000";
		wait for C_period/2;

	end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for C_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
