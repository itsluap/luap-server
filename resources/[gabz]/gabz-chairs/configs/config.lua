Config = {}
function L(cd) if Locales[Config.Language][cd] then return Locales[Config.Language][cd] else print('Locale is nil ('..cd..')') end end


--██╗███╗   ███╗██████╗  ██████╗ ██████╗ ████████╗ █████╗ ███╗   ██╗████████╗
--██║████╗ ████║██╔══██╗██╔═══██╗██╔══██╗╚══██╔══╝██╔══██╗████╗  ██║╚══██╔══╝
--██║██╔████╔██║██████╔╝██║   ██║██████╔╝   ██║   ███████║██╔██╗ ██║   ██║   
--██║██║╚██╔╝██║██╔═══╝ ██║   ██║██╔══██╗   ██║   ██╔══██║██║╚██╗██║   ██║   
--██║██║ ╚═╝ ██║██║     ╚██████╔╝██║  ██║   ██║   ██║  ██║██║ ╚████║   ██║   
--╚═╝╚═╝     ╚═╝╚═╝      ╚═════╝ ╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═══╝   ╚═╝


Config.Language = 'EN' --[ 'EN' ] You can add your own locales to the Locales.lua. But make sure to add it here.
-- To enable debug prints
Config.DebugPrints = false
-- Do you want the prop to highlight with a coloured outline when the player is looking at it? true = yes/false = no
Config.HighlightProp = true
-- If the above is true, what color do you want the highlight to be, defaulted to black
Config.HighlightColour = {R=0, G=0, B=0,A=255}


--███╗   ███╗ █████╗ ██╗███╗   ██╗
--████╗ ████║██╔══██╗██║████╗  ██║
--██╔████╔██║███████║██║██╔██╗ ██║
--██║╚██╔╝██║██╔══██║██║██║╚██╗██║
--██║ ╚═╝ ██║██║  ██║██║██║ ╚████║
--╚═╝     ╚═╝╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝


-- Animations to use when sitting down
Config.SitTasks = {
    'PROP_HUMAN_SEAT_CHAIR_MP_PLAYER', -- mandatory for position to be set
    {dict='timetable@ron@ig_5_p3', anim='ig_5_p3_base'},
    {dict='timetable@reunited@ig_10', anim='base_amanda'},
    {dict='timetable@ron@ig_3_couch', anim='base'},
    {dict='timetable@jimmy@mics3_ig_15@', anim='mics3_15_base_tracy'},
}

-- Animations to use when lying down
Config.LayAnim = {
    {dict='anim@gangops@morgue@table@', anim='ko_front'},
    {dict='switch@trevor@annoys_sunbathers', anim='trev_annoys_sunbathers_loop_girl'},
}

