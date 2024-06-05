//----------------------------------------------------------------------
// Created with uvmf_gen version 2023.4
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: This interface contains the decoder_out interface signals.
//      It is instantiated once per decoder_out bus.  Bus Functional Models, 
//      BFM's named decoder_out_driver_bfm, are used to drive signals on the bus.
//      BFM's named decoder_out_monitor_bfm are used to monitor signals on the 
//      bus. This interface signal bundle is passed in the port list of
//      the BFM in order to give the BFM access to the signals in this
//      interface.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
// This template can be used to connect a DUT to these signals
//
// .dut_signal_port(decoder_out_bus.out), // Agent input 

import uvmf_base_pkg_hdl::*;
import decoder_out_pkg_hdl::*;

interface  decoder_out_if #(
  int decoder_out_WIDTH = 2**8
  )

  (
  input tri clk, 
  input tri rst,
  inout tri [decoder_out_WIDTH-1:0] out
  );

modport monitor_port 
  (
  input clk,
  input rst,
  input out
  );

modport initiator_port 
  (
  input clk,
  input rst,
  input out
  );

modport responder_port 
  (
  input clk,
  input rst,  
  output out
  );
  

// pragma uvmf custom interface_item_additional begin
// pragma uvmf custom interface_item_additional end

endinterface

// pragma uvmf custom external begin
// pragma uvmf custom external end

