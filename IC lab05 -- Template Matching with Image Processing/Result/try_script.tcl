# 1. 讀取設計與庫
set search_path "/home/lab911_1/Desktop/7112064123/ICLAB_05/"
set link_library "/usr/cad/Design_Kit/CBDK_IC_Contest_v2.5/SynopsysDC/db/slow.db"
read_verilog TMIP_syn.v
current_design TMIP
link

#check
current_design


# 2. 設定理想時鐘 (Ideal Clock)
set_ideal_network [get_ports clk]


# 3. 套用約束
read_sdc TMIP_syn.sdc

# 4. 開啟 OCV 模式
#set_operating_conditions -analysis_type on_chip_variation

# 5. 產出報告
check_timing
update_timing
report_timing

report_timing > prime_timing.log
# 產出 Setup 路徑
report_timing -delay_type max -max_paths 1 > setup_timing.log

# 產出 Hold 路徑報告
report_timing -delay_type min -max_paths 1 > hold_timing.log

# 檢查分析覆蓋率
report_analysis_coverage > coverage.log