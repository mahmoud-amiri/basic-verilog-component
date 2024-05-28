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

class decoder_environment  extends uvmf_environment_base #(
    .CONFIG_T( decoder_env_configuration 
  ));
  `uvm_component_utils( decoder_environment )





  typedef decoder_in_agent  decoder_in_agent_t;
  decoder_in_agent_t decoder_in_agent;

  typedef decoder_out_agent  decoder_out_agent_t;
  decoder_out_agent_t decoder_out_agent;




  typedef decoder_predictor #(
                .CONFIG_T(CONFIG_T)
                ) decoder_pred_t;
  decoder_pred_t decoder_pred;

  typedef uvmf_in_order_scoreboard #(.T(decoder_out_transaction))  decoder_sb_t;
  decoder_sb_t decoder_sb;



  typedef uvmf_virtual_sequencer_base #(.CONFIG_T(decoder_env_configuration)) decoder_vsqr_t;
  decoder_vsqr_t vsqr;

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
    decoder_in_agent = decoder_in_agent_t::type_id::create("decoder_in_agent",this);
    decoder_in_agent.set_config(configuration.decoder_in_agent_config);
    decoder_out_agent = decoder_out_agent_t::type_id::create("decoder_out_agent",this);
    decoder_out_agent.set_config(configuration.decoder_out_agent_config);
    decoder_pred = decoder_pred_t::type_id::create("decoder_pred",this);
    configuration.decoder_out_WIDTH = 256;
    decoder_pred.configuration = configuration;
    decoder_sb = decoder_sb_t::type_id::create("decoder_sb",this);

    vsqr = decoder_vsqr_t::type_id::create("vsqr", this);
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
    decoder_in_agent.monitored_ap.connect(decoder_pred.decoder_in_agent_ae);
    decoder_pred.decoder_sb_ap.connect(decoder_sb.expected_analysis_export);
    decoder_out_agent.monitored_ap.connect(decoder_sb.actual_analysis_export);
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
     configuration.decoder_configuration_cg.sample();
  endfunction

endclass

// pragma uvmf custom external begin
// pragma uvmf custom external end

