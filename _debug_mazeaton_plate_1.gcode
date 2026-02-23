; HEADER_BLOCK_START
; BambuStudio 02.01.01.52
; model printing time: 6m 8s; total estimated time: 12m 7s
; total layer number: 23
; total filament length [mm] : 742.03
; total filament volume [cm^3] : 1784.79
; total filament weight [g] : 2.25
; filament_density: 1.26
; filament_diameter: 1.75
; max_z_height: 4.60
; filament: 1
; HEADER_BLOCK_END

; CONFIG_BLOCK_START
; accel_to_decel_enable = 0
; accel_to_decel_factor = 50%
; activate_air_filtration = 0
; additional_cooling_fan_speed = 70
; apply_scarf_seam_on_circles = 1
; auxiliary_fan = 0
; bed_custom_model = 
; bed_custom_texture = 
; bed_exclude_area = 
; bed_temperature_formula = by_first_filament
; before_layer_change_gcode = 
; best_object_pos = 0.7,0.5
; bottom_color_penetration_layers = 3
; bottom_shell_layers = 3
; bottom_shell_thickness = 0
; bottom_surface_pattern = monotonic
; bridge_angle = 0
; bridge_flow = 1
; bridge_no_support = 0
; bridge_speed = 50
; brim_object_gap = 0.1
; brim_type = auto_brim
; brim_width = 5
; chamber_temperatures = 0
; change_filament_gcode = ;===== A1mini 20250206 =====\nG392 S0\nM1007 S0\nM620 S[next_extruder]A\nM204 S9000\nG1 Z{max_layer_z + 3.0} F1200\n\nM400\nM106 P1 S0\nM106 P2 S0\n{if old_filament_temp > 142 && next_extruder < 255}\nM104 S[old_filament_temp]\n{endif}\n\nG1 X180 F18000\n\n{if long_retractions_when_cut[previous_extruder]}\nM620.11 S1 I[previous_extruder] E-{retraction_distances_when_cut[previous_extruder]} F1200\n{else}\nM620.11 S0\n{endif}\nM400\n\nM620.1 E F[old_filament_e_feedrate] T{nozzle_temperature_range_high[previous_extruder]}\nM620.10 A0 F[old_filament_e_feedrate]\nT[next_extruder]\nM620.1 E F[new_filament_e_feedrate] T{nozzle_temperature_range_high[next_extruder]}\nM620.10 A1 F[new_filament_e_feedrate] L[flush_length] H[nozzle_diameter] T[nozzle_temperature_range_high]\n\nG1 Y90 F9000\n\n{if next_extruder < 255}\n\n{if long_retractions_when_cut[previous_extruder]}\nM620.11 S1 I[previous_extruder] E{retraction_distances_when_cut[previous_extruder]} F{old_filament_e_feedrate}\nM628 S1\nG92 E0\nG1 E{retraction_distances_when_cut[previous_extruder]} F[old_filament_e_feedrate]\nM400\nM629 S1\n{else}\nM620.11 S0\n{endif}\n\nM400\nG92 E0\nM628 S0\n\n{if flush_length_1 > 1}\n; FLUSH_START\n; always use highest temperature to flush\nM400\nM1002 set_filament_type:UNKNOWN\nM109 S[nozzle_temperature_range_high]\nM106 P1 S60\n{if flush_length_1 > 23.7}\nG1 E23.7 F{old_filament_e_feedrate} ; do not need pulsatile flushing for start part\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{old_filament_e_feedrate}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{new_filament_e_feedrate}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{new_filament_e_feedrate}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{new_filament_e_feedrate}\n{else}\nG1 E{flush_length_1} F{old_filament_e_feedrate}\n{endif}\n; FLUSH_END\nG1 E-[old_retract_length_toolchange] F1800\nG1 E[old_retract_length_toolchange] F300\nM400\nM1002 set_filament_type:{filament_type[next_extruder]}\n{endif}\n\n{if flush_length_1 > 45 && flush_length_2 > 1}\n; WIPE\nM400\nM106 P1 S178\nM400 S3\nG1 X-3.5 F18000\nG1 X-13.5 F3000\nG1 X-3.5 F18000\nG1 X-13.5 F3000\nG1 X-3.5 F18000\nG1 X-13.5 F3000\nM400\nM106 P1 S0\n{endif}\n\n{if flush_length_2 > 1}\nM106 P1 S60\n; FLUSH_START\nG1 E{flush_length_2 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_2 * 0.02} F50\n; FLUSH_END\nG1 E-[new_retract_length_toolchange] F1800\nG1 E[new_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_2 > 45 && flush_length_3 > 1}\n; WIPE\nM400\nM106 P1 S178\nM400 S3\nG1 X-3.5 F18000\nG1 X-13.5 F3000\nG1 X-3.5 F18000\nG1 X-13.5 F3000\nG1 X-3.5 F18000\nG1 X-13.5 F3000\nM400\nM106 P1 S0\n{endif}\n\n{if flush_length_3 > 1}\nM106 P1 S60\n; FLUSH_START\nG1 E{flush_length_3 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_3 * 0.02} F50\n; FLUSH_END\nG1 E-[new_retract_length_toolchange] F1800\nG1 E[new_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_3 > 45 && flush_length_4 > 1}\n; WIPE\nM400\nM106 P1 S178\nM400 S3\nG1 X-3.5 F18000\nG1 X-13.5 F3000\nG1 X-3.5 F18000\nG1 X-13.5 F3000\nG1 X-3.5 F18000\nG1 X-13.5 F3000\nM400\nM106 P1 S0\n{endif}\n\n{if flush_length_4 > 1}\nM106 P1 S60\n; FLUSH_START\nG1 E{flush_length_4 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_4 * 0.02} F50\n; FLUSH_END\n{endif}\n\nM629\n\nM400\nM106 P1 S60\nM109 S[new_filament_temp]\nG1 E5 F{new_filament_e_feedrate} ;Compensate for filament spillage during waiting temperature\nM400\nG92 E0\nG1 E-[new_retract_length_toolchange] F1800\nM400\nM106 P1 S178\nM400 S3\nG1 X-3.5 F18000\nG1 X-13.5 F3000\nG1 X-3.5 F18000\nG1 X-13.5 F3000\nG1 X-3.5 F18000\nG1 X-13.5 F3000\nG1 X-3.5 F18000\nG1 X-13.5 F3000\nM400\nG1 Z{max_layer_z + 3.0} F3000\nM106 P1 S0\n{if layer_z <= (initial_layer_print_height + 0.001)}\nM204 S[initial_layer_acceleration]\n{else}\nM204 S[default_acceleration]\n{endif}\n{else}\nG1 X[x_after_toolchange] Y[y_after_toolchange] Z[z_after_toolchange] F12000\n{endif}\n\nM622.1 S0\nM9833 F{outer_wall_volumetric_speed/2.4} A0.3 ; cali dynamic extrusion compensation\nM1002 judge_flag filament_need_cali_flag\nM622 J1\n  G92 E0\n  G1 E-[new_retract_length_toolchange] F1800\n  M400\n  \n  M106 P1 S178\n  M400 S7\n  G1 X0 F18000\n  G1 X-13.5 F3000\n  G1 X0 F18000 ;wipe and shake\n  G1 X-13.5 F3000\n  G1 X0 F12000 ;wipe and shake\n  G1 X-13.5 F3000\n  G1 X0 F12000 ;wipe and shake\n  M400\n  M106 P1 S0 \nM623\n\nM621 S[next_extruder]A\nG392 S0\n\nM1007 S1\n
; circle_compensation_manual_offset = 0
; circle_compensation_speed = 200
; close_fan_the_first_x_layers = 1
; complete_print_exhaust_fan_speed = 70
; cool_plate_temp = 35
; cool_plate_temp_initial_layer = 35
; counter_coef_1 = 0
; counter_coef_2 = 0.008
; counter_coef_3 = -0.041
; counter_limit_max = 0.033
; counter_limit_min = -0.035
; curr_bed_type = Textured PEI Plate
; default_acceleration = 6000
; default_filament_colour = ""
; default_filament_profile = "Bambu PLA Basic @BBL A1M"
; default_jerk = 0
; default_nozzle_volume_type = Standard
; default_print_profile = 0.20mm Standard @BBL A1M
; deretraction_speed = 30
; detect_floating_vertical_shell = 1
; detect_narrow_internal_solid_infill = 1
; detect_overhang_wall = 1
; detect_thin_wall = 0
; diameter_limit = 50
; draft_shield = disabled
; during_print_exhaust_fan_speed = 70
; elefant_foot_compensation = 0
; enable_arc_fitting = 1
; enable_circle_compensation = 0
; enable_long_retraction_when_cut = 2
; enable_overhang_bridge_fan = 1
; enable_overhang_speed = 1
; enable_pre_heating = 0
; enable_pressure_advance = 0
; enable_prime_tower = 0
; enable_support = 0
; enforce_support_layers = 0
; eng_plate_temp = 0
; eng_plate_temp_initial_layer = 0
; ensure_vertical_shell_thickness = enabled
; exclude_object = 1
; extruder_ams_count = 1#0|4#0;1#0|4#0
; extruder_clearance_dist_to_rod = 56.5
; extruder_clearance_height_to_lid = 180
; extruder_clearance_height_to_rod = 25
; extruder_clearance_max_radius = 73
; extruder_colour = #018001
; extruder_offset = 0x0
; extruder_printable_area = 
; extruder_type = Direct Drive
; extruder_variant_list = "Direct Drive Standard"
; fan_cooling_layer_time = 80
; fan_max_speed = 80
; fan_min_speed = 60
; filament_adhesiveness_category = 100
; filament_change_length = 5
; filament_colour = #FF8040
; filament_cost = 24.99
; filament_density = 1.26
; filament_diameter = 1.75
; filament_end_gcode = "; filament end gcode \n\n"
; filament_extruder_variant = "Direct Drive Standard"
; filament_flow_ratio = 0.98
; filament_flush_temp = 0
; filament_flush_volumetric_speed = 0
; filament_ids = GFA00
; filament_is_support = 0
; filament_long_retractions_when_cut = 1
; filament_map = 1
; filament_map_mode = Auto For Flush
; filament_max_volumetric_speed = 21
; filament_minimal_purge_on_wipe_tower = 15
; filament_notes = 
; filament_pre_cooling_temperature = 0
; filament_prime_volume = 30
; filament_printable = 3
; filament_ramming_travel_time = 0
; filament_ramming_volumetric_speed = -1
; filament_retraction_distances_when_cut = 18
; filament_scarf_gap = 0%
; filament_scarf_height = 10%
; filament_scarf_length = 10
; filament_scarf_seam_type = none
; filament_self_index = 1
; filament_settings_id = "Bambu PLA Basic @BBL A1M"
; filament_shrink = 100%
; filament_soluble = 0
; filament_start_gcode = "; filament start gcode\n{if  (bed_temperature[current_extruder] >55)||(bed_temperature_initial_layer[current_extruder] >55)}M106 P3 S200\n{elsif(bed_temperature[current_extruder] >50)||(bed_temperature_initial_layer[current_extruder] >50)}M106 P3 S150\n{elsif(bed_temperature[current_extruder] >45)||(bed_temperature_initial_layer[current_extruder] >45)}M106 P3 S50\n{endif}\n\n{if activate_air_filtration[current_extruder] && support_air_filtration}\nM106 P3 S{during_print_exhaust_fan_speed_num[current_extruder]} \n{endif}"
; filament_type = PLA
; filament_vendor = "Bambu Lab"
; filename_format = {input_filename_base}_{filament_type[0]}_{print_time}.gcode
; filter_out_gap_fill = 0
; first_layer_print_sequence = 0
; flush_into_infill = 0
; flush_into_objects = 0
; flush_into_support = 1
; flush_multiplier = 1
; flush_volumes_matrix = 0
; flush_volumes_vector = 140,140
; full_fan_speed_layer = 0
; fuzzy_skin = none
; fuzzy_skin_point_distance = 0.8
; fuzzy_skin_thickness = 0.3
; gap_infill_speed = 250
; gcode_add_line_number = 0
; gcode_flavor = marlin
; grab_length = 17.4
; has_scarf_joint_seam = 1
; head_wrap_detect_zone = 156x152,180x152,180x180,156x180
; hole_coef_1 = 0
; hole_coef_2 = -0.008
; hole_coef_3 = 0.23415
; hole_limit_max = 0.22
; hole_limit_min = 0.088
; host_type = octoprint
; hot_plate_temp = 60
; hot_plate_temp_initial_layer = 60
; hotend_cooling_rate = 2
; hotend_heating_rate = 2
; impact_strength_z = 13.8
; independent_support_layer_height = 1
; infill_combination = 0
; infill_direction = 45
; infill_jerk = 9
; infill_lock_depth = 1
; infill_rotate_step = 0
; infill_shift_step = 0.4
; infill_wall_overlap = 15%
; initial_layer_acceleration = 500
; initial_layer_flow_ratio = 1
; initial_layer_infill_speed = 105
; initial_layer_jerk = 9
; initial_layer_line_width = 0.5
; initial_layer_print_height = 0.2
; initial_layer_speed = 50
; initial_layer_travel_acceleration = 6000
; inner_wall_acceleration = 0
; inner_wall_jerk = 9
; inner_wall_line_width = 0.45
; inner_wall_speed = 300
; interface_shells = 0
; interlocking_beam = 0
; interlocking_beam_layer_count = 2
; interlocking_beam_width = 0.8
; interlocking_boundary_avoidance = 2
; interlocking_depth = 2
; interlocking_orientation = 22.5
; internal_bridge_support_thickness = 0.8
; internal_solid_infill_line_width = 0.42
; internal_solid_infill_pattern = zig-zag
; internal_solid_infill_speed = 250
; ironing_direction = 45
; ironing_flow = 10%
; ironing_inset = 0.21
; ironing_pattern = zig-zag
; ironing_spacing = 0.15
; ironing_speed = 30
; ironing_type = no ironing
; is_infill_first = 0
; layer_change_gcode = ; layer num/total_layer_count: {layer_num+1}/[total_layer_count]\n; update layer progress\nM73 L{layer_num+1}\nM991 S0 P{layer_num} ;notify layer change\n
; layer_height = 0.2
; line_width = 0.42
; long_retractions_when_cut = 0
; long_retractions_when_ec = 0
; machine_end_gcode = ;===== date: 20231229 =====================\n;turn off nozzle clog detect\nG392 S0\n\nM400 ; wait for buffer to clear\nG92 E0 ; zero the extruder\nG1 E-0.8 F1800 ; retract\nG1 Z{max_layer_z + 0.5} F900 ; lower z a little\nG1 X0 Y{first_layer_center_no_wipe_tower[1]} F18000 ; move to safe pos\nG1 X-13.0 F3000 ; move to safe pos\n{if !spiral_mode && print_sequence != "by object"}\nM1002 judge_flag timelapse_record_flag\nM622 J1\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM991 S0 P-1 ;end timelapse at safe pos\nM623\n{endif}\n\nM140 S0 ; turn off bed\nM106 S0 ; turn off fan\nM106 P2 S0 ; turn off remote part cooling fan\nM106 P3 S0 ; turn off chamber cooling fan\n\n;G1 X27 F15000 ; wipe\n\n; pull back filament to AMS\nM620 S255\nG1 X181 F12000\nT255\nG1 X0 F18000\nG1 X-13.0 F3000\nG1 X0 F18000 ; wipe\nM621 S255\n\nM104 S0 ; turn off hotend\n\nM400 ; wait all motion done\nM17 S\nM17 Z0.4 ; lower z motor current to reduce impact if there is something in the bottom\n{if (max_layer_z + 100.0) < 180}\n    G1 Z{max_layer_z + 100.0} F600\n    G1 Z{max_layer_z +98.0}\n{else}\n    G1 Z180 F600\n    G1 Z180\n{endif}\nM400 P100\nM17 R ; restore z current\n\nG90\nG1 X-13 Y180 F3600\n\nG91\nG1 Z-1 F600\nG90\nM83\n\nM220 S100  ; Reset feedrate magnitude\nM201.2 K1.0 ; Reset acc magnitude\nM73.2   R1.0 ;Reset left time magnitude\nM1002 set_gcode_claim_speed_level : 0\n\n;=====printer finish  sound=========\nM17\nM400 S1\nM1006 S1\nM1006 A0 B20 L100 C37 D20 M100 E42 F20 N100\nM1006 A0 B10 L100 C44 D10 M100 E44 F10 N100\nM1006 A0 B10 L100 C46 D10 M100 E46 F10 N100\nM1006 A44 B20 L100 C39 D20 M100 E48 F20 N100\nM1006 A0 B10 L100 C44 D10 M100 E44 F10 N100\nM1006 A0 B10 L100 C0 D10 M100 E0 F10 N100\nM1006 A0 B10 L100 C39 D10 M100 E39 F10 N100\nM1006 A0 B10 L100 C0 D10 M100 E0 F10 N100\nM1006 A0 B10 L100 C44 D10 M100 E44 F10 N100\nM1006 A0 B10 L100 C0 D10 M100 E0 F10 N100\nM1006 A0 B10 L100 C39 D10 M100 E39 F10 N100\nM1006 A0 B10 L100 C0 D10 M100 E0 F10 N100\nM1006 A44 B10 L100 C0 D10 M100 E48 F10 N100\nM1006 A0 B10 L100 C0 D10 M100 E0 F10 N100\nM1006 A44 B20 L100 C41 D20 M100 E49 F20 N100\nM1006 A0 B20 L100 C0 D20 M100 E0 F20 N100\nM1006 A0 B20 L100 C37 D20 M100 E37 F20 N100\nM1006 W\n;=====printer finish  sound=========\nM400 S1\nM18 X Y Z\n
; machine_load_filament_time = 28
; machine_max_acceleration_e = 5000,5000
; machine_max_acceleration_extruding = 20000,20000
; machine_max_acceleration_retracting = 5000,5000
; machine_max_acceleration_travel = 9000,9000
; machine_max_acceleration_x = 20000,20000
; machine_max_acceleration_y = 20000,20000
; machine_max_acceleration_z = 1500,1500
; machine_max_jerk_e = 3,3
; machine_max_jerk_x = 9,9
; machine_max_jerk_y = 9,9
; machine_max_jerk_z = 5,5
; machine_max_speed_e = 30,30
; machine_max_speed_x = 500,200
; machine_max_speed_y = 500,200
; machine_max_speed_z = 30,30
; machine_min_extruding_rate = 0,0
; machine_min_travel_rate = 0,0
; machine_pause_gcode = M400 U1
; machine_start_gcode = ;===== machine: A1 mini =========================\n;===== date: 20240620 =====================\n\n;===== start to heat heatbead&hotend==========\nM1002 gcode_claim_action : 2\nM1002 set_filament_type:{filament_type[initial_no_support_extruder]}\nM104 S170\nM140 S[bed_temperature_initial_layer_single]\nG392 S0 ;turn off clog detect\nM9833.2\n;=====start printer sound ===================\nM17\nM400 S1\nM1006 S1\nM1006 A0 B0 L100 C37 D10 M100 E37 F10 N100\nM1006 A0 B0 L100 C41 D10 M100 E41 F10 N100\nM1006 A0 B0 L100 C44 D10 M100 E44 F10 N100\nM1006 A0 B10 L100 C0 D10 M100 E0 F10 N100\nM1006 A43 B10 L100 C39 D10 M100 E46 F10 N100\nM1006 A0 B0 L100 C0 D10 M100 E0 F10 N100\nM1006 A0 B0 L100 C39 D10 M100 E43 F10 N100\nM1006 A0 B0 L100 C0 D10 M100 E0 F10 N100\nM1006 A0 B0 L100 C41 D10 M100 E41 F10 N100\nM1006 A0 B0 L100 C44 D10 M100 E44 F10 N100\nM1006 A0 B0 L100 C49 D10 M100 E49 F10 N100\nM1006 A0 B0 L100 C0 D10 M100 E0 F10 N100\nM1006 A44 B10 L100 C39 D10 M100 E48 F10 N100\nM1006 A0 B0 L100 C0 D10 M100 E0 F10 N100\nM1006 A0 B0 L100 C39 D10 M100 E44 F10 N100\nM1006 A0 B0 L100 C0 D10 M100 E0 F10 N100\nM1006 A43 B10 L100 C39 D10 M100 E46 F10 N100\nM1006 W\nM18\n;=====avoid end stop =================\nG91\nG380 S2 Z30 F1200\nG380 S3 Z-20 F1200\nG1 Z5 F1200\nG90\n\n;===== reset machine status =================\nM204 S6000\n\nM630 S0 P0\nG91\nM17 Z0.3 ; lower the z-motor current\n\nG90\nM17 X0.7 Y0.9 Z0.5 ; reset motor current to default\nM960 S5 P1 ; turn on logo lamp\nG90\nM83\nM220 S100 ;Reset Feedrate\nM221 S100 ;Reset Flowrate\nM73.2   R1.0 ;Reset left time magnitude\n;====== cog noise reduction=================\nM982.2 S1 ; turn on cog noise reduction\n\n;===== prepare print temperature and material ==========\nM400\nM18\nM109 S100 H170\nM104 S170\nM400\nM17\nM400\nG28 X\n\nM211 X0 Y0 Z0 ;turn off soft endstop ; turn off soft endstop to prevent protential logic problem\n\nM975 S1 ; turn on\n\nG1 X0.0 F30000\nG1 X-13.5 F3000\n\nM620 M ;enable remap\nM620 S[initial_no_support_extruder]A   ; switch material if AMS exist\n    G392 S0 ;turn on clog detect\n    M1002 gcode_claim_action : 4\n    M400\n    M1002 set_filament_type:UNKNOWN\n    M109 S[nozzle_temperature_initial_layer]\n    M104 S250\n    M400\n    T[initial_no_support_extruder]\n    G1 X-13.5 F3000\n    M400\n    M620.1 E F{filament_max_volumetric_speed[initial_no_support_extruder]/2.4053*60} T{nozzle_temperature_range_high[initial_no_support_extruder]}\n    M109 S250 ;set nozzle to common flush temp\n    M106 P1 S0\n    G92 E0\n    G1 E50 F200\n    M400\n    M1002 set_filament_type:{filament_type[initial_no_support_extruder]}\n    M104 S{nozzle_temperature_range_high[initial_no_support_extruder]}\n    G92 E0\n    G1 E50 F{filament_max_volumetric_speed[initial_no_support_extruder]/2.4053*60}\n    M400\n    M106 P1 S178\n    G92 E0\n    G1 E5 F{filament_max_volumetric_speed[initial_no_support_extruder]/2.4053*60}\n    M109 S{nozzle_temperature_initial_layer[initial_no_support_extruder]-20} ; drop nozzle temp, make filament shink a bit\n    M104 S{nozzle_temperature_initial_layer[initial_no_support_extruder]-40}\n    G92 E0\n    G1 E-0.5 F300\n\n    G1 X0 F30000\n    G1 X-13.5 F3000\n    G1 X0 F30000 ;wipe and shake\n    G1 X-13.5 F3000\n    G1 X0 F12000 ;wipe and shake\n    G1 X0 F30000\n    G1 X-13.5 F3000\n    M109 S{nozzle_temperature_initial_layer[initial_no_support_extruder]-40}\n    G392 S0 ;turn off clog detect\nM621 S[initial_no_support_extruder]A\n\nM400\nM106 P1 S0\n;===== prepare print temperature and material end =====\n\n\n;===== mech mode fast check============================\nM1002 gcode_claim_action : 3\nG0 X25 Y175 F20000 ; find a soft place to home\n;M104 S0\nG28 Z P0 T300; home z with low precision,permit 300deg temperature\nG29.2 S0 ; turn off ABL\nM104 S170\n\n; build plate detect\nM1002 judge_flag build_plate_detect_flag\nM622 S1\n  G39.4\n  M400\nM623\n\nG1 Z5 F3000\nG1 X90 Y-1 F30000\nM400 P200\nM970.3 Q1 A7 K0 O2\nM974 Q1 S2 P0\n\nG1 X90 Y0 Z5 F30000\nM400 P200\nM970 Q0 A10 B50 C90 H15 K0 M20 O3\nM974 Q0 S2 P0\n\nM975 S1\nG1 F30000\nG1 X-1 Y10\nG28 X ; re-home XY\n\n;===== wipe nozzle ===============================\nM1002 gcode_claim_action : 14\nM975 S1\n\nM104 S170 ; set temp down to heatbed acceptable\nM106 S255 ; turn on fan (G28 has turn off fan)\nM211 S; push soft endstop status\nM211 X0 Y0 Z0 ;turn off Z axis endstop\n\nM83\nG1 E-1 F500\nG90\nM83\n\nM109 S170\nM104 S140\nG0 X90 Y-4 F30000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X91 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X92 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X93 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X94 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X95 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X96 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X97 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X98 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X99 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X99 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X99 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X99 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X99 F10000\nG380 S3 Z-5 F1200\n\nG1 Z5 F30000\n;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;\nG1 X25 Y175 F30000.1 ;Brush material\nG1 Z0.2 F30000.1\nG1 Y185\nG91\nG1 X-30 F30000\nG1 Y-2\nG1 X27\nG1 Y1.5\nG1 X-28\nG1 Y-2\nG1 X30\nG1 Y1.5\nG1 X-30\nG90\nM83\n\nG1 Z5 F3000\nG0 X50 Y175 F20000 ; find a soft place to home\nG28 Z P0 T300; home z with low precision, permit 300deg temperature\nG29.2 S0 ; turn off ABL\n\nG0 X85 Y185 F10000 ;move to exposed steel surface and stop the nozzle\nG0 Z-1.01 F10000\nG91\n\nG2 I1 J0 X2 Y0 F2000.1\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\n\nG90\nG1 Z5 F30000\nG1 X25 Y175 F30000.1 ;Brush material\nG1 Z0.2 F30000.1\nG1 Y185\nG91\nG1 X-30 F30000\nG1 Y-2\nG1 X27\nG1 Y1.5\nG1 X-28\nG1 Y-2\nG1 X30\nG1 Y1.5\nG1 X-30\nG90\nM83\n\nG1 Z5\nG0 X55 Y175 F20000 ; find a soft place to home\nG28 Z P0 T300; home z with low precision, permit 300deg temperature\nG29.2 S0 ; turn off ABL\n\nG1 Z10\nG1 X85 Y185\nG1 Z-1.01\nG1 X95\nG1 X90\n\nM211 R; pop softend status\n\nM106 S0 ; turn off fan , too noisy\n;===== wipe nozzle end ================================\n\n\n;===== wait heatbed  ====================\nM1002 gcode_claim_action : 2\nM104 S0\nM190 S[bed_temperature_initial_layer_single];set bed temp\nM109 S140\n\nG1 Z5 F3000\nG29.2 S1\nG1 X10 Y10 F20000\n\n;===== bed leveling ==================================\n;M1002 set_flag g29_before_print_flag=1\nM1002 judge_flag g29_before_print_flag\nM622 J1\n    M1002 gcode_claim_action : 1\n    G29 A1 X{first_layer_print_min[0]} Y{first_layer_print_min[1]} I{first_layer_print_size[0]} J{first_layer_print_size[1]}\n    M400\n    M500 ; save cali data\nM623\n;===== bed leveling end ================================\n\n;===== home after wipe mouth============================\nM1002 judge_flag g29_before_print_flag\nM622 J0\n\n    M1002 gcode_claim_action : 13\n    G28 T145\n\nM623\n\n;===== home after wipe mouth end =======================\n\nM975 S1 ; turn on vibration supression\n;===== nozzle load line ===============================\nM975 S1\nG90\nM83\nT1000\n\nG1 X-13.5 Y0 Z10 F10000\nG1 E1.2 F500\nM400\nM1002 set_filament_type:UNKNOWN\nM109 S{nozzle_temperature[initial_extruder]}\nM400\n\nM412 S1 ;    ===turn on  filament runout detection===\nM400 P10\n\nG392 S0 ;turn on clog detect\n\nM620.3 W1; === turn on filament tangle detection===\nM400 S2\n\nM1002 set_filament_type:{filament_type[initial_no_support_extruder]}\n;M1002 set_flag extrude_cali_flag=1\nM1002 judge_flag extrude_cali_flag\nM622 J1\n    M1002 gcode_claim_action : 8\n    \n    M400\n    M900 K0.0 L1000.0 M1.0\n    G90\n    M83\n    G0 X68 Y-4 F30000\n    G0 Z0.3 F18000 ;Move to start position\n    M400\n    G0 X88 E10  F{outer_wall_volumetric_speed/(24/20)    * 60}\n    G0 X93 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)/4     * 60}\n    G0 X98 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)     * 60}\n    G0 X103 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)/4     * 60}\n    G0 X108 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)     * 60}\n    G0 X113 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)/4     * 60}\n    G0 Y0 Z0 F20000\n    M400\n    \n    G1 X-13.5 Y0 Z10 F10000\n    M400\n    \n    G1 E10 F{outer_wall_volumetric_speed/2.4*60}\n    M983 F{outer_wall_volumetric_speed/2.4} A0.3 H[nozzle_diameter]; cali dynamic extrusion compensation\n    M106 P1 S178\n    M400 S7\n    G1 X0 F18000\n    G1 X-13.5 F3000\n    G1 X0 F18000 ;wipe and shake\n    G1 X-13.5 F3000\n    G1 X0 F12000 ;wipe and shake\n    G1 X-13.5 F3000\n    M400\n    M106 P1 S0\n\n    M1002 judge_last_extrude_cali_success\n    M622 J0\n        M983 F{outer_wall_volumetric_speed/2.4} A0.3 H[nozzle_diameter]; cali dynamic extrusion compensation\n        M106 P1 S178\n        M400 S7\n        G1 X0 F18000\n        G1 X-13.5 F3000\n        G1 X0 F18000 ;wipe and shake\n        G1 X-13.5 F3000\n        G1 X0 F12000 ;wipe and shake\n        M400\n        M106 P1 S0\n    M623\n    \n    G1 X-13.5 F3000\n    M400\n    M984 A0.1 E1 S1 F{outer_wall_volumetric_speed/2.4} H[nozzle_diameter]\n    M106 P1 S178\n    M400 S7\n    G1 X0 F18000\n    G1 X-13.5 F3000\n    G1 X0 F18000 ;wipe and shake\n    G1 X-13.5 F3000\n    G1 X0 F12000 ;wipe and shake\n    G1 X-13.5 F3000\n    M400\n    M106 P1 S0\n\nM623 ; end of "draw extrinsic para cali paint"\n\n;===== extrude cali test ===============================\nM104 S{nozzle_temperature_initial_layer[initial_extruder]}\nG90\nM83\nG0 X68 Y-2.5 F30000\nG0 Z0.3 F18000 ;Move to start position\nG0 X88 E10  F{outer_wall_volumetric_speed/(24/20)    * 60}\nG0 X93 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)/4     * 60}\nG0 X98 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)     * 60}\nG0 X103 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)/4     * 60}\nG0 X108 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)     * 60}\nG0 X113 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)/4     * 60}\nG0 X115 Z0 F20000\nG0 Z5\nM400\n\n;========turn off light and wait extrude temperature =============\nM1002 gcode_claim_action : 0\n\nM400 ; wait all motion done before implement the emprical L parameters\n\n;===== for Textured PEI Plate , lower the nozzle as the nozzle was touching topmost of the texture when homing ==\n;curr_bed_type={curr_bed_type}\n{if curr_bed_type=="Textured PEI Plate"}\nG29.1 Z{-0.02} ; for Textured PEI Plate\n{endif}\n\nM960 S1 P0 ; turn off laser\nM960 S2 P0 ; turn off laser\nM106 S0 ; turn off fan\nM106 P2 S0 ; turn off big fan\nM106 P3 S0 ; turn off chamber fan\n\nM975 S1 ; turn on mech mode supression\nG90\nM83\nT1000\n\nM211 X0 Y0 Z0 ;turn off soft endstop\nM1007 S1\n\n\n\n
; machine_switch_extruder_time = 0
; machine_unload_filament_time = 34
; master_extruder_id = 1
; max_bridge_length = 0
; max_layer_height = 0.28
; max_travel_detour_distance = 0
; min_bead_width = 85%
; min_feature_size = 25%
; min_layer_height = 0.08
; minimum_sparse_infill_area = 15
; mmu_segmented_region_interlocking_depth = 0
; mmu_segmented_region_max_width = 0
; nozzle_diameter = 0.4
; nozzle_height = 4.76
; nozzle_temperature = 220
; nozzle_temperature_initial_layer = 220
; nozzle_temperature_range_high = 240
; nozzle_temperature_range_low = 190
; nozzle_type = stainless_steel
; nozzle_volume = 92
; nozzle_volume_type = Standard
; only_one_wall_first_layer = 0
; ooze_prevention = 0
; other_layers_print_sequence = 0
; other_layers_print_sequence_nums = 0
; outer_wall_acceleration = 5000
; outer_wall_jerk = 9
; outer_wall_line_width = 0.42
; outer_wall_speed = 200
; overhang_1_4_speed = 0
; overhang_2_4_speed = 50
; overhang_3_4_speed = 30
; overhang_4_4_speed = 10
; overhang_fan_speed = 100
; overhang_fan_threshold = 50%
; overhang_threshold_participating_cooling = 95%
; overhang_totally_speed = 10
; physical_extruder_map = 0
; post_process = 
; pre_start_fan_time = 2
; precise_outer_wall = 0
; precise_z_height = 0
; pressure_advance = 0.02
; prime_tower_brim_width = 3
; prime_tower_enable_framework = 0
; prime_tower_extra_rib_length = 0
; prime_tower_fillet_wall = 1
; prime_tower_flat_ironing = 0
; prime_tower_infill_gap = 150%
; prime_tower_lift_height = -1
; prime_tower_lift_speed = 90
; prime_tower_max_speed = 90
; prime_tower_rib_wall = 1
; prime_tower_rib_width = 8
; prime_tower_skip_points = 1
; prime_tower_width = 35
; print_compatible_printers = "Bambu Lab A1 mini 0.4 nozzle"
; print_extruder_id = 1
; print_extruder_variant = "Direct Drive Standard"
; print_flow_ratio = 1
; print_sequence = by layer
; print_settings_id = 0.20mm Standard @BBL A1M
; printable_area = 0x0,180x0,180x180,0x180
; printable_height = 180
; printer_extruder_id = 1
; printer_extruder_variant = "Direct Drive Standard"
; printer_model = Bambu Lab A1 mini
; printer_notes = 
; printer_settings_id = Bambu Lab A1 mini 0.4 nozzle
; printer_structure = i3
; printer_technology = FFF
; printer_variant = 0.4
; printhost_authorization_type = key
; printhost_ssl_ignore_revoke = 0
; printing_by_object_gcode = 
; process_notes = 
; raft_contact_distance = 0.1
; raft_expansion = 1.5
; raft_first_layer_density = 90%
; raft_first_layer_expansion = 2
; raft_layers = 0
; reduce_crossing_wall = 0
; reduce_fan_stop_start_freq = 1
; reduce_infill_retraction = 1
; required_nozzle_HRC = 3
; resolution = 0.012
; retract_before_wipe = 0%
; retract_length_toolchange = 2
; retract_lift_above = 0
; retract_lift_below = 179
; retract_restart_extra = 0
; retract_restart_extra_toolchange = 0
; retract_when_changing_layer = 1
; retraction_distances_when_cut = 18
; retraction_distances_when_ec = 0
; retraction_length = 0.8
; retraction_minimum_travel = 1
; retraction_speed = 30
; role_base_wipe_speed = 1
; scan_first_layer = 0
; scarf_angle_threshold = 155
; seam_gap = 15%
; seam_position = aligned
; seam_slope_conditional = 1
; seam_slope_entire_loop = 0
; seam_slope_inner_walls = 1
; seam_slope_steps = 10
; silent_mode = 0
; single_extruder_multi_material = 1
; skeleton_infill_density = 15%
; skeleton_infill_line_width = 0.45
; skin_infill_density = 15%
; skin_infill_depth = 2
; skin_infill_line_width = 0.45
; skirt_distance = 2
; skirt_height = 1
; skirt_loops = 0
; slice_closing_radius = 0.049
; slicing_mode = regular
; slow_down_for_layer_cooling = 1
; slow_down_layer_time = 6
; slow_down_min_speed = 20
; small_perimeter_speed = 50%
; small_perimeter_threshold = 0
; smooth_coefficient = 80
; smooth_speed_discontinuity_area = 1
; solid_infill_filament = 1
; sparse_infill_acceleration = 100%
; sparse_infill_anchor = 400%
; sparse_infill_anchor_max = 20
; sparse_infill_density = 15%
; sparse_infill_filament = 1
; sparse_infill_line_width = 0.45
; sparse_infill_pattern = grid
; sparse_infill_speed = 270
; spiral_mode = 0
; spiral_mode_max_xy_smoothing = 200%
; spiral_mode_smooth = 0
; standby_temperature_delta = -5
; start_end_points = 30x-3,54x245
; supertack_plate_temp = 45
; supertack_plate_temp_initial_layer = 45
; support_air_filtration = 0
; support_angle = 0
; support_base_pattern = default
; support_base_pattern_spacing = 2.5
; support_bottom_interface_spacing = 0.5
; support_bottom_z_distance = 0.2
; support_chamber_temp_control = 0
; support_critical_regions_only = 0
; support_expansion = 0
; support_filament = 0
; support_interface_bottom_layers = 2
; support_interface_filament = 0
; support_interface_loop_pattern = 0
; support_interface_not_for_body = 1
; support_interface_pattern = auto
; support_interface_spacing = 0.5
; support_interface_speed = 80
; support_interface_top_layers = 2
; support_line_width = 0.42
; support_object_first_layer_gap = 0.2
; support_object_xy_distance = 0.35
; support_on_build_plate_only = 0
; support_remove_small_overhang = 1
; support_speed = 150
; support_style = default
; support_threshold_angle = 30
; support_top_z_distance = 0.2
; support_type = tree(auto)
; symmetric_infill_y_axis = 0
; temperature_vitrification = 45
; template_custom_gcode = 
; textured_plate_temp = 65
; textured_plate_temp_initial_layer = 65
; thick_bridges = 0
; thumbnail_size = 50x50
; time_lapse_gcode = ;===================== date: 20250206 =====================\n{if !spiral_mode && print_sequence != "by object"}\n; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer\n; SKIPPABLE_START\n; SKIPTYPE: timelapse\nM622.1 S1 ; for prev firware, default turned on\nM1002 judge_flag timelapse_record_flag\nM622 J1\nG92 E0\nG1 Z{max_layer_z + 0.4}\nG1 X0 Y{first_layer_center_no_wipe_tower[1]} F18000 ; move to safe pos\nG1 X-13.0 F3000 ; move to safe pos\nM400\nM1004 S5 P1  ; external shutter\nM400 P300\nM971 S11 C11 O0\nG92 E0\nG1 X0 F18000\nM623\n\n; SKIPTYPE: head_wrap_detect\nM622.1 S1\nM1002 judge_flag g39_3rd_layer_detect_flag\nM622 J1\n    ; enable nozzle clog detect at 3rd layer\n    {if layer_num == 2}\n      M400\n      G90\n      M83\n      M204 S5000\n      G0 Z2 F4000\n      G0 X187 Y178 F20000\n      G39 S1 X187 Y178\n      G0 Z2 F4000\n    {endif}\n\n\n    M622.1 S1\n    M1002 judge_flag g39_detection_flag\n    M622 J1\n      {if !in_head_wrap_detect_zone}\n        M622.1 S0\n        M1002 judge_flag g39_mass_exceed_flag\n        M622 J1\n        {if layer_num > 2}\n            G392 S0\n            M400\n            G90\n            M83\n            M204 S5000\n            G0 Z{max_layer_z + 0.4} F4000\n            G39.3 S1\n            G0 Z{max_layer_z + 0.4} F4000\n            G392 S0\n          {endif}\n        M623\n    {endif}\n    M623\nM623\n; SKIPPABLE_END\n{endif}\n\n\n
; timelapse_type = 0
; top_area_threshold = 200%
; top_color_penetration_layers = 5
; top_one_wall_type = all top
; top_shell_layers = 5
; top_shell_thickness = 1
; top_solid_infill_flow_ratio = 1
; top_surface_acceleration = 2000
; top_surface_jerk = 9
; top_surface_line_width = 0.42
; top_surface_pattern = monotonicline
; top_surface_speed = 200
; travel_acceleration = 10000
; travel_jerk = 9
; travel_speed = 700
; travel_speed_z = 0
; tree_support_branch_angle = 45
; tree_support_branch_diameter = 2
; tree_support_branch_diameter_angle = 5
; tree_support_branch_distance = 5
; tree_support_wall_count = 0
; upward_compatible_machine = "Bambu Lab P1S 0.4 nozzle";"Bambu Lab P1P 0.4 nozzle";"Bambu Lab X1 0.4 nozzle";"Bambu Lab X1 Carbon 0.4 nozzle";"Bambu Lab X1E 0.4 nozzle";"Bambu Lab A1 0.4 nozzle";"Bambu Lab H2D 0.4 nozzle"
; use_firmware_retraction = 0
; use_relative_e_distances = 1
; vertical_shell_speed = 80%
; wall_distribution_count = 1
; wall_filament = 1
; wall_generator = classic
; wall_loops = 2
; wall_sequence = inner wall/outer wall
; wall_transition_angle = 10
; wall_transition_filter_deviation = 25%
; wall_transition_length = 100%
; wipe = 1
; wipe_distance = 2
; wipe_speed = 80%
; wipe_tower_no_sparse_layers = 0
; wipe_tower_rotation_angle = 0
; wipe_tower_x = 15
; wipe_tower_y = 220
; xy_contour_compensation = 0
; xy_hole_compensation = 0
; z_direction_outwall_speed_continuous = 0
; z_hop = 0.4
; z_hop_types = Auto Lift
; CONFIG_BLOCK_END

