@set QUESTA_ROOT=C:/questasim64_2021.1
@set UVMF_HOME=C:/UVMF_2023.4/UVMF_2023.4
@set YAML_LOC=.

C:/Python27/python %UVMF_HOME%/scripts/yaml2uvmf.py %YAML_LOC%/AND_inputs_interface.yaml %YAML_LOC%/AND_output_interface.yaml %YAML_LOC%/AND_predictor.yaml %YAML_LOC%/AND_environment.yaml %YAML_LOC%/AND_bench.yaml -d %YAML_LOC%/../uvmf_template_output

pause