-- All chairs that can be used to sit down
Config.Chairs = {
    [`prop_bench_01a`] = {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=-0.5, direction=180.0, model = "prop_bench_01a"},
    [`prop_table_04_chr`] = {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=-0.5, direction=180.0, model = "prop_table_04_chr"},
    [`prop_table_01_chr_a`] = {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=-0.0, direction=180.0, model = "prop_table_01_chr_a"},
    [`prop_bench_01b`] = {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=-0.5, direction=180.0, model = "prop_bench_01b"},
    [`prop_bench_01c`] = {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=-0.5, direction=180.0, model = "prop_bench_01c"},
    [`prop_bench_02`] = {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=-0.5, direction=180.0, model = "prop_bench_02"},
    [`prop_bench_03`] = {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=-0.5, direction=180.0, model = "prop_bench_03"},
    [`prop_bench_04`] = {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=-0.5, direction=180.0, model = "prop_bench_04"},
    [`prop_bench_05`] = {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=-0.5, direction=180.0, model = "prop_bench_05"},
    [`prop_bench_06`] = {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=-0.5, direction=180.0, model = "prop_bench_06"},
    [`prop_bench_07`] = {vOffsetX=0.0, vOffsetY=0.2, vOffsetZ=-0.5, direction=180.0, model = "prop_bench_07"},
    [`prop_bench_08`] = {vOffsetX=0.5, vOffsetY=0.2, vOffsetZ=-0.5, direction=180.0, model = "prop_bench_08"},
    [`prop_bench_09`] = {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=-0.3, direction=180.0, model = "prop_bench_09"},
    [`prop_bench_10`] = {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=-0.3, direction=180.0, model = "prop_bench_10"},
    [`prop_off_chair_01`] = {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=-0.5, direction=180.0, model = "prop_off_chair_01"},
    [`prop_off_chair_03`] = {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=-0.5, direction=180.0, model = "prop_off_chair_03"},
    [`prop_off_chair_04`] = {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=-0.4, direction=180.0, model = "prop_off_chair_04"},
    [`prop_off_chair_05`] = {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=-0.4, direction=180.0, model = "prop_off_chair_05"},
    [`prop_chair_01`] = {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=-0.5, direction=180.0, model = "prop_chair_01"},
    [`prop_chair_02`] = {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=-0.5, direction=180.0, model = "prop_chair_02"},
    [`prop_chair_03`] = {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=-0.5, direction=180.0, model = "prop_chair_03"},
    [`prop_chair_04a`] = {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=-0.5, direction=180.0, model = "prop_chair_04a"},
    [`prop_chair_05`] = {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=-0.5, direction=180.0, model = "prop_chair_05"},
    [`prop_chair_06`] = {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=-0.5, direction=180.0, model = "prop_chair_06"},
    [`prop_chair_07`] = {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=-0.5, direction=180.0, model = "prop_chair_07"},
    [`prop_chair_08`] = {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=0.0, direction=180.0, model = "prop_chair_08"},
    [`prop_skid_chair_01`] = {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=-0.1, direction=180.0, model = "prop_skid_chair_01"},
    [`prop_skid_chair_02`] = {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=-0.1, direction=180.0, model = "prop_skid_chair_02"},
    [`prop_cs_office_chair`] = {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=-0.5, direction=180.0, model = "prop_cs_office_chair"},
    [`ba_prop_battle_club_chair_01`] = {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=0.1, direction=180.0, model = "ba_prop_battle_club_chair_01"},
    [`v_med_cor_medstool`] = {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=-0.65, direction=180.0, model = "v_med_cor_medstool"},
    [`v_corp_offchair`] = {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=-0.5, direction=180.0, model = "v_corp_offchair"},
    [`apa_mp_h_din_chair_04`] = {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=-0.5, direction=180.0, model = "apa_mp_h_din_chair_04"},
    [`p_clb_officechair_s`] = {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=-0.5, direction=180.0, model = "p_clb_officechair_s"},
    [`v_res_fa_chair01`] = {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=-0.3, direction=180.0, model = "v_res_fa_chair01"},
    [`v_club_officechair`] = {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=-0.5, direction=180.0, model = "v_club_officechair"},
    [`bkr_prop_clubhouse_chair_03`] = {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=-0.5, direction=180.0, model = "bkr_prop_clubhouse_chair_03"},
    [`v_corp_bk_chair3`] = {vOffsetX=0.1, vOffsetY=0.0, vOffsetZ=-0.5, direction=180.0, model = "v_corp_bk_chair3"}, -- scuffed
    [`v_ilev_leath_chr`] = {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=-0.5, direction=180.0, model = "v_ilev_leath_chr"},
    [`ba_prop_int_glam_stool`] = {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=-0.7, direction=180.0, model = "ba_prop_int_glam_stool"},
    [`prop_sol_chair`] = {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=-0.5, direction=180.0, model = "prop_sol_chair"},
    [`prop_off_chair_04b`] = {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=-0.5, direction=180.0, model = "prop_off_chair_04b"},
    [`v_res_fa_chair02`] = {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=0.5, direction=180.0, model = "v_res_fa_chair02"},
    [`p_ilev_p_easychair_s`] = {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=-0.5, direction=180.0, model = "p_ilev_p_easychair_s"},
    [`v_res_m_dinechair`] =  {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=-0.0, direction=180.0, model = "v_res_m_dinechair"}, --scuffed
    [`v_res_m_l_chair1`] =  {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=-0.5, direction=180.0, model = "v_res_m_l_chair1"},
    [`bkr_prop_clubhouse_armchair_01a`] =  {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=-0.5, direction=180.0, model = "bkr_prop_clubhouse_armchair_01a"},
    [`prop_old_wood_chair`] =  {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=-0.15, direction=180.0, model = "prop_old_wood_chair"},
    [`prop_bar_stool_01`] =  {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=-0.8, direction=180.0, model = "prop_bar_stool_01"},
    [`sm_pizzeria_chair_01`] =  {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=-0.5, direction=180.0, model = "sm_pizzeria_chair_01"},
    [`sm_pizzeria_chesterfield_chair`] =  {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=-0.5, direction=180.0, model = "sm_pizzeria_chesterfield_chair"},
    [`sm_pizzeria_office_chair01`] =  {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=-0.5, direction=180.0, model = "sm_pizzeria_office_chair01"},
    [`sm_pizzeria_office_chair02`] =  {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=-0.5, direction=180.0, model = "sm_pizzeria_office_chair02"},
    [`v_ilev_m_dinechair`] =  {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=-0.5, direction=180.0, model = "v_ilev_m_dinechair"},
    [`prop_table_02_chr`] =  {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=-0.5, direction=180.0, model = "prop_table_02_chr"},
    [`prop_chair_01a`] =  {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=-0.5, direction=180.0, model = "prop_chair_01a"},
    [`ex_prop_offchair_exec_04`] =  {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=-0.5, direction=180.0, model = "ex_prop_offchair_exec_04"},
    [`hei_prop_hei_skid_chair`] =  {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=-0.5, direction=180.0, model = "hei_prop_hei_skid_chair"},
    [`hei_prop_heist_off_chair`] =  {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=-0.5, direction=180.0, model = "hei_prop_heist_off_chair"},
    [`hei_prop_yah_seat_01`] =  {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=-0.5, direction=180.0, model = "hei_prop_yah_seat_01"},
    [`hei_prop_yah_seat_02`] =  {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=-0.5, direction=180.0, model = "hei_prop_yah_seat_02"},
    [`hei_prop_yah_seat_03`] =  {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=-0.5, direction=180.0, model = "hei_prop_yah_seat_03"},
    [`miss_rub_couch_01`] =  {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=-0.5, direction=180.0, model = "miss_rub_couch_01"},
    [`p_armchair_01_s`] =  {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=-0.5, direction=180.0, model = "p_armchair_01_s"},
    [`p_dinechair_01_s`] =  {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=-0.5, direction=180.0, model = "p_dinechair_01_s"},
    [`p_lev_sofa_s`] =  {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=-0.5, direction=180.0, model = "p_lev_sofa_s"},
    [`p_res_sofa_l_s`] =  {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=-0.5, direction=180.0, model = "p_res_sofa_l_s"},
    [`p_soloffchair_s`] =  {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=-0.5, direction=180.0, model = "p_soloffchair_s"},
    [`p_v_med_p_sofa_s`] =  {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=-0.5, direction=180.0, model = "p_v_med_p_sofa_s"},
    [`p_yacht_chair_01_s`] =  {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=-0.5, direction=180.0, model = "p_yacht_chair_01_s"},
    [`p_yacht_sofa_01_s`] =  {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=-0.5, direction=180.0, model = "p_yacht_sofa_01_s"},
    [`prop_bench_11`] =  {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=-0.5, direction=180.0, model = "prop_bench_11"},
    [`prop_chair_01b`] =  {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=-0.5, direction=180.0, model = "prop_chair_01b"},
    [`prop_chair_04b`] =  {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=-0.5, direction=180.0, model = "prop_chair_04b"},
    [`prop_chair_09`] =  {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=-0.5, direction=180.0, model = "prop_chair_09"},
    [`prop_chair_10`] =  {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=-0.5, direction=180.0, model = "prop_chair_10"},
    [`prop_chateau_chair_01`] =  {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=-0.5, direction=180.0, model = "prop_chateau_chair_01"},
    [`prop_clown_chair`] =  {vOffsetX=-0.225, vOffsetY=0.30, vOffsetZ=-0.5, direction=180.0, model = "prop_clown_chair"},
    [`prop_direct_chair_01`] =  {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=-0.5, direction=180.0, model = "prop_direct_chair_01"},
    [`prop_direct_chair_02`] =  {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=-0.5, direction=180.0, model = "prop_direct_chair_02"},
    [`prop_fib_3b_bench`] =  {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=-0.5, direction=180.0, model = "prop_fib_3b_bench"},
    [`prop_gc_chair02`] =  {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=-0.5, direction=180.0, model = "prop_gc_chair02"},
    [`prop_hobo_seat_01`] =  {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=-0.5, direction=180.0, model = "prop_hobo_seat_01"},
    [`prop_ld_bench01`] =  {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=-0.5, direction=180.0, model = "prop_ld_bench01"},
    [`prop_ld_farm_chair01`] =  {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=-0.5, direction=180.0, model = "prop_ld_farm_chair01"},
    [`prop_ld_farm_couch01`] =  {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=-0.5, direction=180.0, model = "prop_ld_farm_couch01"},
    [`prop_ld_farm_couch02`] =  {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=-0.5, direction=180.0, model = "prop_ld_farm_couch02"},
    [`prop_off_chair_04_s`] =  {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=-0.5, direction=180.0, model = "prop_off_chair_04_s"},
    [`prop_old_deck_chair`] =  {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=-0.5, direction=180.0, model = "prop_old_deck_chair"},
    [`prop_picnictable_01`] =  {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=-0.5, direction=180.0, model = "prop_picnictable_01"},
    [`prop_picnictable_02`] =  {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=-0.5, direction=180.0, model = "prop_picnictable_02"},
    [`prop_rock_chair_01`] =  {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=-0.5, direction=180.0, model = "prop_rock_chair_01"},
    [`prop_roller_car_01`] =  {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=-0.5, direction=180.0, model = "prop_roller_car_01"},
    [`prop_roller_car_02`] =  {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=-0.5, direction=180.0, model = "prop_roller_car_02"},
    [`prop_rub_couch01`] =  {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=-0.5, direction=180.0, model = "prop_rub_couch01"},
    [`prop_rub_couch02`] =  {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=-0.5, direction=180.0, model = "prop_rub_couch02"},
    [`prop_rub_couch03`] =  {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=-0.5, direction=180.0, model = "prop_rub_couch03"},
    [`prop_rub_couch04`] =  {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=-0.5, direction=180.0, model = "prop_rub_couch04"},
    [`prop_skid_chair_03`] =  {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=-0.5, direction=180.0, model = "prop_rub_couch04"},
    [`prop_table_01_chr_b`] =  {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=-0.5, direction=180.0, model = "prop_table_01_chr_b"},
    [`prop_table_03_chr`] =  {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=-0.5, direction=180.0, model = "prop_table_03_chr"},
    [`prop_table_03b_chr`] =  {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=-0.5, direction=180.0, model = "prop_table_03_chr"},
    [`prop_table_05_chr`] =  {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=-0.5, direction=180.0, model = "prop_table_05_chr"},
    [`prop_table_06_chr`] =  {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=-0.5, direction=180.0, model = "prop_table_06_chr"},
    [`prop_torture_ch_01`] =  {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=-0.15, direction=180.0, model = "prop_torture_ch_01"},
    [`prop_wait_bench_01`] =  {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=-0.5, direction=180.0, model = "prop_wait_bench_01"},
    [`prop_waiting_seat_01`] =  {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=-0.5, direction=180.0, model = "prop_waiting_seat_01"},
    [`prop_yacht_seat_01`] =  {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=-0.5, direction=180.0, model = "prop_yacht_seat_01"},
    [`prop_yacht_seat_02`] =  {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=-0.5, direction=180.0, model = "prop_yacht_seat_02"},
    [`prop_yacht_seat_03`] =  {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=-0.5, direction=180.0, model = "prop_yacht_seat_03"},
    [`v_club_bahbarstool`] =  {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=-0.5, direction=180.0, model = "v_club_bahbarstool"},
    [`v_club_stagechair`] =  {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=-0.5, direction=180.0, model = "v_club_stagechair"},
    [`v_corp_cd_chair`] =  {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=-0.5, direction=180.0, model = "v_corp_cd_chair"},
    [`v_ilev_chair02_ped`] =  {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=-0.5, direction=180.0, model = "v_ilev_chair02_ped"},
    [`v_ilev_fh_dineeamesa`] =  {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=-0.5, direction=180.0, model = "v_ilev_fh_dineeamesa"},
    [`v_ilev_fh_kitchenstool`] =  {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=-0.5, direction=180.0, model = "v_ilev_fh_kitchenstool"},
    [`v_ilev_hd_chair`] =  {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=-0.5, direction=180.0, model = "v_ilev_hd_chair"},
    [`v_ilev_m_sofa`] =  {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=-0.5, direction=180.0, model = "v_ilev_m_sofa"},
    [`v_ilev_p_easychair`] =  {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=-0.5, direction=180.0, model = "v_ilev_p_easychair"},
    [`v_ilev_tort_stool`] =  {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=-0.5, direction=180.0, model = "v_ilev_tort_stool"},
    [`v_res_tre_sofa_s`] =  {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=-0.5, direction=180.0, model = "v_res_tre_sofa_s"},
    [`v_ret_gc_chair03`] =  {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=-0.5, direction=180.0, model = "v_ret_gc_chair03"},
    [`v_serv_ct_chair02`] =  {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=-0.5, direction=180.0, model = "v_serv_ct_chair02"},
    [`v_tre_sofa_mess_a_s`] =  {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=-0.5, direction=180.0, model = "v_tre_sofa_mess_a_s"},
    [`v_tre_sofa_mess_b_s`] =  {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=-0.5, direction=180.0, model = "v_tre_sofa_mess_b_s"},
    [`v_tre_sofa_mess_c_s`] =  {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=-0.5, direction=180.0, model = "v_tre_sofa_mess_c_s"},
    [`vw_prop_casino_chair_01a`] =  {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=-0.5, direction=180.0, model = "vw_prop_casino_chair_01a"},
    [`vw_prop_vw_offchair_02`] =  {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=-0.5, direction=180.0, model = "vw_prop_vw_offchair_02"},
    [`bkr_prop_biker_boardchair01`] =  {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=0.1, direction=180.0, model = "bkr_prop_biker_boardchair01"},
    [`v_corp_lazychair`] =  {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=-0.5, direction=180.0, model = "v_corp_lazychair"},
    [`imp_prop_impexp_offchair_01a`] =  {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=0.1, direction=180.0, model = "imp_prop_impexp_offchair_01a"},
    [`gabz_pdprops_chair04`] =  {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=-0.5, direction=180.0, model = "gabz_pdprops_chair04"},
    [`gabz_davispd_chair01`] =  {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=-0.5, direction=180.0, model = "gabz_davispd_chair01"},
    [`gabz_davispd_bench01`] =  {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=-0.5, direction=180.0, model = "gabz_davispd_bench01"},
}