; EXECUTABLE_BLOCK_START
M73 P0 R12
M201 X20000 Y20000 Z1500 E5000
M203 X500 Y500 Z30 E30
M204 P20000 R5000 T20000
M205 X9.00 Y9.00 Z5.00 E3.00
M106 S0
M106 P2 S0
; FEATURE: Custom
;===== machine: A1 mini =========================
;===== date: 20240620 =====================

;===== start to heat heatbead&hotend==========
M1002 gcode_claim_action : 2
M1002 set_filament_type:PLA
M104 S170
M140 S65
G392 S0 ;turn off clog detect
M9833.2
;=====start printer sound ===================
M17
M400 S1
M1006 S1
M1006 A0 B0 L100 C37 D10 M100 E37 F10 N100
M1006 A0 B0 L100 C41 D10 M100 E41 F10 N100
M1006 A0 B0 L100 C44 D10 M100 E44 F10 N100
M1006 A0 B10 L100 C0 D10 M100 E0 F10 N100
M1006 A43 B10 L100 C39 D10 M100 E46 F10 N100
M1006 A0 B0 L100 C0 D10 M100 E0 F10 N100
M1006 A0 B0 L100 C39 D10 M100 E43 F10 N100
M1006 A0 B0 L100 C0 D10 M100 E0 F10 N100
M1006 A0 B0 L100 C41 D10 M100 E41 F10 N100
M1006 A0 B0 L100 C44 D10 M100 E44 F10 N100
M1006 A0 B0 L100 C49 D10 M100 E49 F10 N100
M1006 A0 B0 L100 C0 D10 M100 E0 F10 N100
M1006 A44 B10 L100 C39 D10 M100 E48 F10 N100
M1006 A0 B0 L100 C0 D10 M100 E0 F10 N100
M1006 A0 B0 L100 C39 D10 M100 E44 F10 N100
M1006 A0 B0 L100 C0 D10 M100 E0 F10 N100
M1006 A43 B10 L100 C39 D10 M100 E46 F10 N100
M1006 W
M18
;=====avoid end stop =================
G91
G380 S2 Z30 F1200
G380 S3 Z-20 F1200
G1 Z5 F1200
G90

;===== reset machine status =================
M204 S6000

M630 S0 P0
G91
M17 Z0.3 ; lower the z-motor current

G90
M17 X0.7 Y0.9 Z0.5 ; reset motor current to default
M960 S5 P1 ; turn on logo lamp
G90
M83
M220 S100 ;Reset Feedrate
M221 S100 ;Reset Flowrate
M73.2   R1.0 ;Reset left time magnitude
;====== cog noise reduction=================
M982.2 S1 ; turn on cog noise reduction

;===== prepare print temperature and material ==========
M400
M18
M109 S100 H170
M104 S170
M400
M17
M400
G28 X

M211 X0 Y0 Z0 ;turn off soft endstop ; turn off soft endstop to prevent protential logic problem

M975 S1 ; turn on

G1 X0.0 F30000
G1 X-13.5 F3000

M620 M ;enable remap
M620 S0A   ; switch material if AMS exist
    G392 S0 ;turn on clog detect
    M1002 gcode_claim_action : 4
    M400
    M1002 set_filament_type:UNKNOWN
    M109 S220
    M104 S250
    M400
    T0
    G1 X-13.5 F3000
    M400
    M620.1 E F523.843 T240
    M109 S250 ;set nozzle to common flush temp
    M106 P1 S0
    G92 E0
M73 P4 R11
    G1 E50 F200
    M400
    M1002 set_filament_type:PLA
    M104 S240
    G92 E0
    G1 E50 F523.843
    M400
    M106 P1 S178
    G92 E0
M73 P6 R11
    G1 E5 F523.843
    M109 S200 ; drop nozzle temp, make filament shink a bit
    M104 S180
    G92 E0
    G1 E-0.5 F300

M73 P7 R11
    G1 X0 F30000
    G1 X-13.5 F3000
    G1 X0 F30000 ;wipe and shake
    G1 X-13.5 F3000
    G1 X0 F12000 ;wipe and shake
    G1 X0 F30000
    G1 X-13.5 F3000
    M109 S180
    G392 S0 ;turn off clog detect
M621 S0A

M400
M106 P1 S0
;===== prepare print temperature and material end =====


;===== mech mode fast check============================
M1002 gcode_claim_action : 3
G0 X25 Y175 F20000 ; find a soft place to home
;M104 S0
G28 Z P0 T300; home z with low precision,permit 300deg temperature
G29.2 S0 ; turn off ABL
M104 S170

; build plate detect
M1002 judge_flag build_plate_detect_flag
M622 S1
  G39.4
  M400
M623

G1 Z5 F3000
G1 X90 Y-1 F30000
M400 P200
M970.3 Q1 A7 K0 O2
M974 Q1 S2 P0

G1 X90 Y0 Z5 F30000
M400 P200
M970 Q0 A10 B50 C90 H15 K0 M20 O3
M974 Q0 S2 P0

M975 S1
G1 F30000
G1 X-1 Y10
G28 X ; re-home XY

;===== wipe nozzle ===============================
M1002 gcode_claim_action : 14
M975 S1

M104 S170 ; set temp down to heatbed acceptable
M106 S255 ; turn on fan (G28 has turn off fan)
M211 S; push soft endstop status
M211 X0 Y0 Z0 ;turn off Z axis endstop

M83
G1 E-1 F500
G90
M83

M109 S170
M104 S140
G0 X90 Y-4 F30000
G380 S3 Z-5 F1200
M73 P43 R6
G1 Z2 F1200
G1 X91 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X92 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X93 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X94 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X95 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X96 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X97 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X98 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X99 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X99 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X99 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X99 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X99 F10000
G380 S3 Z-5 F1200

G1 Z5 F30000
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
G1 X25 Y175 F30000.1 ;Brush material
G1 Z0.2 F30000.1
G1 Y185
G91
G1 X-30 F30000
G1 Y-2
G1 X27
G1 Y1.5
G1 X-28
G1 Y-2
G1 X30
G1 Y1.5
G1 X-30
G90
M83

G1 Z5 F3000
G0 X50 Y175 F20000 ; find a soft place to home
G28 Z P0 T300; home z with low precision, permit 300deg temperature
G29.2 S0 ; turn off ABL

G0 X85 Y185 F10000 ;move to exposed steel surface and stop the nozzle
G0 Z-1.01 F10000
G91

G2 I1 J0 X2 Y0 F2000.1
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5

G90
G1 Z5 F30000
G1 X25 Y175 F30000.1 ;Brush material
G1 Z0.2 F30000.1
G1 Y185
G91
G1 X-30 F30000
G1 Y-2
G1 X27
G1 Y1.5
G1 X-28
G1 Y-2
G1 X30
G1 Y1.5
G1 X-30
G90
M83

G1 Z5
G0 X55 Y175 F20000 ; find a soft place to home
G28 Z P0 T300; home z with low precision, permit 300deg temperature
G29.2 S0 ; turn off ABL

G1 Z10
G1 X85 Y185
G1 Z-1.01
G1 X95
M73 P44 R6
G1 X90

M211 R; pop softend status

M106 S0 ; turn off fan , too noisy
;===== wipe nozzle end ================================


;===== wait heatbed  ====================
M1002 gcode_claim_action : 2
M104 S0
M190 S65;set bed temp
M109 S140

G1 Z5 F3000
G29.2 S1
G1 X10 Y10 F20000

;===== bed leveling ==================================
;M1002 set_flag g29_before_print_flag=1
M1002 judge_flag g29_before_print_flag
M622 J1
    M1002 gcode_claim_action : 1
    G29 A1 X50.4707 Y70 I79.0586 J40
    M400
    M500 ; save cali data
M623
;===== bed leveling end ================================

;===== home after wipe mouth============================
M1002 judge_flag g29_before_print_flag
M622 J0

    M1002 gcode_claim_action : 13
    G28 T145

M623

;===== home after wipe mouth end =======================

M975 S1 ; turn on vibration supression
;===== nozzle load line ===============================
M975 S1
G90
M83
T1000

G1 X-13.5 Y0 Z10 F10000
G1 E1.2 F500
M400
M1002 set_filament_type:UNKNOWN
M109 S220
M400

M412 S1 ;    ===turn on  filament runout detection===
M400 P10

G392 S0 ;turn on clog detect

M620.3 W1; === turn on filament tangle detection===
M400 S2

M1002 set_filament_type:PLA
;M1002 set_flag extrude_cali_flag=1
M1002 judge_flag extrude_cali_flag
M622 J1
    M1002 gcode_claim_action : 8
    
    M400
    M900 K0.0 L1000.0 M1.0
    G90
    M83
    G0 X68 Y-4 F30000
    G0 Z0.3 F18000 ;Move to start position
    M400
    G0 X88 E10  F904.991
    G0 X93 E.3742  F1508.32
    G0 X98 E.3742  F6033.27
    G0 X103 E.3742  F1508.32
    G0 X108 E.3742  F6033.27
    G0 X113 E.3742  F1508.32
    G0 Y0 Z0 F20000
    M400
    
    G1 X-13.5 Y0 Z10 F10000
    M400
    
    G1 E10 F377.08
    M983 F6.28466 A0.3 H0.4; cali dynamic extrusion compensation
    M106 P1 S178
    M400 S7
    G1 X0 F18000
    G1 X-13.5 F3000
    G1 X0 F18000 ;wipe and shake
    G1 X-13.5 F3000
    G1 X0 F12000 ;wipe and shake
    G1 X-13.5 F3000
    M400
    M106 P1 S0

    M1002 judge_last_extrude_cali_success
    M622 J0
        M983 F6.28466 A0.3 H0.4; cali dynamic extrusion compensation
        M106 P1 S178
        M400 S7
        G1 X0 F18000
        G1 X-13.5 F3000
        G1 X0 F18000 ;wipe and shake
        G1 X-13.5 F3000
        G1 X0 F12000 ;wipe and shake
        M400
        M106 P1 S0
    M623
    
M73 P45 R6
    G1 X-13.5 F3000
    M400
    M984 A0.1 E1 S1 F6.28466 H0.4
    M106 P1 S178
    M400 S7
    G1 X0 F18000
    G1 X-13.5 F3000
M73 P46 R6
    G1 X0 F18000 ;wipe and shake
    G1 X-13.5 F3000
    G1 X0 F12000 ;wipe and shake
    G1 X-13.5 F3000
    M400
    M106 P1 S0

M623 ; end of "draw extrinsic para cali paint"

;===== extrude cali test ===============================
M104 S220
G90
M83
G0 X68 Y-2.5 F30000
G0 Z0.3 F18000 ;Move to start position
G0 X88 E10  F904.991
G0 X93 E.3742  F1508.32
G0 X98 E.3742  F6033.27
G0 X103 E.3742  F1508.32
G0 X108 E.3742  F6033.27
G0 X113 E.3742  F1508.32
G0 X115 Z0 F20000
G0 Z5
M400

;========turn off light and wait extrude temperature =============
M1002 gcode_claim_action : 0

M400 ; wait all motion done before implement the emprical L parameters

;===== for Textured PEI Plate , lower the nozzle as the nozzle was touching topmost of the texture when homing ==
;curr_bed_type=Textured PEI Plate

G29.1 Z-0.02 ; for Textured PEI Plate


M960 S1 P0 ; turn off laser
M960 S2 P0 ; turn off laser
M106 S0 ; turn off fan
M106 P2 S0 ; turn off big fan
M106 P3 S0 ; turn off chamber fan

M975 S1 ; turn on mech mode supression
G90
M83
T1000

M211 X0 Y0 Z0 ;turn off soft endstop
M1007 S1



; MACHINE_START_GCODE_END
; filament start gcode
M106 P3 S200


;VT0
G90
G21
M83 ; use relative distances for extrusion
M981 S1 P20000 ;open spaghetti detector
; CHANGE_LAYER
; Z_HEIGHT: 0.2
; LAYER_HEIGHT: 0.2
G1 E-.8 F1800
; layer num/total_layer_count: 1/23
; update layer progress
M73 L1
M991 S0 P0 ;notify layer change

M106 S0
M106 P2 S0
; OBJECT_ID: 66
G1 X84.84 Y75.893 F42000
M204 S6000
G1 Z.4
G1 Z.2
M73 P47 R6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X85.645 Y75.893 E.02997
G1 X85.645 Y108.945 E1.23108
G1 X84.84 Y108.945 E.02997
G1 X84.84 Y109.75 E.02997
M73 P48 R6
G1 X51.525 Y109.75 E1.24085
G1 X51.525 Y108.945 E.02997
G1 X50.721 Y108.945 E.02997
G1 X50.721 Y75.893 E1.23108
G1 X51.525 Y75.893 E.02997
G1 X51.525 Y75.088 E.02997
G1 X84.84 Y75.088 E1.24085
G1 X84.84 Y75.833 E.02773
; WIPE_START
G1 X85.645 Y75.893 E-.3066
G1 X85.645 Y77.086 E-.4534
; WIPE_END
G1 E-.04 F1800
M204 S6000
G17
G3 Z.6 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z0.6
G1 X0 Y90 F18000 ; move to safe pos
M73 P49 R6
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X83.732 Y75.271 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.50075
G1 F6300
M204 S500
G1 X85.256 Y76.796 E.08043
G1 X85.256 Y77.443 E.02416
G1 X83.29 Y75.477 E.10374
G1 X82.643 Y75.477 E.02416
G1 X85.256 Y78.09 E.1379
G1 X85.256 Y78.738 E.02416
G1 X81.995 Y75.477 E.17206
G1 X81.348 Y75.477 E.02416
G1 X85.256 Y79.385 E.20622
G1 X85.256 Y80.033 E.02416
G1 X80.7 Y75.477 E.24038
G1 X80.053 Y75.477 E.02416
G1 X85.256 Y80.68 E.27454
G1 X85.256 Y81.328 E.02416
G1 X79.405 Y75.477 E.30871
G1 X78.758 Y75.477 E.02416
G1 X85.256 Y81.975 E.34287
G1 X85.256 Y82.623 E.02416
G1 X78.11 Y75.477 E.37703
G1 X77.463 Y75.477 E.02416
G1 X85.256 Y83.27 E.41119
G1 X85.256 Y83.918 E.02416
G1 X76.815 Y75.477 E.44535
G1 X76.168 Y75.477 E.02416
G1 X85.256 Y84.565 E.47951
G1 X85.256 Y85.213 E.02416
G1 X75.52 Y75.477 E.51367
G1 X74.873 Y75.477 E.02416
G1 X85.256 Y85.86 E.54783
G1 X85.256 Y86.508 E.02416
G1 X74.225 Y75.477 E.58199
G1 X73.578 Y75.477 E.02416
G1 X85.256 Y87.155 E.61615
G1 X85.256 Y87.802 E.02416
G1 X72.931 Y75.477 E.65031
G1 X72.283 Y75.477 E.02416
G1 X85.256 Y88.45 E.68448
M73 P50 R6
G1 X85.256 Y89.097 E.02416
G1 X71.636 Y75.477 E.71864
G1 X70.988 Y75.477 E.02416
G1 X85.256 Y89.745 E.7528
G1 X85.256 Y90.392 E.02416
G1 X70.341 Y75.477 E.78696
G1 X69.693 Y75.477 E.02416
G1 X85.256 Y91.04 E.82112
G1 X85.256 Y91.687 E.02416
G1 X69.046 Y75.477 E.85528
G1 X68.398 Y75.477 E.02416
G1 X85.256 Y92.335 E.88944
G1 X85.256 Y92.982 E.02416
G1 X67.751 Y75.477 E.9236
G1 X67.103 Y75.477 E.02416
G1 X85.256 Y93.63 E.95776
G1 X85.256 Y94.277 E.02416
G1 X66.456 Y75.477 E.99192
G1 X65.808 Y75.477 E.02416
G1 X85.256 Y94.925 E1.02608
G1 X85.256 Y95.572 E.02416
G1 X65.161 Y75.477 E1.06024
G1 X64.513 Y75.477 E.02416
G1 X85.256 Y96.22 E1.09441
G1 X85.256 Y96.867 E.02416
G1 X63.866 Y75.477 E1.12857
G1 X63.218 Y75.477 E.02416
M73 P50 R5
G1 X85.256 Y97.515 E1.16273
G1 X85.256 Y98.162 E.02416
G1 X62.571 Y75.477 E1.19689
G1 X61.924 Y75.477 E.02416
G1 X85.256 Y98.809 E1.23105
G1 X85.256 Y99.457 E.02416
G1 X61.276 Y75.477 E1.26521
G1 X60.629 Y75.477 E.02416
G1 X85.256 Y100.104 E1.29937
G1 X85.256 Y100.752 E.02416
G1 X59.981 Y75.477 E1.33353
G1 X59.334 Y75.477 E.02416
G1 X85.256 Y101.399 E1.36769
G1 X85.256 Y102.047 E.02416
G1 X58.686 Y75.477 E1.40185
G1 X58.039 Y75.477 E.02416
M73 P51 R5
G1 X85.256 Y102.694 E1.43601
G1 X85.256 Y103.342 E.02416
G1 X57.391 Y75.477 E1.47017
G1 X56.744 Y75.477 E.02416
G1 X85.256 Y103.989 E1.50434
G1 X85.256 Y104.637 E.02416
G1 X56.096 Y75.477 E1.5385
G1 X55.449 Y75.477 E.02416
G1 X85.256 Y105.284 E1.57266
G1 X85.256 Y105.932 E.02416
G1 X54.801 Y75.477 E1.60682
G1 X54.154 Y75.477 E.02416
G1 X85.256 Y106.579 E1.64098
G1 X85.256 Y107.227 E.02416
G1 X53.506 Y75.477 E1.67514
G1 X52.859 Y75.477 E.02416
G1 X85.256 Y107.874 E1.7093
G1 X85.256 Y108.522 E.02416
G1 X52.211 Y75.477 E1.74346
G1 X51.914 Y75.477 E.01111
G1 X51.914 Y75.826 E.01305
G1 X84.644 Y108.557 E1.72688
G1 X84.452 Y108.557 E.00719
G1 X84.452 Y109.012 E.01697
G1 X51.721 Y76.281 E1.72688
G1 X51.109 Y76.281 E.02283
G1 X51.109 Y76.317 E.00132
G1 X84.154 Y109.362 E1.74346
M73 P52 R5
G1 X83.506 Y109.362 E.02416
G1 X51.109 Y76.964 E1.7093
G1 X51.109 Y77.612 E.02416
G1 X82.859 Y109.362 E1.67514
G1 X82.212 Y109.362 E.02416
G1 X51.109 Y78.259 E1.64098
G1 X51.109 Y78.907 E.02416
G1 X81.564 Y109.362 E1.60682
G1 X80.917 Y109.362 E.02416
G1 X51.109 Y79.554 E1.57266
G1 X51.109 Y80.202 E.02416
G1 X80.269 Y109.362 E1.5385
G1 X79.622 Y109.362 E.02416
G1 X51.109 Y80.849 E1.50434
G1 X51.109 Y81.497 E.02416
G1 X78.974 Y109.362 E1.47018
G1 X78.327 Y109.362 E.02416
G1 X51.109 Y82.144 E1.43602
G1 X51.109 Y82.791 E.02416
G1 X77.679 Y109.362 E1.40186
G1 X77.032 Y109.362 E.02416
G1 X51.109 Y83.439 E1.36769
G1 X51.109 Y84.086 E.02416
G1 X76.384 Y109.362 E1.33353
G1 X75.737 Y109.362 E.02416
M73 P53 R5
G1 X51.109 Y84.734 E1.29937
G1 X51.109 Y85.381 E.02416
G1 X75.089 Y109.362 E1.26521
G1 X74.442 Y109.362 E.02416
G1 X51.109 Y86.029 E1.23105
G1 X51.109 Y86.676 E.02416
G1 X73.794 Y109.362 E1.19689
G1 X73.147 Y109.362 E.02416
G1 X51.109 Y87.324 E1.16273
G1 X51.109 Y87.971 E.02416
G1 X72.5 Y109.362 E1.12857
G1 X71.852 Y109.362 E.02416
G1 X51.109 Y88.619 E1.09441
G1 X51.109 Y89.266 E.02416
G1 X71.205 Y109.362 E1.06025
G1 X70.557 Y109.362 E.02416
G1 X51.109 Y89.914 E1.02609
G1 X51.109 Y90.561 E.02416
G1 X69.91 Y109.362 E.99193
G1 X69.262 Y109.362 E.02416
G1 X51.109 Y91.209 E.95776
G1 X51.109 Y91.856 E.02416
G1 X68.615 Y109.362 E.9236
G1 X67.967 Y109.362 E.02416
M73 P54 R5
G1 X51.109 Y92.503 E.88944
G1 X51.109 Y93.151 E.02416
G1 X67.32 Y109.362 E.85528
G1 X66.672 Y109.362 E.02416
G1 X51.109 Y93.798 E.82112
G1 X51.109 Y94.446 E.02416
G1 X66.025 Y109.362 E.78696
G1 X65.377 Y109.362 E.02416
G1 X51.109 Y95.093 E.7528
G1 X51.109 Y95.741 E.02416
G1 X64.73 Y109.362 E.71864
G1 X64.082 Y109.362 E.02416
G1 X51.109 Y96.388 E.68448
G1 X51.109 Y97.036 E.02416
G1 X63.435 Y109.362 E.65032
G1 X62.787 Y109.362 E.02416
G1 X51.109 Y97.683 E.61616
G1 X51.109 Y98.331 E.02416
G1 X62.14 Y109.362 E.58199
G1 X61.493 Y109.362 E.02416
G1 X51.109 Y98.978 E.54783
G1 X51.109 Y99.626 E.02416
G1 X60.845 Y109.362 E.51367
G1 X60.198 Y109.362 E.02416
G1 X51.109 Y100.273 E.47951
G1 X51.109 Y100.921 E.02416
G1 X59.55 Y109.362 E.44535
G1 X58.903 Y109.362 E.02416
M73 P55 R5
G1 X51.109 Y101.568 E.41119
G1 X51.109 Y102.216 E.02416
G1 X58.255 Y109.362 E.37703
G1 X57.608 Y109.362 E.02416
G1 X51.109 Y102.863 E.34287
G1 X51.109 Y103.51 E.02416
G1 X56.96 Y109.362 E.30871
G1 X56.313 Y109.362 E.02416
G1 X51.109 Y104.158 E.27455
G1 X51.109 Y104.805 E.02416
G1 X55.665 Y109.362 E.24039
G1 X55.018 Y109.362 E.02416
G1 X51.109 Y105.453 E.20623
G1 X51.109 Y106.1 E.02416
G1 X54.37 Y109.362 E.17206
G1 X53.723 Y109.362 E.02416
G1 X51.109 Y106.748 E.1379
G1 X51.109 Y107.395 E.02416
G1 X53.075 Y109.362 E.10374
G1 X52.428 Y109.362 E.02416
G1 X50.903 Y107.837 E.08043
; WIPE_START
G1 X52.318 Y109.251 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X59.224 Y106.002 Z.6 F42000
G1 X125.76 Y74.704 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X125.76 Y73.888 E.03036
G2 X125.684 Y73.813 I-.069 J-.006 E.00453
G1 X124.85 Y73.813 E.03108
G1 X124.687 Y73.335 E.01879
G3 X126.709 Y70.755 I2.026 J-.495 E.14048
G3 X126.245 Y74.857 I-.013 J2.075 E.25932
G1 X125.817 Y74.722 E.01673
; WIPE_START
G1 X125.76 Y73.888 E-.31736
G1 X125.741 Y73.832 E-.02275
G1 X125.684 Y73.813 E-.02263
G1 X124.85 Y73.813 E-.31708
G1 X124.782 Y73.613 E-.08018
; WIPE_END
M73 P56 R5
G1 E-.04 F1800
M204 S6000
G1 X124.27 Y73.813 Z.6 F42000
G1 Z.2
G1 E.8 F1800
G1 F3000
M204 S500
G1 X124.141 Y73.159 E.02482
G3 X126.827 Y70.252 I2.571 J-.319 E.16776
G3 X126.411 Y75.395 I-.131 J2.578 E.3078
G1 X125.76 Y75.277 E.02464
G1 X125.76 Y108.804 E1.24878
G3 X125.684 Y108.88 I-.07 J.006 E.00452
G1 X90.295 Y108.88 E1.31812
G3 X90.217 Y108.804 I-.008 J-.07 E.0046
G1 X90.218 Y73.888 E1.30049
G3 X90.293 Y73.813 I.069 J-.006 E.00451
G1 X124.21 Y73.813 E1.26329
; WIPE_START
G1 X124.141 Y73.159 E-.24977
G1 X124.12 Y72.814 E-.13125
G1 X124.145 Y72.47 E-.13121
G1 X124.216 Y72.132 E-.13128
G1 X124.319 Y71.843 E-.11649
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X125.577 Y74.922 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.50102
G1 F6300
M204 S500
G1 X124.856 Y74.201 E.03803
G1 X124.209 Y74.201 E.02418
G1 X125.371 Y75.364 E.06138
G1 X125.371 Y76.012 E.02418
G1 X123.561 Y74.201 E.09558
G1 X122.913 Y74.201 E.02418
G1 X125.371 Y76.66 E.12978
G1 X125.371 Y77.307 E.02418
G1 X122.265 Y74.201 E.16398
G1 X121.617 Y74.201 E.02418
G1 X125.371 Y77.955 E.19818
G1 X125.371 Y78.603 E.02418
G1 X120.969 Y74.201 E.23238
G1 X120.322 Y74.201 E.02418
G1 X125.371 Y79.251 E.26658
G1 X125.371 Y79.899 E.02418
G1 X119.674 Y74.201 E.30078
G1 X119.026 Y74.201 E.02418
G1 X125.371 Y80.547 E.33499
G1 X125.371 Y81.195 E.02418
G1 X118.378 Y74.201 E.36919
G1 X117.73 Y74.201 E.02418
G1 X125.371 Y81.842 E.40339
G1 X125.371 Y82.49 E.02418
G1 X117.082 Y74.201 E.43759
G1 X116.434 Y74.201 E.02418
G1 X125.371 Y83.138 E.47179
G1 X125.371 Y83.786 E.02418
G1 X115.787 Y74.201 E.50599
G1 X115.139 Y74.201 E.02418
G1 X125.371 Y84.434 E.54019
G1 X125.371 Y85.082 E.02418
G1 X114.491 Y74.201 E.57439
G1 X113.843 Y74.201 E.02418
G1 X125.371 Y85.73 E.6086
G1 X125.371 Y86.377 E.02418
G1 X113.195 Y74.201 E.6428
G1 X112.547 Y74.201 E.02418
G1 X125.371 Y87.025 E.677
G1 X125.371 Y87.673 E.02418
G1 X111.899 Y74.201 E.7112
G1 X111.252 Y74.201 E.02418
G1 X125.371 Y88.321 E.7454
M73 P57 R5
G1 X125.371 Y88.969 E.02418
G1 X110.604 Y74.201 E.7796
G1 X109.956 Y74.201 E.02418
G1 X125.371 Y89.617 E.8138
G1 X125.371 Y90.264 E.02418
G1 X109.308 Y74.201 E.848
G1 X108.66 Y74.201 E.02418
G1 X125.371 Y90.912 E.8822
G1 X125.371 Y91.56 E.02418
G1 X108.012 Y74.201 E.91641
G1 X107.364 Y74.201 E.02418
G1 X125.371 Y92.208 E.95061
G1 X125.371 Y92.856 E.02418
G1 X106.717 Y74.201 E.98481
G1 X106.069 Y74.201 E.02418
G1 X125.371 Y93.504 E1.01901
G1 X125.371 Y94.152 E.02418
G1 X105.421 Y74.201 E1.05321
G1 X104.773 Y74.201 E.02418
G1 X125.371 Y94.799 E1.08741
G1 X125.371 Y95.447 E.02418
G1 X104.125 Y74.201 E1.12161
G1 X103.477 Y74.201 E.02418
G1 X125.371 Y96.095 E1.15581
G1 X125.371 Y96.743 E.02418
G1 X102.83 Y74.201 E1.19002
G1 X102.182 Y74.201 E.02418
G1 X125.371 Y97.391 E1.22422
G1 X125.371 Y98.039 E.02418
G1 X101.534 Y74.201 E1.25842
G1 X100.886 Y74.201 E.02418
G1 X125.371 Y98.687 E1.29262
G1 X125.371 Y99.334 E.02418
G1 X100.238 Y74.201 E1.32682
G1 X99.59 Y74.201 E.02418
G1 X125.371 Y99.982 E1.36102
G1 X125.371 Y100.63 E.02418
G1 X98.942 Y74.201 E1.39522
G1 X98.295 Y74.201 E.02418
G1 X125.371 Y101.278 E1.42942
G1 X125.371 Y101.926 E.02418
M73 P58 R5
G1 X97.647 Y74.201 E1.46362
G1 X96.999 Y74.201 E.02418
G1 X125.371 Y102.574 E1.49783
G1 X125.371 Y103.221 E.02418
G1 X96.351 Y74.201 E1.53203
G1 X95.703 Y74.201 E.02418
G1 X125.371 Y103.869 E1.56623
G1 X125.371 Y104.517 E.02418
G1 X95.055 Y74.201 E1.60043
G1 X94.407 Y74.201 E.02418
G1 X125.371 Y105.165 E1.63463
G1 X125.371 Y105.813 E.02418
G1 X93.76 Y74.201 E1.66883
G1 X93.112 Y74.201 E.02418
G1 X125.371 Y106.461 E1.70303
G1 X125.371 Y107.109 E.02418
G1 X92.464 Y74.201 E1.73723
G1 X91.816 Y74.201 E.02418
G1 X125.371 Y107.756 E1.77143
G1 X125.371 Y108.404 E.02418
G1 X91.168 Y74.201 E1.80564
G1 X90.606 Y74.201 E.02099
G1 X90.606 Y74.287 E.0032
G1 X124.81 Y108.491 E1.8057
M73 P58 R4
G1 X124.162 Y108.491 E.02418
G1 X90.606 Y74.935 E1.7715
G1 X90.606 Y75.583 E.02418
G1 X123.515 Y108.491 E1.7373
M73 P59 R4
G1 X122.867 Y108.491 E.02418
G1 X90.606 Y76.23 E1.7031
G1 X90.606 Y76.878 E.02418
G1 X122.219 Y108.491 E1.6689
G1 X121.571 Y108.491 E.02418
G1 X90.606 Y77.526 E1.6347
G1 X90.606 Y78.174 E.02418
G1 X120.923 Y108.491 E1.6005
G1 X120.275 Y108.491 E.02418
G1 X90.606 Y78.822 E1.5663
G1 X90.606 Y79.47 E.02418
G1 X119.628 Y108.491 E1.53209
G1 X118.98 Y108.491 E.02418
G1 X90.606 Y80.118 E1.49789
G1 X90.606 Y80.765 E.02418
G1 X118.332 Y108.491 E1.46369
G1 X117.684 Y108.491 E.02418
G1 X90.606 Y81.413 E1.42949
G1 X90.606 Y82.061 E.02418
G1 X117.036 Y108.491 E1.39529
G1 X116.388 Y108.491 E.02418
G1 X90.606 Y82.709 E1.36109
G1 X90.606 Y83.357 E.02418
G1 X115.74 Y108.491 E1.32689
M73 P60 R4
G1 X115.093 Y108.491 E.02418
G1 X90.606 Y84.005 E1.29269
G1 X90.606 Y84.653 E.02418
G1 X114.445 Y108.491 E1.25849
G1 X113.797 Y108.491 E.02418
G1 X90.606 Y85.3 E1.22429
G1 X90.606 Y85.948 E.02418
G1 X113.149 Y108.491 E1.19008
G1 X112.501 Y108.491 E.02418
G1 X90.606 Y86.596 E1.15588
G1 X90.606 Y87.244 E.02418
G1 X111.853 Y108.491 E1.12168
G1 X111.205 Y108.491 E.02418
G1 X90.606 Y87.892 E1.08748
G1 X90.606 Y88.54 E.02418
G1 X110.558 Y108.491 E1.05328
G1 X109.91 Y108.491 E.02418
G1 X90.606 Y89.187 E1.01908
G1 X90.606 Y89.835 E.02418
G1 X109.262 Y108.491 E.98488
G1 X108.614 Y108.491 E.02418
G1 X90.606 Y90.483 E.95068
G1 X90.606 Y91.131 E.02418
M73 P61 R4
G1 X107.966 Y108.491 E.91648
G1 X107.318 Y108.491 E.02418
G1 X90.606 Y91.779 E.88227
G1 X90.606 Y92.427 E.02418
G1 X106.671 Y108.491 E.84807
G1 X106.023 Y108.491 E.02418
G1 X90.606 Y93.075 E.81387
G1 X90.606 Y93.722 E.02418
G1 X105.375 Y108.491 E.77967
G1 X104.727 Y108.491 E.02418
G1 X90.606 Y94.37 E.74547
G1 X90.606 Y95.018 E.02418
G1 X104.079 Y108.491 E.71127
G1 X103.431 Y108.491 E.02418
G1 X90.606 Y95.666 E.67707
G1 X90.606 Y96.314 E.02418
G1 X102.783 Y108.491 E.64287
G1 X102.136 Y108.491 E.02418
G1 X90.606 Y96.962 E.60867
G1 X90.606 Y97.609 E.02418
G1 X101.488 Y108.491 E.57447
G1 X100.84 Y108.491 E.02418
G1 X90.606 Y98.257 E.54026
G1 X90.606 Y98.905 E.02418
G1 X100.092 Y108.391 E.50079
G1 X99.851 Y108.491 E.00973
G1 X99.544 Y108.491 E.01146
M73 P62 R4
G1 X90.606 Y99.553 E.47186
G1 X90.606 Y100.201 E.02418
G1 X98.896 Y108.491 E.43766
G1 X98.248 Y108.491 E.02418
G1 X90.606 Y100.849 E.40346
G1 X90.606 Y101.497 E.02418
G1 X97.601 Y108.491 E.36926
G1 X96.953 Y108.491 E.02418
G1 X90.606 Y102.144 E.33506
G1 X90.606 Y102.792 E.02418
G1 X96.305 Y108.491 E.30086
G1 X95.657 Y108.491 E.02418
G1 X90.606 Y103.44 E.26666
G1 X90.606 Y104.088 E.02418
G1 X95.009 Y108.491 E.23245
G1 X94.361 Y108.491 E.02418
G1 X90.606 Y104.736 E.19825
G1 X90.606 Y105.384 E.02418
G1 X93.713 Y108.491 E.16405
G1 X93.066 Y108.491 E.02418
G1 X90.606 Y106.032 E.12985
G1 X90.606 Y106.679 E.02418
G1 X92.418 Y108.491 E.09565
G1 X91.77 Y108.491 E.02418
G1 X90.606 Y107.327 E.06145
G1 X90.606 Y107.975 E.02418
G1 X91.328 Y108.697 E.03811
; CHANGE_LAYER
; Z_HEIGHT: 0.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6300
G1 X90.606 Y107.975 E-.38792
G1 X90.606 Y107.327 E-.24618
G1 X90.84 Y107.562 E-.1259
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 2/23
; update layer progress
M73 L2
M991 S0 P1 ;notify layer change

