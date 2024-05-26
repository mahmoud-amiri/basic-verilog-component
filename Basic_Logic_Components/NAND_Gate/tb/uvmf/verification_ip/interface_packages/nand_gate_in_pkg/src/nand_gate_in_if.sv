//----------------------------------------------------------------------
// Created with uvmf_gen version 2023.4
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: This interface contains the nand_gate_in interface signals.
//      It is instantiated once per nand_gate_in bus.  Bus Functional Models, 
//      BFM's named nand_gate_in_driver_bfm, are used to drive signals on the bus.
//      BFM's named nand_gate_in_monitor_bfm are used to monitor signals on the 
//      bus. This interface signal bundle is passed in the port list of
//      the BFM in order to give the BFM access to the signals in this
//      interface.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
// This template can be used to connect a DUT to these signals
//
// .dut_signal_port(nand_gate_in_bus.a), // Agent output 
// .dut_signal_port(nand_gate_in_bus.b), // Agent output 

import uvmf_base_pkg_hdl::*;
import nand_gate_in_pkg_hdl::*;

interface  nand_gate_in_if #(
  int nand_gate_in_WIDTH = 8
  )

  (
  input tri clk, 
  input tri rst,
  inout tri [nand_gate_in_WIDTH-1:0] a,
  inout tri [nand_gate_in_WIDTH-1:0] b
  );

modport monitor_port 
  (
  input clk,
  input rst,
  input a,
  input b
  );

modport initiator_port 
  (
  input clk,
  input rst,
  output a,
  output b
  );

modport responder_port 
  (
  input clk,
  input rst,  
  input a,
  input b
  );
  

// pragma uvmf custom interface_item_additional begin
// pragma uvmf custom interface_item_additional end

endinterface

// pragma uvmf custom external begin
// pragma uvmf custom external end

