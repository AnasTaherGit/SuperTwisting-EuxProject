-- -------------------------------------------------------------
-- 
-- File Name: hdlsrc\FPGA_SMC\nfp_relop_double.vhd
-- Created: 2020-12-13 17:04:02
-- 
-- Generated by MATLAB 9.7 and HDL Coder 3.15
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: nfp_relop_double
-- Source Path: FPGA_SMC/nfp_relop_double
-- Hierarchy Level: 1
-- 
-- {Latency Strategy = "Zero"}
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY nfp_relop_double IS
  PORT( nfp_in1                           :   IN    std_logic_vector(63 DOWNTO 0);  -- ufix64
        nfp_in2                           :   IN    std_logic_vector(63 DOWNTO 0);  -- ufix64
        nfp_out1                          :   OUT   std_logic  -- ufix1
        );
END nfp_relop_double;


ARCHITECTURE rtl OF nfp_relop_double IS

  ATTRIBUTE multstyle : string;

  -- Signals
  SIGNAL nfp_in1_unsigned                 : unsigned(63 DOWNTO 0);  -- ufix64
  SIGNAL AS                               : std_logic;  -- ufix1
  SIGNAL AE                               : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL AM                               : unsigned(51 DOWNTO 0);  -- ufix52
  SIGNAL Compare_To_Zero2_out1            : std_logic;
  SIGNAL Logical_Operator1_out1           : std_logic;
  SIGNAL nfp_in2_unsigned                 : unsigned(63 DOWNTO 0);  -- ufix64
  SIGNAL BS                               : std_logic;  -- ufix1
  SIGNAL BE                               : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL BM                               : unsigned(51 DOWNTO 0);  -- ufix52
  SIGNAL Compare_To_Zero3_out1            : std_logic;
  SIGNAL Logical_Operator4_out1           : std_logic;
  SIGNAL Compare_To_Zero_out1             : std_logic;
  SIGNAL Compare_To_Zero1_out1            : std_logic;
  SIGNAL Logical_Operator_out1            : std_logic;
  SIGNAL Relational_Operator1_relop1      : std_logic;
  SIGNAL Relational_Operator3_relop1      : std_logic;
  SIGNAL Relational_Operator5_relop1      : std_logic;
  SIGNAL Relational_Operator_relop1       : std_logic;
  SIGNAL Compare_To_Constant_out1         : std_logic;
  SIGNAL Logical_Operator1_out1_1         : std_logic;
  SIGNAL Relational_Operator2_relop1      : std_logic;
  SIGNAL Relational_Operator4_relop1      : std_logic;
  SIGNAL Logical_Operator3_out1           : std_logic;
  SIGNAL Logical_Operator2_out1           : std_logic;
  SIGNAL Logical_Operator4_out1_1         : std_logic;
  SIGNAL Logical_Operator5_out1           : std_logic;
  SIGNAL Constant_out1                    : std_logic;  -- ufix1
  SIGNAL Logical_Operator_out1_1          : std_logic;
  SIGNAL Compare_To_Constant_out1_1       : std_logic;
  SIGNAL Logical_Operator2_out1_1         : std_logic;
  SIGNAL Compare_To_Constant1_out1        : std_logic;
  SIGNAL Logical_Operator3_out1_1         : std_logic;
  SIGNAL Logical_Operator5_out1_1         : std_logic;
  SIGNAL Logical_Operator1_out1_2         : std_logic;
  SIGNAL Logical_Operator6_out1           : std_logic;
  SIGNAL Logical_Operator_out1_2          : std_logic;
  SIGNAL Switch_out1                      : std_logic;
  SIGNAL Logical_Operator_out1_3          : std_logic;
  SIGNAL Logical_Operator2_out1_2         : std_logic;
  SIGNAL Logical_Operator3_out1_2         : std_logic;
  SIGNAL Constant_out1_1                  : std_logic;
  SIGNAL Switch1_out1                     : std_logic;

