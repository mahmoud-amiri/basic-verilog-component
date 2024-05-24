//----------------------------------------------------------------------
// Created with uvmf_gen version 2023.4
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: This interface contains the AND_output interface signals.
//      It is instantiated once per AND_output bus.  Bus Functional Models, 
//      BFM's named AND_output_driver_bfm, are used to drive signals on the bus.
//      BFM's named AND_output_monitor_bfm are used to monitor signals on the 
//      bus. This interface signal bundle is passed in the port list of
//      the BFM in order to give the BFM access to the signals in this
//      interface.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
// This template can be used to connect a DUT to these signals
//
// .dut_signal_port(AND_output_bus.y), // Agent input 

import uvmf_base_pkg_hdl::*;
import AND_output_pkg_hdl::*;

interface  AND_output_if #(
  int AND_INPUTS_WIDTH = 8
  )

  (
  input tri clk, 
  input tri rst,
  inout tri [AND_INPUTS_WIDTH-1:0] y
  );

modport monitor_port 
  (
  input clk,
  input rst,
  input y
  );

modport initiator_port 
  (
  input clk,
  input rst,
  input y
  );

modport responder_port 
  (
  input clk,
  input rst,  
  output y
  );
  

// pragma uvmf custom interface_item_additional begin
// pragma uvmf custom interface_item_additional end

endinterface

// pragma uvmf custom external begin
// pragma uvmf custom external end

