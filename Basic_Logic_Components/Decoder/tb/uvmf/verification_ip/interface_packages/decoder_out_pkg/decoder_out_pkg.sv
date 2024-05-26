//----------------------------------------------------------------------
// Created with uvmf_gen version 2023.4
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// PACKAGE: This file defines all of the files contained in the
//    interface package that will run on the host simulator.
//
// CONTAINS:
//    - <decoder_out_typedefs_hdl>
//    - <decoder_out_typedefs.svh>
//    - <decoder_out_transaction.svh>

//    - <decoder_out_configuration.svh>
//    - <decoder_out_driver.svh>
//    - <decoder_out_monitor.svh>

//    - <decoder_out_transaction_coverage.svh>
//    - <decoder_out_sequence_base.svh>
//    - <decoder_out_random_sequence.svh>

//    - <decoder_out_responder_sequence.svh>
//    - <decoder_out2reg_adapter.svh>
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
package decoder_out_pkg;
  
   import uvm_pkg::*;
   import uvmf_base_pkg_hdl::*;
   import uvmf_base_pkg::*;
   import decoder_out_pkg_hdl::*;

   `include "uvm_macros.svh"

   // pragma uvmf custom package_imports_additional begin 
   // pragma uvmf custom package_imports_additional end
   `include "src/decoder_out_macros.svh"

   export decoder_out_pkg_hdl::*;
   
 

   // Parameters defined as HVL parameters

   `include "src/decoder_out_typedefs.svh"
   `include "src/decoder_out_transaction.svh"

   `include "src/decoder_out_configuration.svh"
   `include "src/decoder_out_driver.svh"
   `include "src/decoder_out_monitor.svh"

   `include "src/decoder_out_transaction_coverage.svh"
   `include "src/decoder_out_sequence_base.svh"
   `include "src/decoder_out_random_sequence.svh"

   `include "src/decoder_out_responder_sequence.svh"
   `include "src/decoder_out2reg_adapter.svh"

   `include "src/decoder_out_agent.svh"

   // pragma uvmf custom package_item_additional begin
   // UVMF_CHANGE_ME : When adding new interface sequences to the src directory
   //    be sure to add the sequence file here so that it will be
   //    compiled as part of the interface package.  Be sure to place
   //    the new sequence after any base sequences of the new sequence.
   // pragma uvmf custom package_item_additional end

endpackage

// pragma uvmf custom external begin
// pragma uvmf custom external end

