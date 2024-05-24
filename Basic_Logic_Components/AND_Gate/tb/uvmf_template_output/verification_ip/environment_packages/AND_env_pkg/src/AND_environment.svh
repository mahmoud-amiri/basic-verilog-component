//----------------------------------------------------------------------
// Created with uvmf_gen version 2023.4
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//                                          
// DESCRIPTION: This environment contains all agents, predictors and
// scoreboards required for the block level design.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//

class AND_environment  extends uvmf_environment_base #(
    .CONFIG_T( AND_env_configuration 
  ));
  `uvm_component_utils( AND_environment )





  typedef AND_inputs_agent  AND_inputs_agent_t;
  AND_inputs_agent_t AND_inputs_agent;

  typedef AND_output_agent  AND_output_agent_t;
  AND_output_agent_t AND_output_agent;




  typedef AND_predictor #(
                .CONFIG_T(CONFIG_T)
                ) AND_pred_t;
  AND_pred_t AND_pred;

  typedef uvmf_in_order_scoreboard #(.T(AND_output_transaction))  AND_sb_t;
  AND_sb_t AND_sb;



  typedef uvmf_virtual_sequencer_base #(.CONFIG_T(AND_env_configuration)) AND_vsqr_t;
  AND_vsqr_t vsqr;

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
// FUNCTION: build_phase()
// This function builds all components within this environment.
//
  virtual function void build_phase(uvm_phase phase);
// pragma uvmf custom build_phase_pre_super begin
// pragma uvmf custom build_phase_pre_super end
    super.build_phase(phase);
    AND_inputs_agent = AND_inputs_agent_t::type_id::create("AND_inputs_agent",this);
    AND_inputs_agent.set_config(configuration.AND_inputs_agent_config);
    AND_output_agent = AND_output_agent_t::type_id::create("AND_output_agent",this);
    AND_output_agent.set_config(configuration.AND_output_agent_config);
    AND_pred = AND_pred_t::type_id::create("AND_pred",this);
    AND_pred.configuration = configuration;
    AND_sb = AND_sb_t::type_id::create("AND_sb",this);

    vsqr = AND_vsqr_t::type_id::create("vsqr", this);
    vsqr.set_config(configuration);
    configuration.set_vsqr(vsqr);

    // pragma uvmf custom build_phase begin
    // pragma uvmf custom build_phase end
  endfunction

// ****************************************************************************
// FUNCTION: connect_phase()
// This function makes all connections within this environment.  Connections
// typically inclue agent to predictor, predictor to scoreboard and scoreboard
// to agent.
//
  virtual function void connect_phase(uvm_phase phase);
// pragma uvmf custom connect_phase_pre_super begin
// pragma uvmf custom connect_phase_pre_super end
    super.connect_phase(phase);
    AND_inputs_agent.monitored_ap.connect(AND_pred.AND_inputs_agent_ae);
    AND_pred.AND_sb_ap.connect(AND_sb.expected_analysis_export);
    AND_output_agent.monitored_ap.connect(AND_sb.actual_analysis_export);
    // pragma uvmf custom reg_model_connect_phase begin
    // pragma uvmf custom reg_model_connect_phase end
  endfunction

// ****************************************************************************
// FUNCTION: end_of_simulation_phase()
// This function is executed just prior to executing run_phase.  This function
// was added to the environment to sample environment configuration settings
// just before the simulation exits time 0.  The configuration structure is 
// randomized in the build phase before the environment structure is constructed.
// Configuration variables can be customized after randomization in the build_phase
// of the extended test.
// If a sequence modifies values in the configuration structure then the sequence is
// responsible for sampling the covergroup in the configuration if required.
//
  virtual function void start_of_simulation_phase(uvm_phase phase);
     configuration.AND_configuration_cg.sample();
  endfunction

endclass

// pragma uvmf custom external begin
// pragma uvmf custom external end

