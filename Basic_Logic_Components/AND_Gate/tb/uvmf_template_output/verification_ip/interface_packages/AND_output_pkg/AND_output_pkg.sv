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
//    - <AND_output_typedefs_hdl>
//    - <AND_output_typedefs.svh>
//    - <AND_output_transaction.svh>

//    - <AND_output_configuration.svh>
//    - <AND_output_driver.svh>
//    - <AND_output_monitor.svh>

//    - <AND_output_transaction_coverage.svh>
//    - <AND_output_sequence_base.svh>
//    - <AND_output_random_sequence.svh>

//    - <AND_output_responder_sequence.svh>
//    - <AND_output2reg_adapter.svh>
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
package AND_output_pkg;
  
   import uvm_pkg::*;
   import uvmf_base_pkg_hdl::*;
   import uvmf_base_pkg::*;
   import AND_output_pkg_hdl::*;

   `include "uvm_macros.svh"

   // pragma uvmf custom package_imports_additional begin 
   // pragma uvmf custom package_imports_additional end
   `include "src/AND_output_macros.svh"

   export AND_output_pkg_hdl::*;
   
 

   // Parameters defined as HVL parameters

   `include "src/AND_output_typedefs.svh"
   `include "src/AND_output_transaction.svh"

   `include "src/AND_output_configuration.svh"
   `include "src/AND_output_driver.svh"
   `include "src/AND_output_monitor.svh"

   `include "src/AND_output_transaction_coverage.svh"
   `include "src/AND_output_sequence_base.svh"
   `include "src/AND_output_random_sequence.svh"

   `include "src/AND_output_responder_sequence.svh"
   `include "src/AND_output2reg_adapter.svh"

   `include "src/AND_output_agent.svh"

   // pragma uvmf custom package_item_additional begin
   // UVMF_CHANGE_ME : When adding new interface sequences to the src directory
   //    be sure to add the sequence file here so that it will be
   //    compiled as part of the interface package.  Be sure to place
   //    the new sequence after any base sequences of the new sequence.
   // pragma uvmf custom package_item_additional end

endpackage

// pragma uvmf custom external begin
// pragma uvmf custom external end

