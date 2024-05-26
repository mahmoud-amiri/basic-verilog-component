//----------------------------------------------------------------------
// Created with uvmf_gen version 2023.4
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: This interface contains the comparator_out interface signals.
//      It is instantiated once per comparator_out bus.  Bus Functional Models, 
//      BFM's named comparator_out_driver_bfm, are used to drive signals on the bus.
//      BFM's named comparator_out_monitor_bfm are used to monitor signals on the 
//      bus. This interface signal bundle is passed in the port list of
//      the BFM in order to give the BFM access to the signals in this
//      interface.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
// This template can be used to connect a DUT to these signals
//
// .dut_signal_port(comparator_out_bus.GT), // Agent input 
// .dut_signal_port(comparator_out_bus.LT), // Agent input 
// .dut_signal_port(comparator_out_bus.EQ), // Agent input 

import uvmf_base_pkg_hdl::*;
import comparator_out_pkg_hdl::*;

interface  comparator_out_if #(
  int comparator_out_WIDTH = 8
  )

  (
  input tri clk, 
  input tri rst,
  inout tri  GT,
  inout tri  LT,
  inout tri  EQ
  );

modport monitor_port 
  (
  input clk,
  input rst,
  input GT,
  input LT,
  input EQ
  );

modport initiator_port 
  (
  input clk,
  input rst,
  input GT,
  input LT,
  input EQ
  );

modport responder_port 
  (
  input clk,
  input rst,  
  output GT,
  output LT,
  output EQ
  );
  

// pragma uvmf custom interface_item_additional begin
// pragma uvmf custom interface_item_additional end

endinterface

// pragma uvmf custom external begin
// pragma uvmf custom external end

