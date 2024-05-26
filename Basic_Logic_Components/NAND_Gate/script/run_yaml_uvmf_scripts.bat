@set QUESTA_ROOT=C:\questasim64_2021.1
@set UVMF_HOME=C:\UVMF_2023.4\UVMF_2023.4
C:\Python27\python C:\UVMF_2023.4\UVMF_2023.4\scripts\yaml2uvmf.py nand_gate_in_interface.yaml nand_gate_out_interface.yaml nand_gate_predictor.yaml nand_gate_environment.yaml nand_gate_bench.yaml -d ../uvmf
pause