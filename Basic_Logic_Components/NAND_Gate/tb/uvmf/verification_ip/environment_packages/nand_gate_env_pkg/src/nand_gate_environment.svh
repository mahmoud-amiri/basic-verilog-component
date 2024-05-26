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

class nand_gate_environment  extends uvmf_environment_base #(
    .CONFIG_T( nand_gate_env_configuration 
  ));
  `uvm_component_utils( nand_gate_environment )





  typedef nand_gate_in_agent  nand_gate_in_agent_t;
  nand_gate_in_agent_t nand_gate_in_agent;

  typedef nand_gate_out_agent  nand_gate_out_agent_t;
  nand_gate_out_agent_t nand_gate_out_agent;




  typedef nand_gate_predictor #(
                .CONFIG_T(CONFIG_T)
                ) nand_gate_pred_t;
  nand_gate_pred_t nand_gate_pred;

  typedef uvmf_in_order_scoreboard #(.T(nand_gate_out_transaction))  nand_gate_sb_t;
  nand_gate_sb_t nand_gate_sb;



  typedef uvmf_virtual_sequencer_base #(.CONFIG_T(nand_gate_env_configuration)) nand_gate_vsqr_t;
  nand_gate_vsqr_t vsqr;

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
    nand_gate_in_agent = nand_gate_in_agent_t::type_id::create("nand_gate_in_agent",this);
    nand_gate_in_agent.set_config(configuration.nand_gate_in_agent_config);
    nand_gate_out_agent = nand_gate_out_agent_t::type_id::create("nand_gate_out_agent",this);
    nand_gate_out_agent.set_config(configuration.nand_gate_out_agent_config);
    nand_gate_pred = nand_gate_pred_t::type_id::create("nand_gate_pred",this);
    nand_gate_pred.configuration = configuration;
    nand_gate_sb = nand_gate_sb_t::type_id::create("nand_gate_sb",this);

    vsqr = nand_gate_vsqr_t::type_id::create("vsqr", this);
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
    nand_gate_in_agent.monitored_ap.connect(nand_gate_pred.nand_gate_in_agent_ae);
    nand_gate_pred.nand_gate_sb_ap.connect(nand_gate_sb.expected_analysis_export);
    nand_gate_out_agent.monitored_ap.connect(nand_gate_sb.actual_analysis_export);
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
     configuration.nand_gate_configuration_cg.sample();
  endfunction

endclass

// pragma uvmf custom external begin
// pragma uvmf custom external end