M106 S201.45
M106 P2 S178
; open powerlost recovery
M1003 S1
; OBJECT_ID: 66
M204 S10000
G17
G3 Z.6 I.119 J1.211 P1  F42000
G1 X99.731 Y106.691 Z.6
G1 Z.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.378512
G1 F12000
M204 S5000
G3 X99.064 Y106.489 I-.525 J.534 E.10897
M73 P63 R4
G3 X99.573 Y106.573 I.131 J.794 E.01435
G3 X99.686 Y106.651 I-.368 J.653 E.00376
M204 S10000
G1 X99.826 Y106.722 F42000
G1 F12000
M204 S5000
G3 X99.016 Y106.431 I-.637 J.501 E.11441
G3 X99.342 Y106.427 I.172 J.712 E.00899
G3 X99.787 Y106.677 I-.153 J.796 E.0142
; WIPE_START
M204 S6000
G1 X99.93 Y106.871 E-.09167
G1 X99.99 Y107.043 E-.0692
G1 X100.01 Y107.224 E-.0692
G1 X99.99 Y107.405 E-.06919
G1 X99.93 Y107.577 E-.06923
G1 X99.833 Y107.731 E-.06917
G1 X99.704 Y107.86 E-.06921
G1 X99.55 Y107.957 E-.06919
G1 X99.378 Y108.017 E-.06919
G1 X99.197 Y108.037 E-.06921
G1 X99.078 Y108.024 E-.04555
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.274 Y100.608 Z.8 F42000
G1 X94.173 Y87.859 Z.8
G1 Z.4
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X94.173 Y98.062 E.31354
G1 X97.66 Y98.062 E.10715
G1 X97.66 Y101.955 E.11962
G1 X97.436 Y101.955 E.00687
G1 X97.436 Y98.486 E.10659
G1 X93.806 Y98.486 E.11155
G1 X93.806 Y87.582 E.33506
G1 X97.436 Y87.582 E.11155
G1 X97.436 Y84.014 E.10963
G1 X100.853 Y84.014 E.10498
G1 X100.853 Y84.46 E.0137
G1 X97.66 Y84.46 E.0981
G1 X97.66 Y91.257 E.20886
G1 X97.436 Y91.257 E.00687
G1 X97.436 Y87.859 E.10443
G1 X94.233 Y87.859 E.09843
; WIPE_START
M204 S6000
G1 X94.221 Y89.859 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X100.562 Y85.61 Z.8 F42000
G1 X108.108 Y80.554 Z.8
G1 Z.4
G1 E.8 F1800
G1 F12000
M204 S5000
G1 X114.709 Y80.554 E.20283
G1 X114.709 Y76.965 E.11029
G1 X121.185 Y76.965 E.19899
G1 X121.185 Y77.321 E.01094
G1 X115.065 Y77.321 E.18806
G1 X115.065 Y80.855 E.1086
G1 X107.864 Y80.855 E.22127
G1 X107.864 Y77.322 E.10858
G1 X104.632 Y77.322 E.09929
G1 X104.632 Y77.134 E.00578
G1 X108.108 Y77.134 E.1068
G1 X108.108 Y80.494 E.10327
; WIPE_START
M204 S6000
G1 X110.108 Y80.513 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.539 Y88.124 Z.8 F42000
G1 X108.525 Y101.698 Z.8
G1 Z.4
G1 E.8 F1800
G1 F12000
M204 S5000
G1 X108.525 Y95.719 E.1837
G1 X108.262 Y95.719 E.00809
G1 X108.262 Y98.076 E.07241
G1 X101.18 Y98.076 E.21762
G1 X101.18 Y92.809 E.16185
G1 X105.814 Y92.809 E.1424
G1 X105.814 Y92.604 E.00629
G1 X101.18 Y92.604 E.1424
G1 X101.18 Y87.962 E.14265
G1 X108.113 Y87.962 E.21305
G1 X108.113 Y87.523 E.01347
G1 X104.537 Y87.523 E.10988
G1 X104.537 Y80.473 E.21662
G1 X101.264 Y80.473 E.10056
G1 X101.264 Y76.898 E.10985
G1 X93.894 Y76.898 E.22648
G1 X93.894 Y77.437 E.01656
G1 X100.87 Y77.437 E.21434
G1 X100.87 Y80.859 E.10515
G1 X104.157 Y80.859 E.10102
G1 X104.157 Y87.523 E.20477
G1 X100.824 Y87.523 E.10241
G1 X100.824 Y94.622 E.21812
G1 X97.439 Y94.622 E.10402
G1 X97.439 Y95.043 E.01295
G1 X100.824 Y95.043 E.10402
G1 X100.824 Y98.519 E.10681
G1 X108.262 Y98.519 E.22854
G1 X108.262 Y102.038 E.10813
G1 X118.021 Y102.038 E.29986
G1 X118.021 Y105.345 E.10159
G1 X104.867 Y105.345 E.40417
G1 X104.867 Y101.702 E.11191
G1 X100.786 Y101.702 E.12541
G1 X100.786 Y105.11 E.10469
G1 X94.213 Y105.11 E.20195
G1 X94.213 Y101.923 E.09791
G1 X93.903 Y101.923 E.00952
G1 X93.903 Y105.573 E.11213
G1 X100.786 Y105.573 E.21147
G1 X100.786 Y108.768 E.09819
G1 X90.902 Y108.768 E.30371
G1 X90.902 Y108.366 E.01236
G1 X90.499 Y108.366 E.01236
G1 X90.499 Y84.43 E.73549
G1 X94.135 Y84.43 E.11171
G1 X94.135 Y80.855 E.10983
G1 X97.66 Y80.855 E.10832
G1 X97.66 Y80.491 E.01118
G1 X93.8 Y80.491 E.1186
G1 X93.8 Y84.075 E.1101
G1 X90.499 Y84.075 E.10142
G1 X90.499 Y74.313 E.29995
G1 X90.902 Y74.313 E.01236
G1 X90.902 Y73.911 E.01236
G1 X111.27 Y73.911 E.62585
G1 X111.27 Y77.186 E.10065
G1 X111.734 Y77.186 E.01426
G1 X111.734 Y73.911 E.10065
G1 X125.217 Y73.911 E.4143
G1 X125.217 Y74.313 E.01236
G1 X125.619 Y74.313 E.01236
G1 X125.619 Y91.237 E.52004
G1 X118.42 Y91.237 E.22121
G1 X118.42 Y98.011 E.20813
G1 X115.845 Y98.011 E.07911
G1 X115.845 Y98.616 E.01859
G1 X121.741 Y98.616 E.18116
G1 X121.741 Y105.641 E.21586
G1 X121.945 Y105.641 E.00626
G1 X121.945 Y94.648 E.3378
G1 X121.741 Y94.648 E.00626
G1 X121.741 Y98.011 E.10334
G1 X118.706 Y98.011 E.09327
G1 X118.706 Y91.647 E.19556
G1 X125.619 Y91.647 E.21244
M73 P64 R4
G1 X125.619 Y108.366 E.51373
G1 X125.217 Y108.366 E.01236
G1 X125.217 Y108.768 E.01236
G1 X101.161 Y108.768 E.73916
G1 X101.161 Y101.968 E.20895
G1 X104.637 Y101.968 E.10681
G1 X104.637 Y105.69 E.11438
G1 X118.292 Y105.69 E.41956
G1 X118.292 Y101.736 E.12151
G1 X112.158 Y101.736 E.18847
G1 X112.158 Y94.918 E.20948
G1 X115.245 Y94.918 E.09485
G1 X115.245 Y87.933 E.21465
G1 X122.151 Y87.933 E.21218
G1 X122.151 Y80.585 E.22577
G1 X118.222 Y80.58 E.12073
G1 X118.222 Y84.159 E.11
G1 X107.993 Y84.159 E.31429
G1 X107.993 Y84.55 E.01202
G1 X111.829 Y84.55 E.11786
G1 X111.829 Y89.52 E.15269
G1 X112.158 Y89.52 E.01012
G1 X112.158 Y84.55 E.15269
G1 X118.576 Y84.55 E.19721
G1 X118.576 Y80.844 E.11389
G1 X121.742 Y80.844 E.09728
G1 X121.742 Y87.659 E.2094
G1 X114.824 Y87.659 E.21258
G1 X114.824 Y94.612 E.21367
G1 X111.829 Y94.612 E.09204
G1 X111.829 Y101.698 E.21772
G1 X108.585 Y101.698 E.09967
; WIPE_START
M204 S6000
G1 X108.565 Y99.698 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X112.894 Y93.412 Z.8 F42000
G1 X125.8 Y74.674 Z.8
G1 Z.4
G1 E.8 F1800
G1 F12000
M204 S5000
G1 X125.8 Y73.886 E.02423
G2 X125.687 Y73.773 I-.111 J-.001 E.00546
G1 X124.878 Y73.773 E.02484
G1 X124.726 Y73.326 E.01452
G3 X126.678 Y70.797 I1.984 J-.486 E.11271
G3 X126.931 Y74.854 I.024 J2.035 E.19015
G3 X125.855 Y74.696 I-.189 J-2.455 E.03368
; WIPE_START
M204 S6000
G1 X125.8 Y73.886 E-.30882
G1 X125.769 Y73.803 E-.03344
G1 X125.687 Y73.773 E-.03335
G1 X124.878 Y73.773 E-.30722
G1 X124.813 Y73.581 E-.07717
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.221 Y73.773 Z.8 F42000
G1 Z.4
G1 E.8 F1800
G1 F12000
M204 S5000
G1 X124.101 Y73.164 E.01906
G3 X126.901 Y70.22 I2.597 J-.334 E.14291
G3 X128.923 Y71.445 I-.177 J2.573 E.07545
G3 X126.406 Y75.435 I-2.228 J1.383 E.18023
G1 X125.8 Y75.324 E.01894
G1 X125.8 Y108.807 E1.02882
G3 X125.687 Y108.92 I-.111 J.001 E.00546
G1 X90.29 Y108.92 E1.08764
G3 X90.177 Y108.807 I-.001 J-.111 E.00546
G1 X90.178 Y73.886 E1.07303
G3 X90.29 Y73.773 I.111 J-.001 E.00546
G1 X124.161 Y73.773 E1.04077
; WIPE_START
M204 S6000
G1 X124.101 Y73.164 E-.23235
G1 X124.08 Y72.814 E-.1333
G1 X124.106 Y72.464 E-.13326
G1 X124.178 Y72.121 E-.13328
G1 X124.29 Y71.804 E-.1278
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.8 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z0.8
G1 X0 Y90 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X124.528 Y73.715 F42000
G1 Z.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.236135
G1 F15000
M204 S6000
G1 X124.445 Y73.404 E.00506
G3 X127.715 Y74.925 I2.255 J-.573 E.1652
G3 X125.815 Y75.008 I-1.054 J-2.358 E.03065
; WIPE_START
G1 X126.183 Y75.099 E-.14378
G1 X126.439 Y75.141 E-.09888
G1 X126.75 Y75.155 E-.11824
G1 X127.06 Y75.129 E-.11825
G1 X127.337 Y75.07 E-.10748
G1 X127.715 Y74.925 E-.15366
G1 X127.759 Y74.899 E-.01972
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.139 Y74.463 Z.8 F42000
G1 X111.502 Y73.969 Z.8
G1 Z.4
G1 E.8 F1800
; LINE_WIDTH: 0.11491
G1 F15000
M204 S6000
G1 X111.502 Y76.99 E.01772
; WIPE_START
G1 X111.502 Y74.99 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.03 Y76.549 Z.8 F42000
G1 X101.068 Y77.168 Z.8
G1 Z.4
G1 E.8 F1800
; LINE_WIDTH: 0.18966
G1 F15000
M204 S6000
G1 X94.09 Y77.168 E.08344
; WIPE_START
G1 X96.09 Y77.168 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.706 Y74.043 Z.8 F42000
G1 Z.4
G1 E.8 F1800
; LINE_WIDTH: 0.19094
G1 F15000
M204 S6000
G1 X90.374 Y74.043 E.004
M204 S10000
G1 X90.374 Y108.643 F42000
; LINE_WIDTH: 0.20479
G1 F15000
M204 S6000
G1 X90.706 Y108.643 E.00438
; WIPE_START
G1 X90.374 Y108.643 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.1 Y105.341 Z.8 F42000
G1 Z.4
G1 E.8 F1800
; LINE_WIDTH: 0.11373
G1 F15000
M204 S6000
G1 X100.965 Y105.341 E.03962
; WIPE_START
G1 X98.965 Y105.341 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X106.023 Y102.436 Z.8 F42000
G1 X116.041 Y98.313 Z.8
G1 Z.4
G1 E.8 F1800
; LINE_WIDTH: 0.25595
G1 F15000
M204 S6000
G1 X121.749 Y98.313 E.09907
; CHANGE_LAYER
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
M73 P65 R4
G1 X119.749 Y98.313 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 3/23
; update layer progress
M73 L3
M991 S0 P2 ;notify layer change

; OBJECT_ID: 66
M204 S10000
G17
G3 Z.8 I.46 J-1.126 P1  F42000
G1 X94.173 Y87.859 Z.8
G1 Z.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11997
M204 S5000
G1 X94.173 Y98.062 E.31354
G1 X97.66 Y98.062 E.10715
G1 X97.66 Y101.955 E.11962
G1 X97.436 Y101.955 E.00687
G1 X97.436 Y98.486 E.10659
G1 X93.806 Y98.486 E.11155
G1 X93.806 Y87.582 E.33506
G1 X97.436 Y87.582 E.11155
G1 X97.436 Y84.014 E.10963
G1 X100.853 Y84.014 E.10498
G1 X100.853 Y84.46 E.0137
G1 X97.66 Y84.46 E.0981
G1 X97.66 Y91.257 E.20886
G1 X97.436 Y91.257 E.00687
G1 X97.436 Y87.859 E.10443
G1 X94.233 Y87.859 E.09843
; WIPE_START
G1 F12000
M204 S6000
G1 X94.221 Y89.859 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X100.562 Y85.61 Z1 F42000
G1 X108.108 Y80.554 Z1
G1 Z.6
G1 E.8 F1800
G1 F11997
M204 S5000
G1 X114.709 Y80.554 E.20283
G1 X114.709 Y76.965 E.11029
G1 X121.185 Y76.965 E.19899
G1 X121.185 Y77.321 E.01094
G1 X115.065 Y77.321 E.18806
G1 X115.065 Y80.855 E.1086
G1 X107.864 Y80.855 E.22127
G1 X107.864 Y77.322 E.10858
G1 X104.632 Y77.322 E.09929
G1 X104.632 Y77.134 E.00578
G1 X108.108 Y77.134 E.1068
G1 X108.108 Y80.494 E.10327
; WIPE_START
G1 F12000
M204 S6000
G1 X110.108 Y80.513 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.539 Y88.124 Z1 F42000
G1 X108.525 Y101.698 Z1
G1 Z.6
G1 E.8 F1800
G1 F11997
M204 S5000
G1 X108.525 Y95.719 E.1837
G1 X108.262 Y95.719 E.00809
G1 X108.262 Y98.076 E.07241
G1 X101.18 Y98.076 E.21762
G1 X101.18 Y92.809 E.16185
G1 X105.814 Y92.809 E.1424
G1 X105.814 Y92.604 E.00629
G1 X101.18 Y92.604 E.1424
G1 X101.18 Y87.962 E.14265
G1 X108.113 Y87.962 E.21305
G1 X108.113 Y87.523 E.01347
G1 X104.537 Y87.523 E.10988
G1 X104.537 Y80.473 E.21662
G1 X101.264 Y80.473 E.10056
G1 X101.264 Y76.898 E.10985
G1 X93.894 Y76.898 E.22648
G1 X93.894 Y77.437 E.01656
G1 X100.87 Y77.437 E.21434
G1 X100.87 Y80.859 E.10515
G1 X104.157 Y80.859 E.10102
G1 X104.157 Y87.523 E.20477
G1 X100.824 Y87.523 E.10241
G1 X100.824 Y94.622 E.21812
G1 X97.439 Y94.622 E.10402
G1 X97.439 Y95.043 E.01295
G1 X100.824 Y95.043 E.10402
G1 X100.824 Y98.519 E.10681
G1 X108.262 Y98.519 E.22854
G1 X108.262 Y102.038 E.10813
G1 X118.021 Y102.038 E.29986
G1 X118.021 Y105.345 E.10159
G1 X104.867 Y105.345 E.40417
G1 X104.867 Y101.702 E.11191
G1 X100.786 Y101.702 E.12541
G1 X100.786 Y105.11 E.10469
G1 X94.213 Y105.11 E.20195
G1 X94.213 Y101.923 E.09791
G1 X93.903 Y101.923 E.00952
G1 X93.903 Y105.573 E.11213
G1 X100.786 Y105.573 E.21147
G1 X100.786 Y108.768 E.09819
G1 X90.902 Y108.768 E.30371
G1 X90.902 Y108.366 E.01236
G1 X90.499 Y108.366 E.01236
G1 X90.499 Y84.43 E.73549
G1 X94.135 Y84.43 E.11171
G1 X94.135 Y80.855 E.10983
G1 X97.66 Y80.855 E.10832
G1 X97.66 Y80.491 E.01118
G1 X93.8 Y80.491 E.1186
G1 X93.8 Y84.075 E.1101
G1 X90.499 Y84.075 E.10142
G1 X90.499 Y74.313 E.29995
G1 X90.902 Y74.313 E.01236
G1 X90.902 Y73.911 E.01236
G1 X111.27 Y73.911 E.62585
G1 X111.27 Y77.186 E.10065
G1 X111.734 Y77.186 E.01426
G1 X111.734 Y73.911 E.10065
G1 X125.217 Y73.911 E.4143
G1 X125.217 Y74.313 E.01236
G1 X125.619 Y74.313 E.01236
G1 X125.619 Y91.237 E.52004
G1 X118.42 Y91.237 E.22121
G1 X118.42 Y98.011 E.20813
G1 X115.845 Y98.011 E.07911
G1 X115.845 Y98.616 E.01859
G1 X121.741 Y98.616 E.18116
G1 X121.741 Y105.641 E.21586
G1 X121.945 Y105.641 E.00626
G1 X121.945 Y94.648 E.3378
G1 X121.741 Y94.648 E.00626
G1 X121.741 Y98.011 E.10334
G1 X118.706 Y98.011 E.09327
G1 X118.706 Y91.647 E.19556
G1 X125.619 Y91.647 E.21244
G1 X125.619 Y108.366 E.51373
G1 X125.217 Y108.366 E.01236
G1 X125.217 Y108.768 E.01236
G1 X101.161 Y108.768 E.73916
G1 X101.161 Y101.968 E.20895
G1 X104.637 Y101.968 E.10681
G1 X104.637 Y105.69 E.11438
G1 X118.292 Y105.69 E.41956
G1 X118.292 Y101.736 E.12151
G1 X112.158 Y101.736 E.18847
G1 X112.158 Y94.918 E.20948
G1 X115.245 Y94.918 E.09485
G1 X115.245 Y87.933 E.21465
G1 X122.151 Y87.933 E.21218
G1 X122.151 Y80.585 E.22577
G1 X118.222 Y80.58 E.12073
G1 X118.222 Y84.159 E.11
G1 X107.993 Y84.159 E.31429
G1 X107.993 Y84.55 E.01202
G1 X111.829 Y84.55 E.11786
G1 X111.829 Y89.52 E.15269
G1 X112.158 Y89.52 E.01012
G1 X112.158 Y84.55 E.15269
G1 X118.576 Y84.55 E.19721
G1 X118.576 Y80.844 E.11389
G1 X121.742 Y80.844 E.09728
G1 X121.742 Y87.659 E.2094
G1 X114.824 Y87.659 E.21258
G1 X114.824 Y94.612 E.21367
G1 X111.829 Y94.612 E.09204
G1 X111.829 Y101.698 E.21772
G1 X108.585 Y101.698 E.09967
; WIPE_START
G1 F12000
M204 S6000
G1 X108.565 Y99.698 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
M73 P66 R4
G1 X112.894 Y93.412 Z1 F42000
G1 X125.8 Y74.674 Z1
G1 Z.6
G1 E.8 F1800
G1 F11997
M204 S5000
G1 X125.8 Y73.886 E.02423
G2 X125.687 Y73.773 I-.111 J-.001 E.00546
G1 X124.878 Y73.773 E.02484
G1 X124.726 Y73.326 E.01452
G3 X126.645 Y70.799 I1.982 J-.486 E.11169
G3 X126.931 Y74.854 I.052 J2.034 E.1908
G3 X125.855 Y74.696 I-.189 J-2.455 E.03368
; WIPE_START
G1 F12000
M204 S6000
G1 X125.8 Y73.886 E-.3088
G1 X125.769 Y73.803 E-.03346
G1 X125.687 Y73.773 E-.03335
G1 X124.878 Y73.773 E-.30722
G1 X124.813 Y73.581 E-.07717
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.221 Y73.773 Z1 F42000
G1 Z.6
G1 E.8 F1800
G1 F11997
M204 S5000
G1 X124.101 Y73.164 E.01906
G3 X126.971 Y70.228 I2.596 J-.334 E.14503
G3 X126.406 Y75.435 I-.272 J2.605 E.25343
G1 X125.8 Y75.324 E.01894
G1 X125.8 Y108.807 E1.02882
G3 X125.687 Y108.92 I-.111 J.001 E.00546
G1 X90.29 Y108.92 E1.08764
G3 X90.177 Y108.807 I-.001 J-.111 E.00546
G1 X90.178 Y73.886 E1.07303
G3 X90.29 Y73.773 I.111 J-.001 E.00546
G1 X124.161 Y73.773 E1.04077
; WIPE_START
G1 F12000
M204 S6000
G1 X124.101 Y73.164 E-.23235
G1 X124.08 Y72.814 E-.1333
G1 X124.106 Y72.464 E-.13326
G1 X124.178 Y72.121 E-.13328
G1 X124.29 Y71.804 E-.1278
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1
G1 X0 Y90 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    
      M400
      G90
      M83
      M204 S5000
      G0 Z2 F4000
      G0 X187 Y178 F20000
      G39 S1 X187 Y178
      G0 Z2 F4000
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X124.528 Y73.715 F42000
G1 Z.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.236137
G1 F11997
M204 S6000
G1 X124.445 Y73.404 E.00506
G3 X127.715 Y74.925 I2.256 J-.574 E.16532
G3 X125.815 Y75.008 I-1.054 J-2.358 E.03065
; WIPE_START
G1 F15000
G1 X126.183 Y75.099 E-.14378
G1 X126.439 Y75.141 E-.09888
G1 X126.75 Y75.155 E-.11824
G1 X127.06 Y75.129 E-.11826
G1 X127.337 Y75.07 E-.10746
G1 X127.715 Y74.925 E-.15366
G1 X127.759 Y74.899 E-.01972
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.139 Y74.463 Z1 F42000
G1 X111.502 Y73.969 Z1
G1 Z.6
G1 E.8 F1800
; LINE_WIDTH: 0.11491
G1 F11997
M204 S6000
G1 X111.502 Y76.99 E.01772
; WIPE_START
G1 F15000
G1 X111.502 Y74.99 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.03 Y76.549 Z1 F42000
G1 X101.068 Y77.168 Z1
G1 Z.6
G1 E.8 F1800
; LINE_WIDTH: 0.18966
G1 F11997
M204 S6000
G1 X94.09 Y77.168 E.08344
; WIPE_START
G1 F15000
G1 X96.09 Y77.168 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.706 Y74.043 Z1 F42000
G1 Z.6
G1 E.8 F1800
; LINE_WIDTH: 0.19094
G1 F11997
M204 S6000
G1 X90.374 Y74.043 E.004
M204 S10000
G1 X90.374 Y108.643 F42000
; LINE_WIDTH: 0.20479
G1 F11997
M204 S6000
G1 X90.706 Y108.643 E.00438
; WIPE_START
G1 F15000
G1 X90.374 Y108.643 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.1 Y105.341 Z1 F42000
G1 Z.6
G1 E.8 F1800
; LINE_WIDTH: 0.11373
G1 F11997
M204 S6000
G1 X100.965 Y105.341 E.03962
; WIPE_START
G1 F15000
G1 X98.965 Y105.341 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X106.023 Y102.436 Z1 F42000
G1 X116.041 Y98.313 Z1
G1 Z.6
G1 E.8 F1800
; LINE_WIDTH: 0.25595
G1 F11997
M204 S6000
G1 X121.749 Y98.313 E.09907
; CHANGE_LAYER
; Z_HEIGHT: 0.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X119.749 Y98.313 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 4/23
; update layer progress
M73 L4
M991 S0 P3 ;notify layer change

; OBJECT_ID: 66
M204 S10000
G17
G3 Z1 I.46 J-1.126 P1  F42000
G1 X94.173 Y87.859 Z1
G1 Z.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11997
M204 S5000
G1 X94.173 Y98.062 E.31354
G1 X97.66 Y98.062 E.10715
G1 X97.66 Y101.955 E.11962
G1 X97.436 Y101.955 E.00687
G1 X97.436 Y98.486 E.10659
G1 X93.806 Y98.486 E.11155
G1 X93.806 Y87.582 E.33506
G1 X97.436 Y87.582 E.11155
G1 X97.436 Y84.014 E.10963
G1 X100.853 Y84.014 E.10498
G1 X100.853 Y84.46 E.0137
G1 X97.66 Y84.46 E.0981
G1 X97.66 Y91.257 E.20886
G1 X97.436 Y91.257 E.00687
G1 X97.436 Y87.859 E.10443
G1 X94.233 Y87.859 E.09843
; WIPE_START
G1 F12000
M204 S6000
G1 X94.221 Y89.859 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X100.562 Y85.61 Z1.2 F42000
G1 X108.108 Y80.554 Z1.2
G1 Z.8
G1 E.8 F1800
G1 F11997
M204 S5000
G1 X114.709 Y80.554 E.20283
G1 X114.709 Y76.965 E.11029
G1 X121.185 Y76.965 E.19899
G1 X121.185 Y77.321 E.01094
G1 X115.065 Y77.321 E.18806
G1 X115.065 Y80.855 E.1086
G1 X107.864 Y80.855 E.22127
G1 X107.864 Y77.322 E.10858
G1 X104.632 Y77.322 E.09929
G1 X104.632 Y77.134 E.00578
G1 X108.108 Y77.134 E.1068
M73 P67 R4
G1 X108.108 Y80.494 E.10327
; WIPE_START
G1 F12000
M204 S6000
G1 X110.108 Y80.513 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.539 Y88.124 Z1.2 F42000
G1 X108.525 Y101.698 Z1.2
G1 Z.8
G1 E.8 F1800
M73 P67 R3
G1 F11997
M204 S5000
G1 X108.525 Y95.719 E.1837
G1 X108.262 Y95.719 E.00809
G1 X108.262 Y98.076 E.07241
G1 X101.18 Y98.076 E.21762
G1 X101.18 Y92.809 E.16185
G1 X105.814 Y92.809 E.1424
G1 X105.814 Y92.604 E.00629
G1 X101.18 Y92.604 E.1424
G1 X101.18 Y87.962 E.14265
G1 X108.113 Y87.962 E.21305
G1 X108.113 Y87.523 E.01347
G1 X104.537 Y87.523 E.10988
G1 X104.537 Y80.473 E.21662
G1 X101.264 Y80.473 E.10056
G1 X101.264 Y76.898 E.10985
G1 X93.894 Y76.898 E.22648
G1 X93.894 Y77.437 E.01656
G1 X100.87 Y77.437 E.21434
G1 X100.87 Y80.859 E.10515
G1 X104.157 Y80.859 E.10102
G1 X104.157 Y87.523 E.20477
G1 X100.824 Y87.523 E.10241
G1 X100.824 Y94.622 E.21812
G1 X97.439 Y94.622 E.10402
G1 X97.439 Y95.043 E.01295
G1 X100.824 Y95.043 E.10402
G1 X100.824 Y98.519 E.10681
G1 X108.262 Y98.519 E.22854
G1 X108.262 Y102.038 E.10813
G1 X118.021 Y102.038 E.29986
G1 X118.021 Y105.345 E.10159
G1 X104.867 Y105.345 E.40417
G1 X104.867 Y101.702 E.11191
G1 X100.786 Y101.702 E.12541
G1 X100.786 Y105.11 E.10469
G1 X94.213 Y105.11 E.20195
G1 X94.213 Y101.923 E.09791
G1 X93.903 Y101.923 E.00952
G1 X93.903 Y105.573 E.11213
G1 X100.786 Y105.573 E.21147
G1 X100.786 Y108.768 E.09819
G1 X90.902 Y108.768 E.30371
G1 X90.902 Y108.366 E.01236
G1 X90.499 Y108.366 E.01236
G1 X90.499 Y84.43 E.73549
G1 X94.135 Y84.43 E.11171
G1 X94.135 Y80.855 E.10983
G1 X97.66 Y80.855 E.10832
G1 X97.66 Y80.491 E.01118
G1 X93.8 Y80.491 E.1186
G1 X93.8 Y84.075 E.1101
G1 X90.499 Y84.075 E.10142
G1 X90.499 Y74.313 E.29995
G1 X90.902 Y74.313 E.01236
G1 X90.902 Y73.911 E.01236
G1 X111.27 Y73.911 E.62585
G1 X111.27 Y77.186 E.10065
G1 X111.734 Y77.186 E.01426
G1 X111.734 Y73.911 E.10065
G1 X125.217 Y73.911 E.4143
G1 X125.217 Y74.313 E.01236
G1 X125.619 Y74.313 E.01236
G1 X125.619 Y91.237 E.52004
G1 X118.42 Y91.237 E.22121
G1 X118.42 Y98.011 E.20813
G1 X115.845 Y98.011 E.07911
G1 X115.845 Y98.616 E.01859
G1 X121.741 Y98.616 E.18116
G1 X121.741 Y105.641 E.21586
G1 X121.945 Y105.641 E.00626
G1 X121.945 Y94.648 E.3378
G1 X121.741 Y94.648 E.00626
G1 X121.741 Y98.011 E.10334
G1 X118.706 Y98.011 E.09327
G1 X118.706 Y91.647 E.19556
G1 X125.619 Y91.647 E.21244
G1 X125.619 Y108.366 E.51373
G1 X125.217 Y108.366 E.01236
G1 X125.217 Y108.768 E.01236
G1 X101.161 Y108.768 E.73916
G1 X101.161 Y101.968 E.20895
G1 X104.637 Y101.968 E.10681
G1 X104.637 Y105.69 E.11438
G1 X118.292 Y105.69 E.41956
G1 X118.292 Y101.736 E.12151
G1 X112.158 Y101.736 E.18847
G1 X112.158 Y94.918 E.20948
G1 X115.245 Y94.918 E.09485
G1 X115.245 Y87.933 E.21465
G1 X122.151 Y87.933 E.21218
G1 X122.151 Y80.585 E.22577
G1 X118.222 Y80.58 E.12073
G1 X118.222 Y84.159 E.11
G1 X107.993 Y84.159 E.31429
G1 X107.993 Y84.55 E.01202
G1 X111.829 Y84.55 E.11786
G1 X111.829 Y89.52 E.15269
G1 X112.158 Y89.52 E.01012
G1 X112.158 Y84.55 E.15269
G1 X118.576 Y84.55 E.19721
G1 X118.576 Y80.844 E.11389
G1 X121.742 Y80.844 E.09728
G1 X121.742 Y87.659 E.2094
G1 X114.824 Y87.659 E.21258
G1 X114.824 Y94.612 E.21367
G1 X111.829 Y94.612 E.09204
G1 X111.829 Y101.698 E.21772
G1 X108.585 Y101.698 E.09967
; WIPE_START
G1 F12000
M204 S6000
G1 X108.565 Y99.698 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X112.894 Y93.412 Z1.2 F42000
G1 X125.8 Y74.674 Z1.2
G1 Z.8
G1 E.8 F1800
G1 F11997
M204 S5000
G1 X125.8 Y73.886 E.02423
G2 X125.687 Y73.773 I-.111 J-.001 E.00546
G1 X124.878 Y73.773 E.02484
G1 X124.726 Y73.326 E.01452
G3 X126.613 Y70.801 I1.97 J-.495 E.11086
G3 X126.386 Y74.836 I.095 J2.029 E.20894
G1 X126.254 Y74.817 E.00408
G1 X125.857 Y74.692 E.0128
; WIPE_START
G1 F12000
M204 S6000
G1 X125.8 Y73.886 E-.30726
G1 X125.769 Y73.803 E-.03346
G1 X125.687 Y73.773 E-.03334
G1 X124.878 Y73.773 E-.30722
G1 X124.811 Y73.577 E-.07872
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.221 Y73.773 Z1.2 F42000
G1 Z.8
G1 E.8 F1800
M73 P68 R3
G1 F11997
M204 S5000
G1 X124.101 Y73.164 E.01906
G3 X127.04 Y70.235 I2.596 J-.334 E.1472
G3 X128.993 Y71.567 I-.31 J2.552 E.07545
G3 X126.406 Y75.435 I-2.291 J1.267 E.17609
G1 X125.8 Y75.324 E.01894
G1 X125.8 Y108.807 E1.02882
G3 X125.687 Y108.92 I-.111 J.001 E.00546
G1 X90.29 Y108.92 E1.08764
G3 X90.177 Y108.807 I-.001 J-.111 E.00546
G1 X90.178 Y73.886 E1.07303
G3 X90.29 Y73.773 I.111 J-.001 E.00546
G1 X124.161 Y73.773 E1.04077
; WIPE_START
G1 F12000
M204 S6000
G1 X124.101 Y73.164 E-.23235
G1 X124.08 Y72.814 E-.1333
G1 X124.106 Y72.464 E-.13326
G1 X124.178 Y72.121 E-.13327
G1 X124.29 Y71.804 E-.12781
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.2 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1.2
G1 X0 Y90 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z1.2 F4000
            G39.3 S1
            G0 Z1.2 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X124.528 Y73.715 F42000
