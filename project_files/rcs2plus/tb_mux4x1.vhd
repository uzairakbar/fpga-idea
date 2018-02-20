--------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date:   22:19:12 01/27/2018
-- Design Name:
-- Module Name:   C:/Users/uzair/Desktop/rcs2/tb_mux4x1.vhd
-- Project Name:  idea_rcs2
-- Target Device:
-- Tool versions:
-- Description:
--
-- VHDL Test Bench Created by ISE for module: mux4x1
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

ENTITY tb_mux4x1 IS
END tb_mux4x1;

ARCHITECTURE behavior OF tb_mux4x1 IS

    -- Component Declaration for the Unit Under Test (UUT)

    COMPONENT mux4x1
    PORT( mux_in_0 : in  STD_LOGIC_VECTOR (15 downto 0);
           mux_in_1 : in  STD_LOGIC_VECTOR (15 downto 0);
           mux_in_2 : in  STD_LOGIC_VECTOR (15 downto 0);
           mux_in_3 : in  STD_LOGIC_VECTOR (15 downto 0);
           mux_sel : in  STD_LOGIC_VECTOR (1 downto 0);
           mux_out : out  STD_LOGIC_VECTOR (15 downto 0));
    END COMPONENT;


   --Inputs
   signal mux_in_0 : std_logic_vector(15 downto 0) := (others => '0');
   signal mux_in_1 : std_logic_vector(15 downto 0) := (others => '0');
   signal mux_in_2 : std_logic_vector(15 downto 0) := (others => '0');
   signal mux_in_3 : std_logic_vector(15 downto 0) := (others => '0');
   signal mux_sel : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal mux_out : std_logic_vector(15 downto 0);
   -- No clocks detected in port list. Replace <clock> below with
   -- appropriate port name

   constant I_period : time := 10 ns;

BEGIN

	-- Instantiate the Unit Under Test (UUT)
   uut: mux4x1 PORT MAP (
          mux_in_0 => mux_in_0,
          mux_in_1 => mux_in_1,
          mux_in_2 => mux_in_2,
          mux_in_3 => mux_in_3,
          mux_sel => mux_sel,
          mux_out => mux_out
        );

   stim_proc: process
   begin
      -- hold reset state for 100 ns.
      wait for 100 ns;

			mux_in_0<=x"aaaa";
			mux_in_1<=x"bbbb";
			mux_in_2<=x"cccc";
			mux_in_3<=x"dddd";
			wait for 10 ns;
			mux_sel<=b"00";
			wait for 10 ns;
			mux_sel<=b"01";
			wait for 10 ns;
			mux_sel<=b"10";
			wait for 10 ns;
			mux_sel<=b"11";
			wait for 10 ns;
			mux_in_3<=x"ffff";

     wait;
   end process;

END;
