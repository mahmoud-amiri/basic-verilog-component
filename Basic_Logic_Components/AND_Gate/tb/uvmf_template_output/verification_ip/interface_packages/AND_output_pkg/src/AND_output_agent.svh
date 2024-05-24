//----------------------------------------------------------------------
// Created with uvmf_gen version 2023.4
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
// DESCRIPTION: Protocol specific agent class definition
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
class AND_output_agent #(
     int AND_INPUTS_WIDTH = 8
     ) extends uvmf_parameterized_agent #(
                    .CONFIG_T(AND_output_configuration #(
                              .AND_INPUTS_WIDTH(AND_INPUTS_WIDTH)
                              )),
                    .DRIVER_T(AND_output_driver #(
                              .AND_INPUTS_WIDTH(AND_INPUTS_WIDTH)
                              )),
                    .MONITOR_T(AND_output_monitor #(
                               .AND_INPUTS_WIDTH(AND_INPUTS_WIDTH)
                               )),
                    .COVERAGE_T(AND_output_transaction_coverage #(
                                .AND_INPUTS_WIDTH(AND_INPUTS_WIDTH)
                                )),
                    .TRANS_T(AND_output_transaction #(
                             .AND_INPUTS_WIDTH(AND_INPUTS_WIDTH)
                             ))
                    );

  `uvm_component_param_utils( AND_output_agent #(
                              AND_INPUTS_WIDTH
                              ))

// pragma uvmf custom class_item_additional begin
// pragma uvmf custom class_item_additional end

// ****************************************************************************
// FUNCTION : new()
// This function is the standard SystemVerilog constructor.
//
  function new( string name = "", uvm_component parent = null );
    super.new( name, parent );
  endfunction

// ****************************************************************************
  // FUNCTION: build_phase
  virtual function void build_phase(uvm_phase phase);
// pragma uvmf custom build_phase_pre_super begin
// pragma uvmf custom build_phase_pre_super end
    super.build_phase(phase);
    if (configuration.active_passive == ACTIVE) begin
      // Place sequencer handle into configuration object
      // so that it may be retrieved from configuration 
      // rather than using uvm_config_db
      configuration.sequencer = this.sequencer;
    end
  endfunction
  
endclass

// pragma uvmf custom external begin
// pragma uvmf custom external end

