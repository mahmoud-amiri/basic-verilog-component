@set QUESTA_ROOT=C:\questasim64_2021.1
@set UVMF_HOME=C:\UVMF_2023.4\UVMF_2023.4
C:\Python27\python C:\UVMF_2023.4\UVMF_2023.4\scripts\yaml2uvmf.py decoder_in_interface.yaml decoder_out_interface.yaml decoder_predictor.yaml decoder_environment.yaml decoder_bench.yaml -d ../uvmf
pause