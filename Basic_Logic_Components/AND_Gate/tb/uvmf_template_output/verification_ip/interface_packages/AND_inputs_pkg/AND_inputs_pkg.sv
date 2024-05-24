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
//    - <AND_inputs_typedefs_hdl>
//    - <AND_inputs_typedefs.svh>
//    - <AND_inputs_transaction.svh>

//    - <AND_inputs_configuration.svh>
//    - <AND_inputs_driver.svh>
//    - <AND_inputs_monitor.svh>

//    - <AND_inputs_transaction_coverage.svh>
//    - <AND_inputs_sequence_base.svh>
//    - <AND_inputs_random_sequence.svh>

//    - <AND_inputs_responder_sequence.svh>
//    - <AND_inputs2reg_adapter.svh>
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
package AND_inputs_pkg;
  
   import uvm_pkg::*;
   import uvmf_base_pkg_hdl::*;
   import uvmf_base_pkg::*;
   import AND_inputs_pkg_hdl::*;

   `include "uvm_macros.svh"

   // pragma uvmf custom package_imports_additional begin 
   // pragma uvmf custom package_imports_additional end
   `include "src/AND_inputs_macros.svh"

   export AND_inputs_pkg_hdl::*;
   
 

   // Parameters defined as HVL parameters

   `include "src/AND_inputs_typedefs.svh"
   `include "src/AND_inputs_transaction.svh"

   `include "src/AND_inputs_configuration.svh"
   `include "src/AND_inputs_driver.svh"
   `include "src/AND_inputs_monitor.svh"

   `include "src/AND_inputs_transaction_coverage.svh"
   `include "src/AND_inputs_sequence_base.svh"
   `include "src/AND_inputs_random_sequence.svh"

   `include "src/AND_inputs_responder_sequence.svh"
   `include "src/AND_inputs2reg_adapter.svh"

   `include "src/AND_inputs_agent.svh"

   // pragma uvmf custom package_item_additional begin
   // UVMF_CHANGE_ME : When adding new interface sequences to the src directory
   //    be sure to add the sequence file here so that it will be
   //    compiled as part of the interface package.  Be sure to place
   //    the new sequence after any base sequences of the new sequence.
   // pragma uvmf custom package_item_additional end

endpackage

// pragma uvmf custom external begin
// pragma uvmf custom external end

