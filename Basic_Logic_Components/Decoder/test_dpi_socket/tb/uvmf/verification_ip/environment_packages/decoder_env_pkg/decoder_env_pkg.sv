//----------------------------------------------------------------------
// Created with uvmf_gen version 2023.4
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// PACKAGE: This file defines all of the files contained in the
//    environment package that will run on the host simulator.
//
// CONTAINS:
//     - <decoder_configuration.svh>
//     - <decoder_environment.svh>
//     - <decoder_env_sequence_base.svh>
//     - <decoder_predictor.svh>
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
package decoder_env_pkg;

  import uvm_pkg::*;
  `include "uvm_macros.svh"
  import uvmf_base_pkg::*;
  import decoder_in_pkg::*;
  import decoder_in_pkg_hdl::*;
  import decoder_out_pkg::*;
  import decoder_out_pkg_hdl::*;
 
  `uvm_analysis_imp_decl(_decoder_in_agent_ae)

  // pragma uvmf custom package_imports_additional begin
  // pragma uvmf custom package_imports_additional end

  // Parameters defined as HVL parameters

  `include "src/decoder_env_typedefs.svh"
  `include "src/decoder_env_configuration.svh"
  `include "src/decoder_predictor.svh"
  `include "src/decoder_environment.svh"
  `include "src/decoder_env_sequence_base.svh"

  // pragma uvmf custom package_item_additional begin
  // UVMF_CHANGE_ME : When adding new environment level sequences to the src directory
  //    be sure to add the sequence file here so that it will be
  //    compiled as part of the environment package.  Be sure to place
  //    the new sequence after any base sequence of the new sequence.
  // pragma uvmf custom package_item_additional end

endpackage

// pragma uvmf custom external begin
// pragma uvmf custom external end

