//----------------------------------------------------------------------
// Created with uvmf_gen version 2023.4
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: This interface contains the decoder_in interface signals.
//      It is instantiated once per decoder_in bus.  Bus Functional Models, 
//      BFM's named decoder_in_driver_bfm, are used to drive signals on the bus.
//      BFM's named decoder_in_monitor_bfm are used to monitor signals on the 
//      bus. This interface signal bundle is passed in the port list of
//      the BFM in order to give the BFM access to the signals in this
//      interface.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
// This template can be used to connect a DUT to these signals
//
// .dut_signal_port(decoder_in_bus.in), // Agent output 

import uvmf_base_pkg_hdl::*;
import decoder_in_pkg_hdl::*;

interface  decoder_in_if #(
  int decoder_in_WIDTH = 8
  )

  (
  input tri clk, 
  input tri rst,
  inout tri [decoder_in_WIDTH-1:0] in
  );

modport monitor_port 
  (
  input clk,
  input rst,
  input in
  );

modport initiator_port 
  (
  input clk,
  input rst,
  output in
  );

modport responder_port 
  (
  input clk,
  input rst,  
  input in
  );
  

// pragma uvmf custom interface_item_additional begin
// pragma uvmf custom interface_item_additional end

endinterface

// pragma uvmf custom external begin
// pragma uvmf custom external end