-- All beds that can be used to lie down
Config.Beds = {
    [`p_lestersbed_s`] = {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=0.0, direction=180.0, model = "p_lestersbed_s"},
    [`p_mbbed_s`] = {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=0.75, direction=180.0, model = "p_mbbed_s"},
    [`v_res_msonbed_s`] = {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=0.5, direction=180.0, model = "v_res_msonbed_s"},
    [`v_res_d_bed`] = {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=-0.61, direction=180.0, model = "v_res_d_bed"},
    [`v_res_lestersbed`] = {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=0.325, direction=180.0, model = "v_res_lestersbed"},
    [`v_res_mbbed`] = {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=0.35, direction=180.0, model = "v_res_mbbed"},
    [`v_res_mbbed_mess`] = {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=0.35, direction=180.0, model = "v_res_mbbed_mess"},
    [`v_res_mdbed`] = {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=0.4, direction=180.0, model = "v_res_mdbed"},
    [`v_res_msonbed`] = {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=0.5, direction=180.0, model = "v_res_msonbed"},
    [`v_res_tre_bed1`] = {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=0.6, direction=180.0, model = "v_res_tre_bed1"},
    [`v_res_tre_bed1_messy`] = {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=0.6, direction=180.0, model = "v_res_tre_bed1_messy"},
    [`v_res_tre_bed2`] = {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=0.5, direction=180.0, model = "v_res_tre_bed2"},
    [`v_res_tt_bed`] = {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=0.5, direction=180.0, model = "v_res_tt_bed"},
    [`v_med_bed1`] = {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=0.4, direction=180.0, model = "v_med_bed1"},
    [`v_med_bed2`] = {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=0.4, direction=180.0, model = "v_med_bed2"},
    [`v_med_emptybed`] = {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=0.1, direction=180.0, model = "v_med_emptybed"},
    [`apa_mp_h_bed_double_08`] = {vOffsetX=0.0, vOffsetY=-1.25, vOffsetZ=0.6, direction=180.0, model = "apa_mp_h_bed_double_08"},
    [`apa_mp_h_bed_double_09`] = {vOffsetX=0.0, vOffsetY=-1.25, vOffsetZ=0.6, direction=180.0, model = "apa_mp_h_bed_double_09"},
    [`apa_mp_h_bed_wide_05`] = {vOffsetX=0.0, vOffsetY=-1.25, vOffsetZ=0.6, direction=180.0, model = "apa_mp_h_bed_wide_05"},
    [`apa_mp_h_bed_with_table_02`] = {vOffsetX=0.0, vOffsetY=-1.25, vOffsetZ=1.0, direction=180.0, model = "apa_mp_h_bed_with_table_02"},
    [`apa_mp_h_yacht_bed_01`] = {vOffsetX=0.0, vOffsetY=-1.25, vOffsetZ=1.0, direction=180.0, model = "apa_mp_h_yacht_bed_01"},
    [`apa_mp_h_yacht_bed_02`] = {vOffsetX=0.0, vOffsetY=-1.25, vOffsetZ=1.0, direction=180.0, model = "apa_mp_h_yacht_bed_02"},
    [`h4_mp_h_yacht_bed_01`] = {vOffsetX=0.0, vOffsetY=-1.25, vOffsetZ=1.0, direction=180.0, model = "h4_mp_h_yacht_bed_01"},
    [`h4_mp_h_yacht_bed_02`] = {vOffsetX=0.0, vOffsetY=-1.25, vOffsetZ=1.0, direction=180.0, model = "h4_mp_h_yacht_bed_02"},
    [`sm_hanger_bedroom_tradbed`] =  {vOffsetX=0.0, vOffsetY=-1.25, vOffsetZ=1.0, direction=180.0, model = "sm_hanger_bedroom_tradbed"},
    [`imp_prop_impexp_campbed_01`] =  {vOffsetX=0.0, vOffsetY=0.0, vOffsetZ=0.75, direction=90.0, model = "imp_prop_impexp_campbed_01"},
}