G1 Z.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.236136
G1 F11997
M204 S6000
G1 X124.445 Y73.404 E.00506
G3 X127.715 Y74.925 I2.255 J-.572 E.16519
G3 X125.815 Y75.008 I-1.054 J-2.358 E.03065
; WIPE_START
G1 F15000
G1 X126.183 Y75.099 E-.14376
G1 X126.439 Y75.141 E-.0989
G1 X126.75 Y75.155 E-.11823
G1 X127.06 Y75.129 E-.11827
G1 X127.337 Y75.07 E-.10746
G1 X127.715 Y74.925 E-.15368
G1 X127.759 Y74.899 E-.01971
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.139 Y74.463 Z1.2 F42000
G1 X111.502 Y73.969 Z1.2
G1 Z.8
G1 E.8 F1800
; LINE_WIDTH: 0.11491
G1 F11997
M204 S6000
G1 X111.502 Y76.99 E.01772
; WIPE_START
G1 F15000
G1 X111.502 Y74.99 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.03 Y76.549 Z1.2 F42000
G1 X101.068 Y77.168 Z1.2
G1 Z.8
G1 E.8 F1800
; LINE_WIDTH: 0.18966
G1 F11997
M204 S6000
G1 X94.09 Y77.168 E.08344
; WIPE_START
G1 F15000
G1 X96.09 Y77.168 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.706 Y74.043 Z1.2 F42000
G1 Z.8
G1 E.8 F1800
; LINE_WIDTH: 0.19094
G1 F11997
M204 S6000
G1 X90.374 Y74.043 E.004
M204 S10000
G1 X90.374 Y108.643 F42000
; LINE_WIDTH: 0.20479
G1 F11997
M204 S6000
G1 X90.706 Y108.643 E.00438
; WIPE_START
G1 F15000
G1 X90.374 Y108.643 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.1 Y105.341 Z1.2 F42000
G1 Z.8
G1 E.8 F1800
; LINE_WIDTH: 0.11373
G1 F11997
M204 S6000
G1 X100.965 Y105.341 E.03962
; WIPE_START
G1 F15000
G1 X98.965 Y105.341 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X106.023 Y102.436 Z1.2 F42000
G1 X116.041 Y98.313 Z1.2
G1 Z.8
G1 E.8 F1800
; LINE_WIDTH: 0.25595
G1 F11997
M204 S6000
G1 X121.749 Y98.313 E.09907
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X119.749 Y98.313 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 5/23
; update layer progress
M73 L5
M991 S0 P4 ;notify layer change

; OBJECT_ID: 66
M204 S10000
G17
G3 Z1.2 I.46 J-1.126 P1  F42000
G1 X94.173 Y87.859 Z1.2
G1 Z1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11997
M204 S5000
G1 X94.173 Y98.062 E.31354
G1 X97.66 Y98.062 E.10715
G1 X97.66 Y101.955 E.11962
G1 X97.436 Y101.955 E.00687
G1 X97.436 Y98.486 E.10659
G1 X93.806 Y98.486 E.11155
G1 X93.806 Y87.582 E.33506
G1 X97.436 Y87.582 E.11155
G1 X97.436 Y84.014 E.10963
G1 X100.853 Y84.014 E.10498
G1 X100.853 Y84.46 E.0137
G1 X97.66 Y84.46 E.0981
G1 X97.66 Y91.257 E.20886
G1 X97.436 Y91.257 E.00687
G1 X97.436 Y87.859 E.10443
G1 X94.233 Y87.859 E.09843
; WIPE_START
G1 F12000
M204 S6000
G1 X94.221 Y89.859 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X100.562 Y85.61 Z1.4 F42000
G1 X108.108 Y80.554 Z1.4
G1 Z1
G1 E.8 F1800
G1 F11997
M204 S5000
G1 X114.709 Y80.554 E.20283
G1 X114.709 Y76.965 E.11029
G1 X121.185 Y76.965 E.19899
G1 X121.185 Y77.321 E.01094
G1 X115.065 Y77.321 E.18806
G1 X115.065 Y80.855 E.1086
G1 X107.864 Y80.855 E.22127
G1 X107.864 Y77.322 E.10858
G1 X104.632 Y77.322 E.09929
G1 X104.632 Y77.134 E.00578
G1 X108.108 Y77.134 E.1068
G1 X108.108 Y80.494 E.10327
; WIPE_START
G1 F12000
M204 S6000
G1 X110.108 Y80.513 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.539 Y88.124 Z1.4 F42000
G1 X108.525 Y101.698 Z1.4
G1 Z1
G1 E.8 F1800
G1 F11997
M204 S5000
G1 X108.525 Y95.719 E.1837
G1 X108.262 Y95.719 E.00809
G1 X108.262 Y98.076 E.07241
G1 X101.18 Y98.076 E.21762
G1 X101.18 Y92.809 E.16185
G1 X105.814 Y92.809 E.1424
G1 X105.814 Y92.604 E.00629
G1 X101.18 Y92.604 E.1424
G1 X101.18 Y87.962 E.14265
G1 X108.113 Y87.962 E.21305
G1 X108.113 Y87.523 E.01347
G1 X104.537 Y87.523 E.10988
G1 X104.537 Y80.473 E.21662
G1 X101.264 Y80.473 E.10056
G1 X101.264 Y76.898 E.10985
G1 X93.894 Y76.898 E.22648
G1 X93.894 Y77.437 E.01656
G1 X100.87 Y77.437 E.21434
G1 X100.87 Y80.859 E.10515
G1 X104.157 Y80.859 E.10102
G1 X104.157 Y87.523 E.20477
G1 X100.824 Y87.523 E.10241
G1 X100.824 Y94.622 E.21812
G1 X97.439 Y94.622 E.10402
G1 X97.439 Y95.043 E.01295
G1 X100.824 Y95.043 E.10402
G1 X100.824 Y98.519 E.10681
G1 X108.262 Y98.519 E.22854
G1 X108.262 Y102.038 E.10813
G1 X118.021 Y102.038 E.29986
G1 X118.021 Y105.345 E.10159
G1 X104.867 Y105.345 E.40417
G1 X104.867 Y101.702 E.11191
G1 X100.786 Y101.702 E.12541
G1 X100.786 Y105.11 E.10469
G1 X94.213 Y105.11 E.20195
G1 X94.213 Y101.923 E.09791
G1 X93.903 Y101.923 E.00952
G1 X93.903 Y105.573 E.11213
G1 X100.786 Y105.573 E.21147
M73 P69 R3
G1 X100.786 Y108.768 E.09819
G1 X90.902 Y108.768 E.30371
G1 X90.902 Y108.366 E.01236
G1 X90.499 Y108.366 E.01236
G1 X90.499 Y84.43 E.73549
G1 X94.135 Y84.43 E.11171
G1 X94.135 Y80.855 E.10983
G1 X97.66 Y80.855 E.10832
G1 X97.66 Y80.491 E.01118
G1 X93.8 Y80.491 E.1186
G1 X93.8 Y84.075 E.1101
G1 X90.499 Y84.075 E.10142
G1 X90.499 Y74.313 E.29995
G1 X90.902 Y74.313 E.01236
G1 X90.902 Y73.911 E.01236
G1 X111.27 Y73.911 E.62585
G1 X111.27 Y77.186 E.10065
G1 X111.734 Y77.186 E.01426
G1 X111.734 Y73.911 E.10065
G1 X125.217 Y73.911 E.4143
G1 X125.217 Y74.313 E.01236
G1 X125.619 Y74.313 E.01236
G1 X125.619 Y91.237 E.52004
G1 X118.42 Y91.237 E.22121
G1 X118.42 Y98.011 E.20813
G1 X115.845 Y98.011 E.07911
G1 X115.845 Y98.616 E.01859
G1 X121.741 Y98.616 E.18116
G1 X121.741 Y105.641 E.21586
G1 X121.945 Y105.641 E.00626
G1 X121.945 Y94.648 E.3378
G1 X121.741 Y94.648 E.00626
G1 X121.741 Y98.011 E.10334
G1 X118.706 Y98.011 E.09327
G1 X118.706 Y91.647 E.19556
G1 X125.619 Y91.647 E.21244
G1 X125.619 Y108.366 E.51373
G1 X125.217 Y108.366 E.01236
G1 X125.217 Y108.768 E.01236
G1 X101.161 Y108.768 E.73916
G1 X101.161 Y101.968 E.20895
G1 X104.637 Y101.968 E.10681
G1 X104.637 Y105.69 E.11438
G1 X118.292 Y105.69 E.41956
G1 X118.292 Y101.736 E.12151
G1 X112.158 Y101.736 E.18847
G1 X112.158 Y94.918 E.20948
G1 X115.245 Y94.918 E.09485
G1 X115.245 Y87.933 E.21465
G1 X122.151 Y87.933 E.21218
G1 X122.151 Y80.585 E.22577
G1 X118.222 Y80.58 E.12073
G1 X118.222 Y84.159 E.11
G1 X107.993 Y84.159 E.31429
G1 X107.993 Y84.55 E.01202
G1 X111.829 Y84.55 E.11786
G1 X111.829 Y89.52 E.15269
G1 X112.158 Y89.52 E.01012
G1 X112.158 Y84.55 E.15269
G1 X118.576 Y84.55 E.19721
G1 X118.576 Y80.844 E.11389
G1 X121.742 Y80.844 E.09728
G1 X121.742 Y87.659 E.2094
G1 X114.824 Y87.659 E.21258
G1 X114.824 Y94.612 E.21367
G1 X111.829 Y94.612 E.09204
G1 X111.829 Y101.698 E.21772
G1 X108.585 Y101.698 E.09967
; WIPE_START
G1 F12000
M204 S6000
G1 X108.565 Y99.698 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X112.894 Y93.412 Z1.4 F42000
G1 X125.8 Y74.674 Z1.4
G1 Z1
G1 E.8 F1800
G1 F11997
M204 S5000
G1 X125.8 Y73.886 E.02423
G2 X125.687 Y73.773 I-.111 J-.001 E.00546
G1 X124.878 Y73.773 E.02484
G1 X124.726 Y73.326 E.01452
G3 X126.58 Y70.803 I1.981 J-.487 E.10965
G3 X126.931 Y74.854 I.119 J2.03 E.19283
G3 X125.855 Y74.696 I-.189 J-2.455 E.03368
; WIPE_START
G1 F12000
M204 S6000
G1 X125.8 Y73.886 E-.3088
G1 X125.769 Y73.803 E-.03346
G1 X125.687 Y73.773 E-.03335
G1 X124.878 Y73.773 E-.30722
G1 X124.813 Y73.581 E-.07717
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.221 Y73.773 Z1.4 F42000
G1 Z1
G1 E.8 F1800
G1 F11997
M204 S5000
G1 X124.101 Y73.164 E.01906
G3 X127.11 Y70.243 I2.598 J-.334 E.1494
G3 X126.406 Y75.435 I-.413 J2.588 E.24917
G1 X125.8 Y75.325 E.01894
G1 X125.8 Y108.807 E1.02882
G3 X125.687 Y108.92 I-.112 J.001 E.00546
G1 X90.29 Y108.92 E1.08764
G3 X90.177 Y108.807 I-.006 J-.107 E.00552
G1 X90.178 Y73.885 E1.07304
G3 X90.29 Y73.773 I.112 J-.001 E.00545
G1 X124.161 Y73.773 E1.04077
; WIPE_START
G1 F12000
M204 S6000
G1 X124.101 Y73.164 E-.23236
G1 X124.08 Y72.814 E-.1333
G1 X124.106 Y72.464 E-.13326
G1 X124.178 Y72.121 E-.13331
G1 X124.29 Y71.804 E-.12778
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.4 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1.4
G1 X0 Y90 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z1.4 F4000
            G39.3 S1
            G0 Z1.4 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X124.528 Y73.715 F42000
G1 Z1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.23614
G1 F11997
M204 S6000
G1 X124.445 Y73.404 E.00506
G3 X127.715 Y74.925 I2.255 J-.572 E.1652
G3 X125.815 Y75.008 I-1.054 J-2.359 E.03065
; WIPE_START
G1 F15000
G1 X126.183 Y75.099 E-.14377
G1 X126.439 Y75.141 E-.09886
G1 X126.75 Y75.155 E-.11825
G1 X127.06 Y75.129 E-.11827
G1 X127.337 Y75.07 E-.10746
G1 X127.715 Y74.925 E-.15366
G1 X127.759 Y74.899 E-.01972
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.139 Y74.463 Z1.4 F42000
G1 X111.502 Y73.969 Z1.4
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.11491
G1 F11997
M204 S6000
G1 X111.502 Y76.99 E.01772
; WIPE_START
G1 F15000
G1 X111.502 Y74.99 E-.76
; WIPE_END
M73 P70 R3
G1 E-.04 F1800
M204 S10000
G1 X104.03 Y76.549 Z1.4 F42000
G1 X101.068 Y77.168 Z1.4
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.18966
G1 F11997
M204 S6000
G1 X94.09 Y77.168 E.08344
; WIPE_START
G1 F15000
G1 X96.09 Y77.168 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.706 Y74.043 Z1.4 F42000
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.19094
G1 F11997
M204 S6000
G1 X90.374 Y74.043 E.004
M204 S10000
G1 X90.374 Y108.643 F42000
; LINE_WIDTH: 0.20479
G1 F11997
M204 S6000
G1 X90.706 Y108.643 E.00438
; WIPE_START
G1 F15000
G1 X90.374 Y108.643 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.1 Y105.341 Z1.4 F42000
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.11373
G1 F11997
M204 S6000
G1 X100.965 Y105.341 E.03962
; WIPE_START
G1 F15000
G1 X98.965 Y105.341 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X106.023 Y102.436 Z1.4 F42000
G1 X116.041 Y98.313 Z1.4
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.25595
G1 F11997
M204 S6000
G1 X121.749 Y98.313 E.09907
; CHANGE_LAYER
; Z_HEIGHT: 1.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X119.749 Y98.313 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 6/23
; update layer progress
M73 L6
M991 S0 P5 ;notify layer change

; OBJECT_ID: 66
M204 S10000
G17
G3 Z1.4 I.46 J-1.126 P1  F42000
G1 X94.173 Y87.859 Z1.4
G1 Z1.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11996
M204 S5000
G1 X94.173 Y98.062 E.31354
G1 X97.66 Y98.062 E.10715
G1 X97.66 Y101.955 E.11962
G1 X97.436 Y101.955 E.00687
G1 X97.436 Y98.486 E.10659
G1 X93.806 Y98.486 E.11155
G1 X93.806 Y87.582 E.33506
G1 X97.436 Y87.582 E.11155
G1 X97.436 Y84.014 E.10963
G1 X100.853 Y84.014 E.10498
G1 X100.853 Y84.46 E.0137
G1 X97.66 Y84.46 E.0981
G1 X97.66 Y91.257 E.20886
G1 X97.436 Y91.257 E.00687
G1 X97.436 Y87.859 E.10443
G1 X94.233 Y87.859 E.09843
; WIPE_START
G1 F12000
M204 S6000
G1 X94.221 Y89.859 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X100.562 Y85.61 Z1.6 F42000
G1 X108.108 Y80.554 Z1.6
G1 Z1.2
G1 E.8 F1800
G1 F11996
M204 S5000
G1 X114.709 Y80.554 E.20283
G1 X114.709 Y76.965 E.11029
G1 X121.185 Y76.965 E.19899
G1 X121.185 Y77.321 E.01094
G1 X115.065 Y77.321 E.18806
G1 X115.065 Y80.855 E.1086
G1 X107.864 Y80.855 E.22127
G1 X107.864 Y77.322 E.10858
G1 X104.632 Y77.322 E.09929
G1 X104.632 Y77.134 E.00578
G1 X108.108 Y77.134 E.1068
G1 X108.108 Y80.494 E.10327
; WIPE_START
G1 F12000
M204 S6000
G1 X110.108 Y80.513 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.539 Y88.124 Z1.6 F42000
G1 X108.525 Y101.698 Z1.6
G1 Z1.2
G1 E.8 F1800
G1 F11996
M204 S5000
G1 X108.525 Y95.719 E.1837
G1 X108.262 Y95.719 E.00809
G1 X108.262 Y98.076 E.07241
G1 X101.18 Y98.076 E.21762
G1 X101.18 Y92.809 E.16185
G1 X105.814 Y92.809 E.1424
G1 X105.814 Y92.604 E.00629
G1 X101.18 Y92.604 E.1424
G1 X101.18 Y87.962 E.14265
G1 X108.113 Y87.962 E.21305
G1 X108.113 Y87.523 E.01347
G1 X104.537 Y87.523 E.10988
G1 X104.537 Y80.473 E.21662
G1 X101.264 Y80.473 E.10056
G1 X101.264 Y76.898 E.10985
G1 X93.894 Y76.898 E.22648
G1 X93.894 Y77.437 E.01656
G1 X100.87 Y77.437 E.21434
G1 X100.87 Y80.859 E.10515
G1 X104.157 Y80.859 E.10102
G1 X104.157 Y87.523 E.20477
G1 X100.824 Y87.523 E.10241
G1 X100.824 Y94.622 E.21812
G1 X97.439 Y94.622 E.10402
G1 X97.439 Y95.043 E.01295
G1 X100.824 Y95.043 E.10402
G1 X100.824 Y98.519 E.10681
G1 X108.262 Y98.519 E.22854
G1 X108.262 Y102.038 E.10813
G1 X118.021 Y102.038 E.29986
G1 X118.021 Y105.345 E.10159
G1 X104.867 Y105.345 E.40417
G1 X104.867 Y101.702 E.11191
G1 X100.786 Y101.702 E.12541
G1 X100.786 Y105.11 E.10469
G1 X94.213 Y105.11 E.20195
G1 X94.213 Y101.923 E.09791
G1 X93.903 Y101.923 E.00952
G1 X93.903 Y105.573 E.11213
G1 X100.786 Y105.573 E.21147
G1 X100.786 Y108.768 E.09819
G1 X90.902 Y108.768 E.30371
G1 X90.902 Y108.366 E.01236
G1 X90.499 Y108.366 E.01236
G1 X90.499 Y84.43 E.73549
G1 X94.135 Y84.43 E.11171
G1 X94.135 Y80.855 E.10983
G1 X97.66 Y80.855 E.10832
G1 X97.66 Y80.491 E.01118
G1 X93.8 Y80.491 E.1186
G1 X93.8 Y84.075 E.1101
G1 X90.499 Y84.075 E.10142
G1 X90.499 Y74.313 E.29995
G1 X90.902 Y74.313 E.01236
G1 X90.902 Y73.911 E.01236
G1 X111.27 Y73.911 E.62585
G1 X111.27 Y77.186 E.10065
G1 X111.734 Y77.186 E.01426
G1 X111.734 Y73.911 E.10065
G1 X125.217 Y73.911 E.4143
G1 X125.217 Y74.313 E.01236
G1 X125.619 Y74.313 E.01236
G1 X125.619 Y91.237 E.52004
G1 X118.42 Y91.237 E.22121
G1 X118.42 Y98.011 E.20813
G1 X115.845 Y98.011 E.07911
G1 X115.845 Y98.616 E.01859
G1 X121.741 Y98.616 E.18116
G1 X121.741 Y105.641 E.21586
G1 X121.945 Y105.641 E.00626
G1 X121.945 Y94.648 E.3378
G1 X121.741 Y94.648 E.00626
G1 X121.741 Y98.011 E.10334
G1 X118.706 Y98.011 E.09327
G1 X118.706 Y91.647 E.19556
G1 X125.619 Y91.647 E.21244
G1 X125.619 Y108.366 E.51373
G1 X125.217 Y108.366 E.01236
M73 P71 R3
G1 X125.217 Y108.768 E.01236
G1 X101.161 Y108.768 E.73916
G1 X101.161 Y101.968 E.20895
G1 X104.637 Y101.968 E.10681
G1 X104.637 Y105.69 E.11438
G1 X118.292 Y105.69 E.41956
G1 X118.292 Y101.736 E.12151
G1 X112.158 Y101.736 E.18847
G1 X112.158 Y94.918 E.20948
G1 X115.245 Y94.918 E.09485
G1 X115.245 Y87.933 E.21465
G1 X122.151 Y87.933 E.21218
G1 X122.151 Y80.585 E.22577
G1 X118.222 Y80.58 E.12073
G1 X118.222 Y84.159 E.11
G1 X107.993 Y84.159 E.31429
G1 X107.993 Y84.55 E.01202
G1 X111.829 Y84.55 E.11786
G1 X111.829 Y89.52 E.15269
G1 X112.158 Y89.52 E.01012
G1 X112.158 Y84.55 E.15269
G1 X118.576 Y84.55 E.19721
G1 X118.576 Y80.844 E.11389
G1 X121.742 Y80.844 E.09728
G1 X121.742 Y87.659 E.2094
G1 X114.824 Y87.659 E.21258
G1 X114.824 Y94.612 E.21367
G1 X111.829 Y94.612 E.09204
G1 X111.829 Y101.698 E.21772
G1 X108.585 Y101.698 E.09967
; WIPE_START
G1 F12000
M204 S6000
G1 X108.565 Y99.698 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X112.894 Y93.412 Z1.6 F42000
G1 X125.8 Y74.674 Z1.6
G1 Z1.2
G1 E.8 F1800
G1 F11996
M204 S5000
G1 X125.8 Y73.886 E.02423
G2 X125.687 Y73.773 I-.111 J-.001 E.00546
G1 X124.878 Y73.773 E.02484
G1 X124.726 Y73.326 E.01452
G3 X126.547 Y70.805 I1.981 J-.487 E.10865
G3 X126.931 Y74.854 I.156 J2.028 E.19409
G3 X125.855 Y74.696 I-.189 J-2.455 E.03368
; WIPE_START
G1 F12000
M204 S6000
G1 X125.8 Y73.886 E-.30882
G1 X125.769 Y73.803 E-.03344
G1 X125.687 Y73.773 E-.03335
G1 X124.878 Y73.773 E-.30722
G1 X124.813 Y73.581 E-.07717
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.223 Y73.773 Z1.6 F42000
G1 Z1.2
G1 E.8 F1800
G1 F11996
M204 S5000
G1 X124.103 Y73.156 E.01932
G3 X127.172 Y70.253 I2.609 J-.315 E.15077
G3 X126.417 Y75.433 I-.476 J2.576 E.24671
G1 X125.8 Y75.324 E.01926
G1 X125.8 Y108.807 E1.02885
G3 X125.687 Y108.92 I-.111 J.001 E.00546
G1 X90.29 Y108.92 E1.08764
G3 X90.177 Y108.807 I-.001 J-.111 E.00546
G1 X90.178 Y73.886 E1.07303
G3 X90.29 Y73.773 I.111 J-.001 E.00546
G1 X124.163 Y73.773 E1.04081
; WIPE_START
G1 F12000
M204 S6000
G1 X124.103 Y73.156 E-.2356
G1 X124.083 Y72.805 E-.13333
G1 X124.109 Y72.455 E-.13339
G1 X124.181 Y72.116 E-.13179
G1 X124.293 Y71.804 E-.12589
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.6 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1.6
G1 X0 Y90 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z1.6 F4000
            G39.3 S1
            G0 Z1.6 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X124.529 Y73.715 F42000
G1 Z1.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.23349
G1 F11996
M204 S6000
G1 X124.446 Y73.404 E.00499
G3 X127.714 Y74.924 I2.254 J-.572 E.16287
G3 X125.815 Y75.008 I-1.055 J-2.361 E.03022
; WIPE_START
G1 F15000
G1 X126.183 Y75.098 E-.14384
G1 X126.449 Y75.141 E-.10249
G1 X126.752 Y75.154 E-.11498
G1 X127.07 Y75.126 E-.12133
G1 X127.337 Y75.068 E-.10382
G1 X127.714 Y74.924 E-.15349
G1 X127.76 Y74.898 E-.02006
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.14 Y74.462 Z1.6 F42000
G1 X111.502 Y73.969 Z1.6
G1 Z1.2
G1 E.8 F1800
; LINE_WIDTH: 0.11491
G1 F11996
M204 S6000
G1 X111.502 Y76.99 E.01772
; WIPE_START
G1 F15000
G1 X111.502 Y74.99 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.03 Y76.549 Z1.6 F42000
G1 X101.068 Y77.168 Z1.6
G1 Z1.2
G1 E.8 F1800
; LINE_WIDTH: 0.18966
G1 F11996
M204 S6000
G1 X94.09 Y77.168 E.08344
; WIPE_START
G1 F15000
G1 X96.09 Y77.168 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.706 Y74.043 Z1.6 F42000
G1 Z1.2
G1 E.8 F1800
; LINE_WIDTH: 0.19094
G1 F11996
M204 S6000
G1 X90.374 Y74.043 E.004
M204 S10000
G1 X90.374 Y108.643 F42000
; LINE_WIDTH: 0.20479
G1 F11996
M204 S6000
G1 X90.706 Y108.643 E.00438
; WIPE_START
G1 F15000
G1 X90.374 Y108.643 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.1 Y105.341 Z1.6 F42000
G1 Z1.2
G1 E.8 F1800
; LINE_WIDTH: 0.11373
G1 F11996
M204 S6000
G1 X100.965 Y105.341 E.03962
; WIPE_START
G1 F15000
G1 X98.965 Y105.341 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X106.023 Y102.436 Z1.6 F42000
G1 X116.041 Y98.313 Z1.6
G1 Z1.2
G1 E.8 F1800
; LINE_WIDTH: 0.25595
M73 P72 R3
G1 F11996
M204 S6000
G1 X121.749 Y98.313 E.09907
; CHANGE_LAYER
; Z_HEIGHT: 1.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X119.749 Y98.313 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 7/23
; update layer progress
M73 L7
M991 S0 P6 ;notify layer change

; OBJECT_ID: 66
M204 S10000
G17
G3 Z1.6 I.46 J-1.126 P1  F42000
G1 X94.173 Y87.859 Z1.6
G1 Z1.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11995
M204 S5000
G1 X94.173 Y98.062 E.31354
G1 X97.66 Y98.062 E.10715
G1 X97.66 Y101.955 E.11962
G1 X97.436 Y101.955 E.00687
G1 X97.436 Y98.486 E.10659
G1 X93.806 Y98.486 E.11155
G1 X93.806 Y87.582 E.33506
G1 X97.436 Y87.582 E.11155
G1 X97.436 Y84.014 E.10963
G1 X100.853 Y84.014 E.10498
G1 X100.853 Y84.46 E.0137
G1 X97.66 Y84.46 E.0981
G1 X97.66 Y91.257 E.20886
G1 X97.436 Y91.257 E.00687
G1 X97.436 Y87.859 E.10443
G1 X94.233 Y87.859 E.09843
; WIPE_START
G1 F12000
M204 S6000
G1 X94.221 Y89.859 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X100.562 Y85.61 Z1.8 F42000
G1 X108.108 Y80.554 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F11995
M204 S5000
G1 X114.709 Y80.554 E.20283
G1 X114.709 Y76.965 E.11029
G1 X121.185 Y76.965 E.19899
G1 X121.185 Y77.321 E.01094
G1 X115.065 Y77.321 E.18806
G1 X115.065 Y80.855 E.1086
G1 X107.864 Y80.855 E.22127
G1 X107.864 Y77.322 E.10858
G1 X104.632 Y77.322 E.09929
G1 X104.632 Y77.134 E.00578
G1 X108.108 Y77.134 E.1068
G1 X108.108 Y80.494 E.10327
; WIPE_START
G1 F12000
M204 S6000
G1 X110.108 Y80.513 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.539 Y88.124 Z1.8 F42000
G1 X108.525 Y101.698 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F11995
M204 S5000
G1 X108.525 Y95.719 E.1837
G1 X108.262 Y95.719 E.00809
G1 X108.262 Y98.076 E.07241
G1 X101.18 Y98.076 E.21762
G1 X101.18 Y92.809 E.16185
G1 X105.814 Y92.809 E.1424
G1 X105.814 Y92.604 E.00629
G1 X101.18 Y92.604 E.1424
G1 X101.18 Y87.962 E.14265
G1 X108.113 Y87.962 E.21305
G1 X108.113 Y87.523 E.01347
G1 X104.537 Y87.523 E.10988
G1 X104.537 Y80.473 E.21662
G1 X101.264 Y80.473 E.10056
G1 X101.264 Y76.898 E.10985
G1 X93.894 Y76.898 E.22648
G1 X93.894 Y77.437 E.01656
G1 X100.87 Y77.437 E.21434
G1 X100.87 Y80.859 E.10515
G1 X104.157 Y80.859 E.10102
G1 X104.157 Y87.523 E.20477
G1 X100.824 Y87.523 E.10241
G1 X100.824 Y94.622 E.21812
G1 X97.439 Y94.622 E.10402
G1 X97.439 Y95.043 E.01295
G1 X100.824 Y95.043 E.10402
G1 X100.824 Y98.519 E.10681
G1 X108.262 Y98.519 E.22854
G1 X108.262 Y102.038 E.10813
G1 X118.021 Y102.038 E.29986
G1 X118.021 Y105.345 E.10159
G1 X104.867 Y105.345 E.40417
G1 X104.867 Y101.702 E.11191
G1 X100.786 Y101.702 E.12541
G1 X100.786 Y105.11 E.10469
G1 X94.213 Y105.11 E.20195
G1 X94.213 Y101.923 E.09791
G1 X93.903 Y101.923 E.00952
G1 X93.903 Y105.573 E.11213
G1 X100.786 Y105.573 E.21147
G1 X100.786 Y108.768 E.09819
G1 X90.902 Y108.768 E.30371
G1 X90.902 Y108.366 E.01236
G1 X90.499 Y108.366 E.01236
G1 X90.499 Y84.43 E.73549
G1 X94.135 Y84.43 E.11171
G1 X94.135 Y80.855 E.10983
G1 X97.66 Y80.855 E.10832
G1 X97.66 Y80.491 E.01118
G1 X93.8 Y80.491 E.1186
G1 X93.8 Y84.075 E.1101
G1 X90.499 Y84.075 E.10142
G1 X90.499 Y74.313 E.29995
G1 X90.902 Y74.313 E.01236
G1 X90.902 Y73.911 E.01236
G1 X111.27 Y73.911 E.62585
G1 X111.27 Y77.186 E.10065
G1 X111.734 Y77.186 E.01426
G1 X111.734 Y73.911 E.10065
G1 X125.217 Y73.911 E.4143
G1 X125.217 Y74.313 E.01236
G1 X125.619 Y74.313 E.01236
G1 X125.619 Y91.237 E.52004
G1 X118.42 Y91.237 E.22121
G1 X118.42 Y98.011 E.20813
G1 X115.845 Y98.011 E.07911
G1 X115.845 Y98.616 E.01859
G1 X121.741 Y98.616 E.18116
G1 X121.741 Y105.641 E.21586
G1 X121.945 Y105.641 E.00626
G1 X121.945 Y94.648 E.3378
G1 X121.741 Y94.648 E.00626
G1 X121.741 Y98.011 E.10334
G1 X118.706 Y98.011 E.09327
G1 X118.706 Y91.647 E.19556
G1 X125.619 Y91.647 E.21244
G1 X125.619 Y108.366 E.51373
G1 X125.217 Y108.366 E.01236
G1 X125.217 Y108.768 E.01236
G1 X101.161 Y108.768 E.73916
G1 X101.161 Y101.968 E.20895
G1 X104.637 Y101.968 E.10681
G1 X104.637 Y105.69 E.11438
G1 X118.292 Y105.69 E.41956
G1 X118.292 Y101.736 E.12151
G1 X112.158 Y101.736 E.18847
G1 X112.158 Y94.918 E.20948
G1 X115.245 Y94.918 E.09485
G1 X115.245 Y87.933 E.21465
G1 X122.151 Y87.933 E.21218
G1 X122.151 Y80.585 E.22577
G1 X118.222 Y80.58 E.12073
G1 X118.222 Y84.159 E.11
G1 X107.993 Y84.159 E.31429
G1 X107.993 Y84.55 E.01202
G1 X111.829 Y84.55 E.11786
G1 X111.829 Y89.52 E.15269
G1 X112.158 Y89.52 E.01012
G1 X112.158 Y84.55 E.15269
G1 X118.576 Y84.55 E.19721
G1 X118.576 Y80.844 E.11389
G1 X121.742 Y80.844 E.09728
G1 X121.742 Y87.659 E.2094
G1 X114.824 Y87.659 E.21258
G1 X114.824 Y94.612 E.21367
G1 X111.829 Y94.612 E.09204
G1 X111.829 Y101.698 E.21772
G1 X108.585 Y101.698 E.09967
; WIPE_START
G1 F12000
M204 S6000
G1 X108.565 Y99.698 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X112.894 Y93.412 Z1.8 F42000
G1 X125.8 Y74.674 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F11995
M204 S5000
M73 P73 R3
G1 X125.8 Y73.886 E.02423
G2 X125.687 Y73.773 I-.111 J-.001 E.00546
G1 X124.878 Y73.773 E.02484
G1 X124.726 Y73.326 E.01452
G3 X126.514 Y70.807 I1.983 J-.486 E.10764
G3 X126.931 Y74.854 I.188 J2.026 E.19513
G3 X125.855 Y74.696 I-.189 J-2.455 E.03368
; WIPE_START
G1 F12000
M204 S6000
G1 X125.8 Y73.886 E-.3088
G1 X125.769 Y73.803 E-.03346
G1 X125.687 Y73.773 E-.03334
G1 X124.878 Y73.773 E-.30723
G1 X124.813 Y73.581 E-.07717
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.276 Y73.773 Z1.8 F42000
G1 Z1.4
G1 E.8 F1800
G1 F11995
M204 S5000
G3 X125.284 Y70.665 I2.502 J-.906 E.10808
G3 X126.626 Y70.245 I1.46 J2.307 E.04371
G3 X126.166 Y75.362 I.074 J2.586 E.26853
G1 X125.8 Y75.272 E.01159
G1 X125.8 Y108.807 E1.03044
G3 X125.684 Y108.92 I-.114 J-.002 E.00551
G1 X90.29 Y108.92 E1.08755
G3 X90.177 Y108.807 I-.001 J-.111 E.00546
G1 X90.178 Y73.886 E1.07303
G3 X90.293 Y73.773 I.114 J.002 E.00551
G1 X124.216 Y73.773 E1.04237
; WIPE_START
G1 F12000
M204 S6000
G1 X124.182 Y73.419 E-.13492
G1 X124.125 Y73.07 E-.13459
G1 X124.116 Y72.72 E-.13309
G1 X124.155 Y72.372 E-.1331
G1 X124.24 Y72.032 E-.13315
G1 X124.329 Y71.809 E-.09114
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.8 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1.8
G1 X0 Y90 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z1.8 F4000
            G39.3 S1
            G0 Z1.8 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X124.557 Y73.715 F42000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.20188
