-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
-- Date        : Thu Mar 26 14:28:46 2020
-- Host        : DESKTOP-266QRLB running 64-bit major release  (build 9200)
-- Command     : write_vhdl -mode funcsim -nolib -force -file
--               C:/Users/Ray/Desktop/Arquitectura/Archivo_de_registros/arcchivo_de_registro/arcchivo_de_registro.sim/sim_1/synth/func/xsim/tb_arch_reg_func_synth.vhd
-- Design      : Arc_Reg
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity Arc_Reg is
  port (
    writeData : in STD_LOGIC_VECTOR ( 15 downto 0 );
    writeReg : in STD_LOGIC_VECTOR ( 3 downto 0 );
    readReg1 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    readReg2 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    shamt : in STD_LOGIC_VECTOR ( 3 downto 0 );
    WR : in STD_LOGIC;
    SHE : in STD_LOGIC;
    DIR : in STD_LOGIC;
    clr : in STD_LOGIC;
    readData1 : out STD_LOGIC_VECTOR ( 15 downto 0 );
    readData2 : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of Arc_Reg : entity is true;
end Arc_Reg;

architecture STRUCTURE of Arc_Reg is
begin
\readData1_OBUF[0]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => readData1(0)
    );
\readData1_OBUF[10]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => readData1(10)
    );
\readData1_OBUF[11]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => readData1(11)
    );
\readData1_OBUF[12]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => readData1(12)
    );
\readData1_OBUF[13]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => readData1(13)
    );
\readData1_OBUF[14]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => readData1(14)
    );
\readData1_OBUF[15]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => readData1(15)
    );
\readData1_OBUF[1]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => readData1(1)
    );
\readData1_OBUF[2]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => readData1(2)
    );
\readData1_OBUF[3]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => readData1(3)
    );
\readData1_OBUF[4]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => readData1(4)
    );
\readData1_OBUF[5]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => readData1(5)
    );
\readData1_OBUF[6]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => readData1(6)
    );
\readData1_OBUF[7]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => readData1(7)
    );
\readData1_OBUF[8]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => readData1(8)
    );
\readData1_OBUF[9]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => readData1(9)
    );
\readData2_OBUF[0]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => readData2(0)
    );
\readData2_OBUF[10]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => readData2(10)
    );
\readData2_OBUF[11]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => readData2(11)
    );
\readData2_OBUF[12]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => readData2(12)
    );
\readData2_OBUF[13]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => readData2(13)
    );
\readData2_OBUF[14]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => readData2(14)
    );
\readData2_OBUF[15]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => readData2(15)
    );
\readData2_OBUF[1]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => readData2(1)
    );
\readData2_OBUF[2]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => readData2(2)
    );
\readData2_OBUF[3]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => readData2(3)
    );
\readData2_OBUF[4]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => readData2(4)
    );
\readData2_OBUF[5]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => readData2(5)
    );
\readData2_OBUF[6]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => readData2(6)
    );
\readData2_OBUF[7]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => readData2(7)
    );
\readData2_OBUF[8]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => readData2(8)
    );
\readData2_OBUF[9]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => readData2(9)
    );
end STRUCTURE;