--██╗  ██╗███████╗██╗   ██╗███████╗     █████╗ ███╗   ██╗██████╗      ██████╗ ██████╗ ███╗   ███╗███╗   ███╗ █████╗ ███╗   ██╗██████╗ ███████╗
--██║ ██╔╝██╔════╝╚██╗ ██╔╝██╔════╝    ██╔══██╗████╗  ██║██╔══██╗    ██╔════╝██╔═══██╗████╗ ████║████╗ ████║██╔══██╗████╗  ██║██╔══██╗██╔════╝
--█████╔╝ █████╗   ╚████╔╝ ███████╗    ███████║██╔██╗ ██║██║  ██║    ██║     ██║   ██║██╔████╔██║██╔████╔██║███████║██╔██╗ ██║██║  ██║███████╗
--██╔═██╗ ██╔══╝    ╚██╔╝  ╚════██║    ██╔══██║██║╚██╗██║██║  ██║    ██║     ██║   ██║██║╚██╔╝██║██║╚██╔╝██║██╔══██║██║╚██╗██║██║  ██║╚════██║
--██║  ██╗███████╗   ██║   ███████║    ██║  ██║██║ ╚████║██████╔╝    ╚██████╗╚██████╔╝██║ ╚═╝ ██║██║ ╚═╝ ██║██║  ██║██║ ╚████║██████╔╝███████║
--╚═╝  ╚═╝╚══════╝   ╚═╝   ╚══════╝    ╚═╝  ╚═╝╚═╝  ╚═══╝╚═════╝      ╚═════╝ ╚═════╝ ╚═╝     ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═════╝ ╚══════╝


Config.Control = {
    ENABLE = true, --Do you want to allow player's to sit/lay on chairs/beds?
    command = '+gabzinteract', --The chat command.
    description = L('command_control'), --The chat command's description.
    key = 'e' --The key (using keymapping).
}

Config.ControlRight = {
    ENABLE = true, --Do you want to allow player's change sitting/laying animations?
    command = '+gabzRight',
    description = L('command_control_right'),
    key = 'RIGHT'
}

Config.ControlLeft = {
    ENABLE = true, --Do you want to allow player's change sitting/laying animations?
    command = '+gabzLeft',
    description = L('command_control_left'),
    key = 'LEFT'
}

Config.EmoteCancel = {
    ENABLE = true, --Do you want to allow player's to be able to cancel emotes?
    command = '+gabzCancel',
    description = L('command_cancel'),
    key = 'x'
}