G1 F11995
M204 S6000
G3 X128.92 Y73.481 I2.141 J-.873 E.11408
G3 X125.815 Y74.98 I-2.249 J-.694 E.05011
; WIPE_START
G1 F15000
G1 X126.218 Y75.091 E-.15878
G1 X126.57 Y75.137 E-.13469
G1 X126.849 Y75.134 E-.10609
G1 X127.333 Y75.052 E-.18681
G1 X127.706 Y74.911 E-.15143
G1 X127.757 Y74.881 E-.02219
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.136 Y74.454 Z1.8 F42000
G1 X111.502 Y73.969 Z1.8
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.11491
G1 F11995
M204 S6000
G1 X111.502 Y76.99 E.01772
; WIPE_START
G1 F15000
G1 X111.502 Y74.99 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.03 Y76.549 Z1.8 F42000
G1 X101.068 Y77.168 Z1.8
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.18966
G1 F11995
M204 S6000
G1 X94.09 Y77.168 E.08344
; WIPE_START
G1 F15000
G1 X96.09 Y77.168 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.706 Y74.043 Z1.8 F42000
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.19094
G1 F11995
M204 S6000
G1 X90.374 Y74.043 E.004
M204 S10000
G1 X90.374 Y108.643 F42000
; LINE_WIDTH: 0.20479
G1 F11995
M204 S6000
G1 X90.706 Y108.643 E.00438
; WIPE_START
G1 F15000
G1 X90.374 Y108.643 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.1 Y105.341 Z1.8 F42000
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.11373
G1 F11995
M204 S6000
G1 X100.965 Y105.341 E.03962
; WIPE_START
G1 F15000
G1 X98.965 Y105.341 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X106.023 Y102.436 Z1.8 F42000
G1 X116.041 Y98.313 Z1.8
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.25595
G1 F11995
M204 S6000
G1 X121.749 Y98.313 E.09907
; CHANGE_LAYER
; Z_HEIGHT: 1.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X119.749 Y98.313 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 8/23
; update layer progress
M73 L8
M991 S0 P7 ;notify layer change

; OBJECT_ID: 66
M204 S10000
G17
G3 Z1.8 I.46 J-1.126 P1  F42000
G1 X94.173 Y87.859 Z1.8
G1 Z1.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11989
M204 S5000
G1 X94.173 Y98.062 E.31354
G1 X97.66 Y98.062 E.10715
G1 X97.66 Y101.955 E.11962
G1 X97.436 Y101.955 E.00687
G1 X97.436 Y98.486 E.10659
G1 X93.806 Y98.486 E.11155
G1 X93.806 Y87.582 E.33506
G1 X97.436 Y87.582 E.11155
G1 X97.436 Y84.014 E.10963
G1 X100.853 Y84.014 E.10498
G1 X100.853 Y84.46 E.0137
G1 X97.66 Y84.46 E.0981
G1 X97.66 Y91.257 E.20886
G1 X97.436 Y91.257 E.00687
G1 X97.436 Y87.859 E.10443
G1 X94.233 Y87.859 E.09843
; WIPE_START
G1 F12000
M204 S6000
G1 X94.221 Y89.859 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X100.562 Y85.61 Z2 F42000
G1 X108.108 Y80.554 Z2
G1 Z1.6
G1 E.8 F1800
G1 F11989
M204 S5000
G1 X114.709 Y80.554 E.20283
G1 X114.709 Y76.965 E.11029
G1 X121.185 Y76.965 E.19899
G1 X121.185 Y77.321 E.01094
G1 X115.065 Y77.321 E.18806
G1 X115.065 Y80.855 E.1086
G1 X107.864 Y80.855 E.22127
G1 X107.864 Y77.322 E.10858
G1 X104.632 Y77.322 E.09929
G1 X104.632 Y77.134 E.00578
G1 X108.108 Y77.134 E.1068
G1 X108.108 Y80.494 E.10327
; WIPE_START
G1 F12000
M204 S6000
G1 X110.108 Y80.513 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.539 Y88.124 Z2 F42000
G1 X108.525 Y101.698 Z2
G1 Z1.6
G1 E.8 F1800
G1 F11989
M204 S5000
G1 X108.525 Y95.719 E.1837
G1 X108.262 Y95.719 E.00809
G1 X108.262 Y98.076 E.07241
G1 X101.18 Y98.076 E.21762
G1 X101.18 Y92.809 E.16185
G1 X105.814 Y92.809 E.1424
G1 X105.814 Y92.604 E.00629
G1 X101.18 Y92.604 E.1424
M73 P74 R3
G1 X101.18 Y87.962 E.14265
G1 X108.113 Y87.962 E.21305
G1 X108.113 Y87.523 E.01347
G1 X104.537 Y87.523 E.10988
G1 X104.537 Y80.473 E.21662
G1 X101.264 Y80.473 E.10056
G1 X101.264 Y76.898 E.10985
G1 X93.894 Y76.898 E.22648
G1 X93.894 Y77.437 E.01656
G1 X100.87 Y77.437 E.21434
G1 X100.87 Y80.859 E.10515
G1 X104.157 Y80.859 E.10102
G1 X104.157 Y87.523 E.20477
G1 X100.824 Y87.523 E.10241
G1 X100.824 Y94.622 E.21812
G1 X97.439 Y94.622 E.10402
G1 X97.439 Y95.043 E.01295
G1 X100.824 Y95.043 E.10402
G1 X100.824 Y98.519 E.10681
G1 X108.262 Y98.519 E.22854
G1 X108.262 Y102.038 E.10813
G1 X118.021 Y102.038 E.29986
G1 X118.021 Y105.345 E.10159
G1 X104.867 Y105.345 E.40417
G1 X104.867 Y101.702 E.11191
G1 X100.786 Y101.702 E.12541
G1 X100.786 Y105.11 E.10469
G1 X94.213 Y105.11 E.20195
G1 X94.213 Y101.923 E.09791
G1 X93.903 Y101.923 E.00952
G1 X93.903 Y105.573 E.11213
G1 X100.786 Y105.573 E.21147
G1 X100.786 Y108.768 E.09819
G1 X90.902 Y108.768 E.30371
G1 X90.902 Y108.366 E.01236
G1 X90.499 Y108.366 E.01236
G1 X90.499 Y84.43 E.73549
G1 X94.135 Y84.43 E.11171
G1 X94.135 Y80.855 E.10983
G1 X97.66 Y80.855 E.10832
G1 X97.66 Y80.491 E.01118
G1 X93.8 Y80.491 E.1186
G1 X93.8 Y84.075 E.1101
G1 X90.499 Y84.075 E.10142
G1 X90.499 Y74.313 E.29995
G1 X90.902 Y74.313 E.01236
G1 X90.902 Y73.911 E.01236
G1 X111.27 Y73.911 E.62585
G1 X111.27 Y77.186 E.10065
G1 X111.734 Y77.186 E.01426
G1 X111.734 Y73.911 E.10065
G1 X125.217 Y73.911 E.4143
G1 X125.217 Y74.313 E.01236
G1 X125.619 Y74.313 E.01236
G1 X125.619 Y91.237 E.52004
G1 X118.42 Y91.237 E.22121
G1 X118.42 Y98.011 E.20813
G1 X115.845 Y98.011 E.07911
G1 X115.845 Y98.616 E.01859
G1 X121.741 Y98.616 E.18116
G1 X121.741 Y105.641 E.21586
G1 X121.945 Y105.641 E.00626
G1 X121.945 Y94.648 E.3378
G1 X121.741 Y94.648 E.00626
G1 X121.741 Y98.011 E.10334
G1 X118.706 Y98.011 E.09327
G1 X118.706 Y91.647 E.19556
G1 X125.619 Y91.647 E.21244
G1 X125.619 Y108.366 E.51373
G1 X125.217 Y108.366 E.01236
G1 X125.217 Y108.768 E.01236
G1 X101.161 Y108.768 E.73916
G1 X101.161 Y101.968 E.20895
G1 X104.637 Y101.968 E.10681
G1 X104.637 Y105.69 E.11438
G1 X118.292 Y105.69 E.41956
G1 X118.292 Y101.736 E.12151
G1 X112.158 Y101.736 E.18847
G1 X112.158 Y94.918 E.20948
G1 X115.245 Y94.918 E.09485
G1 X115.245 Y87.933 E.21465
G1 X122.151 Y87.933 E.21218
G1 X122.151 Y80.585 E.22577
G1 X118.222 Y80.58 E.12073
G1 X118.222 Y84.159 E.11
G1 X107.993 Y84.159 E.31429
G1 X107.993 Y84.55 E.01202
G1 X111.829 Y84.55 E.11786
G1 X111.829 Y89.52 E.15269
G1 X112.158 Y89.52 E.01012
G1 X112.158 Y84.55 E.15269
G1 X118.576 Y84.55 E.19721
G1 X118.576 Y80.844 E.11389
G1 X121.742 Y80.844 E.09728
G1 X121.742 Y87.659 E.2094
G1 X114.824 Y87.659 E.21258
G1 X114.824 Y94.612 E.21367
G1 X111.829 Y94.612 E.09204
G1 X111.829 Y101.698 E.21772
G1 X108.585 Y101.698 E.09967
; WIPE_START
G1 F12000
M204 S6000
G1 X108.565 Y99.698 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X112.894 Y93.412 Z2 F42000
G1 X125.8 Y74.674 Z2
G1 Z1.6
G1 E.8 F1800
G1 F11989
M204 S5000
G1 X125.8 Y73.886 E.02423
G2 X125.687 Y73.773 I-.111 J-.001 E.00546
G1 X124.878 Y73.773 E.02484
G1 X124.726 Y73.326 E.01452
G3 X126.481 Y70.809 I1.985 J-.486 E.10664
G3 X126.931 Y74.854 I.221 J2.023 E.1962
G3 X125.855 Y74.696 I-.189 J-2.455 E.03368
; WIPE_START
G1 F12000
M204 S6000
G1 X125.8 Y73.886 E-.3088
G1 X125.769 Y73.803 E-.03348
G1 X125.687 Y73.773 E-.03332
G1 X124.878 Y73.773 E-.30723
G1 X124.813 Y73.581 E-.07717
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.348 Y73.773 Z2 F42000
G1 Z1.6
G1 E.8 F1800
G1 F11989
M204 S5000
G3 X124.21 Y72.724 I4.517 J-1.126 E.03258
G3 X126.664 Y70.34 I2.488 J.106 E.11587
G3 X126.179 Y75.269 I.036 J2.492 E.25781
G1 X125.8 Y75.198 E.01186
G1 X125.8 Y108.807 E1.03271
G3 X125.687 Y108.92 I-.111 J.001 E.00546
G1 X90.29 Y108.92 E1.08764
G3 X90.177 Y108.807 I-.001 J-.111 E.00546
G1 X90.178 Y73.885 E1.07304
G3 X90.29 Y73.773 I.111 J-.001 E.00545
G1 X124.288 Y73.773 E1.04466
; WIPE_START
G1 F12000
M204 S6000
G1 X124.219 Y73.061 E-.27175
G1 X124.21 Y72.724 E-.12823
G1 X124.248 Y72.388 E-.12827
G1 X124.33 Y72.061 E-.12827
M73 P75 R3
G1 X124.431 Y71.808 E-.10348
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2
G1 X0 Y90 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z2 F4000
            G39.3 S1
            G0 Z2 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X124.593 Y73.715 F42000
G1 Z1.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.10872
G1 F11989
M204 S6000
G1 X124.504 Y73.384 E.00184
G3 X126.216 Y75.043 I2.196 J-.554 E.06284
G1 X125.815 Y74.944 E.00221
; WIPE_START
G1 F15000
G1 X126.216 Y75.043 E-.15678
G1 X126.576 Y75.091 E-.13809
G1 X126.954 Y75.079 E-.14359
G1 X127.329 Y75.004 E-.14532
G1 X127.682 Y74.87 E-.14363
G1 X127.756 Y74.827 E-.03258
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.135 Y74.425 Z2 F42000
G1 X111.502 Y73.969 Z2
G1 Z1.6
G1 E.8 F1800
; LINE_WIDTH: 0.11491
G1 F11989
M204 S6000
G1 X111.502 Y76.99 E.01772
; WIPE_START
G1 F15000
G1 X111.502 Y74.99 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.03 Y76.549 Z2 F42000
G1 X101.068 Y77.168 Z2
G1 Z1.6
G1 E.8 F1800
; LINE_WIDTH: 0.18966
G1 F11989
M204 S6000
G1 X94.09 Y77.168 E.08344
; WIPE_START
G1 F15000
G1 X96.09 Y77.168 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.706 Y74.043 Z2 F42000
G1 Z1.6
G1 E.8 F1800
; LINE_WIDTH: 0.19094
G1 F11989
M204 S6000
G1 X90.374 Y74.043 E.004
M204 S10000
G1 X90.374 Y108.643 F42000
; LINE_WIDTH: 0.20479
G1 F11989
M204 S6000
G1 X90.706 Y108.643 E.00438
; WIPE_START
M73 P75 R2
G1 F15000
G1 X90.374 Y108.643 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.1 Y105.341 Z2 F42000
G1 Z1.6
G1 E.8 F1800
; LINE_WIDTH: 0.11373
G1 F11989
M204 S6000
G1 X100.965 Y105.341 E.03962
; WIPE_START
G1 F15000
G1 X98.965 Y105.341 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X106.023 Y102.436 Z2 F42000
G1 X116.041 Y98.313 Z2
G1 Z1.6
G1 E.8 F1800
; LINE_WIDTH: 0.25595
G1 F11989
M204 S6000
G1 X121.749 Y98.313 E.09907
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X119.749 Y98.313 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 9/23
; update layer progress
M73 L9
M991 S0 P8 ;notify layer change

; OBJECT_ID: 66
M204 S10000
G17
G3 Z2 I.46 J-1.126 P1  F42000
G1 X94.173 Y87.859 Z2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11596
M204 S5000
G1 X94.173 Y98.062 E.31354
G1 X97.66 Y98.062 E.10715
G1 X97.66 Y101.955 E.11962
G1 X97.436 Y101.955 E.00687
G1 X97.436 Y98.486 E.10659
G1 X93.806 Y98.486 E.11155
G1 X93.806 Y87.582 E.33506
G1 X97.436 Y87.582 E.11155
G1 X97.436 Y84.014 E.10963
G1 X100.853 Y84.014 E.10498
G1 X100.853 Y84.46 E.0137
G1 X97.66 Y84.46 E.0981
G1 X97.66 Y91.257 E.20886
G1 X97.436 Y91.257 E.00687
G1 X97.436 Y87.859 E.10443
G1 X94.233 Y87.859 E.09843
; WIPE_START
G1 F12000
M204 S6000
G1 X94.221 Y89.859 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X100.562 Y85.61 Z2.2 F42000
G1 X108.108 Y80.554 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F11596
M204 S5000
G1 X114.709 Y80.554 E.20283
G1 X114.709 Y76.965 E.11029
G1 X121.185 Y76.965 E.19899
G1 X121.185 Y77.321 E.01094
G1 X115.065 Y77.321 E.18806
G1 X115.065 Y80.855 E.1086
G1 X107.864 Y80.855 E.22127
G1 X107.864 Y77.322 E.10858
G1 X104.632 Y77.322 E.09929
G1 X104.632 Y77.134 E.00578
G1 X108.108 Y77.134 E.1068
G1 X108.108 Y80.494 E.10327
; WIPE_START
G1 F12000
M204 S6000
G1 X110.108 Y80.513 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.539 Y88.124 Z2.2 F42000
G1 X108.525 Y101.698 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F11596
M204 S5000
G1 X108.525 Y95.719 E.1837
G1 X108.262 Y95.719 E.00809
G1 X108.262 Y98.076 E.07241
G1 X101.18 Y98.076 E.21762
G1 X101.18 Y92.809 E.16185
G1 X105.814 Y92.809 E.1424
G1 X105.814 Y92.604 E.00629
G1 X101.18 Y92.604 E.1424
G1 X101.18 Y87.962 E.14265
G1 X108.113 Y87.962 E.21305
G1 X108.113 Y87.523 E.01347
G1 X104.537 Y87.523 E.10988
G1 X104.537 Y80.473 E.21662
G1 X101.264 Y80.473 E.10056
G1 X101.264 Y76.898 E.10985
G1 X93.894 Y76.898 E.22648
G1 X93.894 Y77.437 E.01656
G1 X100.87 Y77.437 E.21434
G1 X100.87 Y80.859 E.10515
G1 X104.157 Y80.859 E.10102
G1 X104.157 Y87.523 E.20477
G1 X100.824 Y87.523 E.10241
G1 X100.824 Y94.622 E.21812
G1 X97.439 Y94.622 E.10402
G1 X97.439 Y95.043 E.01295
G1 X100.824 Y95.043 E.10402
G1 X100.824 Y98.519 E.10681
G1 X108.262 Y98.519 E.22854
G1 X108.262 Y102.038 E.10813
G1 X118.021 Y102.038 E.29986
G1 X118.021 Y105.345 E.10159
G1 X104.867 Y105.345 E.40417
G1 X104.867 Y101.702 E.11191
G1 X100.786 Y101.702 E.12541
G1 X100.786 Y105.11 E.10469
G1 X94.213 Y105.11 E.20195
G1 X94.213 Y101.923 E.09791
G1 X93.903 Y101.923 E.00952
G1 X93.903 Y105.573 E.11213
G1 X100.786 Y105.573 E.21147
G1 X100.786 Y108.768 E.09819
G1 X90.902 Y108.768 E.30371
G1 X90.902 Y108.366 E.01236
G1 X90.499 Y108.366 E.01236
G1 X90.499 Y84.43 E.73549
G1 X94.135 Y84.43 E.11171
G1 X94.135 Y80.855 E.10983
G1 X97.66 Y80.855 E.10832
G1 X97.66 Y80.491 E.01118
G1 X93.8 Y80.491 E.1186
G1 X93.8 Y84.075 E.1101
G1 X90.499 Y84.075 E.10142
G1 X90.499 Y74.313 E.29995
G1 X90.902 Y74.313 E.01236
G1 X90.902 Y73.911 E.01236
G1 X111.27 Y73.911 E.62585
G1 X111.27 Y77.186 E.10065
M73 P76 R2
G1 X111.734 Y77.186 E.01426
G1 X111.734 Y73.911 E.10065
G1 X125.217 Y73.911 E.4143
G1 X125.217 Y74.313 E.01236
G1 X125.619 Y74.313 E.01236
G1 X125.619 Y91.237 E.52004
G1 X118.42 Y91.237 E.22121
G1 X118.42 Y98.011 E.20813
G1 X115.845 Y98.011 E.07911
G1 X115.845 Y98.616 E.01859
G1 X121.741 Y98.616 E.18116
G1 X121.741 Y105.641 E.21586
G1 X121.945 Y105.641 E.00626
G1 X121.945 Y94.648 E.3378
G1 X121.741 Y94.648 E.00626
G1 X121.741 Y98.011 E.10334
G1 X118.706 Y98.011 E.09327
G1 X118.706 Y91.647 E.19556
G1 X125.619 Y91.647 E.21244
G1 X125.619 Y108.366 E.51373
G1 X125.217 Y108.366 E.01236
G1 X125.217 Y108.768 E.01236
G1 X101.161 Y108.768 E.73916
G1 X101.161 Y101.968 E.20895
G1 X104.637 Y101.968 E.10681
G1 X104.637 Y105.69 E.11438
G1 X118.292 Y105.69 E.41956
G1 X118.292 Y101.736 E.12151
G1 X112.158 Y101.736 E.18847
G1 X112.158 Y94.918 E.20948
G1 X115.245 Y94.918 E.09485
G1 X115.245 Y87.933 E.21465
G1 X122.151 Y87.933 E.21218
G1 X122.151 Y80.585 E.22577
G1 X118.222 Y80.58 E.12073
G1 X118.222 Y84.159 E.11
G1 X107.993 Y84.159 E.31429
G1 X107.993 Y84.55 E.01202
G1 X111.829 Y84.55 E.11786
G1 X111.829 Y89.52 E.15269
G1 X112.158 Y89.52 E.01012
G1 X112.158 Y84.55 E.15269
G1 X118.576 Y84.55 E.19721
G1 X118.576 Y80.844 E.11389
G1 X121.742 Y80.844 E.09728
G1 X121.742 Y87.659 E.2094
G1 X114.824 Y87.659 E.21258
G1 X114.824 Y94.612 E.21367
G1 X111.829 Y94.612 E.09204
G1 X111.829 Y101.698 E.21772
G1 X108.585 Y101.698 E.09967
; WIPE_START
G1 F12000
M204 S6000
G1 X108.565 Y99.698 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X112.894 Y93.412 Z2.2 F42000
G1 X125.8 Y74.674 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F11596
M204 S5000
G1 X125.8 Y73.886 E.02423
G2 X125.687 Y73.773 I-.111 J-.001 E.00546
G1 X124.878 Y73.773 E.02484
G1 X124.726 Y73.326 E.01452
G3 X126.406 Y70.814 I1.994 J-.484 E.10435
G1 X126.448 Y70.811 E.00132
G3 X126.931 Y74.854 I.25 J2.02 E.19709
G3 X125.855 Y74.696 I-.189 J-2.454 E.03368
; WIPE_START
G1 F12000
M204 S6000
G1 X125.8 Y73.886 E-.30881
G1 X125.769 Y73.803 E-.03345
G1 X125.687 Y73.773 E-.03335
G1 X124.878 Y73.773 E-.30722
G1 X124.813 Y73.581 E-.07717
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.559 Y73.773 Z2.2 F42000
G1 Z1.8
G1 E.8 F1800
G1 F11596
M204 S5000
G3 X124.402 Y72.732 I3.584 J-1.071 E.03245
G3 X126.795 Y70.536 I2.294 J.097 E.11085
G3 X126.221 Y75.081 I-.096 J2.297 E.23374
G1 X125.8 Y74.992 E.01325
G1 X125.8 Y108.807 E1.03904
G3 X125.687 Y108.92 I-.111 J.001 E.00546
G1 X90.29 Y108.92 E1.08764
G3 X90.177 Y108.807 I-.001 J-.111 E.00546
G1 X90.178 Y73.886 E1.07303
G3 X90.29 Y73.773 I.111 J-.001 E.00546
G1 X124.499 Y73.773 E1.05114
; WIPE_START
G1 F12000
M204 S6000
G1 X124.461 Y73.358 E-.15846
G1 X124.41 Y73.043 E-.12098
G1 X124.402 Y72.732 E-.11837
G1 X124.437 Y72.422 E-.11835
G1 X124.513 Y72.12 E-.1184
G1 X124.628 Y71.831 E-.11839
G1 X124.638 Y71.815 E-.00705
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.2 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2.2
G1 X0 Y90 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z2.2 F4000
            G39.3 S1
            G0 Z2.2 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X111.502 Y73.969 F42000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.11491
G1 F11596
M204 S6000
G1 X111.502 Y76.99 E.01772
; WIPE_START
G1 F15000
G1 X111.502 Y74.99 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.03 Y76.549 Z2.2 F42000
G1 X101.068 Y77.168 Z2.2
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.18966
G1 F11596
M204 S6000
G1 X94.09 Y77.168 E.08344
; WIPE_START
G1 F15000
G1 X96.09 Y77.168 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.706 Y74.043 Z2.2 F42000
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.19094
G1 F11596
M204 S6000
G1 X90.374 Y74.043 E.004
M204 S10000
G1 X90.374 Y108.643 F42000
; LINE_WIDTH: 0.20479
G1 F11596
M204 S6000
G1 X90.706 Y108.643 E.00438
; WIPE_START
G1 F15000
G1 X90.374 Y108.643 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.1 Y105.341 Z2.2 F42000
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.11373
G1 F11596
M204 S6000
G1 X100.965 Y105.341 E.03962
; WIPE_START
G1 F15000
G1 X98.965 Y105.341 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X106.023 Y102.436 Z2.2 F42000
G1 X116.041 Y98.313 Z2.2
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.25595
G1 F11596
M204 S6000
G1 X121.749 Y98.313 E.09907
; CHANGE_LAYER
; Z_HEIGHT: 2
; LAYER_HEIGHT: 0.2
; WIPE_START
M73 P77 R2
G1 F15000
G1 X119.749 Y98.313 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 10/23
; update layer progress
M73 L10
M991 S0 P9 ;notify layer change

; OBJECT_ID: 66
M204 S10000
G17
G3 Z2.2 I.46 J-1.126 P1  F42000
G1 X94.173 Y87.859 Z2.2
G1 Z2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11179
M204 S5000
G1 X94.173 Y98.062 E.31354
G1 X97.66 Y98.062 E.10715
G1 X97.66 Y101.955 E.11962
G1 X97.436 Y101.955 E.00687
G1 X97.436 Y98.486 E.10659
G1 X93.806 Y98.486 E.11155
G1 X93.806 Y87.582 E.33506
G1 X97.436 Y87.582 E.11155
G1 X97.436 Y84.014 E.10963
G1 X100.853 Y84.014 E.10498
G1 X100.853 Y84.46 E.0137
G1 X97.66 Y84.46 E.0981
G1 X97.66 Y91.257 E.20886
G1 X97.436 Y91.257 E.00687
G1 X97.436 Y87.859 E.10443
G1 X94.233 Y87.859 E.09843
; WIPE_START
G1 F12000
M204 S6000
G1 X94.221 Y89.859 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X100.562 Y85.61 Z2.4 F42000
G1 X108.108 Y80.554 Z2.4
G1 Z2
G1 E.8 F1800
G1 F11179
M204 S5000
G1 X114.709 Y80.554 E.20283
G1 X114.709 Y76.965 E.11029
G1 X121.185 Y76.965 E.19899
G1 X121.185 Y77.321 E.01094
G1 X115.065 Y77.321 E.18806
G1 X115.065 Y80.855 E.1086
G1 X107.864 Y80.855 E.22127
G1 X107.864 Y77.322 E.10858
G1 X104.632 Y77.322 E.09929
G1 X104.632 Y77.134 E.00578
G1 X108.108 Y77.134 E.1068
G1 X108.108 Y80.494 E.10327
; WIPE_START
G1 F12000
M204 S6000
G1 X110.108 Y80.513 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.539 Y88.124 Z2.4 F42000
G1 X108.525 Y101.698 Z2.4
G1 Z2
G1 E.8 F1800
G1 F11179
M204 S5000
G1 X108.525 Y95.719 E.1837
G1 X108.262 Y95.719 E.00809
G1 X108.262 Y98.076 E.07241
G1 X101.18 Y98.076 E.21762
G1 X101.18 Y92.809 E.16185
G1 X105.814 Y92.809 E.1424
G1 X105.814 Y92.604 E.00629
G1 X101.18 Y92.604 E.1424
G1 X101.18 Y87.962 E.14265
G1 X108.113 Y87.962 E.21305
G1 X108.113 Y87.523 E.01347
G1 X104.537 Y87.523 E.10988
G1 X104.537 Y80.473 E.21662
G1 X101.264 Y80.473 E.10056
G1 X101.264 Y76.898 E.10985
G1 X93.894 Y76.898 E.22648
G1 X93.894 Y77.437 E.01656
G1 X100.87 Y77.437 E.21434
G1 X100.87 Y80.859 E.10515
G1 X104.157 Y80.859 E.10102
G1 X104.157 Y87.523 E.20477
G1 X100.824 Y87.523 E.10241
G1 X100.824 Y94.622 E.21812
G1 X97.439 Y94.622 E.10402
G1 X97.439 Y95.043 E.01295
G1 X100.824 Y95.043 E.10402
G1 X100.824 Y98.519 E.10681
G1 X108.262 Y98.519 E.22854
G1 X108.262 Y102.038 E.10813
G1 X118.021 Y102.038 E.29986
G1 X118.021 Y105.345 E.10159
G1 X104.867 Y105.345 E.40417
G1 X104.867 Y101.702 E.11191
G1 X100.786 Y101.702 E.12541
G1 X100.786 Y105.11 E.10469
G1 X94.213 Y105.11 E.20195
G1 X94.213 Y101.923 E.09791
G1 X93.903 Y101.923 E.00952
G1 X93.903 Y105.573 E.11213
G1 X100.786 Y105.573 E.21147
G1 X100.786 Y108.768 E.09819
G1 X90.902 Y108.768 E.30371
G1 X90.902 Y108.366 E.01236
G1 X90.499 Y108.366 E.01236
G1 X90.499 Y84.43 E.73549
G1 X94.135 Y84.43 E.11171
G1 X94.135 Y80.855 E.10983
G1 X97.66 Y80.855 E.10832
G1 X97.66 Y80.491 E.01118
G1 X93.8 Y80.491 E.1186
G1 X93.8 Y84.075 E.1101
G1 X90.499 Y84.075 E.10142
G1 X90.499 Y74.313 E.29995
G1 X90.902 Y74.313 E.01236
G1 X90.902 Y73.911 E.01236
G1 X111.27 Y73.911 E.62585
G1 X111.27 Y77.186 E.10065
G1 X111.734 Y77.186 E.01426
G1 X111.734 Y73.911 E.10065
G1 X125.217 Y73.911 E.4143
G1 X125.217 Y74.313 E.01236
G1 X125.619 Y74.313 E.01236
G1 X125.619 Y91.237 E.52004
G1 X118.42 Y91.237 E.22121
G1 X118.42 Y98.011 E.20813
G1 X115.845 Y98.011 E.07911
G1 X115.845 Y98.616 E.01859
G1 X121.741 Y98.616 E.18116
G1 X121.741 Y105.641 E.21586
G1 X121.945 Y105.641 E.00626
G1 X121.945 Y94.648 E.3378
G1 X121.741 Y94.648 E.00626
G1 X121.741 Y98.011 E.10334
G1 X118.706 Y98.011 E.09327
G1 X118.706 Y91.647 E.19556
G1 X125.619 Y91.647 E.21244
G1 X125.619 Y108.366 E.51373
G1 X125.217 Y108.366 E.01236
G1 X125.217 Y108.768 E.01236
G1 X101.161 Y108.768 E.73916
G1 X101.161 Y101.968 E.20895
G1 X104.637 Y101.968 E.10681
G1 X104.637 Y105.69 E.11438
G1 X118.292 Y105.69 E.41956
G1 X118.292 Y101.736 E.12151
G1 X112.158 Y101.736 E.18847
G1 X112.158 Y94.918 E.20948
G1 X115.245 Y94.918 E.09485
G1 X115.245 Y87.933 E.21465
G1 X122.151 Y87.933 E.21218
G1 X122.151 Y80.585 E.22577
G1 X118.222 Y80.58 E.12073
G1 X118.222 Y84.159 E.11
G1 X107.993 Y84.159 E.31429
G1 X107.993 Y84.55 E.01202
G1 X111.829 Y84.55 E.11786
G1 X111.829 Y89.52 E.15269
G1 X112.158 Y89.52 E.01012
G1 X112.158 Y84.55 E.15269
G1 X118.576 Y84.55 E.19721
G1 X118.576 Y80.844 E.11389
G1 X121.742 Y80.844 E.09728
M73 P78 R2
G1 X121.742 Y87.659 E.2094
G1 X114.824 Y87.659 E.21258
G1 X114.824 Y94.612 E.21367
G1 X111.829 Y94.612 E.09204
G1 X111.829 Y101.698 E.21772
G1 X108.585 Y101.698 E.09967
; WIPE_START
G1 F12000
M204 S6000
G1 X108.565 Y99.698 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X112.778 Y93.334 Z2.4 F42000
G1 X125.725 Y73.778 Z2.4
G1 Z2
G1 E.8 F1800
G1 F11179
M204 S5000
G1 X125.726 Y73.778 E.00003
G3 X125.8 Y73.886 I-.032 J.101 E.00433
G1 X125.8 Y108.807 E1.07303
G3 X125.687 Y108.92 I-.111 J.001 E.00546
G1 X90.29 Y108.92 E1.08764
G3 X90.177 Y108.807 I-.001 J-.111 E.00546
G1 X90.178 Y73.885 E1.07304
G3 X90.29 Y73.773 I.111 J-.001 E.00545
G1 X125.665 Y73.778 E1.08696
; WIPE_START
G1 F12000
M204 S6000
G1 X125.726 Y73.778 E-.02323
G1 X125.785 Y73.823 E-.02822
G1 X125.8 Y73.886 E-.02441
G1 X125.8 Y75.686 E-.68414
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.4 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2.4
G1 X0 Y90 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z2.4 F4000
            G39.3 S1
            G0 Z2.4 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X111.502 Y76.99 F42000
G1 Z2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.11491
G1 F11179
M204 S6000
G1 X111.502 Y73.969 E.01772
; WIPE_START
G1 F15000
G1 X111.502 Y75.969 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.919 Y76.84 Z2.4 F42000
G1 X101.068 Y77.168 Z2.4
G1 Z2
G1 E.8 F1800
; LINE_WIDTH: 0.18966
G1 F11179
M204 S6000
G1 X94.09 Y77.168 E.08344
; WIPE_START
G1 F15000
G1 X96.09 Y77.168 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.706 Y74.043 Z2.4 F42000
G1 Z2
G1 E.8 F1800
; LINE_WIDTH: 0.19094
G1 F11179
M204 S6000
G1 X90.374 Y74.043 E.004
M204 S10000
G1 X90.374 Y108.643 F42000
; LINE_WIDTH: 0.20479
G1 F11179
M204 S6000
G1 X90.706 Y108.643 E.00438
; WIPE_START
G1 F15000
G1 X90.374 Y108.643 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.1 Y105.341 Z2.4 F42000
G1 Z2
G1 E.8 F1800
; LINE_WIDTH: 0.11373
G1 F11179
M204 S6000
G1 X100.965 Y105.341 E.03962
; WIPE_START
G1 F15000
G1 X98.965 Y105.341 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X106.023 Y102.436 Z2.4 F42000
G1 X116.041 Y98.313 Z2.4
G1 Z2
G1 E.8 F1800
; LINE_WIDTH: 0.25595
G1 F11179
M204 S6000
G1 X121.749 Y98.313 E.09907
; CHANGE_LAYER
; Z_HEIGHT: 2.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X119.749 Y98.313 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 11/23
; update layer progress
M73 L11
M991 S0 P10 ;notify layer change

