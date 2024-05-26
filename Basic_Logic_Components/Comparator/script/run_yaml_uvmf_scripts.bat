@set QUESTA_ROOT=C:\questasim64_2021.1
@set UVMF_HOME=C:\UVMF_2023.4\UVMF_2023.4
C:\Python27\python C:\UVMF_2023.4\UVMF_2023.4\scripts\yaml2uvmf.py comparator_in_interface.yaml comparator_out_interface.yaml comparator_predictor.yaml comparator_environment.yaml comparator_bench.yaml -d ../uvmf
pause