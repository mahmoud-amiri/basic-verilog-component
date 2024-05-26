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
//     - <nand_gate_configuration.svh>
//     - <nand_gate_environment.svh>
//     - <nand_gate_env_sequence_base.svh>
//     - <nand_gate_predictor.svh>
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
package nand_gate_env_pkg;

  import uvm_pkg::*;
  `include "uvm_macros.svh"
  import uvmf_base_pkg::*;
  import nand_gate_in_pkg::*;
  import nand_gate_in_pkg_hdl::*;
  import nand_gate_out_pkg::*;
  import nand_gate_out_pkg_hdl::*;
 
  `uvm_analysis_imp_decl(_nand_gate_in_agent_ae)

  // pragma uvmf custom package_imports_additional begin
  // pragma uvmf custom package_imports_additional end

  // Parameters defined as HVL parameters

  `include "src/nand_gate_env_typedefs.svh"
  `include "src/nand_gate_env_configuration.svh"
  `include "src/nand_gate_predictor.svh"
  `include "src/nand_gate_environment.svh"
  `include "src/nand_gate_env_sequence_base.svh"

  // pragma uvmf custom package_item_additional begin
  // UVMF_CHANGE_ME : When adding new environment level sequences to the src directory
  //    be sure to add the sequence file here so that it will be
  //    compiled as part of the environment package.  Be sure to place
  //    the new sequence after any base sequence of the new sequence.
  // pragma uvmf custom package_item_additional end

endpackage

// pragma uvmf custom external begin
// pragma uvmf custom external end