; OBJECT_ID: 66
M204 S10000
G17
G3 Z2.4 I.46 J-1.126 P1  F42000
G1 X94.173 Y87.859 Z2.4
G1 Z2.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11179
M204 S5000
G1 X94.173 Y98.062 E.31354
G1 X97.66 Y98.062 E.10715
G1 X97.66 Y101.955 E.11962
G1 X97.436 Y101.955 E.00687
G1 X97.436 Y98.486 E.10659
G1 X93.806 Y98.486 E.11155
G1 X93.806 Y87.582 E.33506
G1 X97.436 Y87.582 E.11155
G1 X97.436 Y84.014 E.10963
G1 X100.853 Y84.014 E.10498
G1 X100.853 Y84.46 E.0137
G1 X97.66 Y84.46 E.0981
G1 X97.66 Y91.257 E.20886
G1 X97.436 Y91.257 E.00687
G1 X97.436 Y87.859 E.10443
G1 X94.233 Y87.859 E.09843
; WIPE_START
G1 F12000
M204 S6000
G1 X94.221 Y89.859 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X100.562 Y85.61 Z2.6 F42000
G1 X108.108 Y80.554 Z2.6
G1 Z2.2
G1 E.8 F1800
G1 F11179
M204 S5000
G1 X114.709 Y80.554 E.20283
G1 X114.709 Y76.965 E.11029
G1 X121.185 Y76.965 E.19899
G1 X121.185 Y77.321 E.01094
G1 X115.065 Y77.321 E.18806
G1 X115.065 Y80.855 E.1086
G1 X107.864 Y80.855 E.22127
G1 X107.864 Y77.322 E.10858
G1 X104.632 Y77.322 E.09929
G1 X104.632 Y77.134 E.00578
G1 X108.108 Y77.134 E.1068
G1 X108.108 Y80.494 E.10327
; WIPE_START
G1 F12000
M204 S6000
G1 X110.108 Y80.513 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.539 Y88.124 Z2.6 F42000
G1 X108.525 Y101.698 Z2.6
G1 Z2.2
G1 E.8 F1800
G1 F11179
M204 S5000
G1 X108.525 Y95.719 E.1837
G1 X108.262 Y95.719 E.00809
G1 X108.262 Y98.076 E.07241
G1 X101.18 Y98.076 E.21762
G1 X101.18 Y92.809 E.16185
M73 P79 R2
G1 X105.814 Y92.809 E.1424
G1 X105.814 Y92.604 E.00629
G1 X101.18 Y92.604 E.1424
G1 X101.18 Y87.962 E.14265
G1 X108.113 Y87.962 E.21305
G1 X108.113 Y87.523 E.01347
G1 X104.537 Y87.523 E.10988
G1 X104.537 Y80.473 E.21662
G1 X101.264 Y80.473 E.10056
G1 X101.264 Y76.898 E.10985
G1 X93.894 Y76.898 E.22648
G1 X93.894 Y77.437 E.01656
G1 X100.87 Y77.437 E.21434
G1 X100.87 Y80.859 E.10515
G1 X104.157 Y80.859 E.10102
G1 X104.157 Y87.523 E.20477
G1 X100.824 Y87.523 E.10241
G1 X100.824 Y94.622 E.21812
G1 X97.439 Y94.622 E.10402
G1 X97.439 Y95.043 E.01295
G1 X100.824 Y95.043 E.10402
G1 X100.824 Y98.519 E.10681
G1 X108.262 Y98.519 E.22854
G1 X108.262 Y102.038 E.10813
G1 X118.021 Y102.038 E.29986
G1 X118.021 Y105.345 E.10159
G1 X104.867 Y105.345 E.40417
G1 X104.867 Y101.702 E.11191
G1 X100.786 Y101.702 E.12541
G1 X100.786 Y105.11 E.10469
G1 X94.213 Y105.11 E.20195
G1 X94.213 Y101.923 E.09791
G1 X93.903 Y101.923 E.00952
G1 X93.903 Y105.573 E.11213
G1 X100.786 Y105.573 E.21147
G1 X100.786 Y108.768 E.09819
G1 X90.902 Y108.768 E.30371
G1 X90.902 Y108.366 E.01236
G1 X90.499 Y108.366 E.01236
G1 X90.499 Y84.43 E.73549
G1 X94.135 Y84.43 E.11171
G1 X94.135 Y80.855 E.10983
G1 X97.66 Y80.855 E.10832
G1 X97.66 Y80.491 E.01118
G1 X93.8 Y80.491 E.1186
G1 X93.8 Y84.075 E.1101
G1 X90.499 Y84.075 E.10142
G1 X90.499 Y74.313 E.29995
G1 X90.902 Y74.313 E.01236
G1 X90.902 Y73.911 E.01236
G1 X111.27 Y73.911 E.62585
G1 X111.27 Y77.186 E.10065
G1 X111.734 Y77.186 E.01426
G1 X111.734 Y73.911 E.10065
G1 X125.217 Y73.911 E.4143
G1 X125.217 Y74.313 E.01236
G1 X125.619 Y74.313 E.01236
G1 X125.619 Y91.237 E.52004
G1 X118.42 Y91.237 E.22121
G1 X118.42 Y98.011 E.20813
G1 X115.845 Y98.011 E.07911
G1 X115.845 Y98.616 E.01859
G1 X121.741 Y98.616 E.18116
G1 X121.741 Y105.641 E.21586
G1 X121.945 Y105.641 E.00626
G1 X121.945 Y94.648 E.3378
G1 X121.741 Y94.648 E.00626
G1 X121.741 Y98.011 E.10334
G1 X118.706 Y98.011 E.09327
G1 X118.706 Y91.647 E.19556
G1 X125.619 Y91.647 E.21244
G1 X125.619 Y108.366 E.51373
G1 X125.217 Y108.366 E.01236
G1 X125.217 Y108.768 E.01236
G1 X101.161 Y108.768 E.73916
G1 X101.161 Y101.968 E.20895
G1 X104.637 Y101.968 E.10681
G1 X104.637 Y105.69 E.11438
G1 X118.292 Y105.69 E.41956
G1 X118.292 Y101.736 E.12151
G1 X112.158 Y101.736 E.18847
G1 X112.158 Y94.918 E.20948
G1 X115.245 Y94.918 E.09485
G1 X115.245 Y87.933 E.21465
G1 X122.151 Y87.933 E.21218
G1 X122.151 Y80.585 E.22577
G1 X118.222 Y80.58 E.12073
G1 X118.222 Y84.159 E.11
G1 X107.993 Y84.159 E.31429
G1 X107.993 Y84.55 E.01202
G1 X111.829 Y84.55 E.11786
G1 X111.829 Y89.52 E.15269
G1 X112.158 Y89.52 E.01012
G1 X112.158 Y84.55 E.15269
G1 X118.576 Y84.55 E.19721
G1 X118.576 Y80.844 E.11389
G1 X121.742 Y80.844 E.09728
G1 X121.742 Y87.659 E.2094
G1 X114.824 Y87.659 E.21258
G1 X114.824 Y94.612 E.21367
G1 X111.829 Y94.612 E.09204
G1 X111.829 Y101.698 E.21772
G1 X108.585 Y101.698 E.09967
; WIPE_START
G1 F12000
M204 S6000
G1 X108.565 Y99.698 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X112.778 Y93.334 Z2.6 F42000
G1 X125.726 Y73.778 Z2.6
G1 Z2.2
G1 E.8 F1800
G1 F11179
M204 S5000
G3 X125.8 Y73.886 I-.032 J.101 E.00433
G1 X125.8 Y108.807 E1.07303
G3 X125.687 Y108.92 I-.111 J.001 E.00546
G1 X90.29 Y108.92 E1.08764
G3 X90.177 Y108.807 I-.001 J-.111 E.00546
G1 X90.178 Y73.886 E1.07303
G3 X90.29 Y73.773 I.111 J-.001 E.00546
G1 X125.666 Y73.778 E1.08699
; WIPE_START
G1 F12000
M204 S6000
G1 X125.785 Y73.823 E-.04835
G1 X125.8 Y73.886 E-.02442
G1 X125.8 Y75.694 E-.68723
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.6 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2.6
G1 X0 Y90 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z2.6 F4000
            G39.3 S1
            G0 Z2.6 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X111.502 Y76.99 F42000
G1 Z2.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.11491
G1 F11179
M204 S6000
G1 X111.502 Y73.969 E.01772
; WIPE_START
G1 F15000
G1 X111.502 Y75.969 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.919 Y76.84 Z2.6 F42000
G1 X101.068 Y77.168 Z2.6
G1 Z2.2
G1 E.8 F1800
; LINE_WIDTH: 0.18966
G1 F11179
M204 S6000
G1 X94.09 Y77.168 E.08344
; WIPE_START
M73 P80 R2
G1 F15000
G1 X96.09 Y77.168 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.706 Y74.043 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
; LINE_WIDTH: 0.19094
G1 F11179
M204 S6000
G1 X90.374 Y74.043 E.004
M204 S10000
G1 X90.374 Y108.643 F42000
; LINE_WIDTH: 0.20479
G1 F11179
M204 S6000
G1 X90.706 Y108.643 E.00438
; WIPE_START
G1 F15000
G1 X90.374 Y108.643 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.1 Y105.341 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
; LINE_WIDTH: 0.11373
G1 F11179
M204 S6000
G1 X100.965 Y105.341 E.03962
; WIPE_START
G1 F15000
G1 X98.965 Y105.341 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X106.023 Y102.436 Z2.6 F42000
G1 X116.041 Y98.313 Z2.6
G1 Z2.2
G1 E.8 F1800
; LINE_WIDTH: 0.25595
G1 F11179
M204 S6000
G1 X121.749 Y98.313 E.09907
; CHANGE_LAYER
; Z_HEIGHT: 2.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X119.749 Y98.313 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 12/23
; update layer progress
M73 L12
M991 S0 P11 ;notify layer change

; OBJECT_ID: 66
M204 S10000
G17
G3 Z2.6 I.46 J-1.126 P1  F42000
G1 X94.173 Y87.859 Z2.6
G1 Z2.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11179
M204 S5000
G1 X94.173 Y98.062 E.31354
G1 X97.66 Y98.062 E.10715
G1 X97.66 Y101.955 E.11962
G1 X97.436 Y101.955 E.00687
G1 X97.436 Y98.486 E.10659
G1 X93.806 Y98.486 E.11155
G1 X93.806 Y87.582 E.33506
G1 X97.436 Y87.582 E.11155
G1 X97.436 Y84.014 E.10963
G1 X100.853 Y84.014 E.10498
G1 X100.853 Y84.46 E.0137
G1 X97.66 Y84.46 E.0981
G1 X97.66 Y91.257 E.20886
G1 X97.436 Y91.257 E.00687
G1 X97.436 Y87.859 E.10443
G1 X94.233 Y87.859 E.09843
; WIPE_START
G1 F12000
M204 S6000
G1 X94.221 Y89.859 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X100.562 Y85.61 Z2.8 F42000
G1 X108.108 Y80.554 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F11179
M204 S5000
G1 X114.709 Y80.554 E.20283
G1 X114.709 Y76.965 E.11029
G1 X121.185 Y76.965 E.19899
G1 X121.185 Y77.321 E.01094
G1 X115.065 Y77.321 E.18806
G1 X115.065 Y80.855 E.1086
G1 X107.864 Y80.855 E.22127
G1 X107.864 Y77.322 E.10858
G1 X104.632 Y77.322 E.09929
G1 X104.632 Y77.134 E.00578
G1 X108.108 Y77.134 E.1068
G1 X108.108 Y80.494 E.10327
; WIPE_START
G1 F12000
M204 S6000
G1 X110.108 Y80.513 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.539 Y88.124 Z2.8 F42000
G1 X108.525 Y101.698 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F11179
M204 S5000
G1 X108.525 Y95.719 E.1837
G1 X108.262 Y95.719 E.00809
G1 X108.262 Y98.076 E.07241
G1 X101.18 Y98.076 E.21762
G1 X101.18 Y92.809 E.16185
G1 X105.814 Y92.809 E.1424
G1 X105.814 Y92.604 E.00629
G1 X101.18 Y92.604 E.1424
G1 X101.18 Y87.962 E.14265
G1 X108.113 Y87.962 E.21305
G1 X108.113 Y87.523 E.01347
G1 X104.537 Y87.523 E.10988
G1 X104.537 Y80.473 E.21662
G1 X101.264 Y80.473 E.10056
G1 X101.264 Y76.898 E.10985
G1 X93.894 Y76.898 E.22648
G1 X93.894 Y77.437 E.01656
G1 X100.87 Y77.437 E.21434
G1 X100.87 Y80.859 E.10515
G1 X104.157 Y80.859 E.10102
G1 X104.157 Y87.523 E.20477
G1 X100.824 Y87.523 E.10241
G1 X100.824 Y94.622 E.21812
G1 X97.439 Y94.622 E.10402
G1 X97.439 Y95.043 E.01295
G1 X100.824 Y95.043 E.10402
G1 X100.824 Y98.519 E.10681
G1 X108.262 Y98.519 E.22854
G1 X108.262 Y102.038 E.10813
G1 X118.021 Y102.038 E.29986
G1 X118.021 Y105.345 E.10159
G1 X104.867 Y105.345 E.40417
G1 X104.867 Y101.702 E.11191
G1 X100.786 Y101.702 E.12541
G1 X100.786 Y105.11 E.10469
G1 X94.213 Y105.11 E.20195
G1 X94.213 Y101.923 E.09791
G1 X93.903 Y101.923 E.00952
G1 X93.903 Y105.573 E.11213
G1 X100.786 Y105.573 E.21147
G1 X100.786 Y108.768 E.09819
G1 X90.902 Y108.768 E.30371
G1 X90.902 Y108.366 E.01236
G1 X90.499 Y108.366 E.01236
G1 X90.499 Y84.43 E.73549
G1 X94.135 Y84.43 E.11171
G1 X94.135 Y80.855 E.10983
G1 X97.66 Y80.855 E.10832
G1 X97.66 Y80.491 E.01118
G1 X93.8 Y80.491 E.1186
G1 X93.8 Y84.075 E.1101
G1 X90.499 Y84.075 E.10142
G1 X90.499 Y74.313 E.29995
G1 X90.902 Y74.313 E.01236
G1 X90.902 Y73.911 E.01236
G1 X111.27 Y73.911 E.62585
G1 X111.27 Y77.186 E.10065
G1 X111.734 Y77.186 E.01426
G1 X111.734 Y73.911 E.10065
G1 X125.217 Y73.911 E.4143
G1 X125.217 Y74.313 E.01236
G1 X125.619 Y74.313 E.01236
G1 X125.619 Y91.237 E.52004
G1 X118.42 Y91.237 E.22121
G1 X118.42 Y98.011 E.20813
G1 X115.845 Y98.011 E.07911
G1 X115.845 Y98.616 E.01859
G1 X121.741 Y98.616 E.18116
G1 X121.741 Y105.641 E.21586
M73 P81 R2
G1 X121.945 Y105.641 E.00626
G1 X121.945 Y94.648 E.3378
G1 X121.741 Y94.648 E.00626
G1 X121.741 Y98.011 E.10334
G1 X118.706 Y98.011 E.09327
G1 X118.706 Y91.647 E.19556
G1 X125.619 Y91.647 E.21244
G1 X125.619 Y108.366 E.51373
G1 X125.217 Y108.366 E.01236
G1 X125.217 Y108.768 E.01236
G1 X101.161 Y108.768 E.73916
G1 X101.161 Y101.968 E.20895
G1 X104.637 Y101.968 E.10681
G1 X104.637 Y105.69 E.11438
G1 X118.292 Y105.69 E.41956
G1 X118.292 Y101.736 E.12151
G1 X112.158 Y101.736 E.18847
G1 X112.158 Y94.918 E.20948
G1 X115.245 Y94.918 E.09485
G1 X115.245 Y87.933 E.21465
G1 X122.151 Y87.933 E.21218
G1 X122.151 Y80.585 E.22577
G1 X118.222 Y80.58 E.12073
G1 X118.222 Y84.159 E.11
G1 X107.993 Y84.159 E.31429
G1 X107.993 Y84.55 E.01202
G1 X111.829 Y84.55 E.11786
G1 X111.829 Y89.52 E.15269
G1 X112.158 Y89.52 E.01012
G1 X112.158 Y84.55 E.15269
G1 X118.576 Y84.55 E.19721
G1 X118.576 Y80.844 E.11389
G1 X121.742 Y80.844 E.09728
G1 X121.742 Y87.659 E.2094
G1 X114.824 Y87.659 E.21258
G1 X114.824 Y94.612 E.21367
G1 X111.829 Y94.612 E.09204
G1 X111.829 Y101.698 E.21772
G1 X108.585 Y101.698 E.09967
; WIPE_START
G1 F12000
M204 S6000
G1 X108.565 Y99.698 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X112.778 Y93.334 Z2.8 F42000
G1 X125.726 Y73.778 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F11179
M204 S5000
G3 X125.8 Y73.886 I-.032 J.101 E.00433
G1 X125.8 Y108.807 E1.07303
G3 X125.687 Y108.92 I-.111 J.001 E.00546
G1 X90.29 Y108.92 E1.08764
G3 X90.177 Y108.807 I-.001 J-.112 E.00546
G1 X90.178 Y73.886 E1.07303
G3 X90.29 Y73.773 I.106 J-.007 E.00554
G1 X125.666 Y73.778 E1.08699
; WIPE_START
G1 F12000
M204 S6000
G1 X125.785 Y73.823 E-.04834
G1 X125.8 Y73.886 E-.02443
G1 X125.8 Y75.694 E-.68723
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.8 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2.8
G1 X0 Y90 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z2.8 F4000
            G39.3 S1
            G0 Z2.8 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X111.502 Y76.99 F42000
G1 Z2.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.11491
G1 F11179
M204 S6000
G1 X111.502 Y73.969 E.01772
; WIPE_START
G1 F15000
G1 X111.502 Y75.969 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.919 Y76.84 Z2.8 F42000
G1 X101.068 Y77.168 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.18966
G1 F11179
M204 S6000
G1 X94.09 Y77.168 E.08344
; WIPE_START
G1 F15000
G1 X96.09 Y77.168 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.706 Y74.043 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.19094
G1 F11179
M204 S6000
G1 X90.374 Y74.043 E.004
M204 S10000
G1 X90.374 Y108.643 F42000
; LINE_WIDTH: 0.20479
G1 F11179
M204 S6000
G1 X90.706 Y108.643 E.00438
; WIPE_START
G1 F15000
G1 X90.374 Y108.643 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.1 Y105.341 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.11373
G1 F11179
M204 S6000
G1 X100.965 Y105.341 E.03962
; WIPE_START
G1 F15000
G1 X98.965 Y105.341 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X106.023 Y102.436 Z2.8 F42000
G1 X116.041 Y98.313 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.25595
G1 F11179
M204 S6000
G1 X121.749 Y98.313 E.09907
; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X119.749 Y98.313 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 13/23
; update layer progress
M73 L13
M991 S0 P12 ;notify layer change

; OBJECT_ID: 66
M204 S10000
G17
G3 Z2.8 I.46 J-1.126 P1  F42000
G1 X94.173 Y87.859 Z2.8
G1 Z2.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11179
M204 S5000
M73 P82 R2
G1 X94.173 Y98.062 E.31354
G1 X97.66 Y98.062 E.10715
G1 X97.66 Y101.955 E.11962
G1 X97.436 Y101.955 E.00687
G1 X97.436 Y98.486 E.10659
G1 X93.806 Y98.486 E.11155
G1 X93.806 Y87.582 E.33506
G1 X97.436 Y87.582 E.11155
G1 X97.436 Y84.014 E.10963
G1 X100.853 Y84.014 E.10498
G1 X100.853 Y84.46 E.0137
G1 X97.66 Y84.46 E.0981
G1 X97.66 Y91.257 E.20886
G1 X97.436 Y91.257 E.00687
G1 X97.436 Y87.859 E.10443
G1 X94.233 Y87.859 E.09843
; WIPE_START
G1 F12000
M204 S6000
G1 X94.221 Y89.859 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X100.562 Y85.61 Z3 F42000
G1 X108.108 Y80.554 Z3
G1 Z2.6
G1 E.8 F1800
G1 F11179
M204 S5000
G1 X114.709 Y80.554 E.20283
G1 X114.709 Y76.965 E.11029
G1 X121.185 Y76.965 E.19899
G1 X121.185 Y77.321 E.01094
G1 X115.065 Y77.321 E.18806
G1 X115.065 Y80.855 E.1086
G1 X107.864 Y80.855 E.22127
G1 X107.864 Y77.322 E.10858
G1 X104.632 Y77.322 E.09929
G1 X104.632 Y77.134 E.00578
G1 X108.108 Y77.134 E.1068
G1 X108.108 Y80.494 E.10327
; WIPE_START
G1 F12000
M204 S6000
G1 X110.108 Y80.513 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.539 Y88.124 Z3 F42000
G1 X108.525 Y101.698 Z3
G1 Z2.6
G1 E.8 F1800
G1 F11179
M204 S5000
G1 X108.525 Y95.719 E.1837
G1 X108.262 Y95.719 E.00809
G1 X108.262 Y98.076 E.07241
G1 X101.18 Y98.076 E.21762
G1 X101.18 Y92.809 E.16185
G1 X105.814 Y92.809 E.1424
G1 X105.814 Y92.604 E.00629
G1 X101.18 Y92.604 E.1424
G1 X101.18 Y87.962 E.14265
G1 X108.113 Y87.962 E.21305
G1 X108.113 Y87.523 E.01347
G1 X104.537 Y87.523 E.10988
G1 X104.537 Y80.473 E.21662
G1 X101.264 Y80.473 E.10056
G1 X101.264 Y76.898 E.10985
G1 X93.894 Y76.898 E.22648
G1 X93.894 Y77.437 E.01656
G1 X100.87 Y77.437 E.21434
G1 X100.87 Y80.859 E.10515
G1 X104.157 Y80.859 E.10102
G1 X104.157 Y87.523 E.20477
G1 X100.824 Y87.523 E.10241
G1 X100.824 Y94.622 E.21812
G1 X97.439 Y94.622 E.10402
G1 X97.439 Y95.043 E.01295
G1 X100.824 Y95.043 E.10402
G1 X100.824 Y98.519 E.10681
G1 X108.262 Y98.519 E.22854
G1 X108.262 Y102.038 E.10813
G1 X118.021 Y102.038 E.29986
G1 X118.021 Y105.345 E.10159
G1 X104.867 Y105.345 E.40417
G1 X104.867 Y101.702 E.11191
G1 X100.786 Y101.702 E.12541
G1 X100.786 Y105.11 E.10469
G1 X94.213 Y105.11 E.20195
G1 X94.213 Y101.923 E.09791
G1 X93.903 Y101.923 E.00952
G1 X93.903 Y105.573 E.11213
G1 X100.786 Y105.573 E.21147
G1 X100.786 Y108.768 E.09819
G1 X90.902 Y108.768 E.30371
G1 X90.902 Y108.366 E.01236
G1 X90.499 Y108.366 E.01236
G1 X90.499 Y84.43 E.73549
G1 X94.135 Y84.43 E.11171
G1 X94.135 Y80.855 E.10983
G1 X97.66 Y80.855 E.10832
G1 X97.66 Y80.491 E.01118
G1 X93.8 Y80.491 E.1186
G1 X93.8 Y84.075 E.1101
G1 X90.499 Y84.075 E.10142
G1 X90.499 Y74.313 E.29995
G1 X90.902 Y74.313 E.01236
G1 X90.902 Y73.911 E.01236
G1 X111.27 Y73.911 E.62585
G1 X111.27 Y77.186 E.10065
G1 X111.734 Y77.186 E.01426
G1 X111.734 Y73.911 E.10065
G1 X125.217 Y73.911 E.4143
G1 X125.217 Y74.313 E.01236
G1 X125.619 Y74.313 E.01236
G1 X125.619 Y91.237 E.52004
G1 X118.42 Y91.237 E.22121
G1 X118.42 Y98.011 E.20813
G1 X115.845 Y98.011 E.07911
G1 X115.845 Y98.616 E.01859
G1 X121.741 Y98.616 E.18116
G1 X121.741 Y105.641 E.21586
G1 X121.945 Y105.641 E.00626
G1 X121.945 Y94.648 E.3378
G1 X121.741 Y94.648 E.00626
G1 X121.741 Y98.011 E.10334
G1 X118.706 Y98.011 E.09327
G1 X118.706 Y91.647 E.19556
G1 X125.619 Y91.647 E.21244
G1 X125.619 Y108.366 E.51373
G1 X125.217 Y108.366 E.01236
G1 X125.217 Y108.768 E.01236
G1 X101.161 Y108.768 E.73916
G1 X101.161 Y101.968 E.20895
G1 X104.637 Y101.968 E.10681
G1 X104.637 Y105.69 E.11438
G1 X118.292 Y105.69 E.41956
G1 X118.292 Y101.736 E.12151
G1 X112.158 Y101.736 E.18847
G1 X112.158 Y94.918 E.20948
G1 X115.245 Y94.918 E.09485
G1 X115.245 Y87.933 E.21465
G1 X122.151 Y87.933 E.21218
G1 X122.151 Y80.585 E.22577
G1 X118.222 Y80.58 E.12073
G1 X118.222 Y84.159 E.11
G1 X107.993 Y84.159 E.31429
G1 X107.993 Y84.55 E.01202
G1 X111.829 Y84.55 E.11786
G1 X111.829 Y89.52 E.15269
G1 X112.158 Y89.52 E.01012
G1 X112.158 Y84.55 E.15269
G1 X118.576 Y84.55 E.19721
G1 X118.576 Y80.844 E.11389
G1 X121.742 Y80.844 E.09728
G1 X121.742 Y87.659 E.2094
G1 X114.824 Y87.659 E.21258
G1 X114.824 Y94.612 E.21367
G1 X111.829 Y94.612 E.09204
G1 X111.829 Y101.698 E.21772
G1 X108.585 Y101.698 E.09967
; WIPE_START
G1 F12000
M204 S6000
G1 X108.565 Y99.698 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X112.778 Y93.334 Z3 F42000
G1 X125.726 Y73.778 Z3
G1 Z2.6
G1 E.8 F1800
G1 F11179
M204 S5000
G3 X125.8 Y73.886 I-.032 J.101 E.00433
G1 X125.8 Y108.807 E1.07303
G3 X125.687 Y108.92 I-.111 J.001 E.00546
G1 X90.29 Y108.92 E1.08764
M73 P83 R2
G3 X90.177 Y108.807 I-.001 J-.111 E.00546
G1 X90.178 Y73.886 E1.07303
G3 X90.29 Y73.773 I.111 J-.001 E.00546
G1 X125.666 Y73.778 E1.087
; WIPE_START
G1 F12000
M204 S6000
G1 X125.785 Y73.823 E-.04832
G1 X125.8 Y73.886 E-.02443
G1 X125.8 Y75.694 E-.68725
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z3
G1 X0 Y90 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z3 F4000
            G39.3 S1
            G0 Z3 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X111.502 Y76.99 F42000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.11491
G1 F11179
M204 S6000
G1 X111.502 Y73.969 E.01772
; WIPE_START
G1 F15000
G1 X111.502 Y75.969 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.919 Y76.84 Z3 F42000
G1 X101.068 Y77.168 Z3
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.18966
G1 F11179
M204 S6000
G1 X94.09 Y77.168 E.08344
; WIPE_START
G1 F15000
G1 X96.09 Y77.168 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.706 Y74.043 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.19094
G1 F11179
M204 S6000
G1 X90.374 Y74.043 E.004
M204 S10000
G1 X90.374 Y108.643 F42000
; LINE_WIDTH: 0.20479
G1 F11179
M204 S6000
G1 X90.706 Y108.643 E.00438
; WIPE_START
G1 F15000
G1 X90.374 Y108.643 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.1 Y105.341 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.11373
G1 F11179
M204 S6000
G1 X100.965 Y105.341 E.03962
; WIPE_START
G1 F15000
G1 X98.965 Y105.341 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X106.023 Y102.436 Z3 F42000
G1 X116.041 Y98.313 Z3
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.25595
G1 F11179
M204 S6000
G1 X121.749 Y98.313 E.09907
; CHANGE_LAYER
; Z_HEIGHT: 2.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X119.749 Y98.313 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 14/23
; update layer progress
M73 L14
M991 S0 P13 ;notify layer change

; OBJECT_ID: 66
M204 S10000
G17
G3 Z3 I.46 J-1.126 P1  F42000
G1 X94.173 Y87.859 Z3
G1 Z2.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11179
M204 S5000
M73 P83 R1
G1 X94.173 Y98.062 E.31354
G1 X97.66 Y98.062 E.10715
G1 X97.66 Y101.955 E.11962
G1 X97.436 Y101.955 E.00687
G1 X97.436 Y98.486 E.10659
G1 X93.806 Y98.486 E.11155
G1 X93.806 Y87.582 E.33506
G1 X97.436 Y87.582 E.11155
G1 X97.436 Y84.014 E.10963
G1 X100.853 Y84.014 E.10498
G1 X100.853 Y84.46 E.0137
G1 X97.66 Y84.46 E.0981
G1 X97.66 Y91.257 E.20886
G1 X97.436 Y91.257 E.00687
G1 X97.436 Y87.859 E.10443
G1 X94.233 Y87.859 E.09843
; WIPE_START
G1 F12000
M204 S6000
G1 X94.221 Y89.859 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X100.562 Y85.61 Z3.2 F42000
G1 X108.108 Y80.554 Z3.2
G1 Z2.8
G1 E.8 F1800
G1 F11179
M204 S5000
G1 X114.709 Y80.554 E.20283
G1 X114.709 Y76.965 E.11029
G1 X121.185 Y76.965 E.19899
G1 X121.185 Y77.321 E.01094
G1 X115.065 Y77.321 E.18806
G1 X115.065 Y80.855 E.1086
G1 X107.864 Y80.855 E.22127
G1 X107.864 Y77.322 E.10858
G1 X104.632 Y77.322 E.09929
G1 X104.632 Y77.134 E.00578
G1 X108.108 Y77.134 E.1068
G1 X108.108 Y80.494 E.10327
; WIPE_START
G1 F12000
M204 S6000
G1 X110.108 Y80.513 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.539 Y88.124 Z3.2 F42000
G1 X108.525 Y101.698 Z3.2
G1 Z2.8
G1 E.8 F1800
G1 F11179
M204 S5000
G1 X108.525 Y95.719 E.1837
G1 X108.262 Y95.719 E.00809
G1 X108.262 Y98.076 E.07241
G1 X101.18 Y98.076 E.21762
G1 X101.18 Y92.809 E.16185
G1 X105.814 Y92.809 E.1424
G1 X105.814 Y92.604 E.00629
G1 X101.18 Y92.604 E.1424
G1 X101.18 Y87.962 E.14265
G1 X108.113 Y87.962 E.21305
G1 X108.113 Y87.523 E.01347
G1 X104.537 Y87.523 E.10988
G1 X104.537 Y80.473 E.21662
G1 X101.264 Y80.473 E.10056
G1 X101.264 Y76.898 E.10985
G1 X93.894 Y76.898 E.22648
G1 X93.894 Y77.437 E.01656
G1 X100.87 Y77.437 E.21434
G1 X100.87 Y80.859 E.10515
G1 X104.157 Y80.859 E.10102
G1 X104.157 Y87.523 E.20477
G1 X100.824 Y87.523 E.10241
G1 X100.824 Y94.622 E.21812
G1 X97.439 Y94.622 E.10402
G1 X97.439 Y95.043 E.01295
G1 X100.824 Y95.043 E.10402
G1 X100.824 Y98.519 E.10681
G1 X108.262 Y98.519 E.22854
M73 P84 R1
G1 X108.262 Y102.038 E.10813
G1 X118.021 Y102.038 E.29986
G1 X118.021 Y105.345 E.10159
G1 X104.867 Y105.345 E.40417
G1 X104.867 Y101.702 E.11191
G1 X100.786 Y101.702 E.12541
G1 X100.786 Y105.11 E.10469
G1 X94.213 Y105.11 E.20195
G1 X94.213 Y101.923 E.09791
G1 X93.903 Y101.923 E.00952
G1 X93.903 Y105.573 E.11213
G1 X100.786 Y105.573 E.21147
G1 X100.786 Y108.768 E.09819
G1 X90.902 Y108.768 E.30371
G1 X90.902 Y108.366 E.01236
G1 X90.499 Y108.366 E.01236
G1 X90.499 Y84.43 E.73549
G1 X94.135 Y84.43 E.11171
G1 X94.135 Y80.855 E.10983
G1 X97.66 Y80.855 E.10832
G1 X97.66 Y80.491 E.01118
G1 X93.8 Y80.491 E.1186
G1 X93.8 Y84.075 E.1101
G1 X90.499 Y84.075 E.10142
G1 X90.499 Y74.313 E.29995
G1 X90.902 Y74.313 E.01236
G1 X90.902 Y73.911 E.01236
G1 X111.27 Y73.911 E.62585
G1 X111.27 Y77.186 E.10065
G1 X111.734 Y77.186 E.01426
G1 X111.734 Y73.911 E.10065
G1 X125.217 Y73.911 E.4143
G1 X125.217 Y74.313 E.01236
G1 X125.619 Y74.313 E.01236
G1 X125.619 Y91.237 E.52004
G1 X118.42 Y91.237 E.22121
G1 X118.42 Y98.011 E.20813
G1 X115.845 Y98.011 E.07911
G1 X115.845 Y98.616 E.01859
G1 X121.741 Y98.616 E.18116
G1 X121.741 Y105.641 E.21586
G1 X121.945 Y105.641 E.00626
G1 X121.945 Y94.648 E.3378
G1 X121.741 Y94.648 E.00626
G1 X121.741 Y98.011 E.10334
G1 X118.706 Y98.011 E.09327
G1 X118.706 Y91.647 E.19556
G1 X125.619 Y91.647 E.21244
G1 X125.619 Y108.366 E.51373
G1 X125.217 Y108.366 E.01236
G1 X125.217 Y108.768 E.01236
G1 X101.161 Y108.768 E.73916
G1 X101.161 Y101.968 E.20895
G1 X104.637 Y101.968 E.10681
G1 X104.637 Y105.69 E.11438
G1 X118.292 Y105.69 E.41956
G1 X118.292 Y101.736 E.12151
G1 X112.158 Y101.736 E.18847
G1 X112.158 Y94.918 E.20948
G1 X115.245 Y94.918 E.09485
G1 X115.245 Y87.933 E.21465
G1 X122.151 Y87.933 E.21218
G1 X122.151 Y80.585 E.22577
G1 X118.222 Y80.58 E.12073
G1 X118.222 Y84.159 E.11
G1 X107.993 Y84.159 E.31429
G1 X107.993 Y84.55 E.01202
G1 X111.829 Y84.55 E.11786
G1 X111.829 Y89.52 E.15269
G1 X112.158 Y89.52 E.01012
G1 X112.158 Y84.55 E.15269
G1 X118.576 Y84.55 E.19721
G1 X118.576 Y80.844 E.11389
G1 X121.742 Y80.844 E.09728
G1 X121.742 Y87.659 E.2094
G1 X114.824 Y87.659 E.21258
G1 X114.824 Y94.612 E.21367
G1 X111.829 Y94.612 E.09204
G1 X111.829 Y101.698 E.21772
G1 X108.585 Y101.698 E.09967
; WIPE_START
G1 F12000
M204 S6000
G1 X108.565 Y99.698 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X112.778 Y93.333 Z3.2 F42000
G1 X125.721 Y73.777 Z3.2
G1 Z2.8
G1 E.8 F1800
G1 F11179
M204 S5000
G3 X125.8 Y73.886 I-.025 J.101 E.00447
G1 X125.8 Y108.807 E1.07303
G3 X125.687 Y108.92 I-.111 J.001 E.00546
G1 X90.29 Y108.92 E1.08764
G3 X90.177 Y108.807 I-.001 J-.111 E.00546
G1 X90.178 Y73.885 E1.07304
G3 X90.29 Y73.773 I.111 J-.001 E.00545
G1 X125.661 Y73.777 E1.08685
; WIPE_START
G1 F12000
M204 S6000
G1 X125.785 Y73.823 E-.05009
G1 X125.8 Y73.886 E-.02442
G1 X125.8 Y75.69 E-.6855
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.2 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z3.2
G1 X0 Y90 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z3.2 F4000
            G39.3 S1
            G0 Z3.2 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X111.502 Y76.99 F42000
G1 Z2.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.11491
G1 F11179
M204 S6000
G1 X111.502 Y73.969 E.01772
; WIPE_START
G1 F15000
G1 X111.502 Y75.969 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.919 Y76.84 Z3.2 F42000
G1 X101.068 Y77.168 Z3.2
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.18966
G1 F11179
M204 S6000
G1 X94.09 Y77.168 E.08344
; WIPE_START
G1 F15000
G1 X96.09 Y77.168 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.706 Y74.043 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.19094
G1 F11179
M204 S6000
G1 X90.374 Y74.043 E.004
M204 S10000
G1 X90.374 Y108.643 F42000
; LINE_WIDTH: 0.20479
G1 F11179
M204 S6000
G1 X90.706 Y108.643 E.00438
; WIPE_START
G1 F15000
G1 X90.374 Y108.643 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.1 Y105.341 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.11373
G1 F11179
M204 S6000
G1 X100.965 Y105.341 E.03962
; WIPE_START
G1 F15000
G1 X98.965 Y105.341 E-.76
; WIPE_END
M73 P85 R1
G1 E-.04 F1800
M204 S10000
G1 X106.023 Y102.436 Z3.2 F42000
G1 X116.041 Y98.313 Z3.2
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.25595
G1 F11179
M204 S6000
G1 X121.749 Y98.313 E.09907
; CHANGE_LAYER
; Z_HEIGHT: 3
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X119.749 Y98.313 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 15/23
; update layer progress
M73 L15
M991 S0 P14 ;notify layer change

