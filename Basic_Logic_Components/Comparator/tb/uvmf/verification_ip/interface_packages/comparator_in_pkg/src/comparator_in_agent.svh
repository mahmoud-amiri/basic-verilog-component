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
class comparator_in_agent #(
     int comparator_in_WIDTH = 8
     ) extends uvmf_parameterized_agent #(
                    .CONFIG_T(comparator_in_configuration #(
                              .comparator_in_WIDTH(comparator_in_WIDTH)
                              )),
                    .DRIVER_T(comparator_in_driver #(
                              .comparator_in_WIDTH(comparator_in_WIDTH)
                              )),
                    .MONITOR_T(comparator_in_monitor #(
                               .comparator_in_WIDTH(comparator_in_WIDTH)
                               )),
                    .COVERAGE_T(comparator_in_transaction_coverage #(
                                .comparator_in_WIDTH(comparator_in_WIDTH)
                                )),
                    .TRANS_T(comparator_in_transaction #(
                             .comparator_in_WIDTH(comparator_in_WIDTH)
                             ))
                    );

  `uvm_component_param_utils( comparator_in_agent #(
                              comparator_in_WIDTH
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

