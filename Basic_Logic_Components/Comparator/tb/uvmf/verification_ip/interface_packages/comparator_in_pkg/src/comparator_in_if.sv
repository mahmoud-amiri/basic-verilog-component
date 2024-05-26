//----------------------------------------------------------------------
// Created with uvmf_gen version 2023.4
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: This interface contains the comparator_in interface signals.
//      It is instantiated once per comparator_in bus.  Bus Functional Models, 
//      BFM's named comparator_in_driver_bfm, are used to drive signals on the bus.
//      BFM's named comparator_in_monitor_bfm are used to monitor signals on the 
//      bus. This interface signal bundle is passed in the port list of
//      the BFM in order to give the BFM access to the signals in this
//      interface.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
// This template can be used to connect a DUT to these signals
//
// .dut_signal_port(comparator_in_bus.A), // Agent output 
// .dut_signal_port(comparator_in_bus.B), // Agent output 

import uvmf_base_pkg_hdl::*;
import comparator_in_pkg_hdl::*;

interface  comparator_in_if #(
  int comparator_in_WIDTH = 8
  )

  (
  input tri clk, 
  input tri rst,
  inout tri [comparator_in_WIDTH-1:0] A,
  inout tri [comparator_in_WIDTH-1:0] B
  );

modport monitor_port 
  (
  input clk,
  input rst,
  input A,
  input B
  );

modport initiator_port 
  (
  input clk,
  input rst,
  output A,
  output B
  );

modport responder_port 
  (
  input clk,
  input rst,  
  input A,
  input B
  );
  

// pragma uvmf custom interface_item_additional begin
// pragma uvmf custom interface_item_additional end

endinterface

// pragma uvmf custom external begin
// pragma uvmf custom external end