; OBJECT_ID: 66
M204 S10000
G17
G3 Z3.2 I.46 J-1.126 P1  F42000
G1 X94.173 Y87.859 Z3.2
G1 Z3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11179
M204 S5000
G1 X94.173 Y98.062 E.31354
G1 X97.66 Y98.062 E.10715
G1 X97.66 Y101.955 E.11962
G1 X97.436 Y101.955 E.00687
G1 X97.436 Y98.486 E.10659
G1 X93.806 Y98.486 E.11155
G1 X93.806 Y87.582 E.33506
G1 X97.436 Y87.582 E.11155
G1 X97.436 Y84.014 E.10963
G1 X100.853 Y84.014 E.10498
G1 X100.853 Y84.46 E.0137
G1 X97.66 Y84.46 E.0981
G1 X97.66 Y91.257 E.20886
G1 X97.436 Y91.257 E.00687
G1 X97.436 Y87.859 E.10443
G1 X94.233 Y87.859 E.09843
; WIPE_START
G1 F12000
M204 S6000
G1 X94.221 Y89.859 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X100.562 Y85.61 Z3.4 F42000
G1 X108.108 Y80.554 Z3.4
G1 Z3
G1 E.8 F1800
G1 F11179
M204 S5000
G1 X114.709 Y80.554 E.20283
G1 X114.709 Y76.965 E.11029
G1 X121.185 Y76.965 E.19899
G1 X121.185 Y77.321 E.01094
G1 X115.065 Y77.321 E.18806
G1 X115.065 Y80.855 E.1086
G1 X107.864 Y80.855 E.22127
G1 X107.864 Y77.322 E.10858
G1 X104.632 Y77.322 E.09929
G1 X104.632 Y77.134 E.00578
G1 X108.108 Y77.134 E.1068
G1 X108.108 Y80.494 E.10327
; WIPE_START
G1 F12000
M204 S6000
G1 X110.108 Y80.513 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.539 Y88.124 Z3.4 F42000
G1 X108.525 Y101.698 Z3.4
G1 Z3
G1 E.8 F1800
G1 F11179
M204 S5000
G1 X108.525 Y95.719 E.1837
G1 X108.262 Y95.719 E.00809
G1 X108.262 Y98.076 E.07241
G1 X101.18 Y98.076 E.21762
G1 X101.18 Y92.809 E.16185
G1 X105.814 Y92.809 E.1424
G1 X105.814 Y92.604 E.00629
G1 X101.18 Y92.604 E.1424
G1 X101.18 Y87.962 E.14265
G1 X108.113 Y87.962 E.21305
G1 X108.113 Y87.523 E.01347
G1 X104.537 Y87.523 E.10988
G1 X104.537 Y80.473 E.21662
G1 X101.264 Y80.473 E.10056
G1 X101.264 Y76.898 E.10985
G1 X93.894 Y76.898 E.22648
G1 X93.894 Y77.437 E.01656
G1 X100.87 Y77.437 E.21434
G1 X100.87 Y80.859 E.10515
G1 X104.157 Y80.859 E.10102
G1 X104.157 Y87.523 E.20477
G1 X100.824 Y87.523 E.10241
G1 X100.824 Y94.622 E.21812
G1 X97.439 Y94.622 E.10402
G1 X97.439 Y95.043 E.01295
G1 X100.824 Y95.043 E.10402
G1 X100.824 Y98.519 E.10681
G1 X108.262 Y98.519 E.22854
G1 X108.262 Y102.038 E.10813
G1 X118.021 Y102.038 E.29986
G1 X118.021 Y105.345 E.10159
G1 X104.867 Y105.345 E.40417
G1 X104.867 Y101.702 E.11191
G1 X100.786 Y101.702 E.12541
G1 X100.786 Y105.11 E.10469
G1 X94.213 Y105.11 E.20195
G1 X94.213 Y101.923 E.09791
G1 X93.903 Y101.923 E.00952
G1 X93.903 Y105.573 E.11213
G1 X100.786 Y105.573 E.21147
G1 X100.786 Y108.768 E.09819
G1 X90.902 Y108.768 E.30371
G1 X90.902 Y108.366 E.01236
G1 X90.499 Y108.366 E.01236
G1 X90.499 Y84.43 E.73549
G1 X94.135 Y84.43 E.11171
G1 X94.135 Y80.855 E.10983
G1 X97.66 Y80.855 E.10832
G1 X97.66 Y80.491 E.01118
G1 X93.8 Y80.491 E.1186
G1 X93.8 Y84.075 E.1101
G1 X90.499 Y84.075 E.10142
G1 X90.499 Y74.313 E.29995
G1 X90.902 Y74.313 E.01236
G1 X90.902 Y73.911 E.01236
G1 X111.27 Y73.911 E.62585
G1 X111.27 Y77.186 E.10065
G1 X111.734 Y77.186 E.01426
G1 X111.734 Y73.911 E.10065
G1 X125.217 Y73.911 E.4143
G1 X125.217 Y74.313 E.01236
G1 X125.619 Y74.313 E.01236
G1 X125.619 Y91.237 E.52004
G1 X118.42 Y91.237 E.22121
G1 X118.42 Y98.011 E.20813
G1 X115.845 Y98.011 E.07911
G1 X115.845 Y98.616 E.01859
G1 X121.741 Y98.616 E.18116
G1 X121.741 Y105.641 E.21586
G1 X121.945 Y105.641 E.00626
G1 X121.945 Y94.648 E.3378
G1 X121.741 Y94.648 E.00626
G1 X121.741 Y98.011 E.10334
G1 X118.706 Y98.011 E.09327
G1 X118.706 Y91.647 E.19556
G1 X125.619 Y91.647 E.21244
G1 X125.619 Y108.366 E.51373
G1 X125.217 Y108.366 E.01236
G1 X125.217 Y108.768 E.01236
G1 X101.161 Y108.768 E.73916
G1 X101.161 Y101.968 E.20895
G1 X104.637 Y101.968 E.10681
G1 X104.637 Y105.69 E.11438
G1 X118.292 Y105.69 E.41956
G1 X118.292 Y101.736 E.12151
G1 X112.158 Y101.736 E.18847
G1 X112.158 Y94.918 E.20948
G1 X115.245 Y94.918 E.09485
M73 P86 R1
G1 X115.245 Y87.933 E.21465
G1 X122.151 Y87.933 E.21218
G1 X122.151 Y80.585 E.22577
G1 X118.222 Y80.58 E.12073
G1 X118.222 Y84.159 E.11
G1 X107.993 Y84.159 E.31429
G1 X107.993 Y84.55 E.01202
G1 X111.829 Y84.55 E.11786
G1 X111.829 Y89.52 E.15269
G1 X112.158 Y89.52 E.01012
G1 X112.158 Y84.55 E.15269
G1 X118.576 Y84.55 E.19721
G1 X118.576 Y80.844 E.11389
G1 X121.742 Y80.844 E.09728
G1 X121.742 Y87.659 E.2094
G1 X114.824 Y87.659 E.21258
G1 X114.824 Y94.612 E.21367
G1 X111.829 Y94.612 E.09204
G1 X111.829 Y101.698 E.21772
G1 X108.585 Y101.698 E.09967
; WIPE_START
G1 F12000
M204 S6000
G1 X108.565 Y99.698 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X112.778 Y93.334 Z3.4 F42000
G1 X125.725 Y73.778 Z3.4
G1 Z3
G1 E.8 F1800
G1 F11179
M204 S5000
G3 X125.8 Y73.886 I-.03 J.101 E.00435
G1 X125.8 Y108.807 E1.07303
G3 X125.686 Y108.92 I-.112 J.001 E.00548
G1 X90.29 Y108.92 E1.08761
G3 X90.177 Y108.807 I-.001 J-.111 E.00546
G1 X90.178 Y73.885 E1.07304
G3 X90.29 Y73.773 I.111 J-.001 E.00545
G1 X125.665 Y73.778 E1.08696
; WIPE_START
G1 F12000
M204 S6000
G1 X125.785 Y73.823 E-.04871
G1 X125.8 Y73.886 E-.0244
G1 X125.8 Y75.693 E-.6869
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.4 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z3.4
G1 X0 Y90 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z3.4 F4000
            G39.3 S1
            G0 Z3.4 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X111.502 Y76.99 F42000
G1 Z3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.11491
G1 F11179
M204 S6000
G1 X111.502 Y73.969 E.01772
; WIPE_START
G1 F15000
G1 X111.502 Y75.969 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.919 Y76.84 Z3.4 F42000
G1 X101.068 Y77.168 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.18966
G1 F11179
M204 S6000
G1 X94.09 Y77.168 E.08344
; WIPE_START
G1 F15000
G1 X96.09 Y77.168 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.706 Y74.043 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.19094
G1 F11179
M204 S6000
G1 X90.374 Y74.043 E.004
M204 S10000
G1 X90.374 Y108.643 F42000
; LINE_WIDTH: 0.20479
G1 F11179
M204 S6000
G1 X90.706 Y108.643 E.00438
; WIPE_START
G1 F15000
G1 X90.374 Y108.643 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.1 Y105.341 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.11373
G1 F11179
M204 S6000
G1 X100.965 Y105.341 E.03962
; WIPE_START
G1 F15000
G1 X98.965 Y105.341 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X106.023 Y102.436 Z3.4 F42000
G1 X116.041 Y98.313 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.25595
G1 F11179
M204 S6000
G1 X121.749 Y98.313 E.09907
; CHANGE_LAYER
; Z_HEIGHT: 3.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X119.749 Y98.313 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 16/23
; update layer progress
M73 L16
M991 S0 P15 ;notify layer change

; OBJECT_ID: 66
M204 S10000
G17
G3 Z3.4 I.46 J-1.126 P1  F42000
G1 X94.173 Y87.859 Z3.4
G1 Z3.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11179
M204 S5000
G1 X94.173 Y98.062 E.31354
G1 X97.66 Y98.062 E.10715
G1 X97.66 Y101.955 E.11962
G1 X97.436 Y101.955 E.00687
G1 X97.436 Y98.486 E.10659
G1 X93.806 Y98.486 E.11155
G1 X93.806 Y87.582 E.33506
G1 X97.436 Y87.582 E.11155
G1 X97.436 Y84.014 E.10963
G1 X100.853 Y84.014 E.10498
G1 X100.853 Y84.46 E.0137
G1 X97.66 Y84.46 E.0981
G1 X97.66 Y91.257 E.20886
G1 X97.436 Y91.257 E.00687
G1 X97.436 Y87.859 E.10443
G1 X94.233 Y87.859 E.09843
; WIPE_START
G1 F12000
M204 S6000
G1 X94.221 Y89.859 E-.76
; WIPE_END
M73 P87 R1
G1 E-.04 F1800
M204 S10000
G1 X100.562 Y85.61 Z3.6 F42000
G1 X108.108 Y80.554 Z3.6
G1 Z3.2
G1 E.8 F1800
G1 F11179
M204 S5000
G1 X114.709 Y80.554 E.20283
G1 X114.709 Y76.965 E.11029
G1 X121.185 Y76.965 E.19899
G1 X121.185 Y77.321 E.01094
G1 X115.065 Y77.321 E.18806
G1 X115.065 Y80.855 E.1086
G1 X107.864 Y80.855 E.22127
G1 X107.864 Y77.322 E.10858
G1 X104.632 Y77.322 E.09929
G1 X104.632 Y77.134 E.00578
G1 X108.108 Y77.134 E.1068
G1 X108.108 Y80.494 E.10327
; WIPE_START
G1 F12000
M204 S6000
G1 X110.108 Y80.513 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.539 Y88.124 Z3.6 F42000
G1 X108.525 Y101.698 Z3.6
G1 Z3.2
G1 E.8 F1800
G1 F11179
M204 S5000
G1 X108.525 Y95.719 E.1837
G1 X108.262 Y95.719 E.00809
G1 X108.262 Y98.076 E.07241
G1 X101.18 Y98.076 E.21762
G1 X101.18 Y92.809 E.16185
G1 X105.814 Y92.809 E.1424
G1 X105.814 Y92.604 E.00629
G1 X101.18 Y92.604 E.1424
G1 X101.18 Y87.962 E.14265
G1 X108.113 Y87.962 E.21305
G1 X108.113 Y87.523 E.01347
G1 X104.537 Y87.523 E.10988
G1 X104.537 Y80.473 E.21662
G1 X101.264 Y80.473 E.10056
G1 X101.264 Y76.898 E.10985
G1 X93.894 Y76.898 E.22648
G1 X93.894 Y77.437 E.01656
G1 X100.87 Y77.437 E.21434
G1 X100.87 Y80.859 E.10515
G1 X104.157 Y80.859 E.10102
G1 X104.157 Y87.523 E.20477
G1 X100.824 Y87.523 E.10241
G1 X100.824 Y94.622 E.21812
G1 X97.439 Y94.622 E.10402
G1 X97.439 Y95.043 E.01295
G1 X100.824 Y95.043 E.10402
G1 X100.824 Y98.519 E.10681
G1 X108.262 Y98.519 E.22854
G1 X108.262 Y102.038 E.10813
G1 X118.021 Y102.038 E.29986
G1 X118.021 Y105.345 E.10159
G1 X104.867 Y105.345 E.40417
G1 X104.867 Y101.702 E.11191
G1 X100.786 Y101.702 E.12541
G1 X100.786 Y105.11 E.10469
G1 X94.213 Y105.11 E.20195
G1 X94.213 Y101.923 E.09791
G1 X93.903 Y101.923 E.00952
G1 X93.903 Y105.573 E.11213
G1 X100.786 Y105.573 E.21147
G1 X100.786 Y108.768 E.09819
G1 X90.902 Y108.768 E.30371
G1 X90.902 Y108.366 E.01236
G1 X90.499 Y108.366 E.01236
G1 X90.499 Y84.43 E.73549
G1 X94.135 Y84.43 E.11171
G1 X94.135 Y80.855 E.10983
G1 X97.66 Y80.855 E.10832
G1 X97.66 Y80.491 E.01118
G1 X93.8 Y80.491 E.1186
G1 X93.8 Y84.075 E.1101
G1 X90.499 Y84.075 E.10142
G1 X90.499 Y74.313 E.29995
G1 X90.902 Y74.313 E.01236
G1 X90.902 Y73.911 E.01236
G1 X111.27 Y73.911 E.62585
G1 X111.27 Y77.186 E.10065
G1 X111.734 Y77.186 E.01426
G1 X111.734 Y73.911 E.10065
G1 X125.217 Y73.911 E.4143
G1 X125.217 Y74.313 E.01236
G1 X125.619 Y74.313 E.01236
G1 X125.619 Y91.237 E.52004
G1 X118.42 Y91.237 E.22121
G1 X118.42 Y98.011 E.20813
G1 X115.845 Y98.011 E.07911
G1 X115.845 Y98.616 E.01859
G1 X121.741 Y98.616 E.18116
G1 X121.741 Y105.641 E.21586
G1 X121.945 Y105.641 E.00626
G1 X121.945 Y94.648 E.3378
G1 X121.741 Y94.648 E.00626
G1 X121.741 Y98.011 E.10334
G1 X118.706 Y98.011 E.09327
G1 X118.706 Y91.647 E.19556
G1 X125.619 Y91.647 E.21244
G1 X125.619 Y108.366 E.51373
G1 X125.217 Y108.366 E.01236
G1 X125.217 Y108.768 E.01236
G1 X101.161 Y108.768 E.73916
G1 X101.161 Y101.968 E.20895
G1 X104.637 Y101.968 E.10681
G1 X104.637 Y105.69 E.11438
G1 X118.292 Y105.69 E.41956
G1 X118.292 Y101.736 E.12151
G1 X112.158 Y101.736 E.18847
G1 X112.158 Y94.918 E.20948
G1 X115.245 Y94.918 E.09485
G1 X115.245 Y87.933 E.21465
G1 X122.151 Y87.933 E.21218
G1 X122.151 Y80.585 E.22577
G1 X118.222 Y80.58 E.12073
G1 X118.222 Y84.159 E.11
G1 X107.993 Y84.159 E.31429
G1 X107.993 Y84.55 E.01202
G1 X111.829 Y84.55 E.11786
G1 X111.829 Y89.52 E.15269
G1 X112.158 Y89.52 E.01012
G1 X112.158 Y84.55 E.15269
G1 X118.576 Y84.55 E.19721
G1 X118.576 Y80.844 E.11389
G1 X121.742 Y80.844 E.09728
G1 X121.742 Y87.659 E.2094
G1 X114.824 Y87.659 E.21258
G1 X114.824 Y94.612 E.21367
G1 X111.829 Y94.612 E.09204
G1 X111.829 Y101.698 E.21772
G1 X108.585 Y101.698 E.09967
; WIPE_START
G1 F12000
M204 S6000
G1 X108.565 Y99.698 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X112.777 Y93.333 Z3.6 F42000
G1 X125.72 Y73.777 Z3.6
G1 Z3.2
G1 E.8 F1800
G1 F11179
M204 S5000
G3 X125.8 Y73.886 I-.024 J.101 E.00449
G1 X125.8 Y108.807 E1.07303
G3 X125.687 Y108.92 I-.111 J.001 E.00546
G1 X90.29 Y108.92 E1.08764
G3 X90.177 Y108.807 I-.001 J-.111 E.00546
G1 X90.178 Y73.885 E1.07304
G3 X90.29 Y73.773 I.111 J-.001 E.00546
G1 X125.66 Y73.777 E1.08683
; WIPE_START
G1 F12000
M204 S6000
G1 X125.785 Y73.823 E-.0504
G1 X125.8 Y73.886 E-.02442
G1 X125.8 Y75.689 E-.68519
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.6 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z3.6
G1 X0 Y90 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z3.6 F4000
            G39.3 S1
            G0 Z3.6 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X111.502 Y76.99 F42000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.11491
G1 F11179
M204 S6000
M73 P88 R1
G1 X111.502 Y73.969 E.01772
; WIPE_START
G1 F15000
G1 X111.502 Y75.969 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.919 Y76.84 Z3.6 F42000
G1 X101.068 Y77.168 Z3.6
G1 Z3.2
G1 E.8 F1800
; LINE_WIDTH: 0.18966
G1 F11179
M204 S6000
G1 X94.09 Y77.168 E.08344
; WIPE_START
G1 F15000
G1 X96.09 Y77.168 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.706 Y74.043 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; LINE_WIDTH: 0.19094
G1 F11179
M204 S6000
G1 X90.374 Y74.043 E.004
M204 S10000
G1 X90.374 Y108.643 F42000
; LINE_WIDTH: 0.20479
G1 F11179
M204 S6000
G1 X90.706 Y108.643 E.00438
; WIPE_START
G1 F15000
G1 X90.374 Y108.643 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.1 Y105.341 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; LINE_WIDTH: 0.11373
G1 F11179
M204 S6000
G1 X100.965 Y105.341 E.03962
; WIPE_START
G1 F15000
G1 X98.965 Y105.341 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X106.023 Y102.436 Z3.6 F42000
G1 X116.041 Y98.313 Z3.6
G1 Z3.2
G1 E.8 F1800
; LINE_WIDTH: 0.25595
G1 F11179
M204 S6000
G1 X121.749 Y98.313 E.09907
; CHANGE_LAYER
; Z_HEIGHT: 3.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X119.749 Y98.313 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 17/23
; update layer progress
M73 L17
M991 S0 P16 ;notify layer change

; OBJECT_ID: 66
M204 S10000
G17
G3 Z3.6 I.46 J-1.126 P1  F42000
G1 X94.173 Y87.859 Z3.6
G1 Z3.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11179
M204 S5000
G1 X94.173 Y98.062 E.31354
G1 X97.66 Y98.062 E.10715
G1 X97.66 Y101.955 E.11962
G1 X97.436 Y101.955 E.00687
G1 X97.436 Y98.486 E.10659
G1 X93.806 Y98.486 E.11155
G1 X93.806 Y87.582 E.33506
G1 X97.436 Y87.582 E.11155
G1 X97.436 Y84.014 E.10963
G1 X100.853 Y84.014 E.10498
G1 X100.853 Y84.46 E.0137
G1 X97.66 Y84.46 E.0981
G1 X97.66 Y91.257 E.20886
G1 X97.436 Y91.257 E.00687
G1 X97.436 Y87.859 E.10443
G1 X94.233 Y87.859 E.09843
; WIPE_START
G1 F12000
M204 S6000
G1 X94.221 Y89.859 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X100.562 Y85.61 Z3.8 F42000
G1 X108.108 Y80.554 Z3.8
G1 Z3.4
G1 E.8 F1800
G1 F11179
M204 S5000
G1 X114.709 Y80.554 E.20283
G1 X114.709 Y76.965 E.11029
G1 X121.185 Y76.965 E.19899
G1 X121.185 Y77.321 E.01094
G1 X115.065 Y77.321 E.18806
G1 X115.065 Y80.855 E.1086
G1 X107.864 Y80.855 E.22127
G1 X107.864 Y77.322 E.10858
G1 X104.632 Y77.322 E.09929
G1 X104.632 Y77.134 E.00578
G1 X108.108 Y77.134 E.1068
G1 X108.108 Y80.494 E.10327
; WIPE_START
G1 F12000
M204 S6000
G1 X110.108 Y80.513 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.539 Y88.124 Z3.8 F42000
G1 X108.525 Y101.698 Z3.8
G1 Z3.4
G1 E.8 F1800
G1 F11179
M204 S5000
G1 X108.525 Y95.719 E.1837
G1 X108.262 Y95.719 E.00809
G1 X108.262 Y98.076 E.07241
G1 X101.18 Y98.076 E.21762
G1 X101.18 Y92.809 E.16185
G1 X105.814 Y92.809 E.1424
G1 X105.814 Y92.604 E.00629
G1 X101.18 Y92.604 E.1424
G1 X101.18 Y87.962 E.14265
G1 X108.113 Y87.962 E.21305
G1 X108.113 Y87.523 E.01347
G1 X104.537 Y87.523 E.10988
G1 X104.537 Y80.473 E.21662
G1 X101.264 Y80.473 E.10056
G1 X101.264 Y76.898 E.10985
G1 X93.894 Y76.898 E.22648
G1 X93.894 Y77.437 E.01656
G1 X100.87 Y77.437 E.21434
G1 X100.87 Y80.859 E.10515
G1 X104.157 Y80.859 E.10102
G1 X104.157 Y87.523 E.20477
G1 X100.824 Y87.523 E.10241
G1 X100.824 Y94.622 E.21812
G1 X97.439 Y94.622 E.10402
G1 X97.439 Y95.043 E.01295
G1 X100.824 Y95.043 E.10402
G1 X100.824 Y98.519 E.10681
G1 X108.262 Y98.519 E.22854
G1 X108.262 Y102.038 E.10813
G1 X118.021 Y102.038 E.29986
G1 X118.021 Y105.345 E.10159
G1 X104.867 Y105.345 E.40417
G1 X104.867 Y101.702 E.11191
G1 X100.786 Y101.702 E.12541
G1 X100.786 Y105.11 E.10469
G1 X94.213 Y105.11 E.20195
G1 X94.213 Y101.923 E.09791
G1 X93.903 Y101.923 E.00952
G1 X93.903 Y105.573 E.11213
G1 X100.786 Y105.573 E.21147
G1 X100.786 Y108.768 E.09819
G1 X90.902 Y108.768 E.30371
G1 X90.902 Y108.366 E.01236
G1 X90.499 Y108.366 E.01236
G1 X90.499 Y84.43 E.73549
G1 X94.135 Y84.43 E.11171
G1 X94.135 Y80.855 E.10983
G1 X97.66 Y80.855 E.10832
G1 X97.66 Y80.491 E.01118
G1 X93.8 Y80.491 E.1186
G1 X93.8 Y84.075 E.1101
M73 P89 R1
G1 X90.499 Y84.075 E.10142
G1 X90.499 Y74.313 E.29995
G1 X90.902 Y74.313 E.01236
G1 X90.902 Y73.911 E.01236
G1 X111.27 Y73.911 E.62585
G1 X111.27 Y77.186 E.10065
G1 X111.734 Y77.186 E.01426
G1 X111.734 Y73.911 E.10065
G1 X125.217 Y73.911 E.4143
G1 X125.217 Y74.313 E.01236
G1 X125.619 Y74.313 E.01236
G1 X125.619 Y91.237 E.52004
G1 X118.42 Y91.237 E.22121
G1 X118.42 Y98.011 E.20813
G1 X115.845 Y98.011 E.07911
G1 X115.845 Y98.616 E.01859
G1 X121.741 Y98.616 E.18116
G1 X121.741 Y105.641 E.21586
G1 X121.945 Y105.641 E.00626
G1 X121.945 Y94.648 E.3378
G1 X121.741 Y94.648 E.00626
G1 X121.741 Y98.011 E.10334
G1 X118.706 Y98.011 E.09327
G1 X118.706 Y91.647 E.19556
G1 X125.619 Y91.647 E.21244
G1 X125.619 Y108.366 E.51373
G1 X125.217 Y108.366 E.01236
G1 X125.217 Y108.768 E.01236
G1 X101.161 Y108.768 E.73916
G1 X101.161 Y101.968 E.20895
G1 X104.637 Y101.968 E.10681
G1 X104.637 Y105.69 E.11438
G1 X118.292 Y105.69 E.41956
G1 X118.292 Y101.736 E.12151
G1 X112.158 Y101.736 E.18847
G1 X112.158 Y94.918 E.20948
G1 X115.245 Y94.918 E.09485
G1 X115.245 Y87.933 E.21465
G1 X122.151 Y87.933 E.21218
G1 X122.151 Y80.585 E.22577
G1 X118.222 Y80.58 E.12073
G1 X118.222 Y84.159 E.11
G1 X107.993 Y84.159 E.31429
G1 X107.993 Y84.55 E.01202
G1 X111.829 Y84.55 E.11786
G1 X111.829 Y89.52 E.15269
G1 X112.158 Y89.52 E.01012
G1 X112.158 Y84.55 E.15269
G1 X118.576 Y84.55 E.19721
G1 X118.576 Y80.844 E.11389
G1 X121.742 Y80.844 E.09728
G1 X121.742 Y87.659 E.2094
G1 X114.824 Y87.659 E.21258
G1 X114.824 Y94.612 E.21367
G1 X111.829 Y94.612 E.09204
G1 X111.829 Y101.698 E.21772
G1 X108.585 Y101.698 E.09967
; WIPE_START
G1 F12000
M204 S6000
G1 X108.565 Y99.698 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X112.778 Y93.334 Z3.8 F42000
G1 X125.726 Y73.778 Z3.8
G1 Z3.4
G1 E.8 F1800
G1 F11179
M204 S5000
G3 X125.8 Y73.886 I-.032 J.101 E.00433
G1 X125.8 Y108.807 E1.07303
G3 X125.687 Y108.92 I-.111 J.001 E.00546
G1 X90.29 Y108.92 E1.08764
G3 X90.177 Y108.807 I-.001 J-.111 E.00546
G1 X90.178 Y73.886 E1.07303
G3 X90.29 Y73.773 I.111 J-.001 E.00546
G1 X125.666 Y73.778 E1.08699
; WIPE_START
G1 F12000
M204 S6000
G1 X125.785 Y73.823 E-.04835
G1 X125.8 Y73.886 E-.02441
G1 X125.8 Y75.694 E-.68725
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.8 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z3.8
G1 X0 Y90 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z3.8 F4000
            G39.3 S1
            G0 Z3.8 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X111.502 Y76.99 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.11491
G1 F11179
M204 S6000
G1 X111.502 Y73.969 E.01772
; WIPE_START
G1 F15000
G1 X111.502 Y75.969 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.919 Y76.84 Z3.8 F42000
G1 X101.068 Y77.168 Z3.8
G1 Z3.4
G1 E.8 F1800
; LINE_WIDTH: 0.18966
G1 F11179
M204 S6000
G1 X94.09 Y77.168 E.08344
; WIPE_START
G1 F15000
G1 X96.09 Y77.168 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.706 Y74.043 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; LINE_WIDTH: 0.19094
G1 F11179
M204 S6000
G1 X90.374 Y74.043 E.004
M204 S10000
G1 X90.374 Y108.643 F42000
; LINE_WIDTH: 0.20479
G1 F11179
M204 S6000
G1 X90.706 Y108.643 E.00438
; WIPE_START
G1 F15000
G1 X90.374 Y108.643 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.1 Y105.341 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; LINE_WIDTH: 0.11373
G1 F11179
M204 S6000
G1 X100.965 Y105.341 E.03962
; WIPE_START
G1 F15000
G1 X98.965 Y105.341 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X106.023 Y102.436 Z3.8 F42000
G1 X116.041 Y98.313 Z3.8
G1 Z3.4
G1 E.8 F1800
; LINE_WIDTH: 0.25595
G1 F11179
M204 S6000
G1 X121.749 Y98.313 E.09907
; CHANGE_LAYER
; Z_HEIGHT: 3.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X119.749 Y98.313 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 18/23
; update layer progress
M73 L18
M991 S0 P17 ;notify layer change

; OBJECT_ID: 66
M204 S10000
G17
G3 Z3.8 I.46 J-1.126 P1  F42000
G1 X94.173 Y87.859 Z3.8
G1 Z3.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11179
M204 S5000
M73 P90 R1
G1 X94.173 Y98.062 E.31354
G1 X97.66 Y98.062 E.10715
G1 X97.66 Y101.955 E.11962
G1 X97.436 Y101.955 E.00687
G1 X97.436 Y98.486 E.10659
G1 X93.806 Y98.486 E.11155
G1 X93.806 Y87.582 E.33506
G1 X97.436 Y87.582 E.11155
G1 X97.436 Y84.014 E.10963
G1 X100.853 Y84.014 E.10498
G1 X100.853 Y84.46 E.0137
G1 X97.66 Y84.46 E.0981
G1 X97.66 Y91.257 E.20886
G1 X97.436 Y91.257 E.00687
G1 X97.436 Y87.859 E.10443
G1 X94.233 Y87.859 E.09843
; WIPE_START
G1 F12000
M204 S6000
G1 X94.221 Y89.859 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X100.562 Y85.61 Z4 F42000
G1 X108.108 Y80.554 Z4
G1 Z3.6
G1 E.8 F1800
G1 F11179
M204 S5000
G1 X114.709 Y80.554 E.20283
G1 X114.709 Y76.965 E.11029
G1 X121.185 Y76.965 E.19899
G1 X121.185 Y77.321 E.01094
G1 X115.065 Y77.321 E.18806
G1 X115.065 Y80.855 E.1086
G1 X107.864 Y80.855 E.22127
G1 X107.864 Y77.322 E.10858
G1 X104.632 Y77.322 E.09929
G1 X104.632 Y77.134 E.00578
G1 X108.108 Y77.134 E.1068
G1 X108.108 Y80.494 E.10327
; WIPE_START
G1 F12000
M204 S6000
G1 X110.108 Y80.513 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.539 Y88.124 Z4 F42000
G1 X108.525 Y101.698 Z4
G1 Z3.6
G1 E.8 F1800
G1 F11179
M204 S5000
G1 X108.525 Y95.719 E.1837
G1 X108.262 Y95.719 E.00809
G1 X108.262 Y98.076 E.07241
G1 X101.18 Y98.076 E.21762
G1 X101.18 Y92.809 E.16185
G1 X105.814 Y92.809 E.1424
G1 X105.814 Y92.604 E.00629
G1 X101.18 Y92.604 E.1424
G1 X101.18 Y87.962 E.14265
G1 X108.113 Y87.962 E.21305
G1 X108.113 Y87.523 E.01347
G1 X104.537 Y87.523 E.10988
G1 X104.537 Y80.473 E.21662
G1 X101.264 Y80.473 E.10056
G1 X101.264 Y76.898 E.10985
G1 X93.894 Y76.898 E.22648
G1 X93.894 Y77.437 E.01656
G1 X100.87 Y77.437 E.21434
G1 X100.87 Y80.859 E.10515
G1 X104.157 Y80.859 E.10102
G1 X104.157 Y87.523 E.20477
G1 X100.824 Y87.523 E.10241
G1 X100.824 Y94.622 E.21812
G1 X97.439 Y94.622 E.10402
G1 X97.439 Y95.043 E.01295
G1 X100.824 Y95.043 E.10402
G1 X100.824 Y98.519 E.10681
G1 X108.262 Y98.519 E.22854
G1 X108.262 Y102.038 E.10813
G1 X118.021 Y102.038 E.29986
G1 X118.021 Y105.345 E.10159
G1 X104.867 Y105.345 E.40417
G1 X104.867 Y101.702 E.11191
G1 X100.786 Y101.702 E.12541
G1 X100.786 Y105.11 E.10469
G1 X94.213 Y105.11 E.20195
G1 X94.213 Y101.923 E.09791
G1 X93.903 Y101.923 E.00952
G1 X93.903 Y105.573 E.11213
G1 X100.786 Y105.573 E.21147
G1 X100.786 Y108.768 E.09819
G1 X90.902 Y108.768 E.30371
G1 X90.902 Y108.366 E.01236
G1 X90.499 Y108.366 E.01236
G1 X90.499 Y84.43 E.73549
G1 X94.135 Y84.43 E.11171
G1 X94.135 Y80.855 E.10983
G1 X97.66 Y80.855 E.10832
G1 X97.66 Y80.491 E.01118
G1 X93.8 Y80.491 E.1186
G1 X93.8 Y84.075 E.1101
G1 X90.499 Y84.075 E.10142
G1 X90.499 Y74.313 E.29995
G1 X90.902 Y74.313 E.01236
G1 X90.902 Y73.911 E.01236
G1 X111.27 Y73.911 E.62585
G1 X111.27 Y77.186 E.10065
G1 X111.734 Y77.186 E.01426
G1 X111.734 Y73.911 E.10065
G1 X125.217 Y73.911 E.4143
G1 X125.217 Y74.313 E.01236
G1 X125.619 Y74.313 E.01236
G1 X125.619 Y91.237 E.52004
G1 X118.42 Y91.237 E.22121
G1 X118.42 Y98.011 E.20813
G1 X115.845 Y98.011 E.07911
G1 X115.845 Y98.616 E.01859
G1 X121.741 Y98.616 E.18116
G1 X121.741 Y105.641 E.21586
G1 X121.945 Y105.641 E.00626
G1 X121.945 Y94.648 E.3378
G1 X121.741 Y94.648 E.00626
G1 X121.741 Y98.011 E.10334
G1 X118.706 Y98.011 E.09327
G1 X118.706 Y91.647 E.19556
G1 X125.619 Y91.647 E.21244
G1 X125.619 Y108.366 E.51373
G1 X125.217 Y108.366 E.01236
G1 X125.217 Y108.768 E.01236
G1 X101.161 Y108.768 E.73916
G1 X101.161 Y101.968 E.20895
G1 X104.637 Y101.968 E.10681
G1 X104.637 Y105.69 E.11438
G1 X118.292 Y105.69 E.41956
G1 X118.292 Y101.736 E.12151
G1 X112.158 Y101.736 E.18847
G1 X112.158 Y94.918 E.20948
G1 X115.245 Y94.918 E.09485
G1 X115.245 Y87.933 E.21465
G1 X122.151 Y87.933 E.21218
G1 X122.151 Y80.585 E.22577
G1 X118.222 Y80.58 E.12073
G1 X118.222 Y84.159 E.11
G1 X107.993 Y84.159 E.31429
G1 X107.993 Y84.55 E.01202
G1 X111.829 Y84.55 E.11786
G1 X111.829 Y89.52 E.15269
G1 X112.158 Y89.52 E.01012
G1 X112.158 Y84.55 E.15269
G1 X118.576 Y84.55 E.19721
G1 X118.576 Y80.844 E.11389
G1 X121.742 Y80.844 E.09728
G1 X121.742 Y87.659 E.2094
G1 X114.824 Y87.659 E.21258
G1 X114.824 Y94.612 E.21367
G1 X111.829 Y94.612 E.09204
G1 X111.829 Y101.698 E.21772
M73 P91 R1
G1 X108.585 Y101.698 E.09967
; WIPE_START
G1 F12000
M204 S6000
G1 X108.565 Y99.698 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X112.778 Y93.334 Z4 F42000
G1 X125.726 Y73.778 Z4
G1 Z3.6
G1 E.8 F1800
G1 F11179
M204 S5000
G3 X125.8 Y73.886 I-.032 J.101 E.00433
G1 X125.8 Y108.807 E1.07303
G3 X125.687 Y108.92 I-.111 J.001 E.00546
G1 X90.249 Y108.914 E1.0889
G3 X90.177 Y108.807 I.033 J-.1 E.00425
G1 X90.178 Y73.885 E1.07304
G3 X90.29 Y73.773 I.111 J-.001 E.00546
G1 X125.666 Y73.778 E1.08699
; WIPE_START
G1 F12000
M204 S6000
G1 X125.785 Y73.823 E-.04838
G1 X125.8 Y73.886 E-.02441
G1 X125.8 Y75.694 E-.68721
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z4
G1 X0 Y90 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z4 F4000
            G39.3 S1
            G0 Z4 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X111.502 Y76.99 F42000
G1 Z3.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.11491
G1 F11179
M204 S6000
G1 X111.502 Y73.969 E.01772
; WIPE_START
G1 F15000
G1 X111.502 Y75.969 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.919 Y76.84 Z4 F42000
G1 X101.068 Y77.168 Z4
G1 Z3.6
G1 E.8 F1800
; LINE_WIDTH: 0.18966
G1 F11179
M204 S6000
G1 X94.09 Y77.168 E.08344
; WIPE_START
G1 F15000
G1 X96.09 Y77.168 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.706 Y74.043 Z4 F42000
G1 Z3.6
G1 E.8 F1800
; LINE_WIDTH: 0.19094
G1 F11179
M204 S6000
G1 X90.374 Y74.043 E.004
M204 S10000
G1 X90.374 Y108.643 F42000
; LINE_WIDTH: 0.20479
G1 F11179
M204 S6000
G1 X90.706 Y108.643 E.00438
; WIPE_START
G1 F15000
G1 X90.374 Y108.643 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.1 Y105.341 Z4 F42000
G1 Z3.6
G1 E.8 F1800
; LINE_WIDTH: 0.11373
G1 F11179
M204 S6000
G1 X100.965 Y105.341 E.03962
; WIPE_START
G1 F15000
G1 X98.965 Y105.341 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X106.023 Y102.436 Z4 F42000
G1 X116.041 Y98.313 Z4
G1 Z3.6
G1 E.8 F1800
; LINE_WIDTH: 0.25595
G1 F11179
M204 S6000
G1 X121.749 Y98.313 E.09907
; CHANGE_LAYER
; Z_HEIGHT: 3.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X119.749 Y98.313 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 19/23
; update layer progress
M73 L19
M991 S0 P18 ;notify layer change