BEGIN
  nfp_in1_unsigned <= unsigned(nfp_in1);

  -- Split 64 bit word into FP sign, exponent, mantissa
  AS <= nfp_in1_unsigned(63);
  AE <= nfp_in1_unsigned(62 DOWNTO 52);
  AM <= nfp_in1_unsigned(51 DOWNTO 0);

  
  Compare_To_Zero2_out1 <= '1' WHEN AM = to_unsigned(0, 52) ELSE
      '0';

  Logical_Operator1_out1 <=  NOT Compare_To_Zero2_out1;

  nfp_in2_unsigned <= unsigned(nfp_in2);

  -- Split 64 bit word into FP sign, exponent, mantissa
  BS <= nfp_in2_unsigned(63);
  BE <= nfp_in2_unsigned(62 DOWNTO 52);
  BM <= nfp_in2_unsigned(51 DOWNTO 0);

  
  Compare_To_Zero3_out1 <= '1' WHEN BM = to_unsigned(0, 52) ELSE
      '0';

  Logical_Operator4_out1 <=  NOT Compare_To_Zero3_out1;

  
  Compare_To_Zero_out1 <= '1' WHEN AE = to_unsigned(16#000#, 11) ELSE
      '0';

  
  Compare_To_Zero1_out1 <= '1' WHEN BE = to_unsigned(16#000#, 11) ELSE
      '0';

  Logical_Operator_out1 <= Compare_To_Zero3_out1 AND (Compare_To_Zero2_out1 AND (Compare_To_Zero_out1 AND Compare_To_Zero1_out1));

  
  Relational_Operator1_relop1 <= '1' WHEN AS = BS ELSE
      '0';

  
  Relational_Operator3_relop1 <= '1' WHEN AE = BE ELSE
      '0';

  
  Relational_Operator5_relop1 <= '1' WHEN AM = BM ELSE
      '0';

  
  Relational_Operator_relop1 <= '1' WHEN AS < BS ELSE
      '0';

  
  Compare_To_Constant_out1 <= '1' WHEN BS = '1' ELSE
      '0';

  Logical_Operator1_out1_1 <= Compare_To_Constant_out1 AND Relational_Operator1_relop1;

  
  Relational_Operator2_relop1 <= '1' WHEN AE > BE ELSE
      '0';

  
  Relational_Operator4_relop1 <= '1' WHEN AM > BM ELSE
      '0';

  Logical_Operator3_out1 <= Relational_Operator3_relop1 AND Relational_Operator4_relop1;

  Logical_Operator2_out1 <= Relational_Operator2_relop1 OR Logical_Operator3_out1;

  Logical_Operator4_out1_1 <= Relational_Operator1_relop1 AND Logical_Operator2_out1;

  Logical_Operator5_out1 <=  NOT Logical_Operator4_out1_1;

  Constant_out1 <= '1';

  Logical_Operator_out1_1 <=  NOT Constant_out1;

  
  Compare_To_Constant_out1_1 <= '1' WHEN AE = to_unsigned(16#7FF#, 11) ELSE
      '0';

  Logical_Operator2_out1_1 <= Logical_Operator1_out1 AND Compare_To_Constant_out1_1;

  
  Compare_To_Constant1_out1 <= '1' WHEN BE = to_unsigned(16#7FF#, 11) ELSE
      '0';

  Logical_Operator3_out1_1 <= Logical_Operator4_out1 AND Compare_To_Constant1_out1;

  Logical_Operator5_out1_1 <= Logical_Operator2_out1_1 OR Logical_Operator3_out1_1;

  Logical_Operator1_out1_2 <= Logical_Operator_out1_1 OR Logical_Operator5_out1_1;

  Logical_Operator6_out1 <= Relational_Operator5_relop1 AND (Relational_Operator1_relop1 AND Relational_Operator3_relop1);

  Logical_Operator_out1_2 <= Logical_Operator_out1 OR Logical_Operator6_out1;

  
  Switch_out1 <= Logical_Operator4_out1_1 WHEN Logical_Operator1_out1_1 = '0' ELSE
      Logical_Operator5_out1;

  Logical_Operator_out1_3 <= Relational_Operator_relop1 OR Switch_out1;

  Logical_Operator2_out1_2 <= Logical_Operator_out1_2 OR Logical_Operator_out1_3;

  Logical_Operator3_out1_2 <=  NOT Logical_Operator2_out1_2;

  Constant_out1_1 <= '0';

  
  Switch1_out1 <= Logical_Operator3_out1_2 WHEN Logical_Operator1_out1_2 = '0' ELSE
      Constant_out1_1;

  nfp_out1 <= Switch1_out1;

END rtl;

