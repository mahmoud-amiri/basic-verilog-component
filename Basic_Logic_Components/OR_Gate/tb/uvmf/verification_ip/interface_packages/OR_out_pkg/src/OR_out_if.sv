//----------------------------------------------------------------------
// Created with uvmf_gen version 2023.4
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: This interface contains the OR_out interface signals.
//      It is instantiated once per OR_out bus.  Bus Functional Models, 
//      BFM's named OR_out_driver_bfm, are used to drive signals on the bus.
//      BFM's named OR_out_monitor_bfm are used to monitor signals on the 
//      bus. This interface signal bundle is passed in the port list of
//      the BFM in order to give the BFM access to the signals in this
//      interface.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
// This template can be used to connect a DUT to these signals
//
// .dut_signal_port(OR_out_bus.y), // Agent input 

import uvmf_base_pkg_hdl::*;
import OR_out_pkg_hdl::*;

interface  OR_out_if #(
  int OR_out_WIDTH = 8
  )

  (
  input tri clk, 
  input tri rst,
  inout tri [OR_out_WIDTH-1:0] y
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