; OBJECT_ID: 66
M204 S10000
G17
G3 Z4 I.46 J-1.126 P1  F42000
G1 X94.173 Y87.859 Z4
G1 Z3.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11179
M204 S5000
G1 X94.173 Y98.062 E.31354
G1 X97.66 Y98.062 E.10715
G1 X97.66 Y101.955 E.11962
G1 X97.436 Y101.955 E.00687
G1 X97.436 Y98.486 E.10659
G1 X93.806 Y98.486 E.11155
G1 X93.806 Y87.582 E.33506
G1 X97.436 Y87.582 E.11155
G1 X97.436 Y84.014 E.10963
G1 X100.853 Y84.014 E.10498
G1 X100.853 Y84.46 E.0137
G1 X97.66 Y84.46 E.0981
M73 P91 R0
G1 X97.66 Y91.257 E.20886
G1 X97.436 Y91.257 E.00687
G1 X97.436 Y87.859 E.10443
G1 X94.233 Y87.859 E.09843
; WIPE_START
G1 F12000
M204 S6000
G1 X94.221 Y89.859 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X100.562 Y85.61 Z4.2 F42000
G1 X108.108 Y80.554 Z4.2
G1 Z3.8
G1 E.8 F1800
G1 F11179
M204 S5000
G1 X114.709 Y80.554 E.20283
G1 X114.709 Y76.965 E.11029
G1 X121.185 Y76.965 E.19899
G1 X121.185 Y77.321 E.01094
G1 X115.065 Y77.321 E.18806
G1 X115.065 Y80.855 E.1086
G1 X107.864 Y80.855 E.22127
G1 X107.864 Y77.322 E.10858
G1 X104.632 Y77.322 E.09929
G1 X104.632 Y77.134 E.00578
G1 X108.108 Y77.134 E.1068
G1 X108.108 Y80.494 E.10327
; WIPE_START
G1 F12000
M204 S6000
G1 X110.108 Y80.513 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.539 Y88.124 Z4.2 F42000
G1 X108.525 Y101.698 Z4.2
G1 Z3.8
G1 E.8 F1800
G1 F11179
M204 S5000
G1 X108.525 Y95.719 E.1837
G1 X108.262 Y95.719 E.00809
G1 X108.262 Y98.076 E.07241
G1 X101.18 Y98.076 E.21762
G1 X101.18 Y92.809 E.16185
G1 X105.814 Y92.809 E.1424
G1 X105.814 Y92.604 E.00629
G1 X101.18 Y92.604 E.1424
M73 P92 R0
G1 X101.18 Y87.962 E.14265
G1 X108.113 Y87.962 E.21305
G1 X108.113 Y87.523 E.01347
G1 X104.537 Y87.523 E.10988
G1 X104.537 Y80.473 E.21662
G1 X101.264 Y80.473 E.10056
G1 X101.264 Y76.898 E.10985
G1 X93.894 Y76.898 E.22648
G1 X93.894 Y77.437 E.01656
G1 X100.87 Y77.437 E.21434
G1 X100.87 Y80.859 E.10515
G1 X104.157 Y80.859 E.10102
G1 X104.157 Y87.523 E.20477
G1 X100.824 Y87.523 E.10241
G1 X100.824 Y94.622 E.21812
G1 X97.439 Y94.622 E.10402
G1 X97.439 Y95.043 E.01295
G1 X100.824 Y95.043 E.10402
G1 X100.824 Y98.519 E.10681
G1 X108.262 Y98.519 E.22854
G1 X108.262 Y102.038 E.10813
G1 X118.021 Y102.038 E.29986
G1 X118.021 Y105.345 E.10159
G1 X104.867 Y105.345 E.40417
G1 X104.867 Y101.702 E.11191
G1 X100.786 Y101.702 E.12541
G1 X100.786 Y105.11 E.10469
G1 X94.213 Y105.11 E.20195
G1 X94.213 Y101.923 E.09791
G1 X93.903 Y101.923 E.00952
G1 X93.903 Y105.573 E.11213
G1 X100.786 Y105.573 E.21147
G1 X100.786 Y108.768 E.09819
G1 X90.902 Y108.768 E.30371
G1 X90.902 Y108.366 E.01236
G1 X90.499 Y108.366 E.01236
G1 X90.499 Y84.43 E.73549
G1 X94.135 Y84.43 E.11171
G1 X94.135 Y80.855 E.10983
G1 X97.66 Y80.855 E.10832
G1 X97.66 Y80.491 E.01118
G1 X93.8 Y80.491 E.1186
G1 X93.8 Y84.075 E.1101
G1 X90.499 Y84.075 E.10142
G1 X90.499 Y74.313 E.29995
G1 X90.902 Y74.313 E.01236
G1 X90.902 Y73.911 E.01236
G1 X111.27 Y73.911 E.62585
G1 X111.27 Y77.186 E.10065
G1 X111.734 Y77.186 E.01426
G1 X111.734 Y73.911 E.10065
G1 X125.217 Y73.911 E.4143
G1 X125.217 Y74.313 E.01236
G1 X125.619 Y74.313 E.01236
G1 X125.619 Y91.237 E.52004
G1 X118.42 Y91.237 E.22121
G1 X118.42 Y98.011 E.20813
G1 X115.845 Y98.011 E.07911
G1 X115.845 Y98.616 E.01859
G1 X121.741 Y98.616 E.18116
G1 X121.741 Y105.641 E.21586
G1 X121.945 Y105.641 E.00626
G1 X121.945 Y94.648 E.3378
G1 X121.741 Y94.648 E.00626
G1 X121.741 Y98.011 E.10334
G1 X118.706 Y98.011 E.09327
G1 X118.706 Y91.647 E.19556
G1 X125.619 Y91.647 E.21244
G1 X125.619 Y108.366 E.51373
G1 X125.217 Y108.366 E.01236
G1 X125.217 Y108.768 E.01236
G1 X101.161 Y108.768 E.73916
G1 X101.161 Y101.968 E.20895
G1 X104.637 Y101.968 E.10681
G1 X104.637 Y105.69 E.11438
G1 X118.292 Y105.69 E.41956
G1 X118.292 Y101.736 E.12151
G1 X112.158 Y101.736 E.18847
G1 X112.158 Y94.918 E.20948
G1 X115.245 Y94.918 E.09485
G1 X115.245 Y87.933 E.21465
G1 X122.151 Y87.933 E.21218
G1 X122.151 Y80.585 E.22577
G1 X118.222 Y80.58 E.12073
G1 X118.222 Y84.159 E.11
G1 X107.993 Y84.159 E.31429
G1 X107.993 Y84.55 E.01202
G1 X111.829 Y84.55 E.11786
G1 X111.829 Y89.52 E.15269
G1 X112.158 Y89.52 E.01012
G1 X112.158 Y84.55 E.15269
G1 X118.576 Y84.55 E.19721
G1 X118.576 Y80.844 E.11389
G1 X121.742 Y80.844 E.09728
G1 X121.742 Y87.659 E.2094
G1 X114.824 Y87.659 E.21258
G1 X114.824 Y94.612 E.21367
G1 X111.829 Y94.612 E.09204
G1 X111.829 Y101.698 E.21772
G1 X108.585 Y101.698 E.09967
; WIPE_START
G1 F12000
M204 S6000
G1 X108.565 Y99.698 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X112.778 Y93.334 Z4.2 F42000
G1 X125.726 Y73.778 Z4.2
G1 Z3.8
G1 E.8 F1800
G1 F11179
M204 S5000
G3 X125.8 Y73.886 I-.032 J.101 E.00433
G1 X125.8 Y108.807 E1.07303
G3 X125.687 Y108.92 I-.111 J.001 E.00546
G1 X90.29 Y108.92 E1.08764
G3 X90.177 Y108.807 I-.007 J-.106 E.00554
G1 X90.178 Y73.886 E1.07303
G3 X90.29 Y73.773 I.111 J-.001 E.00546
G1 X125.666 Y73.776 E1.087
; WIPE_START
G1 F12000
M204 S6000
G1 X125.785 Y73.823 E-.04853
G1 X125.8 Y73.886 E-.02444
G1 X125.8 Y75.694 E-.68703
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.2 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z4.2
G1 X0 Y90 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z4.2 F4000
            G39.3 S1
            G0 Z4.2 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X111.502 Y76.99 F42000
G1 Z3.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.11491
G1 F11179
M204 S6000
G1 X111.502 Y73.969 E.01772
; WIPE_START
G1 F15000
G1 X111.502 Y75.969 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.919 Y76.84 Z4.2 F42000
G1 X101.068 Y77.168 Z4.2
G1 Z3.8
G1 E.8 F1800
; LINE_WIDTH: 0.18966
G1 F11179
M204 S6000
G1 X94.09 Y77.168 E.08344
; WIPE_START
G1 F15000
G1 X96.09 Y77.168 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.706 Y74.043 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
; LINE_WIDTH: 0.19094
G1 F11179
M204 S6000
M73 P93 R0
G1 X90.374 Y74.043 E.004
M204 S10000
G1 X90.374 Y108.643 F42000
; LINE_WIDTH: 0.20479
G1 F11179
M204 S6000
G1 X90.706 Y108.643 E.00438
; WIPE_START
G1 F15000
G1 X90.374 Y108.643 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.1 Y105.341 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
; LINE_WIDTH: 0.11373
G1 F11179
M204 S6000
G1 X100.965 Y105.341 E.03962
; WIPE_START
G1 F15000
G1 X98.965 Y105.341 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X106.023 Y102.436 Z4.2 F42000
G1 X116.041 Y98.313 Z4.2
G1 Z3.8
G1 E.8 F1800
; LINE_WIDTH: 0.25595
G1 F11179
M204 S6000
G1 X121.749 Y98.313 E.09907
; CHANGE_LAYER
; Z_HEIGHT: 4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X119.749 Y98.313 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 20/23
; update layer progress
M73 L20
M991 S0 P19 ;notify layer change

; OBJECT_ID: 66
M204 S10000
G17
G3 Z4.2 I.46 J-1.126 P1  F42000
G1 X94.173 Y87.859 Z4.2
G1 Z4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11179
M204 S5000
G1 X94.173 Y98.062 E.31354
G1 X97.66 Y98.062 E.10715
G1 X97.66 Y101.955 E.11962
G1 X97.436 Y101.955 E.00687
G1 X97.436 Y98.486 E.10659
G1 X93.806 Y98.486 E.11155
G1 X93.806 Y87.582 E.33506
G1 X97.436 Y87.582 E.11155
G1 X97.436 Y84.014 E.10963
G1 X100.853 Y84.014 E.10498
G1 X100.853 Y84.46 E.0137
G1 X97.66 Y84.46 E.0981
G1 X97.66 Y91.257 E.20886
G1 X97.436 Y91.257 E.00687
G1 X97.436 Y87.859 E.10443
G1 X94.233 Y87.859 E.09843
; WIPE_START
G1 F12000
M204 S6000
G1 X94.221 Y89.859 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X100.562 Y85.61 Z4.4 F42000
G1 X108.108 Y80.554 Z4.4
G1 Z4
G1 E.8 F1800
G1 F11179
M204 S5000
G1 X114.709 Y80.554 E.20283
G1 X114.709 Y76.965 E.11029
G1 X121.185 Y76.965 E.19899
G1 X121.185 Y77.321 E.01094
G1 X115.065 Y77.321 E.18806
G1 X115.065 Y80.855 E.1086
G1 X107.864 Y80.855 E.22127
G1 X107.864 Y77.322 E.10858
G1 X104.632 Y77.322 E.09929
G1 X104.632 Y77.134 E.00578
G1 X108.108 Y77.134 E.1068
G1 X108.108 Y80.494 E.10327
; WIPE_START
G1 F12000
M204 S6000
G1 X110.108 Y80.513 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.539 Y88.124 Z4.4 F42000
G1 X108.525 Y101.698 Z4.4
G1 Z4
G1 E.8 F1800
G1 F11179
M204 S5000
G1 X108.525 Y95.719 E.1837
G1 X108.262 Y95.719 E.00809
G1 X108.262 Y98.076 E.07241
G1 X101.18 Y98.076 E.21762
G1 X101.18 Y92.809 E.16185
G1 X105.814 Y92.809 E.1424
G1 X105.814 Y92.604 E.00629
G1 X101.18 Y92.604 E.1424
G1 X101.18 Y87.962 E.14265
G1 X108.113 Y87.962 E.21305
G1 X108.113 Y87.523 E.01347
G1 X104.537 Y87.523 E.10988
G1 X104.537 Y80.473 E.21662
G1 X101.264 Y80.473 E.10056
G1 X101.264 Y76.898 E.10985
G1 X93.894 Y76.898 E.22648
G1 X93.894 Y77.437 E.01656
G1 X100.87 Y77.437 E.21434
G1 X100.87 Y80.859 E.10515
G1 X104.157 Y80.859 E.10102
G1 X104.157 Y87.523 E.20477
G1 X100.824 Y87.523 E.10241
G1 X100.824 Y94.622 E.21812
G1 X97.439 Y94.622 E.10402
G1 X97.439 Y95.043 E.01295
G1 X100.824 Y95.043 E.10402
G1 X100.824 Y98.519 E.10681
G1 X108.262 Y98.519 E.22854
G1 X108.262 Y102.038 E.10813
G1 X118.021 Y102.038 E.29986
G1 X118.021 Y105.345 E.10159
G1 X104.867 Y105.345 E.40417
G1 X104.867 Y101.702 E.11191
G1 X100.786 Y101.702 E.12541
G1 X100.786 Y105.11 E.10469
G1 X94.213 Y105.11 E.20195
G1 X94.213 Y101.923 E.09791
G1 X93.903 Y101.923 E.00952
G1 X93.903 Y105.573 E.11213
G1 X100.786 Y105.573 E.21147
G1 X100.786 Y108.768 E.09819
G1 X90.902 Y108.768 E.30371
G1 X90.902 Y108.366 E.01236
G1 X90.499 Y108.366 E.01236
G1 X90.499 Y84.43 E.73549
G1 X94.135 Y84.43 E.11171
G1 X94.135 Y80.855 E.10983
G1 X97.66 Y80.855 E.10832
G1 X97.66 Y80.491 E.01118
G1 X93.8 Y80.491 E.1186
G1 X93.8 Y84.075 E.1101
G1 X90.499 Y84.075 E.10142
G1 X90.499 Y74.313 E.29995
G1 X90.902 Y74.313 E.01236
G1 X90.902 Y73.911 E.01236
G1 X111.27 Y73.911 E.62585
G1 X111.27 Y77.186 E.10065
G1 X111.734 Y77.186 E.01426
G1 X111.734 Y73.911 E.10065
G1 X125.217 Y73.911 E.4143
G1 X125.217 Y74.313 E.01236
G1 X125.619 Y74.313 E.01236
G1 X125.619 Y91.237 E.52004
G1 X118.42 Y91.237 E.22121
G1 X118.42 Y98.011 E.20813
G1 X115.845 Y98.011 E.07911
G1 X115.845 Y98.616 E.01859
G1 X121.741 Y98.616 E.18116
G1 X121.741 Y105.641 E.21586
G1 X121.945 Y105.641 E.00626
G1 X121.945 Y94.648 E.3378
G1 X121.741 Y94.648 E.00626
G1 X121.741 Y98.011 E.10334
G1 X118.706 Y98.011 E.09327
G1 X118.706 Y91.647 E.19556
G1 X125.619 Y91.647 E.21244
M73 P94 R0
G1 X125.619 Y108.366 E.51373
G1 X125.217 Y108.366 E.01236
G1 X125.217 Y108.768 E.01236
G1 X101.161 Y108.768 E.73916
G1 X101.161 Y101.968 E.20895
G1 X104.637 Y101.968 E.10681
G1 X104.637 Y105.69 E.11438
G1 X118.292 Y105.69 E.41956
G1 X118.292 Y101.736 E.12151
G1 X112.158 Y101.736 E.18847
G1 X112.158 Y94.918 E.20948
G1 X115.245 Y94.918 E.09485
G1 X115.245 Y87.933 E.21465
G1 X122.151 Y87.933 E.21218
G1 X122.151 Y80.585 E.22577
G1 X118.222 Y80.58 E.12073
G1 X118.222 Y84.159 E.11
G1 X107.993 Y84.159 E.31429
G1 X107.993 Y84.55 E.01202
G1 X111.829 Y84.55 E.11786
G1 X111.829 Y89.52 E.15269
G1 X112.158 Y89.52 E.01012
G1 X112.158 Y84.55 E.15269
G1 X118.576 Y84.55 E.19721
G1 X118.576 Y80.844 E.11389
G1 X121.742 Y80.844 E.09728
G1 X121.742 Y87.659 E.2094
G1 X114.824 Y87.659 E.21258
G1 X114.824 Y94.612 E.21367
G1 X111.829 Y94.612 E.09204
G1 X111.829 Y101.698 E.21772
G1 X108.585 Y101.698 E.09967
; WIPE_START
G1 F12000
M204 S6000
G1 X108.565 Y99.698 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X112.774 Y93.331 Z4.4 F42000
G1 X125.702 Y73.775 Z4.4
G1 Z4
G1 E.8 F1800
G1 F11179
M204 S5000
G3 X125.8 Y73.886 I-.011 J.108 E.00499
G1 X125.8 Y108.807 E1.07303
G3 X125.687 Y108.92 I-.111 J.001 E.00547
G1 X90.29 Y108.92 E1.08764
G3 X90.177 Y108.807 I-.007 J-.106 E.00554
G1 X90.178 Y73.886 E1.07303
G3 X90.29 Y73.773 I.111 J-.001 E.00546
G1 X125.642 Y73.775 E1.08626
; WIPE_START
G1 F12000
M204 S6000
G1 X125.769 Y73.803 E-.04958
G1 X125.8 Y73.886 E-.03345
G1 X125.8 Y75.667 E-.67697
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.4 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z4.4
G1 X0 Y90 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z4.4 F4000
            G39.3 S1
            G0 Z4.4 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X111.502 Y76.99 F42000
G1 Z4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.11491
G1 F11179
M204 S6000
G1 X111.502 Y73.969 E.01772
; WIPE_START
G1 F15000
G1 X111.502 Y75.969 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.919 Y76.84 Z4.4 F42000
G1 X101.068 Y77.168 Z4.4
G1 Z4
G1 E.8 F1800
; LINE_WIDTH: 0.18966
G1 F11179
M204 S6000
G1 X94.09 Y77.168 E.08344
; WIPE_START
G1 F15000
G1 X96.09 Y77.168 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.706 Y74.043 Z4.4 F42000
G1 Z4
G1 E.8 F1800
; LINE_WIDTH: 0.19094
G1 F11179
M204 S6000
G1 X90.374 Y74.043 E.004
M204 S10000
G1 X90.374 Y108.643 F42000
; LINE_WIDTH: 0.20479
G1 F11179
M204 S6000
G1 X90.706 Y108.643 E.00438
; WIPE_START
G1 F15000
G1 X90.374 Y108.643 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.1 Y105.341 Z4.4 F42000
G1 Z4
G1 E.8 F1800
; LINE_WIDTH: 0.11373
G1 F11179
M204 S6000
G1 X100.965 Y105.341 E.03962
; WIPE_START
G1 F15000
G1 X98.965 Y105.341 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X106.023 Y102.436 Z4.4 F42000
G1 X116.041 Y98.313 Z4.4
G1 Z4
G1 E.8 F1800
; LINE_WIDTH: 0.25595
G1 F11179
M204 S6000
G1 X121.749 Y98.313 E.09907
; CHANGE_LAYER
; Z_HEIGHT: 4.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X119.749 Y98.313 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 21/23
; update layer progress
M73 L21
M991 S0 P20 ;notify layer change

; OBJECT_ID: 66
M204 S10000
G17
G3 Z4.4 I.46 J-1.126 P1  F42000
G1 X94.173 Y87.859 Z4.4
G1 Z4.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11260
M204 S5000
G1 X94.173 Y98.062 E.31354
G1 X97.66 Y98.062 E.10715
G1 X97.66 Y101.955 E.11962
G1 X97.436 Y101.955 E.00687
G1 X97.436 Y98.486 E.10659
G1 X93.806 Y98.486 E.11155
G1 X93.806 Y87.582 E.33506
G1 X97.436 Y87.582 E.11155
G1 X97.436 Y84.014 E.10963
G1 X100.853 Y84.014 E.10498
G1 X100.853 Y84.46 E.0137
G1 X97.66 Y84.46 E.0981
G1 X97.66 Y91.257 E.20886
G1 X97.436 Y91.257 E.00687
M73 P95 R0
G1 X97.436 Y87.859 E.10443
G1 X94.233 Y87.859 E.09843
; WIPE_START
G1 F12000
M204 S6000
G1 X94.221 Y89.859 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X100.562 Y85.61 Z4.6 F42000
G1 X108.108 Y80.554 Z4.6
G1 Z4.2
G1 E.8 F1800
G1 F11260
M204 S5000
G1 X114.709 Y80.554 E.20283
G1 X114.709 Y76.965 E.11029
G1 X121.185 Y76.965 E.19899
G1 X121.185 Y77.321 E.01094
G1 X115.065 Y77.321 E.18806
G1 X115.065 Y80.855 E.1086
G1 X107.864 Y80.855 E.22127
G1 X107.864 Y77.322 E.10858
G1 X104.632 Y77.322 E.09929
G1 X104.632 Y77.134 E.00578
G1 X108.108 Y77.134 E.1068
G1 X108.108 Y80.494 E.10327
; WIPE_START
G1 F12000
M204 S6000
G1 X110.108 Y80.513 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.539 Y88.124 Z4.6 F42000
G1 X108.525 Y101.698 Z4.6
G1 Z4.2
G1 E.8 F1800
G1 F11260
M204 S5000
G1 X108.525 Y95.719 E.1837
G1 X108.262 Y95.719 E.00809
G1 X108.262 Y98.076 E.07241
G1 X101.18 Y98.076 E.21762
G1 X101.18 Y92.809 E.16185
G1 X105.814 Y92.809 E.1424
G1 X105.814 Y92.604 E.00629
G1 X101.18 Y92.604 E.1424
G1 X101.18 Y87.962 E.14265
G1 X108.113 Y87.962 E.21305
G1 X108.113 Y87.523 E.01347
G1 X104.537 Y87.523 E.10988
G1 X104.537 Y80.473 E.21662
G1 X101.264 Y80.473 E.10056
G1 X101.264 Y76.898 E.10985
G1 X93.894 Y76.898 E.22648
G1 X93.894 Y77.437 E.01656
G1 X100.87 Y77.437 E.21434
G1 X100.87 Y80.859 E.10515
G1 X104.157 Y80.859 E.10102
G1 X104.157 Y87.523 E.20477
G1 X100.824 Y87.523 E.10241
G1 X100.824 Y94.622 E.21812
G1 X97.439 Y94.622 E.10402
G1 X97.439 Y95.043 E.01295
G1 X100.824 Y95.043 E.10402
G1 X100.824 Y98.519 E.10681
G1 X108.262 Y98.519 E.22854
G1 X108.262 Y102.038 E.10813
G1 X118.021 Y102.038 E.29986
G1 X118.021 Y105.345 E.10159
G1 X104.867 Y105.345 E.40417
G1 X104.867 Y101.702 E.11191
G1 X100.786 Y101.702 E.12541
G1 X100.786 Y105.11 E.10469
G1 X94.213 Y105.11 E.20195
G1 X94.213 Y101.923 E.09791
G1 X93.903 Y101.923 E.00952
G1 X93.903 Y105.573 E.11213
G1 X100.786 Y105.573 E.21147
G1 X100.786 Y108.768 E.09819
G1 X90.902 Y108.768 E.30371
G1 X90.902 Y108.366 E.01236
G1 X90.499 Y108.366 E.01236
G1 X90.499 Y84.43 E.73549
G1 X94.135 Y84.43 E.11171
G1 X94.135 Y80.855 E.10983
G1 X97.66 Y80.855 E.10832
G1 X97.66 Y80.491 E.01118
G1 X93.8 Y80.491 E.1186
G1 X93.8 Y84.075 E.1101
G1 X90.499 Y84.075 E.10142
G1 X90.499 Y74.313 E.29995
G1 X90.902 Y74.313 E.01236
G1 X90.902 Y73.911 E.01236
G1 X111.27 Y73.911 E.62585
G1 X111.27 Y77.186 E.10065
G1 X111.734 Y77.186 E.01426
G1 X111.734 Y73.911 E.10065
G1 X125.217 Y73.911 E.4143
G1 X125.217 Y74.313 E.01236
G1 X125.619 Y74.313 E.01236
G1 X125.619 Y91.237 E.52004
G1 X118.42 Y91.237 E.22121
G1 X118.42 Y98.011 E.20813
G1 X115.845 Y98.011 E.07911
G1 X115.845 Y98.616 E.01859
G1 X121.741 Y98.616 E.18116
G1 X121.741 Y105.641 E.21586
G1 X121.945 Y105.641 E.00626
G1 X121.945 Y94.648 E.3378
G1 X121.741 Y94.648 E.00626
G1 X121.741 Y98.011 E.10334
G1 X118.706 Y98.011 E.09327
G1 X118.706 Y91.647 E.19556
G1 X125.619 Y91.647 E.21244
G1 X125.619 Y108.366 E.51373
G1 X125.217 Y108.366 E.01236
G1 X125.217 Y108.768 E.01236
G1 X101.161 Y108.768 E.73916
G1 X101.161 Y101.968 E.20895
G1 X104.637 Y101.968 E.10681
G1 X104.637 Y105.69 E.11438
G1 X118.292 Y105.69 E.41956
G1 X118.292 Y101.736 E.12151
G1 X112.158 Y101.736 E.18847
G1 X112.158 Y94.918 E.20948
G1 X115.245 Y94.918 E.09485
G1 X115.245 Y87.933 E.21465
G1 X122.151 Y87.933 E.21218
G1 X122.151 Y80.585 E.22577
G1 X118.222 Y80.58 E.12073
G1 X118.222 Y84.159 E.11
G1 X107.993 Y84.159 E.31429
G1 X107.993 Y84.55 E.01202
G1 X111.829 Y84.55 E.11786
G1 X111.829 Y89.52 E.15269
G1 X112.158 Y89.52 E.01012
G1 X112.158 Y84.55 E.15269
G1 X118.576 Y84.55 E.19721
G1 X118.576 Y80.844 E.11389
G1 X121.742 Y80.844 E.09728
G1 X121.742 Y87.659 E.2094
G1 X114.824 Y87.659 E.21258
G1 X114.824 Y94.612 E.21367
G1 X111.829 Y94.612 E.09204
G1 X111.829 Y101.698 E.21772
G1 X108.585 Y101.698 E.09967
; WIPE_START
G1 F12000
M204 S6000
G1 X108.565 Y99.698 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X112.775 Y93.331 Z4.6 F42000
G1 X125.705 Y73.775 Z4.6
G1 Z4.2
G1 E.8 F1800
G1 F11260
M204 S5000
G3 X125.8 Y73.886 I-.014 J.108 E.0049
G1 X125.8 Y108.807 E1.07303
G3 X125.687 Y108.92 I-.111 J.001 E.00546
G1 X90.29 Y108.92 E1.08764
G3 X90.177 Y108.807 I-.001 J-.111 E.00546
G1 X90.178 Y73.885 E1.07304
G3 X90.29 Y73.773 I.111 J-.001 E.00545
G1 X125.645 Y73.775 E1.08635
; WIPE_START
G1 F12000
M204 S6000
G1 X125.769 Y73.803 E-.04852
G1 X125.8 Y73.886 E-.03346
M73 P96 R0
G1 X125.8 Y75.67 E-.67803
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.6 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z4.6
G1 X0 Y90 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z4.6 F4000
            G39.3 S1
            G0 Z4.6 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X111.502 Y74.406 F42000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.11491
G1 F11260
M204 S6000
G1 X111.502 Y76.99 E.01516
; WIPE_START
G1 F15000
G1 X111.502 Y74.99 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.03 Y76.549 Z4.6 F42000
G1 X101.068 Y77.168 Z4.6
G1 Z4.2
G1 E.8 F1800
; LINE_WIDTH: 0.18966
G1 F11260
M204 S6000
G1 X94.09 Y77.168 E.08344
; WIPE_START
G1 F15000
G1 X96.09 Y77.168 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.706 Y74.043 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; LINE_WIDTH: 0.190926
G1 F11260
M204 S6000
G1 X90.374 Y74.043 E.004
; WIPE_START
G1 F15000
G1 X90.706 Y74.043 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.632 Y81.675 Z4.6 F42000
G1 X90.374 Y108.643 Z4.6
G1 Z4.2
G1 E.8 F1800
; LINE_WIDTH: 0.20479
G1 F11260
M204 S6000
G1 X90.706 Y108.643 E.00438
; WIPE_START
G1 F15000
G1 X90.374 Y108.643 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.1 Y105.341 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; LINE_WIDTH: 0.11373
G1 F11260
M204 S6000
G1 X100.965 Y105.341 E.03962
; WIPE_START
G1 F15000
G1 X98.965 Y105.341 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X106.023 Y102.436 Z4.6 F42000
G1 X116.041 Y98.313 Z4.6
G1 Z4.2
G1 E.8 F1800
; LINE_WIDTH: 0.25595
G1 F11260
M204 S6000
G1 X121.749 Y98.313 E.09907
; CHANGE_LAYER
; Z_HEIGHT: 4.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X119.749 Y98.313 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 22/23
; update layer progress
M73 L22
M991 S0 P21 ;notify layer change

M106 S204
; OBJECT_ID: 66
M204 S10000
G17
G3 Z4.6 I.778 J-.936 P1  F42000
G1 X90.898 Y74.334 Z4.6
G1 Z4.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.378512
G1 F1200
M204 S5000
G1 X90.898 Y74.31 E.00065
G1 X90.91 Y74.31 E.00031
; WIPE_START
G1 F12000
M204 S6000
G1 X90.898 Y74.31 E-.38
G1 X90.91 Y74.31 E-.38
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.913 Y81.942 Z4.8 F42000
G1 X90.922 Y108.345 Z4.8
G1 Z4.4
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X90.922 Y108.369 E.00065
G1 X90.911 Y108.369 E.00031
; WIPE_START
G1 F12000
M204 S6000
G1 X90.922 Y108.369 E-.38
G1 X90.911 Y108.369 E-.38
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.543 Y108.363 Z4.8 F42000
G1 X125.196 Y108.345 Z4.8
G1 Z4.4
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X125.22 Y108.345 E.00065
G1 X125.22 Y108.356 E.00031
; WIPE_START
G1 F12000
M204 S6000
G1 X125.22 Y108.345 E-.38
G1 X125.22 Y108.356 E-.38
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.22 Y100.724 Z4.8 F42000
G1 X125.22 Y74.31 Z4.8
G1 Z4.4
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X125.22 Y74.334 E.00065
G1 X125.209 Y74.334 E.00031
; WIPE_START
G1 F12000
M204 S6000
G1 X125.22 Y74.334 E-.38
G1 X125.209 Y74.334 E-.38
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.8 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z4.8
G1 X0 Y90 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z4.8 F4000
            G39.3 S1
            G0 Z4.8 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




; CHANGE_LAYER
; Z_HEIGHT: 4.6
; LAYER_HEIGHT: 0.2
; layer num/total_layer_count: 23/23
; update layer progress
M73 L23
M991 S0 P22 ;notify layer change

; OBJECT_ID: 66
G1 X125.196 Y108.345 F42000
G1 Z4.6
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X125.22 Y108.345 E.00065
G1 X125.22 Y108.356 E.00031
; WIPE_START
G1 F12000
M204 S6000
G1 X125.22 Y108.345 E-.38
G1 X125.22 Y108.356 E-.38
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.22 Y100.724 Z5 F42000
G1 X125.22 Y74.31 Z5
G1 Z4.6
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X125.22 Y74.334 E.00065
G1 X125.209 Y74.334 E.00031
; WIPE_START
G1 F12000
M204 S6000
G1 X125.22 Y74.334 E-.38
G1 X125.209 Y74.334 E-.38
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.576 Y74.328 Z5 F42000
G1 X90.922 Y74.31 Z5
G1 Z4.6
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X90.922 Y74.334 E.00065
G1 X90.911 Y74.334 E.00031
; WIPE_START
G1 F12000
M204 S6000
G1 X90.922 Y74.334 E-.38
G1 X90.911 Y74.334 E-.38
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.913 Y81.966 Z5 F42000
G1 X90.922 Y108.345 Z5
M73 P97 R0
G1 Z4.6
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X90.922 Y108.369 E.00065
G1 X90.911 Y108.369 E.00031
; WIPE_START
G1 F12000
M204 S6000
G1 X90.922 Y108.369 E-.38
G1 X90.911 Y108.369 E-.38
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z5
G1 X0 Y90 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z5 F4000
            G39.3 S1
            G0 Z5 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




; close powerlost recovery
M1003 S0
M106 S0
M106 P2 S0
M981 S0 P20000 ; close spaghetti detector
; FEATURE: Custom
; MACHINE_END_GCODE_START
; filament end gcode 

;===== date: 20231229 =====================
;turn off nozzle clog detect
G392 S0

M400 ; wait for buffer to clear
G92 E0 ; zero the extruder
G1 E-0.8 F1800 ; retract
G1 Z5.1 F900 ; lower z a little
G1 X0 Y90 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos

M1002 judge_flag timelapse_record_flag
M622 J1
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M991 S0 P-1 ;end timelapse at safe pos
M623


M140 S0 ; turn off bed
M106 S0 ; turn off fan
M106 P2 S0 ; turn off remote part cooling fan
M106 P3 S0 ; turn off chamber cooling fan

;G1 X27 F15000 ; wipe

; pull back filament to AMS
M620 S255
G1 X181 F12000
T255
G1 X0 F18000
G1 X-13.0 F3000
G1 X0 F18000 ; wipe
M621 S255

M104 S0 ; turn off hotend

M400 ; wait all motion done
M17 S
M17 Z0.4 ; lower z motor current to reduce impact if there is something in the bottom

    G1 Z104.6 F600
    G1 Z102.6

M400 P100
M17 R ; restore z current

G90
G1 X-13 Y180 F3600

G91
G1 Z-1 F600
G90
M83

M220 S100  ; Reset feedrate magnitude
M201.2 K1.0 ; Reset acc magnitude
M73.2   R1.0 ;Reset left time magnitude
M1002 set_gcode_claim_speed_level : 0

;=====printer finish  sound=========
M17
M400 S1
M1006 S1
M1006 A0 B20 L100 C37 D20 M100 E42 F20 N100
M1006 A0 B10 L100 C44 D10 M100 E44 F10 N100
M1006 A0 B10 L100 C46 D10 M100 E46 F10 N100
M1006 A44 B20 L100 C39 D20 M100 E48 F20 N100
M1006 A0 B10 L100 C44 D10 M100 E44 F10 N100
M1006 A0 B10 L100 C0 D10 M100 E0 F10 N100
M1006 A0 B10 L100 C39 D10 M100 E39 F10 N100
M1006 A0 B10 L100 C0 D10 M100 E0 F10 N100
M1006 A0 B10 L100 C44 D10 M100 E44 F10 N100
M1006 A0 B10 L100 C0 D10 M100 E0 F10 N100
M1006 A0 B10 L100 C39 D10 M100 E39 F10 N100
M1006 A0 B10 L100 C0 D10 M100 E0 F10 N100
M1006 A44 B10 L100 C0 D10 M100 E48 F10 N100
M1006 A0 B10 L100 C0 D10 M100 E0 F10 N100
M1006 A44 B20 L100 C41 D20 M100 E49 F20 N100
M1006 A0 B20 L100 C0 D20 M100 E0 F20 N100
M1006 A0 B20 L100 C37 D20 M100 E37 F20 N100
M1006 W
;=====printer finish  sound=========
M400 S1
M18 X Y Z
M73 P100 R0
; EXECUTABLE_BLOCK_END

