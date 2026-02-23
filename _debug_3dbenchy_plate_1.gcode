; HEADER_BLOCK_START
; BambuStudio 02.03.00.70
; model printing time: 12m 14s; total estimated time: 18m 12s
; total layer number: 111
; total filament length [mm] : 521.12
; total filament volume [cm^3] : 1253.44
; total filament weight [g] : 1.58
; filament_density: 1.26
; filament_diameter: 1.75
; max_z_height: 22.10
; filament: 1
; HEADER_BLOCK_END

; CONFIG_BLOCK_START
; accel_to_decel_enable = 0
; accel_to_decel_factor = 50%
; activate_air_filtration = 0
; additional_cooling_fan_speed = 70
; apply_scarf_seam_on_circles = 1
; apply_top_surface_compensation = 0
; auxiliary_fan = 0
; avoid_crossing_wall_includes_support = 0
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
; change_filament_gcode = ;===== A1mini 20250822 =====\nG392 S0\nM1007 S0\nM620 S[next_extruder]A\nM204 S9000\nG1 Z{max_layer_z + 3.0} F1200\n\nM400\nM106 P1 S0\nM106 P2 S0\n{if nozzle_temperature[previous_extruder] > 142 && next_extruder < 255}\nM104 S{nozzle_temperature[previous_extruder]}\n{endif}\n\nG1 X180 F18000\n\n{if long_retractions_when_cut[previous_extruder]}\nM620.11 S1 I[previous_extruder] E-{retraction_distances_when_cut[previous_extruder]} F1200\n{else}\nM620.11 S0\n{endif}\nM400\n\nM620.1 E F{flush_volumetric_speeds[previous_extruder]/2.4053*60} T{flush_temperatures[previous_extruder]}\nM620.10 A0 F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\nT[next_extruder]\nM620.1 E F{flush_volumetric_speeds[next_extruder]/2.4053*60} T{flush_temperatures[next_extruder]}\nM620.10 A1 F{flush_volumetric_speeds[next_extruder]/2.4053*60} L[flush_length] H[nozzle_diameter] T{flush_temperatures[next_extruder]}\n\nG1 Y90 F9000\n\n{if next_extruder < 255}\n\n{if long_retractions_when_cut[previous_extruder]}\nM620.11 S1 I[previous_extruder] E{retraction_distances_when_cut[previous_extruder]} F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\nM628 S1\nG92 E0\nG1 E{retraction_distances_when_cut[previous_extruder]} F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\nM400\nM629 S1\n{else}\nM620.11 S0\n{endif}\n\nM400\nG92 E0\nM628 S0\n\n{if flush_length_1 > 1}\n; FLUSH_START\n; always use highest temperature to flush\nM400\nM1002 set_filament_type:UNKNOWN\nM109 S[flush_temperatures[next_extruder]]\nM106 P1 S60\n{if flush_length_1 > 23.7}\nG1 E23.7 F{flush_volumetric_speeds[previous_extruder]/2.4053*60} ; do not need pulsatile flushing for start part\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\n{else}\nG1 E{flush_length_1} F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\n{endif}\n; FLUSH_END\nG1 E-[old_retract_length_toolchange] F1800\nG1 E[old_retract_length_toolchange] F300\nM400\nM1002 set_filament_type:{filament_type[next_extruder]}\n{endif}\n\n{if flush_length_1 > 45 && flush_length_2 > 1}\n; WIPE\nM400\nM106 P1 S178\nM400 S3\nG1 X-3.5 F18000\nG1 X-13.5 F3000\nG1 X-3.5 F18000\nG1 X-13.5 F3000\nG1 X-3.5 F18000\nG1 X-13.5 F3000\nM400\nM106 P1 S0\n{endif}\n\n{if flush_length_2 > 1}\nM106 P1 S60\n; FLUSH_START\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\n; FLUSH_END\nG1 E-[new_retract_length_toolchange] F1800\nG1 E[new_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_2 > 45 && flush_length_3 > 1}\n; WIPE\nM400\nM106 P1 S178\nM400 S3\nG1 X-3.5 F18000\nG1 X-13.5 F3000\nG1 X-3.5 F18000\nG1 X-13.5 F3000\nG1 X-3.5 F18000\nG1 X-13.5 F3000\nM400\nM106 P1 S0\n{endif}\n\n{if flush_length_3 > 1}\nM106 P1 S60\n; FLUSH_START\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\n; FLUSH_END\nG1 E-[new_retract_length_toolchange] F1800\nG1 E[new_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_3 > 45 && flush_length_4 > 1}\n; WIPE\nM400\nM106 P1 S178\nM400 S3\nG1 X-3.5 F18000\nG1 X-13.5 F3000\nG1 X-3.5 F18000\nG1 X-13.5 F3000\nG1 X-3.5 F18000\nG1 X-13.5 F3000\nM400\nM106 P1 S0\n{endif}\n\n{if flush_length_4 > 1}\nM106 P1 S60\n; FLUSH_START\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\n; FLUSH_END\n{endif}\n\nM629\n\nM400\nM106 P1 S60\nM109 S{nozzle_temperature[next_extruder]}\nG1 E5 F{flush_volumetric_speeds[next_extruder]/2.4053*60} ;Compensate for filament spillage during waiting temperature\nM400\nG92 E0\nG1 E-[new_retract_length_toolchange] F1800\nM400\nM106 P1 S178\nM400 S3\nG1 X-3.5 F18000\nG1 X-13.5 F3000\nG1 X-3.5 F18000\nG1 X-13.5 F3000\nG1 X-3.5 F18000\nG1 X-13.5 F3000\nG1 X-3.5 F18000\nG1 X-13.5 F3000\nM400\nG1 Z{max_layer_z + 3.0} F3000\nM106 P1 S0\n{if layer_z <= (initial_layer_print_height + 0.001)}\nM204 S[initial_layer_acceleration]\n{else}\nM204 S[default_acceleration]\n{endif}\n{else}\nG1 X[x_after_toolchange] Y[y_after_toolchange] Z[z_after_toolchange] F12000\n{endif}\n\nM622.1 S0\nM9833 F{outer_wall_volumetric_speed/2.4} A0.3 ; cali dynamic extrusion compensation\nM1002 judge_flag filament_need_cali_flag\nM622 J1\n  G92 E0\n  G1 E-[new_retract_length_toolchange] F1800\n  M400\n  \n  M106 P1 S178\n  M400 S7\n  G1 X0 F18000\n  G1 X-13.5 F3000\n  G1 X0 F18000 ;wipe and shake\n  G1 X-13.5 F3000\n  G1 X0 F12000 ;wipe and shake\n  G1 X-13.5 F3000\n  G1 X0 F12000 ;wipe and shake\n  M400\n  M106 P1 S0 \nM623\n\nM621 S[next_extruder]A\nG392 S0\n\nM1007 S1\n
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
; different_settings_to_system = initial_layer_print_height;internal_solid_infill_pattern;prime_tower_infill_gap;prime_tower_rib_wall;reduce_infill_retraction;sparse_infill_density;top_shell_layers;top_shell_thickness;filament_prime_volume;
; draft_shield = disabled
; during_print_exhaust_fan_speed = 70
; elefant_foot_compensation = 0
; enable_arc_fitting = 1
; enable_circle_compensation = 0
; enable_height_slowdown = 0
; enable_long_retraction_when_cut = 2
; enable_overhang_bridge_fan = 1
; enable_overhang_speed = 1
; enable_pre_heating = 0
; enable_pressure_advance = 0
; enable_prime_tower = 0
; enable_support = 0
; enable_wrapping_detection = 0
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
; fan_direction = undefine
; fan_max_speed = 80
; fan_min_speed = 60
; filament_adaptive_volumetric_speed = 0
; filament_adhesiveness_category = 100
; filament_change_length = 5
; filament_colour = #FFFFFF
; filament_colour_type = 1
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
; filament_multi_colour = #FFFFFF
; filament_notes = 
; filament_pre_cooling_temperature = 0
; filament_prime_volume = 45
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
; filament_velocity_adaptation_factor = 1
; filament_vendor = "Bambu Lab"
; filename_format = {input_filename_base}_{filament_type[0]}_{print_time}.gcode
; filter_out_gap_fill = 0
; first_layer_print_sequence = 0
; first_x_layer_fan_speed = 0
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
; has_scarf_joint_seam = 0
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
; initial_layer_print_height = 0.1
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
; internal_solid_infill_pattern = monotonicline
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
; locked_skeleton_infill_pattern = zigzag
; locked_skin_infill_pattern = crosszag
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
; machine_prepare_compensation_time = 260
; machine_start_gcode = ;===== machine: A1 mini =========================\n;===== date: 20250822 ==================\n\n;===== start to heat heatbead&hotend==========\nM1002 gcode_claim_action : 2\nM1002 set_filament_type:{filament_type[initial_no_support_extruder]}\nM104 S170\nM140 S[bed_temperature_initial_layer_single]\nG392 S0 ;turn off clog detect\nM9833.2\n;=====start printer sound ===================\nM17\nM400 S1\nM1006 S1\nM1006 A0 B0 L100 C37 D10 M100 E37 F10 N100\nM1006 A0 B0 L100 C41 D10 M100 E41 F10 N100\nM1006 A0 B0 L100 C44 D10 M100 E44 F10 N100\nM1006 A0 B10 L100 C0 D10 M100 E0 F10 N100\nM1006 A43 B10 L100 C39 D10 M100 E46 F10 N100\nM1006 A0 B0 L100 C0 D10 M100 E0 F10 N100\nM1006 A0 B0 L100 C39 D10 M100 E43 F10 N100\nM1006 A0 B0 L100 C0 D10 M100 E0 F10 N100\nM1006 A0 B0 L100 C41 D10 M100 E41 F10 N100\nM1006 A0 B0 L100 C44 D10 M100 E44 F10 N100\nM1006 A0 B0 L100 C49 D10 M100 E49 F10 N100\nM1006 A0 B0 L100 C0 D10 M100 E0 F10 N100\nM1006 A44 B10 L100 C39 D10 M100 E48 F10 N100\nM1006 A0 B0 L100 C0 D10 M100 E0 F10 N100\nM1006 A0 B0 L100 C39 D10 M100 E44 F10 N100\nM1006 A0 B0 L100 C0 D10 M100 E0 F10 N100\nM1006 A43 B10 L100 C39 D10 M100 E46 F10 N100\nM1006 W\nM18\n;=====avoid end stop =================\nG91\nG380 S2 Z30 F1200\nG380 S3 Z-20 F1200\nG1 Z5 F1200\nG90\n\n;===== reset machine status =================\nM204 S6000\n\nM630 S0 P0\nG91\nM17 Z0.3 ; lower the z-motor current\n\nG90\nM17 X0.7 Y0.9 Z0.5 ; reset motor current to default\nM960 S5 P1 ; turn on logo lamp\nG90\nM83\nM220 S100 ;Reset Feedrate\nM221 S100 ;Reset Flowrate\nM73.2   R1.0 ;Reset left time magnitude\n;====== cog noise reduction=================\nM982.2 S1 ; turn on cog noise reduction\n\n;===== prepare print temperature and material ==========\nM400\nM18\nM109 S100 H170\nM104 S170\nM400\nM17\nM400\nG28 X\n\nM211 X0 Y0 Z0 ;turn off soft endstop ; turn off soft endstop to prevent protential logic problem\n\nM975 S1 ; turn on\n\nG1 X0.0 F30000\nG1 X-13.5 F3000\n\nM620 M ;enable remap\nM620 S[initial_no_support_extruder]A   ; switch material if AMS exist\n    G392 S0 ;turn on clog detect\n    M1002 gcode_claim_action : 4\n    M400\n    M1002 set_filament_type:UNKNOWN\n    M109 S[nozzle_temperature_initial_layer]\n    M104 S250\n    M400\n    T[initial_no_support_extruder]\n    G1 X-13.5 F3000\n    M400\n    M620.1 E F{flush_volumetric_speeds[initial_no_support_extruder]/2.4053*60} T{flush_temperatures[initial_no_support_extruder]}\n    M109 S250 ;set nozzle to common flush temp\n    M106 P1 S0\n    G92 E0\n    G1 E50 F200\n    M400\n    M1002 set_filament_type:{filament_type[initial_no_support_extruder]}\n    M104 S{flush_temperatures[initial_no_support_extruder]}\n    G92 E0\n    G1 E50 F{flush_volumetric_speeds[initial_no_support_extruder]/2.4053*60}\n    M400\n    M106 P1 S178\n    G92 E0\n    G1 E5 F{flush_volumetric_speeds[initial_no_support_extruder]/2.4053*60}\n    M109 S{nozzle_temperature_initial_layer[initial_no_support_extruder]-20} ; drop nozzle temp, make filament shink a bit\n    M104 S{nozzle_temperature_initial_layer[initial_no_support_extruder]-40}\n    G92 E0\n    G1 E-0.5 F300\n\n    G1 X0 F30000\n    G1 X-13.5 F3000\n    G1 X0 F30000 ;wipe and shake\n    G1 X-13.5 F3000\n    G1 X0 F12000 ;wipe and shake\n    G1 X0 F30000\n    G1 X-13.5 F3000\n    M109 S{nozzle_temperature_initial_layer[initial_no_support_extruder]-40}\n    G392 S0 ;turn off clog detect\nM621 S[initial_no_support_extruder]A\n\nM400\nM106 P1 S0\n;===== prepare print temperature and material end =====\n\n\n;===== mech mode fast check============================\nM1002 gcode_claim_action : 3\nG0 X25 Y175 F20000 ; find a soft place to home\n;M104 S0\nG28 Z P0 T300; home z with low precision,permit 300deg temperature\nG29.2 S0 ; turn off ABL\nM104 S170\n\n; build plate detect\nM1002 judge_flag build_plate_detect_flag\nM622 S1\n  G39.4\n  M400\nM623\n\nG1 Z5 F3000\nG1 X90 Y-1 F30000\nM400 P200\nM970.3 Q1 A7 K0 O2\nM974 Q1 S2 P0\n\nG1 X90 Y0 Z5 F30000\nM400 P200\nM970 Q0 A10 B50 C90 H15 K0 M20 O3\nM974 Q0 S2 P0\n\nM975 S1\nG1 F30000\nG1 X-1 Y10\nG28 X ; re-home XY\n\n;===== wipe nozzle ===============================\nM1002 gcode_claim_action : 14\nM975 S1\n\nM104 S170 ; set temp down to heatbed acceptable\nM106 S255 ; turn on fan (G28 has turn off fan)\nM211 S; push soft endstop status\nM211 X0 Y0 Z0 ;turn off Z axis endstop\n\nM83\nG1 E-1 F500\nG90\nM83\n\nM109 S170\nM104 S140\nG0 X90 Y-4 F30000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X91 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X92 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X93 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X94 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X95 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X96 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X97 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X98 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X99 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X99 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X99 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X99 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X99 F10000\nG380 S3 Z-5 F1200\n\nG1 Z5 F30000\n;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;\nG1 X25 Y175 F30000.1 ;Brush material\nG1 Z0.2 F30000.1\nG1 Y185\nG91\nG1 X-30 F30000\nG1 Y-2\nG1 X27\nG1 Y1.5\nG1 X-28\nG1 Y-2\nG1 X30\nG1 Y1.5\nG1 X-30\nG90\nM83\n\nG1 Z5 F3000\nG0 X50 Y175 F20000 ; find a soft place to home\nG28 Z P0 T300; home z with low precision, permit 300deg temperature\nG29.2 S0 ; turn off ABL\n\nG0 X85 Y185 F10000 ;move to exposed steel surface and stop the nozzle\nG0 Z-1.01 F10000\nG91\n\nG2 I1 J0 X2 Y0 F2000.1\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\n\nG90\nG1 Z5 F30000\nG1 X25 Y175 F30000.1 ;Brush material\nG1 Z0.2 F30000.1\nG1 Y185\nG91\nG1 X-30 F30000\nG1 Y-2\nG1 X27\nG1 Y1.5\nG1 X-28\nG1 Y-2\nG1 X30\nG1 Y1.5\nG1 X-30\nG90\nM83\n\nG1 Z5\nG0 X55 Y175 F20000 ; find a soft place to home\nG28 Z P0 T300; home z with low precision, permit 300deg temperature\nG29.2 S0 ; turn off ABL\n\nG1 Z10\nG1 X85 Y185\nG1 Z-1.01\nG1 X95\nG1 X90\n\nM211 R; pop softend status\n\nM106 S0 ; turn off fan , too noisy\n;===== wipe nozzle end ================================\n\n\n;===== wait heatbed  ====================\nM1002 gcode_claim_action : 2\nM104 S0\nM190 S[bed_temperature_initial_layer_single];set bed temp\nM109 S140\n\nG1 Z5 F3000\nG29.2 S1\nG1 X10 Y10 F20000\n\n;===== bed leveling ==================================\n;M1002 set_flag g29_before_print_flag=1\nM1002 judge_flag g29_before_print_flag\nM622 J1\n    M1002 gcode_claim_action : 1\n    G29 A1 X{first_layer_print_min[0]} Y{first_layer_print_min[1]} I{first_layer_print_size[0]} J{first_layer_print_size[1]}\n    M400\n    M500 ; save cali data\nM623\n;===== bed leveling end ================================\n\n;===== home after wipe mouth============================\nM1002 judge_flag g29_before_print_flag\nM622 J0\n\n    M1002 gcode_claim_action : 13\n    G28 T145\n\nM623\n\n;===== home after wipe mouth end =======================\n\nM975 S1 ; turn on vibration supression\n;===== nozzle load line ===============================\nM975 S1\nG90\nM83\nT1000\n\nG1 X-13.5 Y0 Z10 F10000\nG1 E1.2 F500\nM400\nM1002 set_filament_type:UNKNOWN\nM109 S{nozzle_temperature[initial_extruder]}\nM400\n\nM412 S1 ;    ===turn on  filament runout detection===\nM400 P10\n\nG392 S0 ;turn on clog detect\n\nM620.3 W1; === turn on filament tangle detection===\nM400 S2\n\nM1002 set_filament_type:{filament_type[initial_no_support_extruder]}\n;M1002 set_flag extrude_cali_flag=1\nM1002 judge_flag extrude_cali_flag\nM622 J1\n    M1002 gcode_claim_action : 8\n    \n    M400\n    M900 K0.0 L1000.0 M1.0\n    G90\n    M83\n    G0 X68 Y-4 F30000\n    G0 Z0.3 F18000 ;Move to start position\n    M400\n    G0 X88 E10  F{outer_wall_volumetric_speed/(24/20)    * 60}\n    G0 X93 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)/4     * 60}\n    G0 X98 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)     * 60}\n    G0 X103 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)/4     * 60}\n    G0 X108 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)     * 60}\n    G0 X113 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)/4     * 60}\n    G0 Y0 Z0 F20000\n    M400\n    \n    G1 X-13.5 Y0 Z10 F10000\n    M400\n    \n    G1 E10 F{outer_wall_volumetric_speed/2.4*60}\n    M983 F{outer_wall_volumetric_speed/2.4} A0.3 H[nozzle_diameter]; cali dynamic extrusion compensation\n    M106 P1 S178\n    M400 S7\n    G1 X0 F18000\n    G1 X-13.5 F3000\n    G1 X0 F18000 ;wipe and shake\n    G1 X-13.5 F3000\n    G1 X0 F12000 ;wipe and shake\n    G1 X-13.5 F3000\n    M400\n    M106 P1 S0\n\n    M1002 judge_last_extrude_cali_success\n    M622 J0\n        M983 F{outer_wall_volumetric_speed/2.4} A0.3 H[nozzle_diameter]; cali dynamic extrusion compensation\n        M106 P1 S178\n        M400 S7\n        G1 X0 F18000\n        G1 X-13.5 F3000\n        G1 X0 F18000 ;wipe and shake\n        G1 X-13.5 F3000\n        G1 X0 F12000 ;wipe and shake\n        M400\n        M106 P1 S0\n    M623\n    \n    G1 X-13.5 F3000\n    M400\n    M984 A0.1 E1 S1 F{outer_wall_volumetric_speed/2.4} H[nozzle_diameter]\n    M106 P1 S178\n    M400 S7\n    G1 X0 F18000\n    G1 X-13.5 F3000\n    G1 X0 F18000 ;wipe and shake\n    G1 X-13.5 F3000\n    G1 X0 F12000 ;wipe and shake\n    G1 X-13.5 F3000\n    M400\n    M106 P1 S0\n\nM623 ; end of "draw extrinsic para cali paint"\n\n;===== extrude cali test ===============================\nM104 S{nozzle_temperature_initial_layer[initial_extruder]}\nG90\nM83\nG0 X68 Y-2.5 F30000\nG0 Z0.3 F18000 ;Move to start position\nG0 X88 E10  F{outer_wall_volumetric_speed/(24/20)    * 60}\nG0 X93 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)/4     * 60}\nG0 X98 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)     * 60}\nG0 X103 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)/4     * 60}\nG0 X108 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)     * 60}\nG0 X113 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)/4     * 60}\nG0 X115 Z0 F20000\nG0 Z5\nM400\n\n;========turn off light and wait extrude temperature =============\nM1002 gcode_claim_action : 0\n\nM400 ; wait all motion done before implement the emprical L parameters\n\n;===== for Textured PEI Plate , lower the nozzle as the nozzle was touching topmost of the texture when homing ==\n;curr_bed_type={curr_bed_type}\n{if curr_bed_type=="Textured PEI Plate"}\nG29.1 Z{-0.02} ; for Textured PEI Plate\n{endif}\n\nM960 S1 P0 ; turn off laser\nM960 S2 P0 ; turn off laser\nM106 S0 ; turn off fan\nM106 P2 S0 ; turn off big fan\nM106 P3 S0 ; turn off chamber fan\n\nM975 S1 ; turn on mech mode supression\nG90\nM83\nT1000\n\nM211 X0 Y0 Z0 ;turn off soft endstop\nM1007 S1\n\n\n\n
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
; no_slow_down_for_cooling_on_outwalls = 0
; nozzle_diameter = 0.4
; nozzle_flush_dataset = 0
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
; override_filament_scarf_seam_setting = 0
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
; prime_tower_infill_gap = 100%
; prime_tower_lift_height = -1
; prime_tower_lift_speed = 90
; prime_tower_max_speed = 90
; prime_tower_rib_wall = 0
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
; raft_first_layer_expansion = -1
; raft_layers = 0
; reduce_crossing_wall = 0
; reduce_fan_stop_start_freq = 1
; reduce_infill_retraction = 0
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
; seam_placement_away_from_overhangs = 0
; seam_position = aligned
; seam_slope_conditional = 1
; seam_slope_entire_loop = 0
; seam_slope_gap = 0
; seam_slope_inner_walls = 1
; seam_slope_min_length = 10
; seam_slope_start_height = 10%
; seam_slope_steps = 10
; seam_slope_type = none
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
; slowdown_end_acc = 100000
; slowdown_end_height = 400
; slowdown_end_speed = 1000
; slowdown_start_acc = 100000
; slowdown_start_height = 0
; slowdown_start_speed = 1000
; small_perimeter_speed = 50%
; small_perimeter_threshold = 0
; smooth_coefficient = 80
; smooth_speed_discontinuity_area = 1
; solid_infill_filament = 1
; sparse_infill_acceleration = 100%
; sparse_infill_anchor = 400%
; sparse_infill_anchor_max = 20
; sparse_infill_density = 20%
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
; support_object_skip_flush = 0
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
; time_lapse_gcode = ;===================== date: 20250206 =====================\n{if !spiral_mode && print_sequence != "by object"}\n; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer\n; SKIPPABLE_START\n; SKIPTYPE: timelapse\nM622.1 S1 ; for prev firmware, default turned on\nM1002 judge_flag timelapse_record_flag\nM622 J1\nG92 E0\nG1 Z{max_layer_z + 0.4}\nG1 X0 Y{first_layer_center_no_wipe_tower[1]} F18000 ; move to safe pos\nG1 X-13.0 F3000 ; move to safe pos\nM400\nM1004 S5 P1  ; external shutter\nM400 P300\nM971 S11 C11 O0\nG92 E0\nG1 X0 F18000\nM623\n\n; SKIPTYPE: head_wrap_detect\nM622.1 S1\nM1002 judge_flag g39_3rd_layer_detect_flag\nM622 J1\n    ; enable nozzle clog detect at 3rd layer\n    {if layer_num == 2}\n      M400\n      G90\n      M83\n      M204 S5000\n      G0 Z2 F4000\n      G0 X187 Y178 F20000\n      G39 S1 X187 Y178\n      G0 Z2 F4000\n    {endif}\n\n\n    M622.1 S1\n    M1002 judge_flag g39_detection_flag\n    M622 J1\n      {if !in_head_wrap_detect_zone}\n        M622.1 S0\n        M1002 judge_flag g39_mass_exceed_flag\n        M622 J1\n        {if layer_num > 2}\n            G392 S0\n            M400\n            G90\n            M83\n            M204 S5000\n            G0 Z{max_layer_z + 0.4} F4000\n            G39.3 S1\n            G0 Z{max_layer_z + 0.4} F4000\n            G392 S0\n          {endif}\n        M623\n    {endif}\n    M623\nM623\n; SKIPPABLE_END\n{endif}\n\n\n
; timelapse_type = 0
; top_area_threshold = 200%
; top_color_penetration_layers = 5
; top_one_wall_type = all top
; top_shell_layers = 4
; top_shell_thickness = 0
; top_solid_infill_flow_ratio = 1
; top_surface_acceleration = 2000
; top_surface_jerk = 9
; top_surface_line_width = 0.42
; top_surface_pattern = monotonicline
; top_surface_speed = 200
; top_z_overrides_xy_distance = 0
; travel_acceleration = 10000
; travel_jerk = 9
; travel_speed = 700
; travel_speed_z = 0
; tree_support_branch_angle = 45
; tree_support_branch_diameter = 2
; tree_support_branch_diameter_angle = 5
; tree_support_branch_distance = 5
; tree_support_wall_count = -1
; upward_compatible_machine = "Bambu Lab P1S 0.4 nozzle";"Bambu Lab P1P 0.4 nozzle";"Bambu Lab X1 0.4 nozzle";"Bambu Lab X1 Carbon 0.4 nozzle";"Bambu Lab X1E 0.4 nozzle";"Bambu Lab A1 0.4 nozzle";"Bambu Lab H2D 0.4 nozzle";"Bambu Lab H2D Pro 0.4 nozzle";"Bambu Lab H2S 0.4 nozzle";"Bambu Lab P2S 0.4 nozzle"
; use_firmware_retraction = 0
; use_relative_e_distances = 1
; vertical_shell_speed = 80%
; volumetric_speed_coefficients = "0 0 0 0 0 0"
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
; wipe_tower_y = 153.211
; wrapping_detection_gcode = 
; wrapping_detection_layers = 20
; wrapping_exclude_area = 
; xy_contour_compensation = 0
; xy_hole_compensation = 0
; z_direction_outwall_speed_continuous = 0
; z_hop = 0.4
; z_hop_types = Auto Lift
; CONFIG_BLOCK_END

; EXECUTABLE_BLOCK_START
M73 P0 R18
M201 X20000 Y20000 Z1500 E5000
M203 X500 Y500 Z30 E30
M204 P20000 R5000 T20000
M205 X9.00 Y9.00 Z5.00 E3.00
; FEATURE: Custom
;===== machine: A1 mini =========================
;===== date: 20250822 ==================

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
M73 P2 R17
    G1 E50 F200
    M400
    M1002 set_filament_type:PLA
    M104 S240
    G92 E0
    G1 E50 F523.843
    M400
    M106 P1 S178
    G92 E0
M73 P4 R17
    G1 E5 F523.843
    M109 S200 ; drop nozzle temp, make filament shink a bit
    M104 S180
    G92 E0
    G1 E-0.5 F300

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
M73 P28 R12
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
M73 P29 R12
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
    G29 A1 X76.159 Y82.848 I27.6819 J14.3039
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
    
M73 P30 R12
    G1 X-13.5 F3000
    M400
    M984 A0.1 E1 S1 F6.28466 H0.4
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
; Z_HEIGHT: 0.1
; LAYER_HEIGHT: 0.1
G1 E-.8 F1800
; layer num/total_layer_count: 1/111
; update layer progress
M73 L1
M991 S0 P0 ;notify layer change

M106 S0
; OBJECT_ID: 427
G1 X99.406 Y91.925 F42000
M204 S6000
G1 Z.4
G1 Z.1
M73 P31 R12
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G2 X100.054 Y92.156 I.877 J-1.433 E.01351
G1 X100.039 Y92.41 E.00496
G1 X90.352 Y92.999 E.18922
G3 X86.088 Y91.623 I-.363 J-6.169 E.08938
M73 P32 R12
G1 X86.156 Y91.43 E.004
G2 X86.887 Y91.328 I.06 J-2.248 E.01446
G1 X86.973 Y91.376 E.00192
G1 X87.255 Y91.439 E.00563
G2 X87.89 Y91.194 I-.03 J-1.023 E.01352
G2 X89.028 Y91.328 I.681 J-.878 E.02348
G2 X89.915 Y91.289 I.409 J-.791 E.01812
G1 X89.993 Y91.344 E.00184
G2 X91.124 Y91.11 I.402 J-.911 E.02402
G1 X91.367 Y90.75 E.00848
G1 X91.508 Y91.088 E.00715
G2 X92.932 Y92.07 I1.537 J-.707 E.03539
G2 X93.964 Y92.09 I.716 J-10.29 E.02013
G2 X94.567 Y91.816 I-.117 J-1.058 E.01311
G2 X95.897 Y92.159 I1.061 J-1.367 E.02754
G2 X96.524 Y91.963 I-.22 J-1.806 E.01289
G2 X97.32 Y92.089 I.618 J-1.325 E.01592
G3 X98.965 Y92.1 I.309 J80.548 E.03207
G2 X99.357 Y91.958 I-.113 J-.929 E.0082
; WIPE_START
G1 X99.526 Y91.997 E-.06566
G1 X99.745 Y92.087 E-.09019
G1 X100.054 Y92.156 E-.12035
G1 X100.039 Y92.41 E-.09667
G1 X99.022 Y92.472 E-.38714
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X98.889 Y88.595 Z.5 F42000
G1 Z.1
G1 E.8 F1800
G1 F3000
M204 S500
G1 X98.785 Y88.346 E.00527
G1 X98.584 Y88.125 E.00582
G2 X97.217 Y88.28 I-.6 J.818 E.02948
G1 X97.037 Y88.567 E.00661
G2 X95.616 Y87.861 I-1.292 J.819 E.03252
G2 X94.58 Y88.221 I0 J1.673 E.0218
G2 X93.649 Y87.944 I-.71 J.683 E.01979
G2 X92.371 Y88.108 I-.281 J2.874 E.02534
G2 X90.815 Y87.93 I-.883 J.829 E.03321
G2 X89.954 Y87.998 I-.369 J.811 E.01758
G2 X89.657 Y87.86 I-.44 J.561 E.00644
G2 X89.652 Y87.441 I-.84 J-.2 E.00825
G1 X89.485 Y87.006 E.00909
G3 X90.359 Y87.001 I.475 J7.183 E.01705
G1 X100.198 Y87.6 E.19219
G1 X100.206 Y87.861 E.0051
G2 X99.166 Y88.29 I.072 J1.652 E.02238
G1 X98.93 Y88.55 E.00686
; WIPE_START
G1 X98.785 Y88.346 E-.09524
G1 X98.584 Y88.125 E-.11342
G1 X98.381 Y88.011 E-.08849
G1 X98.215 Y87.957 E-.06645
G1 X97.917 Y87.927 E-.1138
G1 X97.733 Y87.952 E-.07052
G1 X97.549 Y88.015 E-.07393
G1 X97.367 Y88.127 E-.08122
G1 X97.262 Y88.234 E-.05693
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X89.647 Y87.716 Z.5 F42000
G1 X87.357 Y87.56 Z.5
G1 Z.1
G1 E.8 F1800
G1 F3000
M204 S500
G1 X87.146 Y88.112 E.01153
G1 X86.802 Y87.87 E.0082
G1 X87.304 Y87.589 E.01122
; WIPE_START
G1 X87.146 Y88.112 E-.26937
G1 X86.802 Y87.87 E-.20723
G1 X87.304 Y87.589 E-.2834
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X94.935 Y87.763 Z.5 F42000
G1 X100.712 Y87.895 Z.5
G1 Z.1
G1 E.8 F1800
G1 F3000
M204 S500
G1 X100.749 Y87.633 E.00516
G1 X101.208 Y87.661 E.00895
G1 X101.208 Y88.044 E.00746
G2 X100.771 Y87.907 I-.971 J2.341 E.00895
; WIPE_START
G1 X100.749 Y87.633 E-.13263
G1 X101.208 Y87.661 E-.22161
G1 X101.208 Y88.044 E-.18469
G1 X100.771 Y87.907 E-.22108
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X99.391 Y90.06 Z.5 F42000
G1 Z.1
G1 E.8 F1800
M73 P33 R12
G1 F3000
M204 S500
G1 X99.158 Y90.218 E.0055
G1 X98.898 Y90.172 E.00514
G1 X98.899 Y89.626 E.01065
G1 X99.257 Y89.877 E.00853
G1 X99.489 Y89.993 E.00506
G1 X99.441 Y90.026 E.00114
; WIPE_START
G1 X99.158 Y90.218 E-.13634
G1 X98.898 Y90.172 E-.10499
G1 X98.899 Y89.626 E-.21768
G1 X99.257 Y89.877 E-.17424
G1 X99.489 Y89.993 E-.10343
G1 X99.441 Y90.026 E-.02333
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X100.839 Y92.112 Z.5 F42000
G1 Z.1
G1 E.8 F1800
G1 F3000
M204 S500
G1 X101.21 Y91.985 E.00765
G1 X101.21 Y92.339 E.00689
G1 X100.887 Y92.358 E.0063
G1 X100.85 Y92.171 E.00372
; WIPE_START
G1 X101.21 Y91.985 E-.24173
G1 X101.21 Y92.339 E-.21124
G1 X100.887 Y92.358 E-.19302
G1 X100.85 Y92.171 E-.11401
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X99.644 Y90.498 Z.5 F42000
G1 Z.1
G1 E.8 F1800
; FEATURE: Outer wall
G1 F3000
M204 S500
G2 X99.285 Y91.038 I.165 J.499 E.01362
G2 X98.763 Y90.655 I-.447 J.061 E.0141
G3 X98.409 Y90.675 I-.241 J-1.078 E.00693
G2 X98.417 Y89.072 I-34.007 J-.972 E.03126
G2 X98.376 Y88.607 I-.81 J-.162 E.00923
G2 X97.482 Y88.892 I-.399 J.291 E.02408
G2 X97.488 Y90.678 I139.492 J.41 E.03482
G2 X96.851 Y90.728 I-.172 J1.891 E.01251
G2 X96.612 Y91.03 I.188 J.395 E.00779
G2 X96.051 Y90.58 I-.485 J.029 E.01579
G1 X96.038 Y90.586 E.00028
G2 X96.181 Y89.811 I-.242 J-.445 E.01758
G2 X95.747 Y89.663 I-.452 J.616 E.00907
G3 X95.516 Y89.324 I.037 J-.273 E.00903
G3 X95.644 Y89.26 I.102 J.044 E.00304
G2 X96.486 Y89.337 I.462 J-.409 E.01817
G2 X96.301 Y88.481 I-.435 J-.353 E.01958
G2 X94.837 Y88.641 I-.613 J1.171 E.03044
G2 X94.555 Y89.784 I.772 J.797 E.02421
G2 X94.788 Y90.238 I.959 J-.206 E.01006
G2 X94.618 Y90.992 I.754 J.567 E.01553
G2 X95.463 Y91.685 I.856 J-.181 E.02303
G2 X96.486 Y91.392 I.205 J-1.216 E.02146
G2 X96.6 Y91.187 I-.379 J-.345 E.00462
G2 X97.041 Y91.615 I.428 J.001 E.01338
G3 X98.898 Y91.624 I.794 J29.604 E.0362
G2 X99.29 Y91.073 I-.082 J-.473 E.01462
G2 X99.897 Y91.632 I.833 J-.296 E.01673
G2 X101.688 Y90.62 I.439 J-1.314 E.04519
G1 X101.688 Y92.239 E.03157
G3 X101.156 Y92.821 I-.553 J.029 E.01712
G1 X90.374 Y93.477 E.2106
G3 X84.21 Y90.105 I-.404 J-6.581 E.14447
G3 X84.327 Y89.677 I.476 J-.1 E.00898
G3 X84.895 Y88.887 I5.728 J3.518 E.019
G2 X85.318 Y89.272 I.453 J-.073 E.01205
G2 X85.592 Y89.287 I.207 J-1.268 E.00536
G2 X84.994 Y90.159 I5.788 J4.615 E.02062
G2 X85.082 Y90.844 I.53 J.281 E.01436
G2 X85.4 Y90.951 I.329 J-.452 E.00665
G2 X86.524 Y90.935 I.174 J-27.465 E.02191
G2 X86.876 Y90.659 I-.055 J-.434 E.00917
G2 X87.475 Y90.902 I.415 J-.162 E.01411
G2 X87.798 Y90.443 I-.513 J-.704 E.01114
G3 X87.905 Y90.125 I3.858 J1.12 E.00655
G3 X88.088 Y90.661 I-15.362 J5.551 E.01105
G2 X88.91 Y90.793 I.456 J-.213 E.01912
G2 X88.996 Y90.519 I-.45 J-.291 E.00566
G2 X89.786 Y90.785 I.445 J-.018 E.02099
G2 X89.918 Y90.607 I-.406 J-.441 E.00435
G2 X90.338 Y90.949 I.612 J-.321 E.01085
G2 X90.805 Y90.257 I.067 J-.458 E.02028
G2 X90.453 Y89.647 I-6.562 J3.377 E.01375
G2 X90.802 Y89.085 I-4.592 J-3.245 E.01291
G2 X91.82 Y89.54 I.7 J-.2 E.02476
G2 X92.031 Y91.043 I2.024 J.483 E.03031
G2 X92.984 Y91.594 I1.01 J-.649 E.02229
G2 X93.989 Y91.6 I.541 J-6.548 E.01961
G2 X94.36 Y91.147 I-.066 J-.432 E.0125
G3 X94.345 Y90.568 I3.09 J-.369 E.01131
G2 X94.337 Y88.8 I-81.689 J-.497 E.03447
G2 X93.875 Y88.404 I-.438 J.043 E.01309
G3 X93.044 Y88.432 I-1.166 J-21.756 E.01622
G2 X92.194 Y88.808 I.044 J1.251 E.01856
G2 X90.858 Y88.589 I-.702 J.1 E.03505
G2 X90.096 Y88.508 I-.405 J.184 E.018
G2 X89.946 Y88.733 I1.258 J1.002 E.00528
G2 X89.547 Y88.33 I-.624 J.219 E.01142
G2 X89.046 Y89.081 I-.1 J.475 E.02257
G3 X89.388 Y89.664 I-8.572 J5.418 E.01318
G3 X89.36 Y89.747 I-.203 J-.022 E.00172
G2 X89.009 Y90.379 I3.407 J2.309 E.01412
G1 X88.996 Y90.463 E.00165
G2 X88.792 Y89.817 I-2.059 J.296 E.01327
G2 X88.382 Y88.746 I-15.758 J5.411 E.02236
G3 X88.625 Y88.186 I10.578 J4.241 E.0119
G3 X88.859 Y88.083 I.282 J.325 E.00507
G2 X89.131 Y87.419 I-.09 J-.425 E.01648
G2 X88.482 Y87.184 I-.471 J.287 E.01454
G2 X87.77 Y87.832 I.201 J.935 E.01966
G2 X86.984 Y89.989 I74.237 J28.287 E.04478
G2 X86.865 Y90.257 I2.101 J1.091 E.00571
G2 X86.379 Y89.996 I-.467 J.287 E.01126
G1 X86.259 Y89.99 E.00235
G2 X86.825 Y89.192 I-21.909 J-16.16 E.01907
G2 X86.665 Y88.359 I-.483 J-.339 E.01847
G2 X86.198 Y88.332 I-.29 J.972 E.00919
G2 X85.416 Y88.33 I-.411 J8.57 E.01525
G1 X85.419 Y88.328 E.00007
G3 X90.382 Y86.523 I4.571 J4.846 E.10588
G1 X101.155 Y87.178 E.21043
G3 X101.686 Y87.717 I-.009 J.541 E.01633
G1 X101.687 Y89.412 E.03305
G2 X99.587 Y88.558 I-1.348 J.306 E.05181
G2 X99.267 Y89.024 I.76 J.866 E.01113
G2 X100.188 Y89.327 I.506 J.013 E.02525
G3 X100.773 Y89.731 I.154 J.403 E.01629
G3 X100.666 Y90.588 I-1.242 J.281 E.01719
G3 X100.252 Y90.7 I-.278 J-.206 E.00902
G2 X99.704 Y90.496 I-.545 J.625 E.01167
; WIPE_START
G1 X99.544 Y90.535 E-.06261
G1 X99.463 Y90.59 E-.03726
G1 X99.357 Y90.711 E-.06102
G1 X99.286 Y90.895 E-.07518
G1 X99.285 Y91.038 E-.05422
G1 X99.221 Y90.861 E-.07129
G1 X99.126 Y90.748 E-.05632
G1 X98.999 Y90.676 E-.05549
G1 X98.763 Y90.655 E-.09017
G1 X98.505 Y90.687 E-.09868
G1 X98.409 Y90.675 E-.0366
G1 X98.418 Y90.515 E-.06115
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X95.696 Y90.771 Z.5 F42000
G1 Z.1
G1 E.8 F1800
G1 F3000
M204 S500
G1 X95.638 Y90.762 E.00114
G1 X95.649 Y90.705 E.00114
G3 X95.734 Y90.658 I.124 J.124 E.00192
G2 X95.976 Y90.609 I-.002 J-.639 E.00485
G1 X95.955 Y90.618 E.00045
G3 X95.748 Y90.742 I-1.921 J-2.957 E.0047
; WIPE_START
G1 X95.638 Y90.762 E-.10941
G1 X95.649 Y90.705 E-.05703
G1 X95.734 Y90.658 E-.09466
G1 X95.976 Y90.609 E-.24123
G1 X95.955 Y90.618 E-.02242
G1 X95.748 Y90.742 E-.23524
; WIPE_END
G1 E-.04 F1800
M204 S6000
G17
G3 Z.5 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z0.5
G1 X0 Y90.0001 F18000 ; move to safe pos
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




G1 X96.575 Y90.494 F42000
G1 Z.1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.502247
G1 F3000
M204 S500
G1 X96.694 Y90.348 E.00369
; LINE_WIDTH: 0.545317
G1 X96.813 Y90.203 E.00402
; LINE_WIDTH: 0.57956
G1 X96.826 Y90.186 E.00048
; LINE_WIDTH: 0.604975
G1 X96.838 Y90.169 E.0005
; LINE_WIDTH: 0.63544
G1 X96.856 Y90.147 E.00069
; LINE_WIDTH: 0.67094
G1 X96.873 Y90.125 E.00073
; LINE_WIDTH: 0.706439
G1 X96.89 Y90.104 E.00077
; LINE_WIDTH: 0.743015
G2 X96.882 Y89.795 I-8.852 J.073 E.00909
; LINE_WIDTH: 0.736311
G1 X97.062 Y89.368 E.01349
; LINE_WIDTH: 0.703468
G1 X97.241 Y88.94 E.01287
M204 S6000
G1 X97.017 Y88.142 F42000
; LINE_WIDTH: 0.428337
G1 F3000
M204 S500
G1 X97.011 Y87.853 E.0048
G1 X96.376 Y87.607 E.01128
M204 S6000
G1 X96.385 Y87.67 F42000
; LINE_WIDTH: 0.133004
G1 F3000
M204 S500
G1 X96.267 Y87.65 E.00054
; LINE_WIDTH: 0.0952887
G1 X95.948 Y87.61 E.00097
M204 S6000
G1 X95.676 Y87.594 F42000
; LINE_WIDTH: 0.0881742
G1 F3000
M204 S500
G1 X95.465 Y87.59 E.00057
; LINE_WIDTH: 0.115963
G1 X95.274 Y87.596 E.00074
; LINE_WIDTH: 0.1464
G1 X95.179 Y87.603 E.00049
; LINE_WIDTH: 0.173687
G1 X95.075 Y87.611 E.00065
; LINE_WIDTH: 0.207071
G1 X94.977 Y87.624 E.00075
; LINE_WIDTH: 0.263197
G2 X94.249 Y87.737 I1.697 J13.393 E.00726
M204 S6000
G1 X94.309 Y87.751 F42000
; LINE_WIDTH: 0.364895
G1 F3000
M204 S500
G1 X95.31 Y87.542 E.01431
M204 S6000
G1 X94.934 Y87.746 F42000
; LINE_WIDTH: 0.299879
G1 F3000
M204 S500
G1 X94.35 Y87.62 E.00677
; LINE_WIDTH: 0.263708
G2 X93.634 Y87.573 I-.572 J3.172 E.0071
; LINE_WIDTH: 0.295074
G1 X93.273 Y87.56 E.00402
; LINE_WIDTH: 0.322617
G2 X92.951 Y87.559 I-.185 J6.964 E.00395
; LINE_WIDTH: 0.355782
G1 X92.809 Y87.565 E.00194
; LINE_WIDTH: 0.38701
G1 X92.645 Y87.572 E.00244
; LINE_WIDTH: 0.418203
G1 X92.38 Y87.598 E.00432
; LINE_WIDTH: 0.445013
G1 X92.114 Y87.624 E.00461
M204 S6000
G1 X92.127 Y87.483 F42000
; LINE_WIDTH: 0.266687
G1 F3000
M204 S500
G1 X92.001 Y87.452 E.0013
; LINE_WIDTH: 0.218409
G2 X91.743 Y87.412 I-2.249 J13.749 E.00209
; LINE_WIDTH: 0.201226
G1 X91.196 Y87.399 E.00401
; LINE_WIDTH: 0.248809
G1 X91.113 Y87.407 E.00078
; LINE_WIDTH: 0.277609
G1 X91.012 Y87.417 E.00106
M204 S6000
G1 X91.183 Y87.513 F42000
; LINE_WIDTH: 0.390865
G1 F3000
M204 S500
G2 X90.2 Y87.43 I-.841 J4.057 E.01488
; LINE_WIDTH: 0.42603
G1 X89.896 Y87.471 E.00506
M204 S6000
G1 X89.269 Y87.13 F42000
; LINE_WIDTH: 0.188005
G1 F3000
M204 S500
G2 X89.006 Y86.824 I-3.629 J2.865 E.00274
M204 S6000
G1 X89.182 Y86.885 F42000
; LINE_WIDTH: 0.0868588
G1 F3000
M204 S500
G2 X88.76 Y86.894 I-.124 J3.912 E.00113
M204 S6000
G1 X88.76 Y86.884 F42000
; LINE_WIDTH: 0.156482
G1 F3000
M204 S500
G3 X89.196 Y86.92 I-.131 J4.311 E.00241
; WIPE_START
G1 X88.76 Y86.884 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X88.038 Y87.079 Z.5 F42000
G1 Z.1
G1 E.8 F1800
; LINE_WIDTH: 0.108127
G1 F3000
M204 S500
G2 X87.735 Y87.241 I2.347 J4.768 E.00121
M204 S6000
G1 X87.786 Y87.251 F42000
; LINE_WIDTH: 0.10277
G1 F3000
M204 S500
G1 X87.7 Y87.402 E.00058
M204 S6000
G1 X87.786 Y87.251 F42000
; LINE_WIDTH: 0.139916
G1 F3000
M204 S500
G1 X87.885 Y87.104 E.00085
; WIPE_START
G1 X87.786 Y87.251 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X87.184 Y88.433 Z.5 F42000
G1 Z.1
G1 E.8 F1800
; LINE_WIDTH: 0.0977492
G1 F3000
M204 S500
G3 X87.173 Y88.659 I-1.831 J.021 E.00071
M204 S6000
G1 X86.646 Y88.065 F42000
; LINE_WIDTH: 0.206166
G1 F3000
M204 S500
G2 X86.253 Y87.948 I-2.999 J9.319 E.00308
M204 S6000
G1 X86.121 Y88.072 F42000
; LINE_WIDTH: 0.0952032
G1 F3000
M204 S500
G1 X86.498 Y87.948 E.00119
; WIPE_START
G1 X86.121 Y88.072 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X84.999 Y89.415 Z.5 F42000
G1 Z.1
G1 E.8 F1800
; LINE_WIDTH: 0.362314
G1 F3000
M204 S500
G2 X84.614 Y90.001 I3.836 J2.941 E.00975
G1 X84.599 Y90.001 E.0002
; LINE_WIDTH: 0.322944
G1 X84.58 Y89.999 E.00024
; LINE_WIDTH: 0.288351
G1 X84.561 Y89.998 E.00021
; LINE_WIDTH: 0.257808
G1 X84.546 Y89.998 E.00014
; LINE_WIDTH: 0.211134
G2 X84.434 Y90.009 I.002 J.612 E.00087
; WIPE_START
G1 X84.546 Y89.998 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X85.277 Y91.186 Z.5 F42000
G1 Z.1
G1 E.8 F1800
; LINE_WIDTH: 0.113129
G1 F3000
M204 S500
G1 X85.891 Y91.462 E.00252
M204 S6000
G1 X86.532 Y91.662 F42000
; LINE_WIDTH: 0.131731
G1 F3000
M204 S500
G2 X87.193 Y91.794 I1.953 J-8.027 E.00303
M204 S6000
G1 X87.376 Y91.691 F42000
; LINE_WIDTH: 0.107659
G1 F3000
M204 S500
G3 X86.75 Y91.811 I-.99 J-3.47 E.00224
; WIPE_START
G1 X87.376 Y91.691 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X89.044 Y89.8 Z.5 F42000
G1 Z.1
G1 E.8 F1800
; LINE_WIDTH: 0.112505
G1 F3000
M204 S500
G2 X89.014 Y89.59 I-.265 J-.069 E.00081
G1 X88.931 Y89.41 E.00073
; LINE_WIDTH: 0.0841119
G1 X88.907 Y89.36 E.00014
M204 S6000
G1 X88.708 Y88.85 F42000
; LINE_WIDTH: 0.0938811
G1 F3000
M204 S500
G3 X88.714 Y88.648 I.226 J-.094 E.00062
; WIPE_START
G1 X88.686 Y88.752 E-.39491
G1 X88.708 Y88.85 E-.36509
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X90.748 Y89.65 Z.5 F42000
G1 Z.1
G1 E.8 F1800
; LINE_WIDTH: 0.346787
G1 F3000
M204 S500
G2 X91.547 Y90.314 I12.713 J-14.483 E.01377
M204 S6000
G1 X91.51 Y90.365 F42000
; LINE_WIDTH: 0.0920352
G1 F3000
M204 S500
G1 X91.543 Y90.48 E.00034
M204 S6000
G1 X91.564 Y90.443 F42000
; LINE_WIDTH: 0.216227
G1 F3000
M204 S500
G3 X90.771 Y89.615 I9.302 J-9.701 E.0091
M204 S6000
G1 X90.749 Y89.648 F42000
; LINE_WIDTH: 0.484711
G1 F3000
M204 S500
G1 X91.25 Y90.077 E.01244
G1 X91.279 Y90.069 E.00058
; LINE_WIDTH: 0.460923
G1 X91.322 Y90.059 E.00078
; LINE_WIDTH: 0.423719
G1 X91.345 Y90.08 E.00051
; LINE_WIDTH: 0.377882
G1 X91.368 Y90.102 E.00046
; LINE_WIDTH: 0.332044
G1 X91.391 Y90.123 E.0004
; LINE_WIDTH: 0.286207
G1 X91.414 Y90.144 E.00034
; LINE_WIDTH: 0.240369
G1 X91.437 Y90.165 E.00028
; LINE_WIDTH: 0.194532
G1 X91.46 Y90.187 E.00022
; LINE_WIDTH: 0.158552
G1 X91.475 Y90.224 E.00023
; LINE_WIDTH: 0.125001
G1 X91.51 Y90.365 E.00061
; WIPE_START
G1 X91.475 Y90.224 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X92.101 Y92.386 Z.5 F42000
G1 Z.1
G1 E.8 F1800
; LINE_WIDTH: 0.460673
G1 F3000
M204 S500
G1 X92.284 Y92.408 E.0033
; LINE_WIDTH: 0.43524
G1 X92.467 Y92.43 E.00311
; LINE_WIDTH: 0.406425
G1 X92.579 Y92.439 E.00176
; LINE_WIDTH: 0.377984
G1 X92.673 Y92.446 E.00137
; LINE_WIDTH: 0.342537
G1 X92.885 Y92.456 E.00277
; LINE_WIDTH: 0.299242
G1 X93.207 Y92.457 E.00365
; LINE_WIDTH: 0.251616
G2 X94.008 Y92.432 I-.581 J-31.082 E.00752
G1 X94.297 Y92.391 E.00273
; LINE_WIDTH: 0.291457
G1 X94.404 Y92.371 E.0012
; LINE_WIDTH: 0.309366
G1 X94.845 Y92.268 E.00531
M204 S6000
G1 X95.085 Y92.409 F42000
; LINE_WIDTH: 0.13269
G1 F3000
M204 S500
G1 X95.176 Y92.417 E.00041
; LINE_WIDTH: 0.100173
G1 X95.384 Y92.427 E.00067
M204 S6000
G1 X95.308 Y92.458 F42000
; LINE_WIDTH: 0.253146
G1 F3000
M204 S500
G1 X94.224 Y92.278 E.01038
M204 S6000
G1 X94.269 Y92.265 F42000
; LINE_WIDTH: 0.326206
G1 F3000
M204 S500
G1 X95.208 Y92.464 E.01191
M204 S6000
G1 X95.085 Y92.409 F42000
; LINE_WIDTH: 0.173256
G1 F3000
M204 S500
G3 X94.134 Y92.303 I1.575 J-18.405 E.00592
; WIPE_START
G1 X95.085 Y92.409 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X96.185 Y92.378 Z.5 F42000
G1 Z.1
G1 E.8 F1800
; LINE_WIDTH: 0.104063
G1 F3000
M204 S500
G1 X96.402 Y92.339 E.00074
; LINE_WIDTH: 0.151762
G1 X96.665 Y92.273 E.00144
M204 S6000
G1 X96.821 Y92.339 F42000
; LINE_WIDTH: 0.092341
G1 F3000
M204 S500
G3 X96.349 Y92.3 I.077 J-3.83 E.00137
; WIPE_START
G1 X96.821 Y92.339 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X99.082 Y89.462 Z.5 F42000
G1 Z.1
G1 E.8 F1800
; LINE_WIDTH: 0.248859
G1 F3000
M204 S500
G1 X98.915 Y89.199 E.00289
; LINE_WIDTH: 0.287703
G1 X98.891 Y89.154 E.00055
G1 X99.063 Y88.762 E.00464
M204 S6000
G1 X98.672 Y88.925 F42000
; LINE_WIDTH: 0.121666
G1 F3000
M204 S500
G1 X99.118 Y89.467 E.00287
; WIPE_START
G1 X98.672 Y88.925 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X99.146 Y87.991 Z.5 F42000
G1 Z.1
G1 E.8 F1800
; LINE_WIDTH: 0.226052
G1 F3000
M204 S500
G1 X98.484 Y87.735 E.00592
M204 S6000
G1 X98.777 Y87.981 F42000
; LINE_WIDTH: 0.252502
G1 F3000
M204 S500
G1 X99.384 Y87.8 E.00597
; WIPE_START
G1 X98.777 Y87.981 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X100.469 Y87.713 Z.5 F42000
G1 Z.1
G1 E.8 F1800
; LINE_WIDTH: 0.103436
G1 F3000
M204 S500
M73 P34 R12
G1 X100.487 Y87.378 E.00112
; WIPE_START
G1 X100.469 Y87.713 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X101.261 Y88.342 Z.5 F42000
G1 Z.1
G1 E.8 F1800
; LINE_WIDTH: 0.0991324
G1 F3000
M204 S500
G1 X101.447 Y88.44 E.00067
; WIPE_START
G1 X101.261 Y88.342 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X101.449 Y91.588 Z.5 F42000
G1 Z.1
G1 E.8 F1800
; LINE_WIDTH: 0.0988853
G1 F3000
M204 S500
G1 X101.267 Y91.684 E.00065
; WIPE_START
G1 X101.449 Y91.588 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X97.634 Y87.708 Z.5 F42000
G1 Z.1
G1 E.8 F1800
; LINE_WIDTH: 0.0989536
G1 F3000
M204 S500
G1 X97.53 Y87.722 E.00033
; LINE_WIDTH: 0.152669
G2 X96.69 Y87.878 I.953 J7.468 E.00457
M204 S6000
G1 X96.385 Y87.67 F42000
; LINE_WIDTH: 0.183977
G1 F3000
M204 S500
G3 X97.305 Y87.884 I-4.084 J19.568 E.00625
M204 S6000
G1 X97.255 Y87.915 F42000
; LINE_WIDTH: 0.272632
G1 F3000
M204 S500
G1 X96.222 Y87.598 E.01106
; WIPE_START
G1 X97.255 Y87.915 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X92.956 Y87.72 Z.5 F42000
G1 Z.1
G1 E.8 F1800
; LINE_WIDTH: 0.342842
G1 F3000
M204 S500
G1 X92.254 Y87.514 E.00958
; LINE_WIDTH: 0.313006
G1 X92.127 Y87.483 E.00155
M204 S6000
G1 X91.543 Y87.313 F42000
; LINE_WIDTH: 0.399826
G1 F3000
M204 S500
G1 X90.762 Y87.458 E.01223
; LINE_WIDTH: 0.387816
G1 X90.778 Y87.559 E.00153
; LINE_WIDTH: 0.354177
G1 X90.794 Y87.66 E.00139
; WIPE_START
G1 X90.778 Y87.559 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X91.825 Y92.718 Z.5 F42000
G1 Z.1
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.53859
G1 F6300
M204 S500
G1 X90.863 Y91.756 E.02867
G3 X90.209 Y91.833 I-.506 J-1.469 E.01397
G1 X90.932 Y92.556 E.02154
G3 X90.24 Y92.596 I-1.026 J-11.934 E.0146
G1 X89.478 Y91.834 E.02269
G1 X89.326 Y91.842 E.00322
G1 X88.996 Y91.765 E.00713
G3 X88.74 Y91.827 I-.248 J-.468 E.00562
G1 X89.494 Y92.581 E.02247
G3 X88.619 Y92.438 I.506 J-5.839 E.01868
G1 X87.711 Y91.53 E.02707
; WIPE_START
G1 X88.619 Y92.438 E-.48819
G1 X89.056 Y92.529 E-.16944
G1 X89.323 Y92.561 E-.10238
; WIPE_END
G1 E-.04 F1800
M204 S6000
M73 P34 R11
G1 X93.384 Y89.381 Z.5 F42000
G1 Z.1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X93.381 Y89.441 E.00117
G1 X93.384 Y90.651 E.02357
G3 X92.893 Y90.585 I-.094 J-1.16 E.00972
G3 X92.735 Y89.925 I.673 J-.51 E.0136
G3 X92.915 Y89.449 I.596 J-.048 E.01026
G3 X93.324 Y89.377 I.374 J.94 E.00816
M204 S6000
G1 X93.085 Y89.696 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.157368
G1 F3000
M204 S500
G1 X93.079 Y89.723 E.00015
G2 X93.066 Y89.819 I.993 J.186 E.00054
; LINE_WIDTH: 0.182134
G2 X93.08 Y90.329 I2.242 J.192 E.00334
; LINE_WIDTH: 0.131283
G1 X93.035 Y90.382 E.00031
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 0.3
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F3000
G1 X93.08 Y90.329 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 2/111
; update layer progress
M73 L2
M991 S0 P1 ;notify layer change

M106 S255
; open powerlost recovery
M1003 S1
; OBJECT_ID: 427
M204 S10000
G17
G3 Z.5 I.394 J1.151 P1  F42000
G1 X101.34 Y87.499 Z.5
G1 Z.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
M204 S6000
G3 X101.406 Y87.658 I-.131 J.148 E.0059
G1 X101.406 Y88.142 E.01604
G1 F10902.58
G1 X101.406 Y88.542 E.01327
G1 F5883.29
G1 X101.406 Y88.942 E.01327
G1 F2400
G1 X101.407 Y91.09 E.07127
G1 F7903.652
G1 X101.407 Y91.666 E.01911
G1 F13599.127
G1 X101.405 Y92.066 E.01327
G1 F15476.087
G1 X101.404 Y92.363 E.00983
G3 X101.197 Y92.549 I-.197 J-.011 E.01026
G1 X90.408 Y93.231 E.3586
G3 X84.359 Y90.001 I-.415 J-6.501 E.23954
G1 X84.671 Y89.511 E.01927
G1 F7248.941
G1 X85.03 Y89.047 E.01946
G1 F1980.721
G1 X85.079 Y88.989 E.00251
G1 F1542.221
G1 X85.221 Y88.831 E.00707
G1 F600
G1 X85.376 Y88.67 E.00739
M106 S201.45
M106 S255
G1 F1560.164
G1 X85.531 Y88.519 E.00718
M106 S201.45
M106 S255
G1 F2715.35
G1 X85.666 Y88.396 E.00604
G1 F7163.26
G1 X86.027 Y88.097 E.01557
G1 F12622.266
G1 X86.356 Y87.869 E.01327
G1 F15476.087
G1 X86.567 Y87.728 E.00842
G3 X90.221 Y86.759 I3.43 J5.563 E.12724
G1 X101.194 Y87.45 E.3647
G3 X101.289 Y87.467 I.015 J.197 E.00322
M204 S10000
G1 X101.668 Y87.277 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8400
M204 S5000
G1 X101.714 Y87.344 E.00249
G1 F9300
G1 X101.75 Y87.418 E.00256
G1 F10200
G3 X101.788 Y87.551 I-.59 J.24 E.00424
G1 F11419.777
G1 X101.798 Y87.635 E.0026
G1 F12000
G1 X101.798 Y88.035 E.01229
G1 X101.8 Y92.311 E.13138
G1 X101.793 Y92.411 E.00309
G1 F11100
G1 X101.777 Y92.5 E.00278
G1 F10200
G1 X101.75 Y92.582 E.00265
G1 F9300
G1 X101.714 Y92.656 E.00256
G1 F8400
G3 X101.616 Y92.781 I-.488 J-.281 E.00487
G1 F7500
G1 X101.588 Y92.807 E.00118
G1 F8400
G3 X101.448 Y92.891 I-.367 J-.451 E.00504
G1 F9300
G1 X101.367 Y92.919 E.00262
G1 F10097.331
G1 X101.31 Y92.931 E.0018
G1 F11100
G1 X100.911 Y92.957 E.01229
G1 X99.66 Y93.039 E.0385
G1 X99.261 Y93.065 E.01229
G1 F10200
G1 X96.915 Y93.213 E.07222
G1 X96.516 Y93.238 E.01229
G1 F9300
G1 X95.543 Y93.3 E.02996
G1 X95.144 Y93.325 E.01229
G1 F8400
G1 X92.798 Y93.473 E.07222
G1 X92.399 Y93.498 E.01229
G1 F7500
G1 X91.027 Y93.585 E.04225
G3 X88.747 Y93.517 I-.905 J-7.877 E.07033
G1 X88.474 Y93.462 E.00855
G1 X88.085 Y93.371 E.01229
G1 F6600
G3 X87.446 Y93.153 I2 J-6.9 E.02075
G1 X86.998 Y92.958 E.01499
G1 F5700
G1 X86.737 Y92.816 E.00913
G1 X86.386 Y92.625 E.01229
G1 F4800
G1 X86.189 Y92.491 E.00732
G1 X85.858 Y92.267 E.01229
G1 F3900
G3 X85.395 Y91.889 I4.103 J-5.491 E.01836
G1 F3000
G1 X85.185 Y91.681 E.0091
G1 X84.9 Y91.399 E.01229
G1 F2880
G3 X84.319 Y90.67 I5.915 J-5.309 E.02869
G1 F2760
G3 X84.097 Y90.327 I5.616 J-3.883 E.01253
G1 F2640
G1 X84.028 Y90.21 E.00418
G1 F2520
G3 X83.987 Y90.119 I.426 J-.244 E.00307
G1 F2400
G3 X83.981 Y89.901 I.369 J-.119 E.00679
G1 F2520
G3 X84.014 Y89.814 I.426 J.113 E.00287
G1 F2640
G1 X84.092 Y89.681 E.00473
G1 F2760
G3 X84.351 Y89.284 I5.884 J3.553 E.01457
G1 F2880
G3 X84.636 Y88.912 I7.093 J5.148 E.01441
G1 X84.934 Y88.564 E.01408
G1 F2160
G1 X85.097 Y88.393 E.00725
G1 F3000
G1 X85.392 Y88.123 E.01229
G1 X85.563 Y87.966 E.00713
G1 F3900
G3 X85.973 Y87.648 I4.437 J5.312 E.01595
G1 F4800
G3 X86.359 Y87.392 I3.971 J5.55 E.01425
G1 F5700
G1 X86.71 Y87.199 E.01229
G1 X86.977 Y87.052 E.00936
G1 F6600
G1 X87.345 Y86.896 E.01229
G1 X87.594 Y86.791 E.0083
G3 X88.077 Y86.631 I2.482 J6.707 E.01564
G1 F7500
G1 X88.549 Y86.514 E.01493
G3 X90.236 Y86.367 I1.442 J6.808 E.05216
G1 X90.835 Y86.405 E.01844
G1 F8400
G1 X91.234 Y86.43 E.01229
G1 X92.468 Y86.508 E.03798
G1 F9300
G1 X92.867 Y86.533 E.01229
G1 X95.733 Y86.714 E.08826
G1 F10200
G1 X96.133 Y86.739 E.01229
G1 X97.366 Y86.816 E.03798
G1 F11100
G1 X97.766 Y86.842 E.01229
G1 X100.632 Y87.022 E.08826
G1 X100.931 Y87.044 E.00919
G1 X101.33 Y87.072 E.01229
G1 F9300
G3 X101.448 Y87.109 I-.124 J.608 E.00381
G1 F8400
G3 X101.588 Y87.194 I-.228 J.538 E.00506
G1 F7500
G3 X101.629 Y87.231 I-.346 J.414 E.0017
; WIPE_START
M204 S6000
G1 X101.714 Y87.344 E-.05351
G1 X101.75 Y87.418 E-.0316
G1 X101.788 Y87.551 E-.05237
G1 X101.798 Y87.635 E-.03219
G1 X101.798 Y88.035 E-.152
G1 X101.798 Y89.189 E-.43834
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.7 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z0.7
G1 X0 Y90.0001 F18000 ; move to safe pos
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




G1 X101.242 Y88.187 F42000
G1 Z.3
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.42036
G1 F3000
M204 S6000
G1 X99.645 Y87.687 E.05149
G1 X99.2 Y87.659 E.01371
G1 X98.969 Y87.805 E.00839
G1 X98.695 Y87.627 E.01006
G1 X98.064 Y87.587 E.01945
G1 X101.073 Y88.529 E.09698
G1 X101.073 Y88.925 E.01217
G1 X97.141 Y87.694 E.12674
G1 X97.001 Y87.782 E.0051
G1 X96.722 Y87.611 E.01008
G1 X96.413 Y87.483 E.01026
G1 X95.228 Y87.409 E.03653
G1 X95.074 Y87.442 E.00485
G1 X101.073 Y89.321 E.19336
G1 X101.073 Y89.716 E.01217
G1 X93.804 Y87.44 E.23429
G3 X93.311 Y87.452 I-.384 J-5.346 E.01518
G1 X92.964 Y87.469 E.01066
G1 X92.733 Y87.5 E.00718
G1 X101.073 Y90.112 E.2688
G1 X101.074 Y90.507 E.01217
G1 X90.927 Y87.33 E.32703
G1 X90.759 Y87.396 E.00554
G1 X90.513 Y87.362 E.00763
G1 X90.148 Y87.369 E.01122
G1 X90.043 Y87.095 E.00903
G2 X89.104 Y87.154 I-.131 J5.415 E.02897
G1 X101.074 Y90.903 E.38578
G1 X101.074 Y91.298 E.01217
G1 X88.347 Y87.313 E.41017
G2 X87.732 Y87.516 I1.115 J4.414 E.01993
G1 X101.074 Y91.694 E.43
G1 X101.074 Y92.089 E.01217
G1 X87.212 Y87.748 E.44677
G2 X86.759 Y88.002 I1.665 J3.507 E.01598
G1 X100.379 Y92.267 E.43897
G1 X99.328 Y92.334 E.03239
G1 X86.356 Y88.271 E.41809
G2 X85.996 Y88.554 I1.917 J2.813 E.01409
G1 X98.277 Y92.4 E.39583
G1 X97.226 Y92.467 E.03239
G1 X85.672 Y88.848 E.37238
G2 X85.469 Y89.058 I1.452 J1.604 E.00899
G1 X85.382 Y89.153 E.00396
G1 X96.176 Y92.533 E.34788
G1 X95.125 Y92.599 E.03239
G1 X84.946 Y89.412 E.32804
M106 S201.45
M106 S255
M204 S10000
G1 X84.716 Y89.735 F42000
G1 F3000
M204 S6000
G1 X94.221 Y92.712 E.30635
M106 S201.45
M106 S255
; WIPE_START
G1 X92.313 Y92.114 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.802 Y92.037 Z.7 F42000
G1 Z.3
G1 E.8 F1800
G1 F3000
M204 S6000
G1 X84.863 Y90.177 E.19139
G2 X85.258 Y90.696 I3.435 J-2.202 E.02008
G1 X88.977 Y91.861 E.11986
G1 X88.724 Y91.909 E.00793
G1 X88.448 Y91.912 E.00849
G1 X88.2 Y91.872 E.00772
G1 X87.904 Y91.772 E.0096
G1 X87.693 Y91.854 E.00698
G1 X85.435 Y91.147 E.07278
M106 S201.45
; WIPE_START
G1 X87.343 Y91.745 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X89.875 Y92.291 Z.7 F42000
G1 Z.3
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.51423
G1 F13366.998
M204 S6000
G1 X89.415 Y92.33 E.01771
; LINE_WIDTH: 0.48584
G1 F14223.787
G1 X88.915 Y92.285 E.01812
; LINE_WIDTH: 0.460403
G1 F15000
G1 X88.65 Y92.277 E.00904
; LINE_WIDTH: 0.424268
G1 X88.384 Y92.27 E.00826
; LINE_WIDTH: 0.386943
G1 X87.888 Y92.167 E.0142
G1 X87.341 Y92.266 E.01558
G2 X88.361 Y92.637 I2.086 J-4.152 E.03048
; LINE_WIDTH: 0.42447
G1 X88.624 Y92.675 E.00827
; LINE_WIDTH: 0.46047
G1 X88.887 Y92.714 E.00905
; LINE_WIDTH: 0.501019
G1 F13752.482
G1 X89.444 Y92.784 E.02094
G1 X90.353 Y92.797 E.03395
G1 X90.94 Y92.754 E.02196
; LINE_WIDTH: 0.532213
G1 F12875.735
G3 X91.83 Y92.686 I2.158 J22.575 E.03559
G1 X91.495 Y92.495 E.01537
G1 X91.158 Y92.191 E.01813
G1 X90.89 Y92.278 E.01121
G1 X90.379 Y92.336 E.02052
G1 X89.935 Y92.296 E.01779
; WIPE_START
G1 X90.379 Y92.336 E-.1696
G1 X90.89 Y92.278 E-.19555
G1 X91.158 Y92.191 E-.10684
G1 X91.495 Y92.495 E-.17278
G1 X91.758 Y92.646 E-.11524
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.61 Y92.797 Z.7 F42000
G1 Z.3
G1 E.8 F1800
; LINE_WIDTH: 0.38292
G1 F15000
M204 S6000
G1 X93.026 Y92.806 E.01152
; WIPE_START
G1 X92.61 Y92.797 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.581 Y92.66 Z.7 F42000
G1 Z.3
G1 E.8 F1800
G1 F15000
M204 S6000
G1 X94.518 Y92.696 E.00204
G1 X94.566 Y92.724 E.00155
; WIPE_START
G1 X94.518 Y92.696 E-.32873
G1 X94.581 Y92.66 E-.43127
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.624 Y87.286 Z.7 F42000
G1 Z.3
G1 E.8 F1800
G1 F15000
M204 S6000
G1 X94.561 Y87.322 E.00204
G1 X94.609 Y87.35 E.00155
; WIPE_START
G1 X94.561 Y87.322 E-.32874
G1 X94.624 Y87.286 E-.43126
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.485 Y87.211 Z.7 F42000
G1 Z.3
G1 E.8 F1800
G1 F15000
M204 S6000
G3 X93.42 Y87.217 I.354 J16.173 E.02593
; WIPE_START
G1 X92.485 Y87.211 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.356 Y87.076 Z.7 F42000
G1 Z.3
G1 E.8 F1800
G1 F15000
M204 S6000
G1 X90.667 Y87.094 E.00861
; WIPE_START
G1 X90.356 Y87.076 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.021 Y87.43 Z.7 F42000
G1 Z.3
G1 E.8 F1800
G1 F15000
M204 S6000
G1 X96.957 Y87.467 E.00204
G1 X97.006 Y87.495 E.00155
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 0.5
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X96.957 Y87.467 E-.32874
G1 X97.021 Y87.43 E-.43126
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 3/111
; update layer progress
M73 L3
M991 S0 P2 ;notify layer change

; OBJECT_ID: 427
M204 S10000
G17
G3 Z.7 I-1.058 J.602 P1  F42000
G1 X99.005 Y90.916 Z.7
G1 Z.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4414
M204 S6000
G1 X101.502 Y90.916 E.08282
G1 X101.501 Y92.444 E.05071
G3 X101.289 Y92.654 I-.197 J.013 E.01123
G1 X90.445 Y93.375 E.3605
G3 X84.112 Y90.001 I-.445 J-6.795 E.25067
G3 X90.173 Y86.613 I5.887 J3.415 E.24172
G1 X101.288 Y87.346 E.36951
G3 X101.503 Y87.597 I.008 J.21 E.0126
G1 X101.502 Y89.084 E.04934
G1 X99.005 Y89.084 E.08283
G1 X99.005 Y90.856 E.05875
M204 S10000
M73 P35 R11
G1 X99.398 Y90.524 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4414
M204 S5000
G1 X101.44 Y90.524 E.06276
G1 X101.84 Y90.524 E.01229
G1 X101.894 Y90.524 E.00167
G1 X101.894 Y91.124 E.01844
G1 X101.894 Y91.524 E.01229
G1 X101.893 Y92.069 E.01675
G1 X101.893 Y92.469 E.01229
G1 X101.881 Y92.56 E.00283
G1 X101.86 Y92.646 E.00271
G1 F3700.405
G1 X101.827 Y92.727 E.00269
G1 F3000
G1 X101.809 Y92.76 E.00116
G3 X101.506 Y93.01 I-.55 J-.359 E.01226
G1 F3690.533
G1 X101.423 Y93.032 E.00265
G1 F4414
G1 X101.327 Y93.045 E.00295
G1 X100.928 Y93.071 E.01229
G1 X99.92 Y93.138 E.03105
G1 X99.521 Y93.165 E.01229
G1 X97.504 Y93.299 E.0621
G1 X97.105 Y93.325 E.01229
G1 X96.296 Y93.379 E.02491
G1 X95.897 Y93.405 E.01229
G1 F3900
G1 X93.881 Y93.539 E.0621
G1 X93.482 Y93.566 E.01229
G1 F3000
G1 X92.673 Y93.62 E.02491
G1 X92.274 Y93.646 E.01229
G1 F2880
G1 X91.066 Y93.726 E.0372
G3 X87.475 Y93.328 I-.94 J-7.903 E.11198
G1 F2760
G3 X86.578 Y92.921 I3.482 J-8.875 E.03029
G1 F2640
G3 X85.595 Y92.283 I3.49 J-6.454 E.03604
G1 F2520
G3 X85.097 Y91.861 I4.336 J-5.614 E.02007
G1 F2400
G3 X84.625 Y91.378 I4.805 J-5.175 E.02074
G1 F2280
G3 X84.239 Y90.905 I5.505 J-4.886 E.01876
G1 F2160
G1 X84.029 Y90.608 E.0112
G1 F2040
G3 X83.783 Y90.214 I5.637 J-3.789 E.01426
G1 F1800
G1 X83.758 Y90.165 E.0017
M106 S201.45
M106 S255
G1 F1680
G3 X83.729 Y90.076 I.401 J-.181 E.00287
M106 S201.45
M106 S255
G1 F1560
G3 X83.725 Y89.946 I.436 J-.078 E.00404
M106 S201.45
M106 S255
G1 F1680
G3 X83.749 Y89.857 I.406 J.062 E.00282
M106 S201.45
M106 S255
G1 F1800
G1 X83.769 Y89.812 E.00151
M106 S201.45
G1 F2040
G3 X84.016 Y89.411 I5.177 J2.915 E.01449
G1 F2160
G3 X84.312 Y88.998 I5.943 J3.957 E.01561
G1 F2280
G3 X84.748 Y88.488 I6.41 J5.023 E.02063
G1 F2400
G3 X85.272 Y87.982 I5.793 J5.481 E.02238
G1 F2520
G3 X85.745 Y87.604 I5.639 J6.571 E.01861
G1 F2640
G3 X86.357 Y87.203 I4.799 J6.657 E.02251
G1 F2760
G3 X87.189 Y86.786 I4.543 J8.028 E.02859
G1 F2880
G3 X90.185 Y86.221 I2.815 J6.694 E.09438
G3 X91.059 Y86.274 I-.87 J21.607 E.02693
G1 F3000
G1 X92.644 Y86.38 E.0488
G1 F3900
G1 X93.043 Y86.407 E.01229
G1 X94.229 Y86.486 E.03651
G2 X95.426 Y86.566 I41.694 J-617.821 E.03687
G1 F4414
G1 X95.825 Y86.592 E.01229
G1 X96.752 Y86.653 E.02853
G1 X97.151 Y86.679 E.01229
G1 X98.077 Y86.741 E.02853
G1 X98.476 Y86.767 E.01229
G1 X100.928 Y86.929 E.0755
G1 X101.327 Y86.955 E.01229
G1 X101.423 Y86.968 E.00295
G1 F3684.061
G1 X101.505 Y86.99 E.00263
G1 F3000
G3 X101.828 Y87.276 I-.184 J.533 E.01361
G1 F3700.969
G1 X101.861 Y87.357 E.00269
G1 F4018.888
G1 X101.871 Y87.393 E.00113
G1 F4414
G1 X101.889 Y87.485 E.00288
G1 X101.895 Y87.585 E.00309
G1 X101.895 Y87.985 E.01229
G1 X101.895 Y89.476 E.04582
G1 X101.84 Y89.476 E.00169
G1 X101.44 Y89.476 E.01229
G1 X99.398 Y89.477 E.06274
G1 X99.398 Y90.464 E.03033
; WIPE_START
G1 F12000
M204 S6000
G1 X101.397 Y90.522 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.9 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z0.9
G1 X0 Y90.0001 F18000 ; move to safe pos
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




G1 X100.587 Y87.522 F42000
G1 Z.5
G1 E.8 F1800
; FEATURE: Internal solid infill
G1 F4414
M204 S6000
G1 X101.28 Y88.215 E.03012
G1 X101.28 Y88.749
G1 X100.016 Y87.485 E.05493
G1 X99.445 Y87.447
G1 X100.86 Y88.862 E.06149
G1 X100.327 Y88.862
G1 X98.874 Y87.409 E.06313
G1 X98.303 Y87.372
G1 X99.794 Y88.862 E.06477
G1 X99.261 Y88.862
G1 X97.732 Y87.334 E.0664
G1 X97.161 Y87.296
G1 X98.783 Y88.918 E.07047
G1 X98.783 Y89.451
G1 X96.591 Y87.259 E.09528
G1 X96.02 Y87.221
G1 X98.783 Y89.984 E.12008
G1 X98.783 Y90.518
G1 X95.449 Y87.183 E.14489
G1 X94.878 Y87.146
G1 X98.783 Y91.051 E.1697
; WIPE_START
G1 F15000
G1 X97.369 Y89.637 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.9 I-.53 J1.095 P1  F42000
G1 X100.47 Y91.138 Z.9
G1 Z.5
G1 E.8 F1800
G1 F4414
M204 S6000
G1 X101.279 Y91.947 E.03515
G1 X101.234 Y92.435
G1 X99.937 Y91.138 E.05637
G1 X99.403 Y91.138
G1 X100.734 Y92.468 E.05781
G1 X100.234 Y92.502
G1 X98.87 Y91.138 E.05926
; WIPE_START
G1 F15000
G1 X100.234 Y92.502 E-.73285
G1 X100.305 Y92.497 E-.02715
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.9 I-.081 J-1.214 P1  F42000
G1 X99.734 Y92.535 Z.9
G1 Z.5
G1 E.8 F1800
G1 F4414
M204 S6000
G1 X94.307 Y87.108 E.23582
G1 X93.736 Y87.07
G1 X99.234 Y92.568 E.2389
G1 X98.734 Y92.601
G1 X93.165 Y87.033 E.24198
G1 X92.594 Y86.995
G1 X98.234 Y92.634 E.24506
G1 X97.734 Y92.668
G1 X92.023 Y86.957 E.24814
G1 X91.452 Y86.92
G1 X97.234 Y92.701 E.25122
G1 X96.733 Y92.734
G1 X90.882 Y86.882 E.2543
G1 X90.311 Y86.845
G1 X96.233 Y92.767 E.25738
G1 X95.733 Y92.801
G1 X89.78 Y86.848 E.25869
G1 X89.275 Y86.875
G1 X95.233 Y92.834 E.25892
G1 X94.733 Y92.867
G1 X88.809 Y86.943 E.25743
G1 X88.37 Y87.037
G1 X94.233 Y92.9 E.25477
G1 X93.733 Y92.933
G1 X87.957 Y87.157 E.251
G1 X87.565 Y87.299
G1 X93.233 Y92.967 E.24629
G1 X92.733 Y93
G1 X87.192 Y87.458 E.2408
G1 X86.838 Y87.638
G1 X92.233 Y93.033 E.23443
G1 X91.733 Y93.066
G1 X86.502 Y87.835 E.22732
G1 X86.183 Y88.049
G1 X91.233 Y93.099 E.21945
G1 X90.733 Y93.133
G1 X85.881 Y88.281 E.21082
G1 X85.591 Y88.524
G1 X90.227 Y93.16 E.20146
G1 X89.693 Y93.159
G1 X85.318 Y88.784 E.19013
G1 X85.06 Y89.059
G1 X89.104 Y93.104 E.17574
G1 X88.444 Y92.976
G1 X84.818 Y89.351 E.15755
G1 X84.594 Y89.66
G1 X87.682 Y92.748 E.13422
G1 X86.662 Y92.261
G1 X84.384 Y89.984 E.09896
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 0.7
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X85.799 Y91.398 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 4/111
; update layer progress
M73 L4
M991 S0 P3 ;notify layer change

; OBJECT_ID: 427
M204 S10000
G17
G3 Z.9 I.033 J1.217 P1  F42000
G1 X99.005 Y91.042 Z.9
G1 Z.7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3106
M204 S6000
G1 X101.597 Y91.042 E.08595
G1 X101.595 Y92.549 E.04997
G3 X101.384 Y92.759 I-.197 J.013 E.01121
G1 X90.44 Y93.52 E.36391
G3 X83.866 Y90.001 I-.443 J-7.07 E.26048
G3 X90.222 Y86.47 I6.137 J3.562 E.25322
G1 X101.413 Y87.244 E.37211
G3 X101.597 Y87.493 I-.017 J.205 E.01166
G1 X101.597 Y88.958 E.04858
G1 X99.005 Y88.958 E.08597
G1 X99.005 Y90.982 E.06714
M204 S10000
G1 X99.398 Y90.65 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3106
M204 S5000
G1 X101.535 Y90.65 E.06569
G1 X101.935 Y90.65 E.01229
G1 X101.989 Y90.65 E.00165
G1 X101.988 Y92.172 E.04678
G1 X101.987 Y92.572 E.01229
G1 X101.976 Y92.664 E.00285
G1 X101.958 Y92.74 E.00238
G1 X101.941 Y92.787 E.00154
G1 X101.904 Y92.863 E.0026
G1 F3000
G3 X101.639 Y93.099 I-.497 J-.292 E.01107
G1 F3106
G1 X101.564 Y93.126 E.00247
G1 X101.521 Y93.136 E.00133
G1 X101.424 Y93.149 E.00303
G1 X101.025 Y93.177 E.01229
G1 X99.888 Y93.255 E.03501
G1 X99.489 Y93.283 E.01229
G1 X98.552 Y93.347 E.02887
G1 X98.153 Y93.375 E.01229
G1 X95.281 Y93.573 E.08846
G1 X94.882 Y93.601 E.01229
G1 X93.608 Y93.69 E.03923
G1 X93.209 Y93.718 E.01229
G1 F3000
G1 X92.534 Y93.766 E.0208
G1 X92.135 Y93.794 E.01229
G1 F2880
G1 X91.061 Y93.87 E.03309
G3 X87.299 Y93.423 I-.974 J-7.865 E.11755
G1 F2760
G3 X86.355 Y92.981 I3.688 J-9.107 E.03203
G1 F2640
G3 X85.313 Y92.281 I5.081 J-8.688 E.03861
G1 F2520
G3 X84.849 Y91.876 I4.639 J-5.776 E.01891
G1 F2400
G3 X84.406 Y91.418 I5.132 J-5.41 E.0196
G1 F2280
G3 X84.002 Y90.92 I5.443 J-4.836 E.0197
G1 F2160
G1 X83.802 Y90.638 E.01061
G1 F2040
G3 X83.537 Y90.214 I5.883 J-3.974 E.01537
G1 F1800
G1 X83.511 Y90.165 E.0017
M106 S201.45
M106 S255
G1 F1680
G3 X83.483 Y90.076 I.383 J-.173 E.00288
M106 S201.45
M106 S255
G1 F1560
G3 X83.479 Y89.945 I.399 J-.077 E.00403
M106 S201.45
M106 S255
G1 F1680
G3 X83.502 Y89.857 I.397 J.057 E.0028
M106 S201.45
M106 S255
G1 F1800
G1 X83.525 Y89.807 E.0017
M106 S201.45
G1 F2040
G3 X83.773 Y89.405 I5.743 J3.266 E.0145
G1 F2160
G3 X84.06 Y89.002 I6.152 J4.079 E.01523
G1 F2280
G3 X84.559 Y88.416 I6.56 J5.07 E.02366
G1 F2400
G3 X84.968 Y88.013 I5.497 J5.188 E.01764
G1 F2520
G3 X85.61 Y87.493 I7.24 J8.268 E.0254
G1 F2640
G3 X86.255 Y87.075 I4.878 J6.832 E.02363
G1 F2760
G3 X87.375 Y86.548 I3.883 J6.798 E.03805
G1 F2880
G3 X90.234 Y86.078 I2.661 J7.244 E.08958
G3 X91.054 Y86.13 I-.724 J17.682 E.02525
G1 F3000
G1 X93.722 Y86.318 E.08217
G1 F3106
G1 X94.121 Y86.346 E.01229
G1 X95.405 Y86.435 E.03955
G1 X95.804 Y86.462 E.01229
G1 X96.49 Y86.51 E.02112
G1 X96.889 Y86.537 E.01229
G1 X98.659 Y86.66 E.05453
G1 X99.058 Y86.687 E.01229
G1 X101.028 Y86.823 E.06067
G1 X101.427 Y86.851 E.01229
G1 X101.472 Y86.856 E.00138
G1 X101.561 Y86.874 E.00278
G1 X101.639 Y86.901 E.00257
G1 F3000
G3 X101.923 Y87.173 I-.226 J.52 E.01233
G1 F3106
G1 X101.953 Y87.245 E.00238
G1 X101.966 Y87.291 E.00146
G1 X101.983 Y87.381 E.00283
G1 X101.989 Y87.481 E.00308
G1 X101.989 Y87.881 E.01229
G1 X101.989 Y89.35 E.04512
G1 X101.935 Y89.35 E.00165
G1 X101.536 Y89.35 E.01229
G1 X99.398 Y89.35 E.06569
G1 X99.398 Y90.59 E.0381
; WIPE_START
G1 F12000
M204 S6000
G1 X101.397 Y90.646 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.1 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1.1
G1 X0 Y90.0001 F18000 ; move to safe pos
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
            G0 Z1.1 F4000
            G39.3 S1
            G0 Z1.1 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X98.657 Y88.772 F42000
G1 Z.7
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3106
M204 S6000
G1 X98.657 Y88.61 E.00537
G1 X100.124 Y88.61 E.04864
G1 X98.935 Y87.421 E.05577
G1 X98.375 Y87.382 E.01862
G1 X96.659 Y89.102 E.08058
G3 X96.244 Y89.513 I-.492 J-.082 E.0207
G1 X96.071 Y89.686 E.00812
G3 X96.237 Y90.48 I-.224 J.461 E.03102
G3 X98.376 Y92.619 I-37.216 J39.356 E.10036
G1 X98.934 Y92.58 E.01855
G1 X100.124 Y91.39 E.05582
G1 X101.248 Y91.39 E.0373
G1 X101.248 Y91.894 E.01672
; WIPE_START
G1 F15476.087
G1 X101.248 Y91.39 E-.19149
G1 X100.124 Y91.39 E-.42726
G1 X99.861 Y91.653 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.1 I.465 J-1.125 P1  F42000
G1 X94.855 Y89.585 Z1.1
G1 Z.7
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.39982
G1 F3106
M204 S6000
G1 X94.954 Y89.884 E.00916
; LINE_WIDTH: 0.433168
G1 X95.06 Y90.034 E.00584
; LINE_WIDTH: 0.490885
G1 X95.166 Y90.184 E.00671
M73 P36 R11
G1 X95.134 Y90.418 E.00865
; LINE_WIDTH: 0.483595
G1 X95.119 Y90.41 E.00062
; LINE_WIDTH: 0.449345
G1 X95.104 Y90.402 E.00057
; LINE_WIDTH: 0.40469
G1 X95.089 Y90.394 E.00051
G1 X94.969 Y90.623 E.00762
G1 X94.97 Y90.973 E.01032
G1 X95.12 Y91.216 E.00842
; LINE_WIDTH: 0.390485
G1 X95.33 Y91.33 E.00677
; LINE_WIDTH: 0.357948
G1 X95.683 Y91.383 E.00916
G1 X96.041 Y91.304 E.0094
G1 X96.271 Y91.148 E.00713
G1 X96.304 Y91.059 E.00243
G1 X96.188 Y90.904 E.00499
G1 X95.716 Y91.075 E.01287
G1 X95.446 Y91.024 E.00706
; LINE_WIDTH: 0.399408
G1 X95.35 Y90.917 E.00417
G1 X95.307 Y90.739 E.00531
G1 X95.375 Y90.535 E.00626
; LINE_WIDTH: 0.415095
G1 X95.359 Y90.528 E.00052
; LINE_WIDTH: 0.449345
G1 X95.343 Y90.521 E.00057
; LINE_WIDTH: 0.500474
G1 X95.327 Y90.515 E.00064
G1 X95.475 Y90.379 E.0075
G1 X95.896 Y90.193 E.01714
G1 X95.89 Y90.093 E.00372
G1 X95.497 Y89.959 E.01547
; LINE_WIDTH: 0.48397
G1 X95.406 Y89.847 E.00521
; LINE_WIDTH: 0.45047
G1 X95.315 Y89.734 E.00482
; LINE_WIDTH: 0.41697
G1 X95.224 Y89.621 E.00442
; LINE_WIDTH: 0.380294
G1 X95.186 Y89.305 E.00876
G1 X95.349 Y89.048 E.00835
; LINE_WIDTH: 0.35391
G1 X95.601 Y88.951 E.00684
G1 X95.823 Y89.011 E.00581
; LINE_WIDTH: 0.378866
G1 X96.096 Y89.126 E.00814
G1 X96.231 Y89.102 E.00375
G1 X96.28 Y89.015 E.00273
G1 X96.206 Y88.836 E.0053
G1 X95.936 Y88.691 E.00839
G1 X95.433 Y88.672 E.01379
G1 X95.173 Y88.785 E.00775
G1 X94.992 Y88.959 E.00687
G1 X94.852 Y89.257 E.00901
G1 X94.854 Y89.525 E.00733
; WIPE_START
G1 F15000
G1 X94.852 Y89.257 E-.1018
G1 X94.992 Y88.959 E-.12505
G1 X95.173 Y88.785 E-.09537
G1 X95.433 Y88.672 E-.10759
G1 X95.936 Y88.691 E-.19142
G1 X96.206 Y88.836 E-.11643
G1 X96.228 Y88.89 E-.02235
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.1 I1.106 J-.508 P1  F42000
G1 X95.44 Y87.173 Z1.1
G1 Z.7
G1 E.8 F1800
; LINE_WIDTH: 0.38292
G1 F3106
M204 S6000
G1 X90.222 Y86.829 E.14487
G2 X88.828 Y86.931 I.175 J11.975 E.03875
; WIPE_START
G1 F15000
G1 X89.687 Y86.838 E-.32824
G1 X90.222 Y86.829 E-.20345
G1 X90.822 Y86.868 E-.22831
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.1 I-1.034 J-.641 P1  F42000
G1 X88.659 Y90.358 Z1.1
G1 Z.7
G1 E.8 F1800
; LINE_WIDTH: 0.364925
G1 F3106
M204 S6000
G1 X88.462 Y89.821 E.01501
; LINE_WIDTH: 0.376483
G1 X88.331 Y89.509 E.00919
; LINE_WIDTH: 0.418633
G3 X88.044 Y88.704 I4.49 J-2.056 E.02622
G1 X88.25 Y88.173 E.01742
G1 X88.43 Y87.9 E.01003
G1 X88.837 Y87.695 E.01394
G1 X88.801 Y87.551 E.00453
G1 X88.612 Y87.374 E.00793
G1 X88.601 Y87.264 E.0034
G1 X88.664 Y87.05 E.00682
G1 X88.769 Y86.943 E.00461
G2 X87.512 Y87.34 I3.863 J14.413 E.04038
G2 X85.289 Y88.791 I2.885 J6.85 E.08171
G1 X84.683 Y89.479 E.02808
G1 X84.334 Y89.998 E.01916
G2 X85.226 Y91.129 I5.077 J-3.088 E.04421
G1 X85.189 Y90.922 E.00643
G1 X85.27 Y90.728 E.00646
G1 X85.404 Y90.614 E.00537
G2 X86.42 Y90.594 I.074 J-21.377 E.0311
G1 X86.526 Y90.56 E.00341
G1 X86.65 Y90.373 E.00686
G1 X86.985 Y90.32 E.01039
G3 X87.269 Y90.584 I-.334 J.642 E.012
G1 X87.334 Y90.567 E.00207
G1 X87.46 Y90.364 E.00729
G1 X87.632 Y89.89 E.01546
G1 X87.696 Y89.825 E.00278
G1 X88.007 Y89.793 E.00959
; LINE_WIDTH: 0.405488
G1 X88.084 Y89.861 E.00303
; LINE_WIDTH: 0.367209
G1 X88.161 Y89.929 E.00271
G1 X88.353 Y90.469 E.01514
G1 X88.434 Y90.587 E.00377
G1 X88.601 Y90.614 E.00446
G1 X88.675 Y90.535 E.00287
G1 X88.664 Y90.418 E.00311
; WIPE_START
G1 F15000
G1 X88.675 Y90.535 E-.0737
G1 X88.601 Y90.614 E-.06799
G1 X88.434 Y90.587 E-.10573
G1 X88.353 Y90.469 E-.08943
G1 X88.161 Y89.929 E-.3588
G1 X88.084 Y89.861 E-.06434
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.1 I1.106 J-.508 P1  F42000
G1 X87.881 Y89.418 Z1.1
G1 Z.7
G1 E.8 F1800
; LINE_WIDTH: 0.41999
G1 F3106
M204 S6000
G1 X87.7 Y88.926 E.01613
G1 X87.671 Y88.65 E.00853
G1 X87.9 Y88.034 E.0202
G3 X88.264 Y87.519 I1.545 J.708 E.01947
G1 X88.26 Y87.486 E.00102
G2 X86.474 Y88.322 I1.96 J6.515 E.06081
G1 X86.123 Y88.566 E.01316
G1 X85.555 Y89.059 E.02308
G1 X84.982 Y89.71 E.02665
G1 X84.786 Y90.001 E.01077
G1 X85.083 Y90.41 E.01553
G1 X85.239 Y90.272 E.0064
G1 X85.443 Y90.233 E.0064
G1 X86.284 Y90.23 E.02583
G1 X86.425 Y90.071 E.00656
G1 X86.771 Y89.956 E.01119
G1 X87.026 Y89.945 E.00783
G1 X87.176 Y90.037 E.00541
G1 X87.345 Y89.641 E.01322
G1 X87.499 Y89.503 E.00634
G1 X87.822 Y89.432 E.01018
M204 S10000
G1 X87.383 Y89.158 F42000
G1 F3106
M204 S6000
G3 X87.298 Y88.596 I.926 J-.429 E.01771
G1 X87.422 Y88.214 E.01233
G1 X87.014 Y88.416 E.01398
G1 X86.407 Y88.819 E.02239
G1 X85.822 Y89.327 E.02381
G1 X85.347 Y89.866 E.02207
G3 X86.118 Y89.854 I.781 J24.236 E.02368
G1 X86.201 Y89.768 E.00367
G1 X86.681 Y89.586 E.01578
G1 X86.953 Y89.569 E.00839
G1 X87.172 Y89.277 E.0112
G1 X87.331 Y89.187 E.0056
M204 S10000
G1 X86.906 Y88.973 F42000
; LINE_WIDTH: 0.48997
G1 F3106
M204 S6000
G1 X86.826 Y89.041 E.0038
; LINE_WIDTH: 0.52123
G1 X86.747 Y89.108 E.00406
; WIPE_START
G1 F13171.375
G1 X86.826 Y89.041 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.1 I-.966 J-.74 P1  F42000
G1 X85.226 Y91.129 Z1.1
G1 Z.7
G1 E.8 F1800
; LINE_WIDTH: 0.387247
G1 F3106
M204 S6000
G2 X86.118 Y91.913 I4.671 J-4.414 E.03337
G1 X86.932 Y92.42 E.0269
G2 X90.425 Y93.162 I3.082 J-5.916 E.10141
G1 X95.605 Y92.818 E.14567
; WIPE_START
G1 F15000
G1 X93.61 Y92.95 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.1 I.627 J-1.043 P1  F42000
G1 X89.47 Y90.46 Z1.1
G1 Z.7
G1 E.8 F1800
; LINE_WIDTH: 0.63584
G1 F3106
M204 S6000
G1 X89.546 Y90.34 E.00686
M204 S10000
G1 X90.112 Y89.805 F42000
; LINE_WIDTH: 0.487175
G1 F3106
M204 S6000
G1 X90.123 Y89.459 E.01255
; LINE_WIDTH: 0.470128
G1 X90.212 Y89.371 E.00437
; LINE_WIDTH: 0.427963
G1 X90.302 Y89.283 E.00393
; LINE_WIDTH: 0.429944
G1 X90.319 Y89.206 E.00247
; LINE_WIDTH: 0.476072
G1 X90.336 Y89.13 E.00277
; LINE_WIDTH: 0.5222
G1 X90.353 Y89.053 E.00306
; LINE_WIDTH: 0.568328
G1 X90.369 Y88.977 E.00336
; LINE_WIDTH: 0.614456
G1 X90.386 Y88.9 E.00365
; LINE_WIDTH: 0.614532
G1 X90.328 Y88.941 E.00332
; LINE_WIDTH: 0.568555
G1 X90.27 Y88.983 E.00305
; LINE_WIDTH: 0.522579
G1 X90.212 Y89.024 E.00278
; LINE_WIDTH: 0.48717
G1 X89.853 Y89.094 E.01325
; LINE_WIDTH: 0.456219
G1 X89.808 Y89.05 E.00212
; LINE_WIDTH: 0.419155
G1 X89.763 Y89.006 E.00193
; LINE_WIDTH: 0.356793
G1 X89.508 Y88.662 E.01095
G1 X89.358 Y88.651 E.00385
G1 X89.291 Y88.77 E.0035
G1 X89.309 Y88.874 E.00269
G1 X89.46 Y89.157 E.00822
; LINE_WIDTH: 0.382534
G1 X89.549 Y89.284 E.00427
; LINE_WIDTH: 0.416
G1 X89.637 Y89.41 E.00469
; LINE_WIDTH: 0.449467
G1 X89.725 Y89.536 E.00511
; LINE_WIDTH: 0.4832
G1 X89.705 Y89.759 E.00802
; LINE_WIDTH: 0.5172
G1 X89.685 Y89.982 E.00864
; LINE_WIDTH: 0.552844
G1 X89.649 Y90.084 E.00451
; LINE_WIDTH: 0.59013
G1 X89.613 Y90.186 E.00484
; LINE_WIDTH: 0.627417
G1 X89.578 Y90.289 E.00517
; LINE_WIDTH: 0.624437
G1 X89.675 Y90.267 E.00473
; LINE_WIDTH: 0.58119
G1 X89.773 Y90.246 E.00437
; LINE_WIDTH: 0.537944
G1 X89.87 Y90.225 E.00402
; LINE_WIDTH: 0.49292
G1 X90.009 Y90.247 E.00517
; LINE_WIDTH: 0.451902
G1 X90.124 Y90.371 E.00564
; LINE_WIDTH: 0.416665
G1 X90.239 Y90.495 E.00515
; LINE_WIDTH: 0.368059
G1 X90.354 Y90.619 E.00448
G1 X90.485 Y90.596 E.00354
G1 X90.543 Y90.506 E.00283
G1 X90.421 Y90.208 E.00852
; LINE_WIDTH: 0.384357
G1 X90.33 Y90.089 E.00416
; LINE_WIDTH: 0.42387
G1 X90.239 Y89.971 E.00464
; LINE_WIDTH: 0.463384
G1 X90.148 Y89.853 E.00512
M204 S10000
G1 X90.386 Y88.9 F42000
; LINE_WIDTH: 0.62399
G1 F3106
M204 S6000
G1 X90.461 Y88.795 E.00612
; LINE_WIDTH: 0.587706
G1 X90.548 Y88.804 E.00384
; LINE_WIDTH: 0.542198
G1 X90.634 Y88.813 E.00352
; LINE_WIDTH: 0.49669
G1 X90.72 Y88.822 E.0032
; LINE_WIDTH: 0.451182
G1 X90.806 Y88.831 E.00288
; LINE_WIDTH: 0.405674
G1 X90.892 Y88.84 E.00256
M204 S10000
G1 X90.951 Y88.846 F42000
; LINE_WIDTH: 0.419027
G1 F3106
M204 S6000
G1 X91.072 Y88.917 E.00429
G1 X91.288 Y89.203 E.01098
G1 X91.509 Y89.273 E.00711
G1 X91.769 Y89.186 E.00842
G1 X91.945 Y89.216 E.00547
G1 X92.104 Y89.339 E.00615
G1 X92.176 Y89.498 E.00535
G1 X92.121 Y90.054 E.01711
G1 X92.174 Y90.526 E.01456
G1 X92.316 Y90.852 E.01089
G1 X92.542 Y91.094 E.01013
G1 X92.798 Y91.212 E.00865
G2 X93.859 Y91.273 I.802 J-4.685 E.03264
G1 X94.001 Y91.206 E.00481
G1 X94.002 Y89.248 E.06
G1 X93.971 Y88.803 E.01368
G1 X93.826 Y88.747 E.00477
G2 X92.804 Y88.836 I-.149 J4.165 E.03151
G1 X92.619 Y88.904 E.00604
G1 X92.323 Y89.145 E.0117
G3 X91.878 Y88.97 I-.096 J-.408 E.01558
G1 X91.808 Y88.729 E.0077
G1 X91.672 Y88.593 E.00592
G1 X91.453 Y88.548 E.00684
G1 X91.224 Y88.659 E.00779
G1 X91.076 Y88.822 E.00676
G1 X91.01 Y88.835 E.00204
M204 S10000
G1 X91.511 Y88.873 F42000
; LINE_WIDTH: 0.36842
G1 F3106
M204 S6000
G1 X91.45 Y88.909 E.00187
G1 X91.495 Y88.934 E.00136
; WIPE_START
G1 F15000
G1 X91.45 Y88.909 E-.31962
G1 X91.511 Y88.873 E-.44038
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.1 I-.941 J.772 P1  F42000
G1 X92.498 Y90.076 Z1.1
G1 Z.7
G1 E.8 F1800
; LINE_WIDTH: 0.41999
G1 F3106
M204 S6000
G1 X92.539 Y90.42 E.01065
G1 X92.71 Y90.721 E.01066
G1 X92.903 Y90.845 E.00706
G1 X93.624 Y90.895 E.02219
G1 X93.62 Y89.129 E.05426
G1 X93.064 Y89.161 E.01711
G1 X92.811 Y89.235 E.00808
G1 X92.547 Y89.446 E.01039
G1 X92.502 Y90.016 E.01757
M204 S10000
G1 X92.875 Y90.137 F42000
; LINE_WIDTH: 0.409163
G1 F3106
M204 S6000
G1 X92.95 Y90.435 E.00918
G2 X93.254 Y90.517 I.268 J-.391 E.00958
G3 X93.253 Y89.517 I273.761 J-.692 E.02985
G1 X93.001 Y89.561 E.00765
G1 X92.91 Y89.638 E.00355
G1 X92.879 Y90.077 E.01312
; WIPE_START
G1 F15000
G1 X92.91 Y89.638 E-.16712
G1 X93.001 Y89.561 E-.04523
G1 X93.253 Y89.517 E-.09745
G1 X93.254 Y90.517 E-.38009
G1 X93.071 Y90.494 E-.07012
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.1 I.765 J-.947 P1  F42000
G1 X89.107 Y87.293 Z1.1
G1 Z.7
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3106
M204 S6000
G3 X88.677 Y88.205 I-.425 J.357 E.04197
G1 X88.665 Y88.218 E.0006
G2 X88.533 Y88.533 I4.621 J2.121 E.01132
G1 X88.932 Y88.918 E.0184
G3 X89.946 Y88.631 I.513 J-.124 E.05364
G1 X89.951 Y88.623 E.00029
G3 X90.855 Y88.488 I.488 J.169 E.03726
G1 X90.861 Y88.48 E.00033
G3 X91.791 Y88.209 I.628 J.426 E.03484
G1 X92.659 Y87.341 E.04074
G1 X93.127 Y87.37 E.01557
G1 X94.602 Y88.861 E.06955
G2 X94.701 Y90.263 I1.203 J.62 E.04902
G2 X94.606 Y91.151 I1.016 J.557 E.03041
G3 X93.126 Y92.631 I-18.435 J-16.954 E.06947
G1 X92.661 Y92.661 E.01545
G1 X90.813 Y90.808 E.08681
G2 X90.681 Y89.928 I-.637 J-.355 E.03174
G3 X90.63 Y89.487 I.154 J-.242 E.01685
G3 X90.79 Y89.21 I4.342 J2.332 E.01064
G1 X90.795 Y89.22 E.00039
G2 X91.752 Y89.624 I.694 J-.309 E.03792
G1 X91.733 Y89.754 E.00434
G2 X91.722 Y90.096 I2.212 J.241 E.01137
; WIPE_START
G1 F15476.087
G1 X91.733 Y89.754 E-.13017
G1 X91.752 Y89.624 E-.04966
G1 X91.481 Y89.672 E-.10422
G1 X91.193 Y89.611 E-.11192
G1 X90.94 Y89.437 E-.11688
G1 X90.795 Y89.22 E-.099
G1 X90.79 Y89.21 E-.00442
G1 X90.63 Y89.487 E-.12182
G1 X90.597 Y89.534 E-.02191
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.1 I-.401 J-1.149 P1  F42000
G1 X87.967 Y90.451 Z1.1
G1 Z.7
G1 E.8 F1800
G1 F3106
M204 S6000
G2 X89.003 Y90.729 I.562 J-.026 E.04716
G1 X89.003 Y90.729 E0
G2 X89.122 Y90.878 I.502 J-.278 E.00634
G1 X87.652 Y92.348 E.06893
G3 X86.25 Y91.53 I3.6 J-7.782 E.05392
; CHANGE_LAYER
; Z_HEIGHT: 0.9
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X87.174 Y92.129 E-.41843
G1 X87.652 Y92.348 E-.19975
G1 X87.916 Y92.084 E-.14182
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 5/111
; update layer progress
M73 L5
M991 S0 P4 ;notify layer change

; OBJECT_ID: 427
M204 S10000
G17
G3 Z1.1 I.332 J1.171 P1  F42000
G1 X99.005 Y88.941 Z1.1
G1 Z.9
G1 E.8 F1800
M106 S255
; FEATURE: Inner wall
G1 F2076
M204 S6000
G1 X99.005 Y91.059 E.07025
G1 X101.691 Y91.059 E.08908
G1 X101.689 Y92.664 E.05324
G3 X101.479 Y92.863 I-.199 J0 E.01074
G1 X90.491 Y93.661 E.36547
G3 X83.619 Y90.002 I-.477 J-7.386 E.27195
G3 X90.269 Y86.328 I6.379 J3.689 E.26478
G1 X101.479 Y87.137 E.37285
G3 X101.691 Y87.39 I.006 J.21 E.01258
G1 X101.691 Y88.941 E.05145
G1 X99.065 Y88.941 E.08711
M204 S10000
G1 X99.398 Y89.333 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2076
M204 S5000
G1 X99.398 Y90.667 E.04098
G1 X101.63 Y90.667 E.0686
G1 X102.03 Y90.667 E.01229
G1 X102.083 Y90.667 E.00164
G1 X102.082 Y92.279 E.04953
G1 X102.081 Y92.679 E.01229
G1 X102.078 Y92.719 E.00122
G1 X102.061 Y92.81 E.00285
G1 X102.034 Y92.892 E.00265
G1 X101.998 Y92.966 E.00253
G3 X101.699 Y93.216 I-.517 J-.314 E.01221
G1 X101.614 Y93.24 E.00272
G1 X101.52 Y93.253 E.00292
G1 X101.121 Y93.282 E.01229
G1 X100.921 Y93.296 E.00615
G1 X100.14 Y93.352 E.02407
G1 X99.741 Y93.381 E.01229
G1 X98.959 Y93.437 E.02407
G1 X98.56 Y93.466 E.01229
G1 X96.599 Y93.607 E.06044
G1 X96.2 Y93.636 E.01229
G1 X95.019 Y93.721 E.03636
G1 X94.221 Y93.779 E.02458
G1 X93.823 Y93.808 E.01229
G1 X92.867 Y93.879 E.02945
G1 X92.468 Y93.908 E.01229
G1 X91.113 Y94.009 E.04174
G3 X87.175 Y93.538 I-1.022 J-8.155 E.12308
G3 X85.955 Y92.935 I2.971 J-7.552 E.04185
G3 X85.375 Y92.545 I3.992 J-6.569 E.0215
G3 X84.633 Y91.921 I5.364 J-7.12 E.0298
G3 X84.171 Y91.439 I5.209 J-5.462 E.02054
G3 X83.714 Y90.866 I5.754 J-5.06 E.02253
G3 X83.32 Y90.264 I6.275 J-4.534 E.02209
G1 F1920
G1 X83.278 Y90.19 E.00263
G1 F1800
G1 X83.257 Y90.144 E.00155
M106 S201.45
M106 S255
G1 F1680
G3 X83.233 Y90.054 I.363 J-.144 E.00285
M106 S201.45
M106 S255
G1 F1560
G3 X83.231 Y89.968 I.346 J-.055 E.00268
M106 S201.45
M106 S255
G1 F1680
G3 X83.249 Y89.879 I.41 J.039 E.0028
M106 S201.45
M106 S255
G1 F1800
G3 X83.292 Y89.785 I.471 J.156 E.00318
M106 S201.45
G1 F2040
G3 X83.532 Y89.397 I6.521 J3.773 E.01403
G1 F2076
G3 X83.847 Y88.956 I6.501 J4.302 E.01665
G3 X84.189 Y88.541 I5.968 J4.577 E.01651
G3 X84.851 Y87.879 I6.279 J5.617 E.0288
G3 X85.261 Y87.54 I5.114 J5.779 E.01635
G3 X86.128 Y86.963 I5.983 J8.039 E.03201
G3 X87.196 Y86.454 I3.946 J6.912 E.03638
G3 X89.465 Y85.949 I2.835 J7.388 E.07169
G1 X89.759 Y85.934 E.00903
G3 X90.282 Y85.936 I.243 J8.013 E.01608
G3 X91.107 Y85.991 I-.709 J16.724 E.02542
G1 X93.811 Y86.191 E.08331
G1 X94.21 Y86.22 E.01229
G1 X95.495 Y86.313 E.03958
G1 X95.894 Y86.341 E.01229
G1 X96.58 Y86.391 E.02114
G1 X96.979 Y86.42 E.01229
G1 X98.751 Y86.547 E.05458
G1 X99.15 Y86.576 E.01229
G1 X99.836 Y86.626 E.02114
G1 X100.235 Y86.655 E.01229
G1 X101.121 Y86.718 E.02729
G1 X101.52 Y86.747 E.01229
G1 X101.614 Y86.76 E.00292
G1 X101.699 Y86.784 E.00272
G3 X101.977 Y86.999 I-.225 J.577 E.01097
G3 X102.033 Y87.105 I-.485 J.326 E.00368
G1 X102.061 Y87.19 E.00276
G1 X102.078 Y87.279 E.00277
G1 X102.084 Y87.378 E.00306
G1 X102.084 Y87.778 E.01229
G1 X102.084 Y89.333 E.04777
G1 X102.03 Y89.333 E.00164
G1 X101.63 Y89.333 E.01229
G1 X99.458 Y89.333 E.06676
; WIPE_START
G1 F12000
M204 S6000
G1 X99.398 Y90.667 E-.50731
G1 X100.063 Y90.667 E-.25269
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.3 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1.3
G1 X0 Y90.0001 F18000 ; move to safe pos
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
            G0 Z1.3 F4000
            G39.3 S1
            G0 Z1.3 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X95.611 Y92.946 F42000
G1 Z.9
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.385801
G1 F2076
M204 S6000
G1 X90.475 Y93.303 E.14385
G3 X87.004 Y92.625 I-.415 J-7.098 E.09986
G1 X86.251 Y92.206 E.02407
G1 X85.652 Y91.773 E.02065
G1 X84.95 Y91.113 E.02692
; LINE_WIDTH: 0.451202
G3 X84.23 Y90.161 I4.1 J-3.846 E.0398
G1 X84.16 Y89.998 E.00589
; LINE_WIDTH: 0.53862
G1 X84.365 Y89.623 E.01726
; LINE_WIDTH: 0.436259
G1 X84.897 Y88.955 E.02737
G1 X85.543 Y88.317 E.02911
G1 X86.004 Y87.966 E.01858
; LINE_WIDTH: 0.383167
G1 X86.78 Y87.486 E.02531
G1 X87.583 Y87.126 E.02438
G1 X88.384 Y86.874 E.02328
G1 X89.286 Y86.72 E.02536
G1 X90.255 Y86.687 E.02689
G1 X95.563 Y87.053 E.14752
; WIPE_START
G1 F12000
G1 X93.568 Y86.916 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.129 Y88.346 Z1.3 F42000
G1 Z.9
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2076
M204 S6000
G3 X87.534 Y87.534 I3.849 J5.043 E.05399
G1 X92.79 Y92.79 E.24657
G1 X92.979 Y92.778 E.00627
G1 X98.487 Y87.27 E.25837
G1 X98.807 Y87.294 E.01067
G1 X100.107 Y88.593 E.06095
G1 X98.657 Y88.593 E.04808
G1 X98.657 Y91.407 E.09335
G1 X100.107 Y91.407 E.04808
G1 X98.806 Y92.708 E.06101
G1 X98.488 Y92.731 E.01059
G1 X92.983 Y87.226 E.25823
M73 P37 R11
G1 X92.787 Y87.213 E.00653
G1 X87.538 Y92.462 E.24624
G3 X86.134 Y91.649 I2.687 J-6.256 E.05393
; CHANGE_LAYER
; Z_HEIGHT: 1.1
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X86.816 Y92.115 E-.31386
G1 X87.538 Y92.462 E-.30429
G1 X87.802 Y92.198 E-.14185
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 6/111
; update layer progress
M73 L6
M991 S0 P5 ;notify layer change

; OBJECT_ID: 427
M204 S10000
G17
G3 Z1.3 I.332 J1.171 P1  F42000
G1 X99.005 Y89.018 Z1.3
G1 Z1.1
G1 E.8 F1800
M106 S255
; FEATURE: Inner wall
G1 F2122
M204 S6000
G1 X99.005 Y90.982 E.06513
G1 X101.784 Y90.982 E.09218
G1 X101.783 Y92.754 E.05877
G3 X101.572 Y92.966 I-.201 J.011 E.0112
G1 X90.54 Y93.801 E.367
G3 X83.376 Y90.001 I-.526 J-7.66 E.28339
G3 X90.238 Y86.183 I6.623 J3.828 E.27353
G1 X101.601 Y87.037 E.37801
G3 X101.785 Y87.288 I-.019 J.206 E.01167
G1 X101.785 Y89.018 E.05739
G1 X99.065 Y89.018 E.0902
M204 S10000
G1 X99.398 Y89.41 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2122
M204 S5000
G1 X99.398 Y90.59 E.03623
G1 X99.439 Y90.59 E.00126
G1 X101.777 Y90.59 E.07185
G1 X102.177 Y90.59 E.01229
G1 X102.175 Y92.377 E.05492
G1 X102.175 Y92.777 E.01229
G1 X102.164 Y92.868 E.00282
G1 X102.143 Y92.953 E.00269
G1 X102.111 Y93.032 E.00259
G1 X102.07 Y93.103 E.00252
G3 X101.826 Y93.306 I-.485 J-.336 E.00987
G1 X101.778 Y93.324 E.00158
G1 X101.709 Y93.342 E.00221
G1 X101.614 Y93.356 E.00295
G1 X101.215 Y93.386 E.01229
G1 X101.016 Y93.401 E.00615
G1 X100.264 Y93.457 E.02316
G1 X99.865 Y93.487 E.01229
G1 X97.963 Y93.63 E.05861
G1 X97.564 Y93.66 E.01229
G1 X96.812 Y93.716 E.02316
G1 X96.413 Y93.746 E.01229
G1 X95.263 Y93.833 E.03545
G1 X94.465 Y93.893 E.02458
G1 X94.066 Y93.923 E.01229
G1 X90.965 Y94.162 E.09559
G1 X90.566 Y94.193 E.01229
G1 X90.334 Y94.206 E.00712
G1 X90.027 Y94.212 E.00945
G3 X86.979 Y93.623 I.001 J-8.187 E.09599
G3 X85.964 Y93.128 I4.226 J-9.947 E.03469
G3 X85.125 Y92.57 I4.553 J-7.757 E.031
G3 X84.589 Y92.124 I4.869 J-6.405 E.02143
G3 X83.948 Y91.471 I6.324 J-6.847 E.02813
G3 X83.472 Y90.872 I6.921 J-5.986 E.02353
G1 X83.347 Y90.693 E.00671
G1 F2040
G3 X83.047 Y90.215 I6.341 J-4.312 E.01731
G1 F1800
G3 X83.01 Y90.136 I.405 J-.238 E.00269
M106 S201.45
M106 S255
G1 F1680
G3 X82.998 Y89.902 I.369 J-.136 E.00732
M106 S201.45
M106 S255
G1 F1800
G3 X83.034 Y89.81 I.44 J.117 E.00302
M106 S201.45
G1 F1920
G1 X83.079 Y89.73 E.00282
G1 F2040
G1 X83.228 Y89.487 E.00877
G1 F2122
G3 X83.634 Y88.91 I7.286 J4.689 E.02169
G3 X83.992 Y88.478 I6.049 J4.649 E.01723
G3 X84.582 Y87.882 I6.668 J6.007 E.02578
G3 X85.198 Y87.375 I6.081 J6.762 E.02453
G3 X86.053 Y86.821 I5.901 J8.175 E.03131
G3 X87.009 Y86.365 I5.359 J9.994 E.03255
G3 X89.267 Y85.822 I3.041 J7.683 E.0716
G1 X89.566 Y85.8 E.00923
G1 X89.792 Y85.791 E.00694
G1 X90.064 Y85.788 E.00835
G1 X90.251 Y85.792 E.00574
G1 X90.561 Y85.807 E.00955
G1 X91.159 Y85.853 E.01844
G1 X92.581 Y85.962 E.0438
G1 X92.979 Y85.993 E.01229
G1 X94.002 Y86.072 E.03151
G2 X95.198 Y86.162 I25.767 J-331.19 E.03687
G1 X95.597 Y86.192 E.01229
G1 X96.363 Y86.25 E.02358
G1 X96.761 Y86.28 E.01229
G1 X98.691 Y86.425 E.05946
G1 X99.09 Y86.455 E.01229
G1 X99.855 Y86.512 E.02359
G1 X100.254 Y86.542 E.01229
G1 X101.219 Y86.614 E.02973
G1 X101.618 Y86.644 E.01229
G1 X101.662 Y86.649 E.00135
G1 X101.75 Y86.667 E.00276
G1 X101.828 Y86.695 E.00256
G3 X102.07 Y86.896 I-.243 J.538 E.00977
G1 X102.111 Y86.968 E.00257
G1 X102.143 Y87.047 E.0026
G1 X102.164 Y87.13 E.00263
G1 X102.171 Y87.173 E.00134
G1 X102.177 Y87.276 E.00318
G1 X102.177 Y87.676 E.01229
G1 X102.177 Y89.41 E.05328
G1 X101.777 Y89.41 E.01229
G1 X99.458 Y89.41 E.07127
; WIPE_START
G1 F12000
M204 S6000
G1 X99.398 Y90.59 E-.44869
G1 X99.439 Y90.59 E-.01558
G1 X100.217 Y90.59 E-.29574
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.5 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1.5
G1 X0 Y90.0001 F18000 ; move to safe pos
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
            G0 Z1.5 F4000
            G39.3 S1
            G0 Z1.5 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X95.224 Y86.901 F42000
G1 Z1.1
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.386653
G1 F2122
M204 S6000
G1 X90.227 Y86.541 E.14034
G2 X88.153 Y86.785 I-.128 J7.838 E.05867
G1 X87.306 Y87.064 E.02498
G1 X86.492 Y87.457 E.02531
G1 X86.001 Y87.763 E.01621
G1 X85.301 Y88.301 E.02475
; LINE_WIDTH: 0.45341
G2 X83.985 Y89.832 I4.35 J5.07 E.06778
; LINE_WIDTH: 0.48377
G1 X83.949 Y89.917 E.00332
; LINE_WIDTH: 0.510529
G1 X83.913 Y90.003 E.00352
G1 X84.133 Y90.396 E.01718
; LINE_WIDTH: 0.46134
G1 X84.675 Y91.089 E.03
; LINE_WIDTH: 0.42631
G1 X85.138 Y91.553 E.02048
; LINE_WIDTH: 0.384884
G2 X90.52 Y93.444 I4.921 J-5.398 E.16331
G1 X95.421 Y93.088 E.13692
; WIPE_START
G1 F15000
G1 X93.426 Y93.233 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.01 Y91.776 Z1.5 F42000
G1 Z1.1
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2122
M204 S6000
G2 X87.42 Y92.58 I4.309 J-5.922 E.05396
G1 X92.916 Y87.084 E.25781
G1 X92.836 Y87.079 E.00266
G1 X98.599 Y92.842 E.27036
G1 X98.678 Y92.836 E.00264
G1 X100.184 Y91.33 E.07064
G1 X98.657 Y91.33 E.05064
G1 X98.657 Y88.67 E.08823
G1 X100.184 Y88.67 E.05064
G1 X98.68 Y87.166 E.07054
G1 X98.597 Y87.16 E.00277
G1 X92.832 Y92.925 E.27046
G1 X92.919 Y92.919 E.00291
G1 X87.415 Y87.415 E.25822
G2 X86.005 Y88.221 I3.729 J8.161 E.05396
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 1.3
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X86.666 Y87.785 E-.30099
G1 X87.415 Y87.415 E-.31746
G1 X87.678 Y87.678 E-.14155
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 7/111
; update layer progress
M73 L7
M991 S0 P6 ;notify layer change

; OBJECT_ID: 427
M204 S10000
G17
G3 Z1.5 I-.162 J1.206 P1  F42000
G1 X101.878 Y89.581 Z1.5
G1 Z1.3
G1 E.8 F1800
; FEATURE: Inner wall
M204 S6000
G1 X101.878 Y89.82 E.00793
M106 S201.45
M106 S255
; FEATURE: Overhang wall
G1 F3000
M204 S5000
G1 X101.878 Y90.18 E.01193
M106 S201.45
M106 S255
; FEATURE: Inner wall
G1 F1800
M204 S6000
G1 X101.878 Y90.562 E.01269
M106 S201.45
M106 S255
G1 F2276
G1 X101.878 Y90.962 E.01327
G1 X101.878 Y91.362 E.01327
G1 X101.878 Y91.762 E.01327
G1 X101.878 Y92.813 E.03484
G3 X101.664 Y93.069 I-.21 J.042 E.01267
G1 X90.592 Y93.94 E.36842
G3 X83.134 Y90 I-.577 J-7.937 E.29489
G3 X90.356 Y86.046 I6.867 J3.971 E.28717
G1 X101.664 Y86.931 E.37625
G3 X101.878 Y87.187 I.001 J.216 E.01261
G1 X101.878 Y88.238 E.03485
G1 X101.878 Y88.638 E.01327
G1 X101.878 Y89.038 E.01327
G1 X101.878 Y89.438 E.01327
G1 F1800
G1 X101.878 Y89.521 E.00277
M106 S201.45
M106 S255
M204 S10000
G1 X102.27 Y89.581 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2276
M204 S5000
G1 X102.27 Y89.82 E.00735
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
G1 F3000
G1 X102.27 Y90.18 E.01193
M106 S201.45
M106 S255
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2276
G1 X102.27 Y90.58 E.01229
G1 X102.27 Y90.78 E.00615
G1 X102.27 Y91.18 E.01229
G1 X102.27 Y91.502 E.00991
G1 X102.27 Y91.902 E.01229
G1 X102.27 Y92.425 E.01605
G1 X102.27 Y92.825 E.01229
G1 X102.264 Y92.925 E.00307
G1 X102.247 Y93.013 E.00276
G1 X102.221 Y93.095 E.00265
G1 X102.183 Y93.173 E.00267
G3 X101.957 Y93.389 I-.487 J-.282 E.00973
G3 X101.843 Y93.435 I-.268 J-.505 E.00381
G1 X101.804 Y93.445 E.00122
G1 X101.707 Y93.459 E.003
G1 X101.109 Y93.505 E.01844
G1 X100.246 Y93.572 E.02659
G1 X99.847 Y93.604 E.01229
G1 X97.723 Y93.769 E.06547
G1 X97.324 Y93.8 E.01229
G1 X96.462 Y93.868 E.02659
G1 X96.063 Y93.899 E.01229
G1 X94.801 Y93.997 E.03888
G1 X94.004 Y94.06 E.02458
G1 X93.605 Y94.092 E.01229
G1 X91.216 Y94.283 E.07365
G3 X89.063 Y94.295 I-1.125 J-9.242 E.06629
G1 X88.807 Y94.26 E.00795
G1 X88.411 Y94.199 E.01229
G3 X86.75 Y93.692 I1.945 J-9.36 E.05343
G3 X85.705 Y93.161 I4.505 J-10.158 E.03604
G3 X84.828 Y92.555 I5.168 J-8.411 E.03277
G3 X84.279 Y92.079 I5.157 J-6.515 E.02234
G3 X83.708 Y91.483 I6.064 J-6.375 E.02535
G3 X83.254 Y90.908 I6.233 J-5.396 E.02254
G1 F2160
G3 X82.902 Y90.378 I6.551 J-4.729 E.01957
G1 F2040
G1 X82.791 Y90.191 E.00668
G1 F1800
G3 X82.756 Y90.101 I.405 J-.209 E.00297
M106 S201.45
M106 S255
G1 F1680
G3 X82.771 Y89.855 I.392 J-.1 E.00769
M106 S201.45
M106 S255
G1 F1800
G1 X82.791 Y89.809 E.00153
M106 S201.45
G1 F2040
G1 X82.896 Y89.631 E.00633
G1 F2160
G3 X83.334 Y88.982 I8.077 J4.978 E.0241
G1 F2276
G3 X83.669 Y88.562 I6.829 J5.11 E.01651
G3 X84.235 Y87.962 I7.256 J6.279 E.02535
G3 X84.821 Y87.451 I6.44 J6.79 E.02389
G3 X85.698 Y86.843 I6.467 J8.393 E.03282
G3 X86.948 Y86.227 I4.455 J7.466 E.04284
G3 X88.528 Y85.779 I3.331 J8.749 E.05055
G3 X90.373 Y85.655 I1.499 J8.458 E.05692
G3 X91.208 Y85.716 I-.957 J18.643 E.02573
G1 X91.607 Y85.748 E.01229
G1 X93.389 Y85.891 E.05492
G2 X94.585 Y85.986 I22.211 J-273.111 E.03687
G1 X94.984 Y86.017 E.01229
G1 X96.76 Y86.155 E.05474
G1 X97.158 Y86.187 E.01229
G1 X98.934 Y86.325 E.05474
G1 X99.333 Y86.356 E.01229
G1 X100.022 Y86.41 E.02122
M73 P38 R11
G1 X100.42 Y86.441 E.01229
G1 X101.308 Y86.51 E.02737
G1 X101.707 Y86.541 E.01229
G1 X101.801 Y86.555 E.00291
G1 X101.883 Y86.578 E.00261
G1 X101.961 Y86.612 E.00262
G3 X102.185 Y86.831 I-.275 J.506 E.00974
G1 X102.221 Y86.905 E.00254
G1 X102.247 Y86.987 E.00266
G1 X102.264 Y87.076 E.00276
G1 X102.27 Y87.175 E.00306
G1 X102.27 Y87.575 E.01229
G1 X102.27 Y87.775 E.00615
G1 X102.27 Y88.098 E.00991
G1 X102.27 Y88.498 E.01229
G1 X102.27 Y89.521 E.03145
; WIPE_START
G1 F4800
M204 S6000
G1 X102.27 Y89.82 E-.11364
G1 X102.27 Y90.18 E-.13672
G1 X102.27 Y90.58 E-.152
G1 X102.27 Y90.78 E-.076
G1 X102.27 Y91.18 E-.152
G1 X102.27 Y91.502 E-.12254
G1 X102.27 Y91.521 E-.0071
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.7 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1.7
M106 S255
G1 X0 Y90.0001 F18000 ; move to safe pos
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
            G0 Z1.7 F4000
            G39.3 S1
            G0 Z1.7 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X101.529 Y91.648 F42000
G1 Z1.3
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2276
M204 S6000
G1 X101.529 Y91.556 E.00305
G1 X101.429 Y91.487 E.00407
G1 X100.027 Y91.487 E.04648
G1 X98.55 Y92.964 E.06933
G1 X98.709 Y92.952 E.0053
G1 X92.688 Y86.931 E.28246
G1 X93.043 Y86.957 E.01183
G1 X87.303 Y92.697 E.26929
G3 X86.584 Y92.341 I1.246 J-3.421 E.02666
G1 X84.169 Y89.926 E.11332
G1 X84.125 Y89.996 E.00275
G1 X84.173 Y90.07 E.00292
G1 X86.605 Y87.638 E.11409
G3 X87.3 Y87.3 I3.414 J6.128 E.02564
G1 X93.047 Y93.047 E.26962
G1 X92.684 Y93.073 E.01209
G1 X98.708 Y87.049 E.2826
G1 X98.551 Y87.037 E.00522
G1 X100.027 Y88.513 E.06926
G1 X98.819 Y88.514 E.04009
G1 X98.578 Y88.755 E.01131
G1 X98.578 Y88.834 E.00262
M204 S10000
G1 X98.992 Y88.736 F42000
; FEATURE: Bridge
; LINE_WIDTH: 0.46454
G1 F3000
M204 S6000
G1 X98.992 Y91.094 E.08102
G1 X99.414 Y91.094 E.01449
G1 X99.414 Y88.906 E.07519
G1 X99.836 Y88.906 E.01449
G1 X99.836 Y91.094 E.0752
G1 X100.257 Y91.094 E.01449
G1 X100.257 Y88.906 E.0752
G1 X100.679 Y88.906 E.01449
G1 X100.679 Y91.094 E.0752
G1 X101.1 Y91.094 E.01449
G1 X101.1 Y88.905 E.0752
G1 X101.522 Y88.903 E.01449
G1 X101.522 Y91.28 E.08167
M106 S201.45
; WIPE_START
G1 X101.522 Y89.28 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.287 Y93.227 Z1.7 F42000
G1 Z1.3
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.387668
G1 F2276
M204 S6000
G1 X90.572 Y93.584 E.13284
G3 X88.28 Y93.398 I-.462 J-8.515 E.0648
G1 X87.357 Y93.117 E.0271
G3 X86.104 Y92.499 I2.495 J-6.633 E.03931
G1 X85.315 Y91.941 E.02715
G1 X84.692 Y91.367 E.0238
; LINE_WIDTH: 0.43475
G1 X84.092 Y90.685 E.02899
; LINE_WIDTH: 0.46106
G1 X83.738 Y90.159 E.02161
; LINE_WIDTH: 0.480295
G1 X83.703 Y90.077 E.0032
; LINE_WIDTH: 0.500434
G1 X83.668 Y89.994 E.00334
G1 X83.874 Y89.618 E.01599
; LINE_WIDTH: 0.44806
G1 X84.178 Y89.215 E.01665
; LINE_WIDTH: 0.404641
G1 X84.853 Y88.471 E.02961
G1 X85.727 Y87.748 E.03343
G1 X86.325 Y87.371 E.02084
; LINE_WIDTH: 0.383324
G3 X88.937 Y86.478 I3.811 J6.883 E.07698
G1 X89.919 Y86.403 E.0273
G1 X90.34 Y86.403 E.01168
G1 X95.241 Y86.772 E.13634
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 1.5
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F12000
G1 X93.247 Y86.622 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 8/111
; update layer progress
M73 L8
M991 S0 P7 ;notify layer change

; OBJECT_ID: 427
M204 S10000
G17
G3 Z1.7 I-.391 J1.153 P1  F42000
G1 X101.969 Y89.579 Z1.7
G1 Z1.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2410
M204 S6000
G1 X101.969 Y92.913 E.1106
G3 X101.755 Y93.17 I-.212 J.042 E.01271
G1 X90.639 Y94.078 E.36997
G3 X82.892 Y89.999 I-.637 J-8.186 E.3063
G3 X90.321 Y85.904 I7.109 J4.112 E.29566
G1 X101.755 Y86.83 E.38053
G3 X101.969 Y87.082 I-.001 J.218 E.01244
G1 X101.969 Y89.519 E.08085
M204 S10000
G1 X102.361 Y89.579 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2410
M204 S5000
G1 X102.361 Y92.525 E.09052
G1 X102.361 Y92.925 E.01229
G1 X102.355 Y93.024 E.00306
G1 X102.338 Y93.115 E.00285
G1 X102.328 Y93.151 E.00113
G1 X102.299 Y93.225 E.00246
G1 X102.254 Y93.305 E.00279
G3 X102.046 Y93.492 I-.545 J-.396 E.00866
G3 X101.931 Y93.537 I-.281 J-.546 E.00382
G1 X101.896 Y93.546 E.0011
G1 X101.799 Y93.56 E.00301
G1 X101.401 Y93.592 E.01229
G1 X101.201 Y93.608 E.00615
G1 X100.236 Y93.686 E.02975
G1 X99.837 Y93.719 E.01229
G1 X97.509 Y93.906 E.07179
G1 X97.11 Y93.939 E.01229
G1 X95.547 Y94.065 E.04819
G1 X95.148 Y94.097 E.01229
G1 X93.305 Y94.25 E.05682
G1 X92.907 Y94.283 E.01229
G1 X91.263 Y94.419 E.05067
G3 X89.231 Y94.451 I-1.169 J-9.603 E.06257
G1 X88.714 Y94.383 E.01602
G1 X88.318 Y94.326 E.01229
G3 X86.558 Y93.774 I2.022 J-9.544 E.05678
G3 X85.479 Y93.211 I4.673 J-10.267 E.03739
G3 X84.778 Y92.73 I5.932 J-9.394 E.02613
G3 X83.923 Y91.983 I6.23 J-7.995 E.0349
G1 F2400
G3 X83.51 Y91.54 I5.902 J-5.924 E.01863
G1 F2280
G3 X83.082 Y91.007 I7.229 J-6.229 E.021
G1 F2160
G3 X82.551 Y90.191 I7.428 J-5.42 E.02993
G1 F1800
G3 X82.517 Y90.104 I.383 J-.199 E.00288
M106 S201.45
M106 S255
G1 F1680
G3 X82.516 Y89.899 I.462 J-.105 E.00634
M106 S201.45
M106 S255
G1 F1800
G1 X82.53 Y89.856 E.0014
M106 S201.45
G1 F1920
G1 X82.567 Y89.779 E.00262
G1 F2160
G3 X83.03 Y89.064 I8.01 J4.686 E.02619
G1 F2280
G3 X83.553 Y88.411 I7.882 J5.761 E.02572
G1 F2400
G3 X83.916 Y88.024 I6.196 J5.456 E.01632
G1 F2410
G3 X84.71 Y87.323 I7.825 J8.062 E.03255
G3 X85.391 Y86.844 I5.994 J7.8 E.0256
G3 X86.325 Y86.331 I5.551 J9.007 E.03275
G3 X88.37 Y85.664 I3.861 J8.374 E.06624
G3 X90.336 Y85.513 I1.662 J8.722 E.06071
G3 X92.547 Y85.688 I-5.244 J80.189 E.06816
G1 X92.946 Y85.721 E.01229
G1 X93.838 Y85.795 E.0275
G2 X95.034 Y85.893 I21.397 J-253.648 E.03687
G1 X95.432 Y85.925 E.01229
G1 X96.267 Y85.993 E.02574
G1 X96.666 Y86.025 E.01229
G1 X98.734 Y86.192 E.06376
G1 X99.133 Y86.224 E.01229
G1 X99.968 Y86.292 E.02574
G1 X100.366 Y86.324 E.01229
G1 X101.401 Y86.408 E.03188
G1 X101.799 Y86.44 E.01229
G1 X101.896 Y86.454 E.00301
G1 X101.931 Y86.463 E.0011
G3 X102.084 Y86.53 I-.159 J.567 E.00516
G3 X102.229 Y86.66 I-.381 J.573 E.00601
G1 X102.276 Y86.731 E.0026
G1 X102.312 Y86.806 E.00255
G1 X102.339 Y86.888 E.00266
G1 X102.355 Y86.976 E.00275
G1 X102.361 Y87.069 E.00288
G1 X102.361 Y87.469 E.01229
G1 X102.361 Y89.519 E.06298
; WIPE_START
G1 F10200
M204 S6000
G1 X102.361 Y91.519 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.9 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1.9
G1 X0 Y90.0001 F18000 ; move to safe pos
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
            G0 Z1.9 F4000
            G39.3 S1
            G0 Z1.9 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X99.761 Y89.774 F42000
G1 Z1.5
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.494445
G1 F2410
M204 S6000
G1 X99.761 Y90.226 E.01661
G1 X100.785 Y90.226 E.03768
G1 X100.785 Y89.774 E.01662
G1 X99.821 Y89.774 E.03547
M204 S10000
G1 X98.97 Y90 F42000
; LINE_WIDTH: 0.41999
G1 F2410
M204 S6000
G1 X98.97 Y91.006 E.0309
G2 X101.573 Y91.013 I1.614 J-109.464 E.07997
G2 X101.573 Y88.986 I-130.47 J-1.041 E.06227
G2 X98.981 Y88.983 I-1.782 J358.074 E.07963
G1 X98.971 Y89.94 E.02941
M204 S10000
G1 X99.347 Y90.64 F42000
G1 F2410
M204 S6000
G1 X101.2 Y90.64 E.05692
G1 X101.2 Y89.36 E.03934
G1 X99.347 Y89.36 E.05692
G1 X99.347 Y90.58 E.03749
; WIPE_START
G1 F15000
G1 X99.347 Y89.36 E-.46359
G1 X100.127 Y89.36 E-.29641
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.9 I.636 J1.038 P1  F42000
G1 X101.621 Y88.444 Z1.9
G1 Z1.5
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2410
M204 S6000
G1 X101.621 Y88.524 E.00263
G1 X101.523 Y88.591 E.00393
G1 X100.105 Y88.591 E.04704
G1 X98.423 Y86.909 E.07888
G1 X98.816 Y86.941 E.01306
G1 X92.535 Y93.222 E.29463
G1 X93.173 Y93.173 E.02122
G1 X87.183 Y87.183 E.28102
G1 X86.964 Y87.279 E.00792
G1 X84.025 Y90.218 E.1379
G1 X83.882 Y89.998 E.00871
G1 X84.02 Y89.777 E.00863
G1 X86.95 Y92.707 E.13746
G1 X87.184 Y92.816 E.00857
G1 X93.168 Y86.832 E.28071
G1 X92.542 Y86.785 E.02083
G1 X98.818 Y93.061 E.29441
G1 X98.421 Y93.093 E.01321
G1 X100.105 Y91.409 E.07899
G1 X101.522 Y91.409 E.04703
G1 X101.621 Y91.477 E.00396
G1 X101.621 Y91.556 E.00261
; WIPE_START
G1 F15476.087
G1 X101.621 Y91.477 E-.02994
G1 X101.522 Y91.409 E-.04535
G1 X100.105 Y91.409 E-.53873
G1 X99.833 Y91.681 E-.14598
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.9 I.88 J-.841 P1  F42000
G1 X95.001 Y86.626 Z1.9
G1 Z1.5
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38954
G1 F2410
M204 S6000
G1 X90.306 Y86.26 E.13304
G2 X88.551 Y86.398 I-.215 J8.535 E.04979
G1 X87.634 Y86.633 E.02674
G1 X86.737 Y86.991 E.02728
G1 X86.22 Y87.251 E.01635
G1 X85.41 Y87.773 E.02722
G2 X84.314 Y88.76 I3.989 J5.534 E.04174
; LINE_WIDTH: 0.445472
G1 X83.966 Y89.161 E.01742
G1 X83.496 Y89.835 E.02696
; LINE_WIDTH: 0.48126
G1 X83.461 Y89.918 E.00321
; LINE_WIDTH: 0.500648
G1 X83.426 Y90 E.00335
G1 X83.73 Y90.525 E.02262
; LINE_WIDTH: 0.437315
G2 X84.486 Y91.419 I7.785 J-5.82 E.03764
; LINE_WIDTH: 0.4208
G1 X84.875 Y91.791 E.01658
; LINE_WIDTH: 0.384547
G1 X85.649 Y92.404 E.0275
G2 X90.618 Y93.723 I4.381 J-6.487 E.1458
G1 X94.968 Y93.381 E.12148
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 1.7
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X92.974 Y93.538 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 9/111
; update layer progress
M73 L9
M991 S0 P8 ;notify layer change

; OBJECT_ID: 427
M204 S10000
G17
G3 Z1.9 I.486 J1.116 P1  F42000
G1 X102.059 Y89.576 Z1.9
G1 Z1.7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2348
M204 S6000
G1 X102.059 Y93.021 E.11427
G3 X101.844 Y93.271 I-.219 J.029 E.01237
G1 X90.68 Y94.213 E.37165
M73 P39 R11
G3 X82.657 Y90 I-.665 J-8.479 E.31701
G3 X90.439 Y85.771 I7.351 J4.252 E.30909
G1 X101.844 Y86.729 E.37964
G3 X102.059 Y86.988 I-.001 J.22 E.01276
G1 X102.059 Y89.516 E.08386
M204 S10000
G1 X102.451 Y89.576 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2348
M204 S5000
G1 X102.451 Y92.627 E.09373
G1 X102.451 Y93.027 E.01229
G1 X102.45 Y93.074 E.00145
G1 X102.439 Y93.168 E.0029
G1 X102.417 Y93.253 E.0027
G1 X102.386 Y93.331 E.00259
G1 X102.345 Y93.403 E.00256
G1 X102.298 Y93.465 E.00236
G1 X102.271 Y93.494 E.00124
G3 X102.107 Y93.607 I-.474 J-.515 E.00613
G3 X101.986 Y93.646 I-.273 J-.624 E.00392
G1 X101.889 Y93.661 E.003
G1 X101.291 Y93.711 E.01844
G1 X99.076 Y93.896 E.0683
G1 X98.677 Y93.929 E.01229
G1 X97.769 Y94.005 E.02801
G1 X97.371 Y94.039 E.01229
G1 X96.462 Y94.115 E.02801
G1 X96.064 Y94.148 E.01229
G1 X94.757 Y94.257 E.0403
G1 X92.833 Y94.422 E.05932
G1 X92.435 Y94.456 E.01229
G1 X91.308 Y94.553 E.03474
G3 X88.923 Y94.558 I-1.216 J-9.673 E.07348
G1 X88.379 Y94.468 E.01695
G1 X87.985 Y94.398 E.01229
G3 X86.179 Y93.767 I2.363 J-9.67 E.05888
G3 X85.025 Y93.109 I5.042 J-10.177 E.04084
G3 X84.274 Y92.542 I6.815 J-9.798 E.02892
G3 X83.8 Y92.112 I5.559 J-6.606 E.01968
G3 X83.16 Y91.417 I8.299 J-8.282 E.02903
G1 F2280
G3 X82.737 Y90.861 I7.763 J-6.346 E.02147
G1 F2160
G3 X82.353 Y90.262 I6.926 J-4.869 E.02188
G1 F2040
G1 X82.302 Y90.169 E.00325
G1 F1800
G3 X82.273 Y90.079 I.451 J-.197 E.00292
M106 S201.45
M106 S255
G1 F1680
G3 X82.273 Y89.919 I.429 J-.078 E.00495
M106 S201.45
M106 S255
G1 F1800
G3 X82.302 Y89.832 I.461 J.103 E.0028
M106 S201.45
G1 F2040
G1 X82.381 Y89.69 E.00501
G1 F2160
G3 X82.724 Y89.158 I7.64 J4.55 E.01946
G1 F2280
G3 X83.203 Y88.532 I7.848 J5.508 E.02423
G1 F2348
G3 X83.736 Y87.952 I7.458 J6.313 E.0242
G3 X84.138 Y87.575 I6.236 J6.26 E.01694
G3 X85.074 Y86.858 I7.337 J8.606 E.03624
G3 X86.314 Y86.17 I5.012 J7.57 E.04363
G3 X88.122 Y85.571 I3.784 J8.395 E.05862
G3 X90.458 Y85.379 I1.925 J9.151 E.07221
G3 X91.302 Y85.447 I-1.202 J20.32 E.026
G1 X91.7 Y85.481 E.01229
G1 X93.367 Y85.625 E.0514
G2 X94.562 Y85.726 I20.97 J-239.919 E.03687
G1 X94.961 Y85.76 E.01229
G1 X95.684 Y85.82 E.02229
G1 X96.082 Y85.853 E.01229
G1 X97.927 Y86.008 E.05687
G1 X98.325 Y86.041 E.01229
G1 X100.17 Y86.195 E.05687
G1 X100.568 Y86.229 E.01229
G1 X101.491 Y86.306 E.02844
G1 X101.889 Y86.339 E.01229
G1 X101.982 Y86.353 E.00289
G1 X102.064 Y86.377 E.00262
G3 X102.21 Y86.454 I-.191 J.536 E.0051
G3 X102.296 Y86.533 I-.342 J.459 E.00357
G3 X102.388 Y86.672 I-.473 J.411 E.00514
G1 X102.402 Y86.704 E.00106
G1 X102.429 Y86.789 E.00275
G1 X102.445 Y86.878 E.00278
G1 X102.451 Y86.977 E.00305
G1 X102.451 Y87.377 E.01229
G1 X102.451 Y89.516 E.06575
; WIPE_START
G1 F10200
M204 S6000
G1 X102.451 Y91.516 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.1 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2.1
G1 X0 Y90.0001 F18000 ; move to safe pos
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
            G0 Z2.1 F4000
            G39.3 S1
            G0 Z2.1 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X101.603 Y91.592 F42000
G1 Z1.7
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2348
M204 S6000
G1 X101.19 Y91.688 E.01408
G1 X100.879 Y91.441 E.01319
G1 X100.879 Y90.681 E.0252
G1 X100.833 Y90.681 E.00154
G1 X98.293 Y93.221 E.11916
G1 X98.925 Y93.168 E.02105
G1 X92.391 Y86.634 E.30651
G1 X93.295 Y86.705 E.03007
G1 X87.072 Y92.928 E.29194
G1 X87.25 Y93.007 E.00644
G1 X83.876 Y89.633 E.15824
G2 X83.641 Y89.998 I2.297 J1.744 E.0144
G1 X83.878 Y90.365 E.01451
G1 X87.255 Y86.988 E.15843
G2 X87.067 Y87.067 I.405 J1.219 E.00677
G1 X93.298 Y93.298 E.2923
G1 X92.387 Y93.37 E.03032
G1 X98.924 Y86.833 E.30665
G1 X98.294 Y86.78 E.02096
G1 X100.833 Y89.319 E.11909
G1 X100.88 Y89.319 E.00157
G1 X100.88 Y88.559 E.02519
G1 X101.192 Y88.313 E.01318
G1 X101.605 Y88.409 E.01408
M204 S10000
G1 X101.663 Y88.821 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.44852
G1 F2348
M204 S6000
G1 X101.663 Y89.024 E.00671
; LINE_WIDTH: 0.48766
G1 X101.663 Y89.227 E.00736
; LINE_WIDTH: 0.5268
G1 X101.663 Y89.43 E.008
; LINE_WIDTH: 0.45139
G1 X101.648 Y89.51 E.00271
; LINE_WIDTH: 0.49599
G1 X101.633 Y89.59 E.003
; LINE_WIDTH: 0.54059
G1 X101.619 Y89.67 E.0033
; LINE_WIDTH: 0.58519
G1 X101.604 Y89.75 E.00359
; LINE_WIDTH: 0.526882
G1 X101.594 Y89.873 E.00488
; LINE_WIDTH: 0.487905
G1 X101.584 Y89.996 E.00448
; LINE_WIDTH: 0.50379
G1 X101.574 Y90.119 E.00464
G1 X101.663 Y90.571 E.01727
; LINE_WIDTH: 0.429539
G1 X101.662 Y91.178 E.01912
G1 X101.294 Y91.257 E.01189
G1 X101.29 Y91.206 E.0016
; LINE_WIDTH: 0.4538
G1 X101.285 Y91.143 E.00212
; LINE_WIDTH: 0.50224
G1 X101.28 Y91.08 E.00237
; LINE_WIDTH: 0.55068
G1 X101.276 Y91.017 E.00262
; LINE_WIDTH: 0.451819
G1 X101.275 Y90.858 E.00528
; LINE_WIDTH: 0.496297
G1 X101.273 Y90.7 E.00586
; LINE_WIDTH: 0.540774
G1 X101.272 Y90.541 E.00643
; LINE_WIDTH: 0.564629
G1 X101.271 Y90.383 E.00674
G1 X101.141 Y90.239 E.00824
; LINE_WIDTH: 0.58575
G1 X101.065 Y90.239 E.00332
; LINE_WIDTH: 0.521487
G1 X99.748 Y90.239 E.05136
G1 X99.748 Y89.761 E.01862
; LINE_WIDTH: 0.54227
G1 X100.369 Y89.761 E.02526
; LINE_WIDTH: 0.575531
G1 X101.141 Y89.761 E.03349
; LINE_WIDTH: 0.58519
G1 X101.171 Y89.723 E.00216
; LINE_WIDTH: 0.54059
G1 X101.201 Y89.685 E.00198
; LINE_WIDTH: 0.49599
G1 X101.231 Y89.646 E.0018
; LINE_WIDTH: 0.479876
G1 X101.261 Y89.608 E.00174
G1 X101.277 Y89.43 E.00636
; LINE_WIDTH: 0.428997
G1 X101.277 Y88.758 E.02112
G1 X101.604 Y88.811 E.01041
; WIPE_START
G1 F12000
G1 X101.277 Y88.758 E-.25091
G1 X101.277 Y89.43 E-.50909
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.775 Y93.429 Z2.1 F42000
G1 X94.595 Y93.539 Z2.1
G1 Z1.7
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38765
G1 F2348
M204 S6000
G1 X90.658 Y93.86 E.11099
G1 X89.658 Y93.877 E.02808
G3 X85.754 Y92.66 I.471 J-8.382 E.11603
G1 X84.828 Y91.988 E.03214
G1 X84.198 Y91.394 E.02431
; LINE_WIDTH: 0.450421
G1 X83.78 Y90.908 E.0213
G1 X83.255 Y90.157 E.03042
; LINE_WIDTH: 0.47482
G1 X83.221 Y90.077 E.00307
; LINE_WIDTH: 0.50424
G1 X83.186 Y89.997 E.00328
G1 X83.392 Y89.622 E.01608
; LINE_WIDTH: 0.450003
G3 X84.142 Y88.666 I5.829 J3.801 E.04034
; LINE_WIDTH: 0.388621
G3 X90.422 Y86.125 I5.904 J5.561 E.19688
G1 X94.55 Y86.46 E.11667
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 1.9
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X92.557 Y86.298 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 10/111
; update layer progress
M73 L10
M991 S0 P9 ;notify layer change

; OBJECT_ID: 427
M204 S10000
G17
G3 Z2.1 I-.393 J1.152 P1  F42000
G1 X102.147 Y89.574 Z2.1
G1 Z1.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2472
M204 S6000
G1 X102.147 Y93.134 E.1181
G3 X101.941 Y93.37 I-.215 J.021 E.01164
G1 X90.724 Y94.347 E.37352
G3 X82.418 Y89.999 I-.726 J-8.72 E.32819
G3 X90.152 Y85.625 I7.58 J4.379 E.30914
G3 X90.717 Y85.653 I-.132 J8.489 E.01877
G1 X101.93 Y86.629 E.37336
G3 X102.147 Y86.85 I.006 J.21 E.01151
G1 X102.147 Y89.514 E.08836
M204 S10000
G1 X102.539 Y89.574 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2472
M204 S5000
G1 X102.539 Y92.748 E.09754
G1 X102.54 Y93.148 E.01229
G1 X102.534 Y93.222 E.00229
M73 P39 R10
G1 X102.528 Y93.262 E.00123
G1 X102.506 Y93.35 E.00279
G1 X102.475 Y93.429 E.00262
G1 X102.432 Y93.504 E.00265
G3 X102.193 Y93.706 I-.498 J-.348 E.00972
G1 X102.112 Y93.735 E.00263
G1 X102.025 Y93.755 E.00275
G1 X101.981 Y93.76 E.00134
G1 X101.583 Y93.794 E.01229
G1 X100.598 Y93.879 E.03037
G1 X100.2 Y93.914 E.01229
G1 X99.415 Y93.981 E.02422
G1 X99.016 Y94.016 E.01229
G1 X97.047 Y94.185 E.06073
G1 X96.648 Y94.22 E.01229
G1 X95.464 Y94.322 E.03651
G1 X94.668 Y94.391 E.02458
G1 X94.269 Y94.426 E.01229
G1 X93.209 Y94.52 E.0327
G1 X92.811 Y94.555 E.01229
G1 X91.352 Y94.685 E.04499
G3 X88.193 Y94.58 I-1.259 J-9.769 E.09755
G1 X87.783 Y94.485 E.01293
G1 X87.395 Y94.389 E.01229
G3 X85.586 Y93.635 I3.067 J-9.91 E.0603
G3 X84.755 Y93.119 I5.042 J-9.045 E.03006
G3 X84.17 Y92.675 I5.89 J-8.358 E.02257
G3 X83.394 Y91.954 I7.391 J-8.738 E.03257
G1 F2400
G3 X82.657 Y91.08 I8.065 J-7.553 E.03514
G1 F2280
G1 X82.514 Y90.883 E.00748
G1 F2160
G3 X82.116 Y90.262 I8.542 J-5.919 E.02267
G1 F2040
G1 X82.079 Y90.196 E.00231
G1 F1920
G1 X82.057 Y90.149 E.00161
G1 F1800
G3 X82.03 Y89.985 I.412 J-.154 E.00512
M106 S201.45
M106 S255
G1 F1680
G1 X82.033 Y89.943 E.00132
M106 S201.45
M106 S255
G1 F1800
G3 X82.057 Y89.853 I.415 J.062 E.00284
M106 S201.45
G1 F1920
G1 X82.095 Y89.776 E.00265
G1 F2160
G3 X82.415 Y89.262 I7.507 J4.327 E.0186
G1 F2280
G3 X82.749 Y88.798 I7.31 J4.908 E.01757
G1 F2400
G3 X83.274 Y88.173 I8.024 J6.211 E.02509
G1 F2472
G3 X83.914 Y87.545 I7.337 J6.827 E.02758
G3 X84.813 Y86.841 I7.399 J8.524 E.03508
G3 X85.791 Y86.256 I7.387 J11.24 E.03506
G3 X87.385 Y85.614 I4.626 J9.198 E.05286
G3 X90.16 Y85.233 I2.667 J9.128 E.08636
G3 X91.346 Y85.315 I-.405 J14.523 E.03654
G1 X91.744 Y85.35 E.01229
G1 X92.847 Y85.448 E.03401
G1 X93.245 Y85.483 E.01229
G1 X94.348 Y85.58 E.03401
G2 X95.543 Y85.685 I24.069 J-268.683 E.03687
G1 X95.942 Y85.719 E.01229
G1 X97.002 Y85.811 E.03271
G1 X97.401 Y85.845 E.01229
G1 X99.921 Y86.062 E.07771
G1 X100.319 Y86.097 E.01229
G1 X101.579 Y86.205 E.03886
G1 X101.977 Y86.24 E.01229
G1 X102.071 Y86.254 E.00291
G1 X102.153 Y86.278 E.00261
G1 X102.228 Y86.312 E.00253
G3 X102.457 Y86.537 I-.397 J.633 E.00997
G1 X102.473 Y86.568 E.00106
G1 X102.507 Y86.653 E.00283
G3 X102.527 Y86.732 I-.599 J.194 E.0025
G1 X102.539 Y86.826 E.00292
G1 X102.539 Y87.226 E.01229
G1 X102.539 Y89.514 E.07028
; WIPE_START
G1 F11100
M204 S6000
G1 X102.539 Y91.514 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.3 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2.3
G1 X0 Y90.0001 F18000 ; move to safe pos
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
            G0 Z2.3 F4000
            G39.3 S1
            G0 Z2.3 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X101.727 Y88.865 F42000
G1 Z1.9
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.460933
G1 F2472
M204 S6000
G1 X101.727 Y88.872 E.00024
; LINE_WIDTH: 0.447131
G2 X101.755 Y89.485 I7.021 J-.007 E.02022
; LINE_WIDTH: 0.41999
G1 X101.755 Y91.161 E.05148
G1 X101.295 Y91.261 E.01448
G1 X101.269 Y90.998 E.00812
G1 X101.083 Y90.725 E.01016
G3 X100.823 Y90.166 I1.18 J-.887 E.01906
G1 X100.805 Y89.889 E.00855
; LINE_WIDTH: 0.43398
G1 X100.861 Y89.712 E.00589
; LINE_WIDTH: 0.444045
G1 X100.917 Y89.536 E.00604
G1 X101.083 Y89.31 E.00919
; LINE_WIDTH: 0.469291
G1 X101.297 Y89.02 E.01251
G1 X101.3 Y88.768 E.00875
G1 X101.669 Y88.852 E.01315
; WIPE_START
G1 F12000
G1 X101.3 Y88.768 E-.29054
G1 X101.297 Y89.02 E-.19317
G1 X101.083 Y89.31 E-.27628
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.608 Y93.35 Z2.3 F42000
G1 X94.022 Y93.716 Z2.3
G1 Z1.9
G1 E.8 F1800
; LINE_WIDTH: 0.385986
G1 F2472
M204 S6000
G1 X90.701 Y93.996 E.09317
G3 X87.006 Y93.456 I-.611 J-8.738 E.1052
G1 X86.285 Y93.142 E.02199
G1 X85.48 Y92.671 E.02606
G1 X84.676 Y92.078 E.02793
G1 X83.988 Y91.43 E.02641
G1 X83.423 Y90.763 E.02445
; LINE_WIDTH: 0.442707
G1 X83.01 Y90.159 E.02384
G1 X82.944 Y90.003 E.00551
; LINE_WIDTH: 0.52266
G1 X83.197 Y89.555 E.02009
; LINE_WIDTH: 0.424025
G3 X85.685 Y87.19 I6.882 J4.75 E.10738
; LINE_WIDTH: 0.383041
G3 X90.694 Y86.007 I4.359 J7.262 E.14492
G1 X94.825 Y86.354 E.11491
; WIPE_START
G1 F12000
G1 X92.832 Y86.187 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
M73 P40 R10
G1 X89.379 Y92.993 Z2.3 F42000
G1 X89.068 Y93.605 Z2.3
G1 Z1.9
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2472
M204 S6000
G3 X87.485 Y93.242 I.974 J-7.877 E.05396
G1 X83.736 Y89.493 E.17588
G2 X83.396 Y89.999 I3.795 J2.921 E.02024
G2 X83.734 Y90.509 I4.55 J-2.652 E.02032
G1 X87.5 Y86.743 E.17666
G3 X89.085 Y86.385 I3.067 J9.882 E.05396
; WIPE_START
G1 F15476.087
G1 X88.32 Y86.512 E-.2946
G1 X87.5 Y86.743 E-.32389
G1 X87.236 Y87.007 E-.14151
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.956 Y93.044 Z2.3 F42000
G1 Z1.9
G1 E.8 F1800
G1 F2472
M204 S6000
G1 X93.416 Y86.584 E.30308
G1 X92.246 Y86.489 E.03895
G1 X99.031 Y93.274 E.31829
G1 X98.165 Y93.349 E.02884
G1 X100.672 Y90.842 E.1176
G3 X100.673 Y89.159 I1.221 J-.841 E.05938
G1 X98.165 Y86.651 E.11766
G1 X99.031 Y86.726 E.02883
G1 X92.239 Y93.518 E.31862
G1 X93.422 Y93.422 E.03936
G1 X86.957 Y86.957 E.30328
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 2.1
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X88.371 Y88.371 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 11/111
; update layer progress
M73 L11
M991 S0 P10 ;notify layer change

; OBJECT_ID: 427
M204 S10000
G17
G3 Z2.3 I-.413 J1.145 P1  F42000
G1 X102.203 Y93.358 Z2.3
G1 Z2.1
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2822
M204 S6000
G1 X102.19 Y93.386 E.00105
G3 X102.017 Y93.469 I-.173 J-.14 E.00657
G1 X90.764 Y94.478 E.37477
G3 X82.184 Y90.002 I-.769 J-8.988 E.33882
G3 X90.267 Y85.494 I7.818 J4.518 E.32231
G3 X90.759 Y85.522 I-.321 J10.128 E.01636
G1 X102.017 Y86.531 E.37495
G3 X102.236 Y86.795 I-.001 J.223 E.01296
G1 X102.236 Y93.205 E.21263
G3 X102.231 Y93.305 I-.219 J.041 E.00336
M204 S10000
G1 X102.562 Y93.525 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2822
M204 S5000
G1 X102.561 Y93.526 E.00003
G1 X102.5 Y93.627 E.00364
G3 X102.314 Y93.786 I-.504 J-.402 E.00755
G3 X102.2 Y93.833 I-.286 J-.532 E.00382
G1 X102.162 Y93.843 E.00121
G1 X102.065 Y93.858 E.00302
G1 X101.666 Y93.894 E.01229
G1 X100.46 Y94.001 E.03721
G1 X100.062 Y94.036 E.01229
G1 X99.055 Y94.125 E.03106
G1 X98.656 Y94.161 E.01229
G1 X95.647 Y94.428 E.09285
G1 X95.248 Y94.463 E.01229
G1 X95.049 Y94.481 E.00615
G1 X94.651 Y94.518 E.01229
G1 X93.42 Y94.63 E.03796
G1 X93.022 Y94.666 E.01229
G1 X91.393 Y94.814 E.05025
G3 X87.352 Y94.521 I-1.324 J-9.737 E.12542
G1 X87.027 Y94.421 E.01042
G3 X85.481 Y93.751 I3.108 J-9.286 E.05186
G1 F2760
G3 X84.415 Y93.072 I6.38 J-11.211 E.03885
G1 F2640
G3 X83.696 Y92.487 I7.06 J-9.407 E.02849
G1 F2520
G3 X82.871 Y91.645 I7.732 J-8.392 E.03625
G1 F2400
G3 X82.449 Y91.118 I7.022 J-6.058 E.02075
G1 F2280
G3 X82.021 Y90.49 I8.751 J-6.431 E.02334
G1 F2160
G1 X81.862 Y90.227 E.00946
G1 F2040
G1 X81.825 Y90.148 E.00269
G1 F1920
G1 X81.81 Y90.104 E.00142
G1 F1800
G3 X81.816 Y89.876 I.414 J-.103 E.00709
M106 S201.45
G1 F1920
G1 X81.848 Y89.801 E.00249
G1 F2160
G3 X82.104 Y89.379 I6.73 J3.803 E.01518
G1 F2280
G3 X82.441 Y88.893 I7.65 J4.941 E.01818
G1 F2400
G3 X82.974 Y88.238 I8.141 J6.079 E.02593
G1 F2520
G3 X83.563 Y87.635 I7.074 J6.315 E.02593
G1 F2640
G3 X84.475 Y86.884 I7.743 J8.473 E.03631
G1 F2760
G3 X85.472 Y86.254 I7.877 J11.372 E.03625
G1 F2822
G3 X86.859 Y85.636 I4.712 J8.707 E.04671
G3 X90.035 Y85.098 I3.157 J8.997 E.09946
G1 X90.277 Y85.102 E.00744
G3 X91.387 Y85.185 I-.705 J16.858 E.0342
G1 X91.785 Y85.221 E.01229
G1 X92.907 Y85.324 E.03462
G1 X93.306 Y85.36 E.01229
G1 X94.428 Y85.462 E.03462
G2 X95.623 Y85.57 I24.399 J-264.5 E.03687
G1 X96.021 Y85.605 E.01229
G1 X96.792 Y85.673 E.02377
G1 X97.19 Y85.709 E.01229
G1 X99.129 Y85.881 E.05982
G1 X99.528 Y85.917 E.01229
G1 X101.666 Y86.106 E.06597
G1 X102.065 Y86.142 E.01229
G1 X102.158 Y86.156 E.0029
G1 X102.239 Y86.18 E.00261
G1 X102.314 Y86.214 E.00252
G3 X102.5 Y86.373 I-.319 J.561 E.00755
G3 X102.562 Y86.475 I-.453 J.344 E.00369
G1 X102.594 Y86.555 E.00264
G1 X102.613 Y86.632 E.00244
G1 X102.622 Y86.682 E.00157
G1 X102.628 Y86.784 E.00312
G1 X102.628 Y87.184 E.01229
G1 X102.628 Y87.384 E.00615
G1 X102.628 Y87.784 E.01229
G1 X102.628 Y92.816 E.15464
G1 X102.628 Y93.216 E.01229
G1 X102.622 Y93.319 E.00316
G3 X102.594 Y93.442 I-.674 J-.084 E.00389
G1 X102.584 Y93.469 E.00089
; WIPE_START
G1 F5700
M204 S6000
G1 X102.561 Y93.526 E-.02312
G1 X102.5 Y93.627 E-.04505
G1 X102.314 Y93.786 E-.09278
G1 X102.2 Y93.833 E-.04715
G1 X102.162 Y93.843 E-.01492
G1 X102.065 Y93.858 E-.03729
G1 X101.666 Y93.894 E-.152
G1 X100.755 Y93.974 E-.34769
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.5 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2.5
G1 X0 Y90.0001 F18000 ; move to safe pos
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
            G0 Z2.5 F4000
            G39.3 S1
            G0 Z2.5 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X100.299 Y93.259 F42000
G1 Z2.1
G1 E.8 F1800
; Slow Down Start
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38292
G1 F3000;_EXTRUDE_SET_SPEED
M204 S6000
G1 X100.037 Y93.336 E.00757
G1 X94.296 Y93.857 E.15971
G1 X94.171 Y93.839 E.00349
; Slow Down End
G1 F2822
G1 X94.1 Y93.829 E.002
M204 S10000
G1 X93.333 Y93.904 F42000
; LINE_WIDTH: 0.388531
G1 F2822
M204 S6000
G1 X90.741 Y94.129 E.07326
G3 X88.859 Y94.079 I-.687 J-9.558 E.05311
G1 X87.801 Y93.863 E.03043
G1 X87.043 Y93.63 E.02233
G1 X86.112 Y93.216 E.02869
G1 X85.29 Y92.742 E.02673
G1 X84.571 Y92.212 E.02515
G1 X83.95 Y91.645 E.02368
G1 X83.219 Y90.808 E.03128
G1 X82.778 Y90.163 E.02201
; LINE_WIDTH: 0.45512
G1 X82.71 Y90.001 E.00592
; LINE_WIDTH: 0.5215
G1 X83.058 Y89.405 E.02691
; LINE_WIDTH: 0.427319
G3 X84.896 Y87.544 I6.787 J4.865 E.08227
; LINE_WIDTH: 0.38292
G3 X90.734 Y85.872 I5.12 J6.85 E.172
G1 X92.239 Y86.003 E.04187
G1 X92.617 Y86.052 E.01057
G1 X92.716 Y86.044 E.00273
G1 X93.995 Y86.155 E.03557
G1 X94.122 Y86.128 E.0036
G1 X95.037 Y86.211 E.02546
; Slow Down Start
G1 F3000;_EXTRUDE_SET_SPEED
G1 X98.512 Y86.526 E.09666
G1 X98.729 Y86.589 E.00626
; Slow Down End
; WIPE_START
G1 X98.512 Y86.526 E-.08589
G1 X96.745 Y86.366 E-.67411
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.013 Y89.482 Z2.5 F42000
G1 Z2.1
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F2822
M204 S2000
G1 X101.156 Y88.625 E.03724
G1 X101.062 Y89.064
G1 X102.013 Y90.015 E.04132
G1 X102.013 Y90.548
G1 X100.812 Y89.347 E.0522
G1 X100.668 Y89.736
G1 X102.013 Y91.081 E.05847
G1 X101.732 Y91.333
G1 X100.66 Y90.261 E.04658
; WIPE_START
G1 F12000
M204 S6000
G1 X101.732 Y91.333 E-.5761
G1 X102.013 Y91.081 E-.14351
G1 X101.938 Y91.006 E-.0404
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.343 Y91.444 Z2.5 F42000
G1 Z2.1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.102184
G1 F2822
M204 S6000
G1 X101.075 Y90.97 E.00263
; WIPE_START
G1 F15000
G1 X101.343 Y91.444 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.001 Y88.686 Z2.5 F42000
G1 Z2.1
G1 E.8 F1800
; LINE_WIDTH: 0.351579
G1 F2822
M204 S6000
G1 X101.869 Y88.839 E.0051
G1 X101.443 Y88.645 E.01177
; WIPE_START
G1 F15000
G1 X101.869 Y88.839 E-.53031
G1 X102.001 Y88.686 E-.22969
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.509 Y87.228 Z2.5 F42000
G1 X89.319 Y86.218 Z2.5
G1 Z2.1
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2822
M204 S6000
G2 X87.722 Y86.522 I2.805 J19.144 E.05394
G1 X83.597 Y90.646 E.19347
G3 X83.161 Y90.001 I3.787 J-3.029 E.02585
G3 X83.602 Y89.359 I3.72 J2.079 E.02586
G1 X87.714 Y93.471 E.19293
G2 X89.311 Y93.77 I2.417 J-8.503 E.05397
; WIPE_START
G1 F15476.087
G1 X88.733 Y93.71 E-.22104
G1 X87.714 Y93.471 E-.39741
G1 X87.451 Y93.208 E-.14155
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.414 Y87.621 Z2.5 F42000
G1 Z2.1
G1 E.8 F1800
G1 F2822
M204 S6000
G3 X86.839 Y86.839 I9.285 J15.209 E.05393
G1 X93.504 Y93.504 E.31269
G1 X92.092 Y93.665 E.04715
G1 X98.787 Y86.97 E.3141
G3 X98.332 Y86.818 I.151 J-1.214 E.016
G1 X100.673 Y89.159 E.1098
G2 X100.672 Y90.842 I1.219 J.843 E.05938
G1 X98.331 Y93.183 E.10979
G1 X98.889 Y93.132 E.01856
G1 X92.13 Y86.373 E.31708
G1 X93.54 Y86.46 E.04686
G1 X86.843 Y93.157 E.31415
G3 X85.417 Y92.379 I3.982 J-8.996 E.05395
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 2.3
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X86.27 Y92.897 E-.37936
G1 X86.843 Y93.157 E-.23908
G1 X87.107 Y92.893 E-.14156
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 12/111
; update layer progress
M73 L12
M991 S0 P11 ;notify layer change

; OBJECT_ID: 427
M204 S10000
G17
G3 Z2.5 I-.042 J1.216 P1  F42000
G1 X102.311 Y93.414 Z2.5
G1 Z2.3
G1 E.8 F1800
; FEATURE: Inner wall
G1 F7763
M204 S6000
G3 X102.101 Y93.565 I-.215 J-.077 E.00915
G1 X90.801 Y94.606 E.37643
G3 X81.953 Y90 I-.812 J-9.24 E.34934
G3 X90.461 Y85.37 I8.034 J4.633 E.33803
G1 X102.101 Y86.435 E.38772
G3 X102.322 Y86.702 I-.004 J.228 E.01308
G1 X102.321 Y89.015 E.07672
G1 X101.308 Y88.779 E.03453
G2 X101.306 Y91.222 I295 J1.403 E.08106
G1 X102.161 Y91.022 E.02912
G1 X102.321 Y90.969 E.00561
G1 X102.321 Y93.298 E.07726
G3 X102.324 Y93.355 I-.225 J.039 E.00189
; WIPE_START
G1 F15476.087
G1 X102.268 Y93.491 E-.05589
G1 X102.206 Y93.54 E-.03021
G1 X102.101 Y93.565 E-.041
G1 X100.442 Y93.718 E-.63289
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.698 Y89.272 Z2.7 F42000
G1 Z2.3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7763
M204 S5000
G1 X102.058 Y89.356 E.01135
G3 X102.22 Y90.574 I-.175 J.643 E.04804
G3 X101.698 Y90.728 I-.678 J-1.339 E.01682
G1 X101.697 Y89.778 E.02918
G1 X101.698 Y89.332 E.0137
; WIPE_START
G1 F12000
M204 S6000
G1 X102.058 Y89.356 E-.13701
G1 X102.224 Y89.429 E-.06893
G1 X102.399 Y89.579 E-.08775
G1 X102.516 Y89.788 E-.09096
G1 X102.551 Y89.97 E-.07027
G1 X102.518 Y90.207 E-.09101
G1 X102.47 Y90.318 E-.04592
G1 X102.402 Y90.417 E-.04568
M73 P41 R10
G1 X102.22 Y90.574 E-.09134
G1 X102.145 Y90.606 E-.03113
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.659 Y93.591 Z2.7 F42000
G1 Z2.3
G1 E.8 F1800
G1 F5383.143
M204 S5000
G1 X102.656 Y93.599 E.00025
G1 F5300.193
G1 X102.629 Y93.656 E.00195
G1 F4680.679
G1 X102.581 Y93.728 E.00265
G1 F3900
G1 X102.56 Y93.753 E.00102
G1 F4296.022
G1 X102.496 Y93.816 E.00274
G1 F3900
G1 X102.471 Y93.836 E.001
G1 F4800
G3 X102.365 Y93.899 I-.382 J-.523 E.00378
G1 F5700
G1 X102.281 Y93.93 E.00276
G1 F6085.649
G1 X102.246 Y93.939 E.00111
G1 F7191.95
G1 X102.149 Y93.955 E.00301
G1 F7763
G1 X101.552 Y94.009 E.01844
G1 F7500
G1 X100.597 Y94.096 E.02945
G1 X100.199 Y94.133 E.01229
G1 F6600
G1 X97.892 Y94.344 E.07119
G1 X97.493 Y94.38 E.01229
G1 F5700
G1 X94.589 Y94.646 E.08962
G1 X94.19 Y94.682 E.01229
G1 F4800
G1 X92.91 Y94.802 E.03952
G1 X92.512 Y94.84 E.01229
G1 F3900
G1 X91.431 Y94.941 E.03337
G3 X89.445 Y95.013 I-1.385 J-10.792 E.06112
G1 X89.12 Y94.986 E.01004
G1 X88.721 Y94.949 E.01229
G1 F3000
G3 X86.892 Y94.522 I1.329 J-9.831 E.0578
G1 X86.615 Y94.419 E.00908
G1 X86.241 Y94.277 E.01229
G1 F2880
G3 X84.925 Y93.604 I5.301 J-11.969 E.04544
G1 F2760
G3 X84.136 Y93.064 I5.911 J-9.49 E.02941
G1 F2640
G3 X83.34 Y92.388 I7.979 J-10.212 E.03209
G1 F2520
G3 X82.622 Y91.63 I8.987 J-9.221 E.03209
G1 F2400
G3 X82.191 Y91.083 I8.492 J-7.138 E.02139
G1 F2280
G3 X81.634 Y90.229 I10.702 J-7.594 E.03134
G1 F2040
G1 X81.595 Y90.15 E.00271
G1 F1920
G1 X81.581 Y90.105 E.00143
G1 F1800
G3 X81.582 Y89.892 I.487 J-.105 E.00661
M106 S201.45
M106 S255
G1 F1920
G1 X81.595 Y89.85 E.00134
G1 F2040
G1 X81.633 Y89.772 E.00268
G1 F2280
G3 X82.133 Y88.998 I9.161 J5.364 E.02831
G1 F2400
G3 X82.729 Y88.247 I8.505 J6.137 E.02947
G1 F2520
G3 X83.332 Y87.62 I7.9 J6.988 E.02675
G1 F2640
G3 X83.989 Y87.051 I7.912 J8.475 E.02672
G1 F2760
G3 X84.99 Y86.357 I7.786 J10.169 E.03744
G1 F2880
G3 X86.312 Y85.693 I5.124 J8.552 E.04551
G1 F3000
G3 X88.314 Y85.114 I3.741 J9.192 E.06415
G1 F3900
G1 X88.71 Y85.057 E.01229
G1 X88.917 Y85.029 E.00641
G3 X90.48 Y84.979 I1.099 J9.924 E.04809
G3 X91.425 Y85.058 I-1.113 J18.887 E.02914
G1 F4800
G1 X91.823 Y85.095 E.01229
G1 X92.964 Y85.202 E.03523
G1 F5700
G1 X93.363 Y85.239 E.01229
G1 X94.504 Y85.346 E.03523
G2 X95.699 Y85.456 I27.41 J-290.228 E.03687
G1 F6600
G1 X96.098 Y85.493 E.01229
G1 X98.625 Y85.724 E.078
G1 F7500
G1 X99.024 Y85.76 E.01229
G1 X100.088 Y85.857 E.03285
G1 F7763
G1 X100.487 Y85.894 E.01229
G1 X101.751 Y86.009 E.039
G1 X102.149 Y86.045 E.01229
G1 F7437.264
G1 X102.242 Y86.06 E.0029
G1 F6351.55
G1 X102.324 Y86.084 E.00261
G1 F5447.68
G1 X102.4 Y86.119 E.00255
G1 F4630.495
G1 X102.468 Y86.162 E.00248
G1 F3900
G1 X102.529 Y86.214 E.00248
G1 F4800
G3 X102.63 Y86.346 I-.402 J.412 E.00511
G1 F5142.78
G1 X102.646 Y86.377 E.00108
G1 F6520.174
G3 X102.691 Y86.5 I-.598 J.287 E.00401
G1 F7599.696
G1 X102.707 Y86.591 E.00285
G1 F7763
G1 X102.714 Y86.69 E.00306
G1 X102.714 Y87.09 E.01229
G1 X102.713 Y92.91 E.17882
G1 X102.713 Y93.31 E.01229
G1 X102.707 Y93.409 E.00306
G1 F7695.009
G1 X102.69 Y93.501 E.00287
G1 F6600
G1 X102.679 Y93.535 E.00109
; WIPE_START
M204 S6000
G1 X102.656 Y93.599 E-.02591
G1 X102.629 Y93.656 E-.02406
G1 X102.581 Y93.728 E-.03272
G1 X102.56 Y93.753 E-.01256
G1 X102.496 Y93.816 E-.03394
G1 X102.471 Y93.836 E-.01241
G1 X102.365 Y93.899 E-.04663
G1 X102.281 Y93.93 E-.03415
G1 X102.246 Y93.939 E-.01378
G1 X102.149 Y93.955 E-.03727
G1 X101.552 Y94.009 E-.228
G1 X100.874 Y94.071 E-.25856
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.7 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2.7
G1 X0 Y90.0001 F18000 ; move to safe pos
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
            G0 Z2.7 F4000
            G39.3 S1
            G0 Z2.7 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X100.958 Y90.556 F42000
G1 Z2.3
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7763
M204 S6000
G1 X100.927 Y90.587 E.00147
; WIPE_START
G1 F15476.087
G1 X100.958 Y90.556 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.14 Y89.061 Z2.7 F42000
G1 Z2.3
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.41185
; LAYER_HEIGHT: 0.4
G1 F3000
M204 S6000
G1 X98.561 Y86.482 E.19796
G1 X97.843 Y86.417 E.03918
G1 X100.749 Y89.324 E.22314
G1 X100.559 Y89.786 E.02716
G1 X97.124 Y86.351 E.26371
G1 X96.405 Y86.285 E.03918
G1 X100.497 Y90.378 E.31415
G1 X100.489 Y90.546 E.00916
G1 X100.561 Y91.095 E.03001
G1 X95.686 Y86.219 E.37423
G1 X94.967 Y86.154 E.03918
G1 X100.287 Y91.474 E.4084
G1 X99.961 Y91.801 E.02507
G1 X94.248 Y86.088 E.43852
G1 X93.529 Y86.022 E.03918
G1 X99.634 Y92.127 E.46863
G1 X99.572 Y92.189 E.00477
G1 X100.284 Y93.361 E.07439
G1 X100.22 Y93.367 E.00345
G1 X92.81 Y85.957 E.5688
G1 X92.717 Y85.948 E.00508
G1 X92.443 Y86.243 E.02183
G1 X99.622 Y93.421 E.55104
G1 X99.024 Y93.476 E.03261
G1 X92.161 Y86.614 E.52676
G1 X92.549 Y87.203 E.03829
G1 X92.323 Y87.429 E.01734
G1 X98.425 Y93.531 E.46841
G1 X97.827 Y93.586 E.03261
G1 X91.997 Y87.756 E.44755
G1 X91.67 Y88.082 E.02507
G1 X97.229 Y93.641 E.4267
G1 X96.631 Y93.696 E.03261
G1 X91.344 Y88.409 E.40584
G1 X91.017 Y88.735 E.02507
G1 X96.032 Y93.751 E.38498
G1 X95.434 Y93.805 E.03261
G1 X90.69 Y89.062 E.36413
G1 X90.364 Y89.388 E.02507
G1 X94.836 Y93.86 E.34327
G1 X94.238 Y93.915 E.03261
G1 X89.894 Y89.572 E.3334
M106 S201.45
; WIPE_START
G1 X91.308 Y90.986 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.26 Y86.058 Z2.7 F42000
G1 Z2.3
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F7763
M204 S6000
G3 X91.223 Y86.126 I-.409 J12.728 E.03202
G1 X91.253 Y85.793 E.0111
G1 X91.579 Y85.822 E.01089
G1 X91.927 Y86.17 E.01628
G1 X91.593 Y86.529 E.01628
G1 X91.999 Y87.147 E.02453
G1 X91.718 Y87.428 E.0132
; WIPE_START
G1 F15476.087
G1 X91.999 Y87.147 E-.1512
G1 X91.593 Y86.529 E-.28104
G1 X91.927 Y86.17 E-.18653
G1 X91.664 Y85.907 E-.14123
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.91 Y85.757 Z2.7 F42000
G1 Z2.3
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.390492
G1 F7763
M204 S6000
G2 X83.087 Y89.053 I-.913 J8.767 E.25087
; LINE_WIDTH: 0.43589
G1 X82.764 Y89.491 E.01743
; LINE_WIDTH: 0.468718
G1 X82.484 Y89.957 E.01884
G1 X82.487 Y90.047 E.00315
G1 X82.835 Y90.607 E.02285
; LINE_WIDTH: 0.439495
G1 X83.192 Y91.044 E.01825
; LINE_WIDTH: 0.38732
G1 X83.55 Y91.481 E.01585
G1 X84.209 Y92.123 E.02581
G2 X85.6 Y93.113 I6.579 J-7.776 E.04799
G1 X86.53 Y93.58 E.0292
G1 X87.424 Y93.908 E.02673
G2 X90.717 Y94.264 I2.659 J-9.191 E.09341
G1 X91.529 Y94.191 E.02289
; WIPE_START
G1 F15000
G1 X90.717 Y94.264 E-.31
G1 X90.083 Y94.287 E-.24091
G1 X89.533 Y94.279 E-.20909
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.3 Y92.493 Z2.7 F42000
G1 Z2.3
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7763
M204 S6000
G2 X86.726 Y93.274 I4.461 J-6.454 E.05402
G1 X89.854 Y90.146 E.14675
G1 X89.427 Y89.719 E.02003
G1 X89.573 Y89.573 E.00686
G1 X86.726 Y86.726 E.13358
G3 X87.925 Y86.318 I3.439 J8.153 E.04204
G1 X83.467 Y90.776 E.20912
G3 X82.92 Y90.002 I5.295 J-4.324 E.03148
G3 X83.464 Y89.221 I6.87 J4.206 E.0316
G1 X87.927 Y93.684 E.20939
G2 X91.899 Y93.815 I2.359 J-11.225 E.13251
G1 X92.732 Y93.025 E.03809
G1 X91.581 Y91.873 E.05401
; WIPE_START
G1 F15476.087
G1 X92.732 Y93.025 E-.61876
G1 X92.463 Y93.281 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.865 Y87.889 Z2.7 F42000
G1 X99.235 Y86.522 Z2.7
G1 Z2.3
G1 E.8 F1800
G1 F7763
M204 S6000
G1 X99.225 Y86.532 E.00044
; CHANGE_LAYER
; Z_HEIGHT: 2.5
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X99.235 Y86.522 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 13/111
; update layer progress
M73 L13
M991 S0 P12 ;notify layer change

; OBJECT_ID: 427
M204 S10000
G17
G3 Z2.7 I-1.11 J.499 P1  F42000
G1 X102.383 Y93.533 Z2.7
G1 Z2.5
G1 E.8 F1800
; FEATURE: Inner wall
G1 F4059
M204 S6000
G3 X102.183 Y93.66 I-.2 J-.094 E.00831
G1 X90.834 Y94.732 E.37811
G3 X81.728 Y89.999 I-.855 J-9.482 E.35956
G3 X90.489 Y85.243 I8.251 J4.753 E.348
G1 X102.183 Y86.34 E.38961
G3 X102.404 Y86.57 I-.002 J.223 E.01181
G1 X102.411 Y88.088 E.05036
G1 X102.455 Y88.058 E.00177
G1 X102.455 Y89.065 E.03342
G2 X100.942 Y90.465 I-.527 J.948 E.09022
G2 X102.455 Y90.934 I.989 J-.514 E.05845
G1 X102.455 Y91.98 E.03472
G1 X102.416 Y91.955 E.00154
G1 X102.404 Y93.429 E.0489
G3 X102.401 Y93.476 I-.221 J.011 E.00157
; WIPE_START
G1 F15476.087
G1 X102.327 Y93.61 E-.05813
G1 X102.254 Y93.649 E-.03148
G1 X102.183 Y93.66 E-.02764
G1 X100.499 Y93.819 E-.64276
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.852 Y89.337 Z2.9 F42000
G1 Z2.5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4059
M204 S5000
G1 X101.994 Y89.332 E.00436
G3 X101.805 Y90.661 I-.067 J.668 E.06657
G3 X101.739 Y90.648 I.002 J-.195 E.0021
G3 X101.739 Y89.352 I.169 J-.648 E.05417
G1 X101.754 Y89.347 E.00047
G1 X101.793 Y89.341 E.00121
; WIPE_START
G1 F12000
M204 S6000
G1 X101.994 Y89.332 E-.07674
G1 X102.113 Y89.355 E-.04591
G1 X102.282 Y89.429 E-.07015
G1 X102.377 Y89.496 E-.04422
G1 X102.528 Y89.682 E-.09109
G1 X102.575 Y89.788 E-.04406
G1 X102.609 Y89.966 E-.06871
G1 X102.577 Y90.207 E-.09257
G1 X102.528 Y90.318 E-.04583
G1 X102.38 Y90.5 E-.08939
G1 X102.229 Y90.601 E-.06892
G1 X102.174 Y90.622 E-.02242
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.758 Y93.642 Z2.9 F42000
G1 Z2.5
G1 E.8 F1800
G1 F4059
M204 S5000
G1 X102.751 Y93.665 E.00074
G1 X102.732 Y93.709 E.00147
G3 X102.669 Y93.815 I-.53 J-.246 E.0038
G3 X102.482 Y93.976 I-.492 J-.382 E.00762
G3 X102.366 Y94.024 I-.292 J-.537 E.00386
G1 X102.329 Y94.034 E.0012
G1 X102.232 Y94.05 E.00302
G1 X101.634 Y94.106 E.01844
G1 X98.794 Y94.372 E.08766
G1 X98.396 Y94.409 E.01229
G1 X97.175 Y94.524 E.03769
G1 X96.776 Y94.561 E.01229
G1 X95.157 Y94.713 E.04998
G1 X94.361 Y94.788 E.02458
G1 X93.962 Y94.826 E.01229
G1 F3900
G1 X91.466 Y95.066 E.07707
G3 X88.921 Y95.102 I-1.421 J-10.51 E.07837
G1 X88.612 Y95.06 E.00958
G1 X88.217 Y95.003 E.01229
G1 F3000
G3 X86.414 Y94.497 I1.828 J-9.983 E.05762
G1 X86.041 Y94.338 E.01245
G1 X85.674 Y94.179 E.01229
G1 F2880
G3 X84.732 Y93.661 I4.873 J-9.983 E.03304
G1 F2760
G3 X83.711 Y92.932 I7.237 J-11.21 E.03857
G1 F2640
G3 X82.96 Y92.253 I8.074 J-9.684 E.03112
G1 F2520
G3 X82.259 Y91.472 I9.534 J-9.246 E.03225
G1 F2400
G3 X81.78 Y90.823 I8.551 J-6.822 E.02478
G1 F2280
G3 X81.491 Y90.371 I8.176 J-5.552 E.0165
G1 F2160
G1 X81.394 Y90.204 E.00594
G1 F2040
G1 X81.361 Y90.127 E.00257
G1 F1920
G3 X81.363 Y89.867 I.413 J-.126 E.00811
G1 F2040
G3 X81.4 Y89.783 I.475 J.16 E.00282
G1 F2280
G3 X81.874 Y89.041 I10.066 J5.899 E.02707
G1 F2400
G3 X82.251 Y88.539 I8.16 J5.742 E.0193
G1 F2520
G3 X83.033 Y87.674 I10.687 J8.878 E.03581
G1 F2640
G3 X83.701 Y87.076 I7.463 J7.664 E.02758
G1 F2760
G3 X84.668 Y86.378 I8.442 J10.684 E.03665
G1 F2880
G3 X85.991 Y85.676 I5.431 J8.624 E.04605
G1 F3000
G3 X87.996 Y85.04 I4.073 J9.365 E.06475
G1 F3900
G1 X88.56 Y84.945 E.01759
G3 X90.508 Y84.852 I1.481 J10.539 E.06002
G3 X91.459 Y84.933 I-1.113 J18.491 E.02933
G1 F4059
G1 X91.857 Y84.972 E.01229
G1 X93.019 Y85.083 E.03584
G1 X93.417 Y85.121 E.01229
G1 X94.578 Y85.232 E.03584
G2 X95.772 Y85.345 I28.769 J-297.359 E.03687
G1 X96.171 Y85.382 E.01229
G1 X97.238 Y85.482 E.03294
G1 X97.636 Y85.52 E.01229
G1 X100.169 Y85.757 E.07817
G1 X100.567 Y85.794 E.01229
G1 X101.834 Y85.913 E.03908
G1 X102.232 Y85.95 E.01229
G1 X102.325 Y85.965 E.0029
G1 X102.407 Y85.99 E.00261
G1 X102.482 Y86.024 E.00255
G3 X102.666 Y86.182 I-.319 J.559 E.00749
G1 X102.711 Y86.251 E.00254
G3 X102.762 Y86.365 I-.526 J.301 E.00383
G1 X102.784 Y86.454 E.00283
G1 X102.796 Y86.545 E.00284
G1 X102.798 Y86.945 E.01229
G1 X102.8 Y87.337 E.01203
G1 F3457.011
G1 X102.847 Y87.303 E.00178
G1 F3000
G1 X102.847 Y92.71 E.16613
G1 F3422.864
G1 X102.802 Y92.68 E.00166
G1 F4059
G1 X102.799 Y93.08 E.01229
G1 X102.796 Y93.454 E.01149
G1 X102.784 Y93.549 E.00294
G1 X102.776 Y93.585 E.00112
; WIPE_START
G1 F8400
M204 S6000
G1 X102.751 Y93.665 E-.03196
G1 X102.732 Y93.709 E-.01817
G1 X102.669 Y93.815 E-.04695
G1 X102.583 Y93.907 E-.04779
G1 X102.482 Y93.976 E-.04636
G1 X102.366 Y94.024 E-.0476
G1 X102.329 Y94.034 E-.0148
G1 X102.232 Y94.05 E-.0373
G1 X101.634 Y94.106 E-.228
G1 X101.003 Y94.165 E-.24108
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.9 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2.9
G1 X0 Y90.0001 F18000 ; move to safe pos
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
            G0 Z2.9 F4000
            G39.3 S1
            G0 Z2.9 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X96.169 Y93.876 F42000
G1 Z2.5
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4059
M204 S6000
G1 X97.79 Y93.724 E.05401
G1 X98.164 Y93.35 E.01754
G1 X99.066 Y93.309 E.02995
G1 X99.335 Y93.578 E.01263
G1 X100.956 Y93.426 E.05401
; WIPE_START
G1 F15476.087
G1 X99.335 Y93.578 E-.61876
G1 X99.072 Y93.316 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.266 Y89.381 Z2.9 F42000
G1 Z2.5
G1 E.8 F1800
G1 F4059
M204 S6000
G1 X99.266 Y87.752 E.05401
G1 X100.73 Y89.216 E.06864
G2 X100.729 Y90.785 I1.161 J.785 E.05524
G1 X99.266 Y92.248 E.06862
G1 X99.266 Y90.619 E.05401
; WIPE_START
G1 F15476.087
G1 X99.266 Y92.248 E-.61876
G1 X99.529 Y91.985 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X100.956 Y86.574 Z2.9 F42000
G1 Z2.5
G1 E.8 F1800
G1 F4059
M204 S6000
G1 X99.335 Y86.422 E.05401
G1 X99.066 Y86.691 E.0126
G1 X98.164 Y86.65 E.02995
G1 X97.792 Y86.278 E.01748
G1 X96.17 Y86.126 E.05401
; WIPE_START
G1 F15476.087
G1 X97.792 Y86.278 E-.61876
G1 X98.054 Y86.541 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.417 Y87.062 Z2.9 F42000
G1 Z2.5
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F4059
M204 S6000
G1 X93.417 Y92.946 E.18082
G1 X98.863 Y92.958 E.16733
G1 X98.874 Y87.062 E.18116
G1 X98.855 Y87.042 E.00084
G1 X93.466 Y87.042 E.16558
; WIPE_START
M73 P42 R10
G1 F15000
G1 X95.466 Y87.042 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X96.146 Y90.229 Z2.9 F42000
G1 Z2.5
G1 E.8 F1800
; LINE_WIDTH: 0.59818
G1 F4059
M204 S6000
G1 X96.146 Y89.831 E.01801
M204 S10000
G1 X95.68 Y90.695 F42000
; LINE_WIDTH: 0.41999
G1 F4059
M204 S6000
G1 X96.612 Y90.695 E.02865
G1 X96.612 Y89.305 E.04272
G1 X95.68 Y89.305 E.02865
G1 X95.68 Y90.635 E.04088
M204 S10000
G1 X95.302 Y91.072 F42000
G1 F4059
M204 S6000
G1 X96.989 Y91.072 E.05182
G1 X96.989 Y88.928 E.0659
G1 X95.302 Y88.928 E.05182
G1 X95.302 Y91.012 E.06405
M204 S10000
G1 X94.925 Y91.449 F42000
G1 F4059
M204 S6000
G1 X97.366 Y91.449 E.07499
G1 X97.366 Y88.551 E.08907
G1 X94.925 Y88.551 E.07499
G1 X94.925 Y91.389 E.08722
M204 S10000
G1 X94.548 Y91.826 F42000
G1 F4059
M204 S6000
G1 X97.743 Y91.826 E.09816
G1 X97.743 Y88.174 E.11224
G1 X94.548 Y88.174 E.09816
G1 X94.548 Y91.766 E.1104
M204 S10000
G1 X94.171 Y92.204 F42000
G1 F4059
M204 S6000
G1 X98.12 Y92.204 E.12134
G1 X98.12 Y87.796 E.13541
G1 X94.171 Y87.796 E.12134
G1 X94.171 Y92.144 E.13357
M204 S10000
G1 X93.794 Y92.581 F42000
G1 F4059
M204 S6000
G1 X98.497 Y92.581 E.14451
G1 X98.497 Y87.419 E.15858
G1 X93.794 Y87.419 E.14451
G1 X93.794 Y92.521 E.15674
; WIPE_START
G1 F15000
G1 X93.794 Y90.521 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.978 Y93.35 Z2.9 F42000
G1 Z2.5
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4059
M204 S6000
G1 X93.35 Y93.35 E.05401
G1 X94.073 Y94.073 E.03394
G1 X91.436 Y94.321 E.08788
G1 X93.025 Y92.732 E.07456
G1 X93.025 Y93.025 E.00973
G1 X86.615 Y86.615 E.30072
G3 X88.111 Y86.132 I4.848 J12.478 E.05216
G1 X83.333 Y90.91 E.22414
G3 X82.686 Y90 I6.081 J-5.002 E.03708
G3 X83.331 Y89.088 I7.607 J4.702 E.03706
G1 X88.1 Y93.857 E.22369
G3 X86.616 Y93.384 I2.267 J-9.693 E.05171
G1 X93.025 Y86.975 E.30068
G1 X93.025 Y87.268 E.00973
G1 X91.439 Y85.682 E.0744
G1 X94.071 Y85.929 E.08769
G1 X93.35 Y86.65 E.03384
G1 X94.978 Y86.65 E.05401
; WIPE_START
G1 F15476.087
G1 X93.35 Y86.65 E-.61876
G1 X93.613 Y86.387 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.676 Y85.603 Z2.9 F42000
G1 Z2.5
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.392273
G1 F4059
M204 S6000
G2 X82.46 Y89.606 I-.677 J9.045 E.27268
; LINE_WIDTH: 0.451
G1 X82.351 Y89.806 E.00757
; LINE_WIDTH: 0.486209
G1 X82.242 Y90.006 E.00822
G1 X82.307 Y90.166 E.00625
; LINE_WIDTH: 0.44221
G1 X82.781 Y90.854 E.02718
; LINE_WIDTH: 0.388557
G2 X83.864 Y92.043 I11.463 J-9.36 E.04533
G1 X84.858 Y92.836 E.03581
G2 X90.734 Y94.39 I5.154 J-7.602 E.17446
; CHANGE_LAYER
; Z_HEIGHT: 2.7
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X90.02 Y94.426 E-.2715
G1 X89.363 Y94.401 E-.24972
G1 X88.74 Y94.322 E-.23878
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 14/111
; update layer progress
M73 L14
M991 S0 P13 ;notify layer change

; OBJECT_ID: 427
M204 S10000
G17
G3 Z2.9 I.065 J1.215 P1  F42000
G1 X102.478 Y93.583 Z2.9
G1 Z2.7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4189
M204 S6000
G3 X102.262 Y93.754 I-.223 J-.059 E.0098
G1 X90.866 Y94.855 E.37976
G3 X81.506 Y90 I-.877 J-9.76 E.36935
G3 X90.424 Y85.115 I8.465 J4.87 E.35479
G1 X102.262 Y86.246 E.39446
G3 X102.487 Y86.52 I-.005 J.233 E.01336
G1 X102.487 Y87.373 E.02827
G1 X102.536 Y87.373 E.00163
G1 X102.536 Y89.087 E.05686
G2 X102.279 Y91.024 I-.563 J.911 E.14154
G1 X102.536 Y90.926 E.00914
G1 X102.536 Y92.279 E.04489
G1 X102.391 Y93.139 E.02892
G1 X102.487 Y93.158 E.00327
G3 X102.485 Y93.523 I-1.813 J.171 E.01213
; WIPE_START
G1 F15476.087
G1 X102.402 Y93.705 E-.07595
G1 X102.333 Y93.742 E-.02991
G1 X102.262 Y93.754 E-.02746
G1 X100.62 Y93.912 E-.62668
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.86 Y89.346 Z3.1 F42000
G1 Z2.7
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4189
M204 S5000
G1 X101.922 Y89.331 E.00194
G3 X102.519 Y89.583 I.017 J.793 E.02053
G3 X101.479 Y90.464 I-.544 J.413 E.06365
G1 X101.416 Y90.394 E.00287
G1 X101.358 Y90.298 E.00344
G1 X101.328 Y90.232 E.00224
G1 X101.297 Y90.12 E.00359
G3 X101.297 Y89.881 I.645 J-.12 E.00739
G1 X101.328 Y89.769 E.00357
G3 X101.416 Y89.606 I.663 J.256 E.00569
G1 X101.478 Y89.537 E.00285
G3 X101.699 Y89.387 I.507 J.51 E.00824
G1 X101.802 Y89.361 E.00329
; WIPE_START
G1 F12000
M204 S6000
G1 X101.922 Y89.331 E-.04675
G1 X102.112 Y89.341 E-.07234
G1 X102.228 Y89.374 E-.04598
G1 X102.337 Y89.426 E-.04591
G1 X102.519 Y89.583 E-.09129
G1 X102.633 Y89.788 E-.08934
G1 X102.668 Y89.97 E-.07032
G1 X102.662 Y90.09 E-.04566
G1 X102.587 Y90.317 E-.09099
G1 X102.476 Y90.465 E-.07018
G1 X102.388 Y90.541 E-.0441
G1 X102.276 Y90.595 E-.04714
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.857 Y93.677 Z3.1 F42000
G1 Z2.7
G1 E.8 F1800
G1 F4189
M204 S5000
G1 X102.857 Y93.68 E.00009
G3 X102.811 Y93.806 I-.681 J-.175 E.00414
G3 X102.745 Y93.913 I-.556 J-.269 E.00386
G1 X102.724 Y93.939 E.00103
G1 X102.66 Y94.002 E.00274
G1 X102.635 Y94.022 E.00102
G3 X102.484 Y94.104 I-.372 J-.504 E.0053
G3 X102.408 Y94.127 I-.203 J-.534 E.00241
G1 X102.01 Y94.166 E.01229
G1 X100.564 Y94.309 E.04466
G1 X100.166 Y94.349 E.01229
G1 X99.015 Y94.459 E.03551
G1 X98.617 Y94.497 E.01229
G1 X95.321 Y94.814 E.10175
G1 X94.923 Y94.852 E.01229
G1 X93.309 Y95.01 E.04981
G1 X92.911 Y95.049 E.01229
G1 X91.497 Y95.187 E.04367
G3 X89.277 Y95.258 I-1.471 J-11.296 E.06835
G1 X88.951 Y95.229 E.01006
G1 X88.553 Y95.187 E.01229
G1 F3900
G3 X87.747 Y95.039 I1.54 J-10.621 E.02518
G1 X87.337 Y94.931 E.01305
G1 X86.95 Y94.828 E.01229
G1 F3000
G3 X85.885 Y94.428 I3.217 J-10.202 E.03498
G1 X85.582 Y94.284 E.01032
G1 X85.221 Y94.111 E.01229
G1 F2880
G3 X84.226 Y93.51 I5.355 J-9.996 E.03573
G1 F2760
G3 X83.278 Y92.775 I7.377 J-10.499 E.03688
G1 F2640
G3 X82.548 Y92.069 I9.04 J-10.073 E.03119
G1 F2520
G3 X81.895 Y91.295 I10.097 J-9.185 E.03113
G1 F2400
G3 X81.451 Y90.664 I8.767 J-6.643 E.02374
G1 F2280
G3 X81.171 Y90.204 I7.448 J-4.85 E.01655
G1 F2040
G3 X81.134 Y90.11 I.445 J-.227 E.0031
G1 F1920
G3 X81.141 Y89.868 I.462 J-.108 E.00751
G1 F2040
G1 X81.172 Y89.794 E.00248
G1 F2280
G3 X81.463 Y89.317 I7.953 J4.526 E.01716
G1 F2400
G3 X82 Y88.569 I9.844 J6.502 E.0283
G1 F2520
G3 X82.603 Y87.873 I9.574 J7.675 E.02832
G1 F2640
G3 X83.269 Y87.233 I8.011 J7.673 E.02839
G1 F2760
G3 X83.991 Y86.656 I7.914 J9.167 E.02838
G1 F2880
G3 X85.325 Y85.835 I6.196 J8.577 E.04819
G1 F3000
G3 X87.029 Y85.148 I5.028 J10.016 E.0565
G1 F3900
G1 X87.417 Y85.052 E.01229
G1 X88.007 Y84.91 E.01865
G3 X88.816 Y84.779 I2.244 J11.333 E.02517
G1 F4189
G1 X89.215 Y84.751 E.01229
G1 X89.721 Y84.717 E.01559
G3 X90.443 Y84.723 I.271 J10.504 E.02218
G3 X91.49 Y84.812 I-.984 J17.784 E.0323
G1 X91.888 Y84.851 E.01229
G1 X95.244 Y85.179 E.10361
G1 X95.643 Y85.217 E.01229
G1 X97.31 Y85.377 E.05147
G1 X97.708 Y85.415 E.01229
G1 X98.778 Y85.518 E.03303
G1 X99.176 Y85.556 E.01229
G1 X101.914 Y85.819 E.0845
G1 X102.312 Y85.857 E.01229
G1 X102.405 Y85.872 E.0029
G1 X102.487 Y85.897 E.00263
G3 X102.632 Y85.976 I-.212 J.562 E.00508
G1 X102.693 Y86.029 E.0025
G3 X102.793 Y86.16 I-.421 J.423 E.00507
G1 X102.829 Y86.237 E.00262
G1 X102.856 Y86.32 E.00269
G1 X102.873 Y86.409 E.00277
G1 X102.879 Y86.508 E.00307
G1 X102.879 Y86.98 E.01451
G1 X102.928 Y86.98 E.00152
G1 X102.928 Y87.38 E.01229
G1 X102.924 Y91.938 E.14005
G1 X102.924 Y92.338 E.01229
G1 X102.888 Y92.55 E.0066
G1 X102.852 Y92.762 E.00662
G1 X102.842 Y92.822 E.00184
G1 X102.842 Y92.83 E.00026
G1 X102.928 Y92.848 E.00271
G1 F3900
G1 X102.929 Y93.02 E.00528
G1 F4189
G1 X102.88 Y93.02 E.00149
G1 X102.877 Y93.544 E.01613
G1 X102.868 Y93.618 E.00228
; WIPE_START
G1 F7944.476
M204 S6000
G1 X102.857 Y93.68 E-.02387
G1 X102.811 Y93.806 E-.0511
G1 X102.745 Y93.913 E-.04763
G1 X102.724 Y93.939 E-.0127
G1 X102.66 Y94.002 E-.03392
G1 X102.635 Y94.022 E-.01261
G1 X102.484 Y94.104 E-.06531
G1 X102.408 Y94.127 E-.02984
G1 X102.01 Y94.166 E-.152
G1 X101.144 Y94.252 E-.33101
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.1 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z3.1
G1 X0 Y90.0001 F18000 ; move to safe pos
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
            G0 Z3.1 F4000
            G39.3 S1
            G0 Z3.1 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X101.053 Y93.52 F42000
G1 Z2.7
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4189
M204 S6000
G1 X99.432 Y93.676 E.05401
G1 X99.066 Y93.309 E.01719
G1 X98.164 Y93.35 E.02995
G1 X97.669 Y93.845 E.02323
G1 X96.048 Y94 E.05401
; WIPE_START
G1 F15476.087
G1 X97.669 Y93.845 E-.61876
G1 X97.932 Y93.582 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.266 Y90.619 Z3.1 F42000
G1 Z2.7
G1 E.8 F1800
G1 F4189
M204 S6000
G1 X99.266 Y92.248 E.05401
G1 X100.766 Y90.748 E.07033
G3 X100.766 Y89.252 I1.308 J-.748 E.05196
G1 X99.266 Y87.752 E.07033
G1 X99.266 Y89.381 E.05401
; WIPE_START
G1 F15476.087
G1 X99.266 Y87.752 E-.61876
G1 X99.529 Y88.015 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.612 Y89.365 Z3.1 F42000
G1 Z2.7
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.108407
G1 F4189
M204 S6000
G1 X102.693 Y89.423 E.00053
G1 X102.713 Y89.486 E.00035
; WIPE_START
G1 F15000
G1 X102.693 Y89.423 E-.30285
G1 X102.612 Y89.365 E-.45715
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.732 Y90.571 Z3.1 F42000
G1 Z2.7
G1 E.8 F1800
; LINE_WIDTH: 0.122832
G1 F4189
M204 S6000
G1 X102.554 Y90.686 E.00138
; WIPE_START
G1 F15000
G1 X102.732 Y90.571 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X96.432 Y86.263 Z3.1 F42000
G1 X96.05 Y86.002 Z3.1
G1 Z2.7
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4189
M204 S6000
G1 X97.671 Y86.157 E.05401
G1 X98.164 Y86.65 E.02313
G1 X99.066 Y86.691 E.02995
G1 X99.431 Y86.326 E.01714
G1 X101.052 Y86.481 E.05401
; WIPE_START
G1 F15476.087
G1 X99.431 Y86.326 E-.61876
G1 X99.169 Y86.588 E-.14125
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.978 Y86.65 Z3.1 F42000
G1 Z2.7
G1 E.8 F1800
G1 F4189
M204 S6000
G1 X93.35 Y86.65 E.05401
G1 X94.177 Y85.823 E.0388
G1 X91.306 Y85.549 E.09567
G1 X93.025 Y87.268 E.08065
G1 X93.025 Y86.975 E.00973
G1 X86.503 Y93.497 E.30598
G2 X88.288 Y94.045 I9.79 J-28.723 E.06196
G1 X83.203 Y88.96 E.23856
G2 X82.456 Y90.002 I6.717 J5.602 E.04256
G2 X83.207 Y91.036 I6.715 J-4.087 E.04243
G1 X88.286 Y85.957 E.23827
G2 X86.505 Y86.505 I2.678 J11.865 E.06188
G1 X93.025 Y93.025 E.30586
G1 X93.025 Y92.732 E.00973
G1 X91.301 Y94.456 E.0809
G1 X94.18 Y94.18 E.09595
G1 X93.35 Y93.35 E.03894
G1 X94.978 Y93.35 E.05401
; WIPE_START
G1 F15476.087
G1 X93.35 Y93.35 E-.61876
G1 X93.613 Y93.613 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.417 Y87.062 Z3.1 F42000
G1 Z2.7
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F4189
M204 S6000
G1 X93.417 Y92.946 E.18082
G1 X98.863 Y92.958 E.16733
G1 X98.874 Y87.062 E.18116
G1 X98.855 Y87.042 E.00084
G1 X93.466 Y87.042 E.16558
; WIPE_START
G1 F15000
G1 X95.466 Y87.042 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X96.146 Y90.229 Z3.1 F42000
G1 Z2.7
G1 E.8 F1800
; LINE_WIDTH: 0.59818
G1 F4189
M204 S6000
G1 X96.146 Y89.831 E.01801
M204 S10000
G1 X95.68 Y90.695 F42000
; LINE_WIDTH: 0.41999
G1 F4189
M204 S6000
G1 X96.612 Y90.695 E.02865
G1 X96.612 Y89.305 E.04272
G1 X95.68 Y89.305 E.02865
G1 X95.68 Y90.635 E.04088
M204 S10000
G1 X95.302 Y91.072 F42000
G1 F4189
M204 S6000
G1 X96.989 Y91.072 E.05182
G1 X96.989 Y88.928 E.0659
G1 X95.302 Y88.928 E.05182
G1 X95.302 Y91.012 E.06405
M204 S10000
G1 X94.925 Y91.449 F42000
G1 F4189
M204 S6000
G1 X97.366 Y91.449 E.07499
G1 X97.366 Y88.551 E.08907
G1 X94.925 Y88.551 E.07499
G1 X94.925 Y91.389 E.08722
M204 S10000
G1 X94.548 Y91.826 F42000
G1 F4189
M204 S6000
G1 X97.743 Y91.826 E.09816
G1 X97.743 Y88.174 E.11224
G1 X94.548 Y88.174 E.09816
G1 X94.548 Y91.766 E.1104
M204 S10000
G1 X94.171 Y92.204 F42000
G1 F4189
M204 S6000
G1 X98.12 Y92.204 E.12134
G1 X98.12 Y87.796 E.13541
G1 X94.171 Y87.796 E.12134
G1 X94.171 Y92.144 E.13357
M204 S10000
M73 P43 R10
G1 X93.794 Y92.581 F42000
G1 F4189
M204 S6000
G1 X98.497 Y92.581 E.14451
G1 X98.497 Y87.419 E.15858
G1 X93.794 Y87.419 E.14451
G1 X93.794 Y92.521 E.15674
; WIPE_START
G1 F15000
G1 X93.794 Y90.521 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X89.012 Y85.504 Z3.1 F42000
G1 Z2.7
G1 E.8 F1800
; LINE_WIDTH: 0.389142
G1 F4189
M204 S6000
G2 X82.678 Y88.982 I.946 J9.232 E.20942
; LINE_WIDTH: 0.432234
G2 X82.06 Y89.88 I5.921 J4.736 E.03462
; LINE_WIDTH: 0.449818
G1 X82.029 Y90.045 E.00558
G2 X82.68 Y91.016 I5.804 J-3.184 E.03879
; LINE_WIDTH: 0.389158
G1 X83.115 Y91.535 E.0191
G1 X83.786 Y92.196 E.02657
G2 X86.106 Y93.702 I6.53 J-7.516 E.07831
G1 X87.332 Y94.164 E.03697
G2 X89.396 Y94.528 I2.817 J-9.943 E.05924
; CHANGE_LAYER
; Z_HEIGHT: 2.9
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X88.654 Y94.456 E-.28354
G1 X87.999 Y94.331 E-.25336
G1 X87.429 Y94.188 E-.2231
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 15/111
; update layer progress
M73 L15
M991 S0 P14 ;notify layer change

; OBJECT_ID: 427
M204 S10000
G17
G3 Z3.1 I.134 J1.21 P1  F42000
G1 X98.839 Y92.922 Z3.1
G1 Z2.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4427
M204 S6000
G1 X93.453 Y92.922 E.17868
G1 X93.453 Y87.078 E.19387
G1 X98.839 Y87.078 E.17868
G1 X98.839 Y92.862 E.19188
; WIPE_START
G1 F15476.087
G1 X96.839 Y92.885 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.553 Y93.682 Z3.3 F42000
G1 Z2.9
G1 E.8 F1800
G1 F4427
M204 S6000
G3 X102.344 Y93.845 I-.213 J-.058 E.00942
G1 X90.894 Y94.975 E.38166
G3 X81.284 Y90 I-.93 J-9.971 E.37919
G3 X90.272 Y84.987 I8.675 J4.989 E.35854
G3 X90.886 Y85.025 I-.288 J9.758 E.02041
G1 X102.339 Y86.155 E.38176
G3 X102.564 Y86.391 I-.006 J.231 E.01203
G1 X102.569 Y87.373 E.03256
G1 X102.594 Y87.373 E.00082
G1 X102.603 Y87.693 E.01062
G1 X102.569 Y87.698 E.00114
G2 X102.566 Y89.045 I452.241 J1.543 E.04469
G2 X101.435 Y89.112 I-.5 J1.146 E.03899
G2 X102.337 Y91.024 I.589 J.891 E.10113
G1 X102.573 Y90.934 E.00835
G1 X102.565 Y92.004 E.03549
G3 X102.555 Y93.622 I-31.816 J.599 E.05368
; WIPE_START
G1 F15476.087
G1 X102.486 Y93.79 E-.0689
G1 X102.417 Y93.83 E-.03041
G1 X102.344 Y93.845 E-.02838
G1 X100.688 Y94.008 E-.63231
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.008 Y89.337 Z3.3 F42000
G1 Z2.9
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4427
M204 S5000
G1 X102.168 Y89.35 E.00491
G3 X102.578 Y89.583 I-.163 J.763 E.01471
G3 X101.536 Y90.463 I-.544 J.413 E.06369
G1 X101.475 Y90.394 E.00285
G1 X101.415 Y90.295 E.00354
G1 X101.386 Y90.231 E.00214
G3 X101.386 Y89.769 I.837 J-.231 E.0144
G1 X101.415 Y89.705 E.00214
G1 X101.475 Y89.606 E.00354
G1 X101.536 Y89.537 E.00285
G3 X101.935 Y89.336 I.51 J.514 E.01395
G1 X101.948 Y89.336 E.00042
; WIPE_START
G1 F12000
M204 S6000
G1 X102.168 Y89.35 E-.08355
G1 X102.286 Y89.374 E-.04605
G1 X102.395 Y89.426 E-.04591
G1 X102.578 Y89.583 E-.09124
G1 X102.691 Y89.788 E-.0894
G1 X102.726 Y89.97 E-.07032
G1 X102.721 Y90.09 E-.04562
G1 X102.645 Y90.317 E-.09095
G1 X102.535 Y90.464 E-.07002
G1 X102.446 Y90.541 E-.04431
G1 X102.25 Y90.635 E-.08263
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.946 Y93.721 Z3.3 F42000
G1 Z2.9
G1 E.8 F1800
G1 F4427
M204 S5000
G1 X102.945 Y93.727 E.00019
G1 X102.936 Y93.768 E.00129
G1 X102.925 Y93.808 E.00128
G1 X102.89 Y93.895 E.00286
G3 X102.824 Y94.001 I-.53 J-.253 E.00386
G3 X102.643 Y94.158 I-.813 J-.759 E.00736
G3 X102.526 Y94.207 I-.306 J-.558 E.00392
G1 X102.457 Y94.224 E.0022
G1 X102.391 Y94.234 E.00204
G1 X101.993 Y94.273 E.01229
G1 X101.794 Y94.292 E.00615
G1 X100.349 Y94.434 E.04462
G1 X99.951 Y94.473 E.01229
G1 X96.662 Y94.796 E.10153
G1 X96.264 Y94.835 E.01229
G1 X94.421 Y95.016 E.05691
G1 X93.625 Y95.095 E.02458
G1 X93.227 Y95.135 E.01229
G1 X91.524 Y95.306 E.05257
G3 X90.562 Y95.387 I-1.824 J-15.739 E.02969
G1 X90.322 Y95.399 E.00738
G1 X89.922 Y95.409 E.01229
G3 X88.169 Y95.249 I.184 J-11.652 E.05414
G1 X87.619 Y95.142 E.01721
G1 F3900
G3 X86.809 Y94.92 I2.455 J-10.513 E.02582
G1 X86.473 Y94.8 E.01097
G1 X86.096 Y94.665 E.01229
G1 F3000
G3 X85.322 Y94.318 I4.101 J-10.156 E.02607
G1 X85.008 Y94.149 E.01097
G1 X84.656 Y93.958 E.01229
G1 F2880
G3 X83.673 Y93.297 I5.905 J-9.852 E.03642
G1 F2760
G3 X82.876 Y92.627 I8.951 J-11.463 E.032
G1 F2640
G3 X82.118 Y91.843 I9.85 J-10.285 E.0335
G1 F2520
G3 X81.476 Y91.026 I10.028 J-8.532 E.03195
G1 F2400
G3 X80.968 Y90.235 I9.65 J-6.755 E.02889
G1 F2160
G1 X80.942 Y90.183 E.00179
G1 F2040
G3 X80.902 Y90.009 I.447 J-.194 E.00551
G1 F1920
G3 X80.91 Y89.915 I.409 J-.011 E.00291
G1 F2040
G3 X80.942 Y89.817 I.458 J.094 E.00316
G1 F2160
G1 X80.968 Y89.765 E.00181
G1 F2280
G1 X81.055 Y89.618 E.00523
G1 F2400
G3 X81.523 Y88.909 I9.87 J5.996 E.02612
G1 F2520
G3 X82.109 Y88.167 I9.833 J7.165 E.02906
G1 F2640
G3 X82.97 Y87.286 I10.252 J9.164 E.03788
G1 F2760
G3 X83.701 Y86.682 I8.206 J9.186 E.02915
G1 F2880
G3 X84.769 Y85.977 I8.335 J11.456 E.03932
G1 F3000
G3 X86.087 Y85.338 I5.331 J9.321 E.04504
G1 F3900
G1 X86.465 Y85.208 E.01229
G1 X87.069 Y85.006 E.01956
G3 X87.885 Y84.8 I3.319 J11.435 E.02586
G1 F4427
G1 X88.28 Y84.738 E.01229
G1 X88.805 Y84.656 E.01634
G3 X89.452 Y84.603 I1.205 J10.73 E.01994
G1 X89.852 Y84.599 E.01229
G1 X90.282 Y84.595 E.01321
G1 X90.554 Y84.607 E.00837
G1 X90.92 Y84.634 E.01129
G1 X91.318 Y84.674 E.01229
G1 X93.115 Y84.853 E.05548
G1 X93.513 Y84.893 E.01229
G1 X94.712 Y85.012 E.03704
G2 X95.906 Y85.13 I38.507 J-383.364 E.03687
G1 X96.305 Y85.169 E.01229
G1 X98.849 Y85.419 E.07857
G1 X99.247 Y85.458 E.01229
G1 X100.321 Y85.563 E.03314
G1 X100.719 Y85.602 E.01229
G1 X101.991 Y85.727 E.03928
G1 X102.389 Y85.766 E.01229
G1 X102.483 Y85.781 E.00291
G1 X102.565 Y85.806 E.00263
G1 X102.64 Y85.841 E.00255
G3 X102.848 Y86.032 I-.361 J.601 E.00873
G1 X102.892 Y86.109 E.00273
G1 X102.924 Y86.189 E.00265
G1 X102.945 Y86.275 E.00273
G1 X102.956 Y86.367 E.00283
G1 X102.959 Y86.94 E.01759
G1 X102.969 Y86.98 E.0013
G1 X103.008 Y86.98 E.00118
G1 X103.008 Y87.152 E.00528
G1 X103 Y87.153 E.00024
G1 X102.999 Y87.378 E.00691
G1 X102.986 Y87.381 E.0004
G1 X102.998 Y87.812 E.01324
G1 X103.008 Y87.813 E.00031
G1 X103.008 Y88.022 E.0064
G1 X102.969 Y88.028 E.00119
G1 X102.959 Y88.03 E.00032
G2 X102.969 Y88.53 I3 J.189 E.0154
G1 X103.008 Y88.54 E.00122
G1 X103.008 Y88.828 E.00885
G1 X102.969 Y88.837 E.00121
G1 X102.957 Y89.323 E.01496
G1 X102.969 Y89.327 E.00039
G1 X103.008 Y89.336 E.00122
G1 X103.008 Y89.537 E.00618
G1 X102.969 Y89.544 E.0012
G1 X102.955 Y90.466 E.02831
G1 X102.97 Y90.467 E.00045
G1 X103.008 Y90.473 E.00119
G1 X103.008 Y91.207 E.02257
G1 X102.97 Y91.214 E.0012
G1 X102.956 Y91.692 E.01469
G1 X102.97 Y91.695 E.00042
G1 X103.008 Y91.704 E.00121
G1 X103.008 Y92.45 E.02293
G1 X102.958 Y92.457 E.00155
G1 X102.958 Y92.812 E.01092
G1 X102.969 Y92.927 E.00356
G1 X103.008 Y92.933 E.00119
G1 X103.008 Y93.02 E.00267
G1 X102.97 Y93.02 E.00118
G1 X102.959 Y93.061 E.0013
G1 X102.956 Y93.633 E.01759
G1 X102.953 Y93.662 E.00089
; WIPE_START
G1 F10200
M204 S6000
G1 X102.945 Y93.727 E-.0251
G1 X102.936 Y93.768 E-.01592
G1 X102.925 Y93.808 E-.01583
G1 X102.89 Y93.895 E-.03532
G1 X102.824 Y94.001 E-.04769
G1 X102.742 Y94.088 E-.04551
G1 X102.643 Y94.158 E-.04579
G1 X102.526 Y94.207 E-.04834
G1 X102.457 Y94.224 E-.02723
G1 X102.391 Y94.234 E-.02525
G1 X101.993 Y94.273 E-.152
G1 X101.794 Y94.292 E-.076
G1 X101.27 Y94.344 E-.20003
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.3 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z3.3
G1 X0 Y90.0001 F18000 ; move to safe pos
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
            G0 Z3.3 F4000
            G39.3 S1
            G0 Z3.3 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X98.593 Y92.618 F42000
G1 Z2.9
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F4427
M204 S6000
G1 X98.529 Y92.655 E.00204
G1 X98.577 Y92.683 E.00155
; WIPE_START
G1 F15000
G1 X98.529 Y92.655 E-.32873
G1 X98.593 Y92.618 E-.43127
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.741 Y92.618 Z3.3 F42000
G1 Z2.9
G1 E.8 F1800
G1 F4427
M204 S6000
G1 X93.678 Y92.655 E.00204
G1 X93.726 Y92.683 E.00155
; WIPE_START
G1 F15000
G1 X93.678 Y92.655 E-.32873
G1 X93.741 Y92.618 E-.43127
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.741 Y87.308 Z3.3 F42000
G1 Z2.9
G1 E.8 F1800
G1 F4427
M204 S6000
G1 X93.678 Y87.345 E.00204
G1 X93.726 Y87.373 E.00155
; WIPE_START
G1 F15000
G1 X93.678 Y87.345 E-.32874
G1 X93.741 Y87.308 E-.43126
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.593 Y87.308 Z3.3 F42000
G1 Z2.9
G1 E.8 F1800
G1 F4427
M204 S6000
G1 X98.529 Y87.345 E.00204
G1 X98.577 Y87.373 E.00155
M204 S10000
G1 X97.747 Y87.348 F42000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F4427
M204 S2000
G1 X98.568 Y88.17 E.0357
G1 X98.568 Y88.703
G1 X97.214 Y87.348 E.05887
G1 X96.68 Y87.348
G1 X98.568 Y89.236 E.08204
G1 X98.568 Y89.77
G1 X96.147 Y87.348 E.10522
G1 X95.614 Y87.348
G1 X98.568 Y90.303 E.12839
G1 X98.568 Y90.836
G1 X95.081 Y87.348 E.15156
G1 X94.547 Y87.348
G1 X98.568 Y91.369 E.17473
G1 X98.568 Y91.903
G1 X94.014 Y87.348 E.19791
G1 X93.723 Y87.591
G1 X98.568 Y92.436 E.21054
G1 X98.251 Y92.652
G1 X93.723 Y88.124 E.19675
G1 X93.723 Y88.657
G1 X97.718 Y92.652 E.17357
G1 X97.184 Y92.652
G1 X93.723 Y89.191 E.1504
G1 X93.723 Y89.724
G1 X96.651 Y92.652 E.12723
G1 X96.118 Y92.652
G1 X93.723 Y90.257 E.10406
G1 X93.723 Y90.79
G1 X95.584 Y92.652 E.08088
G1 X95.051 Y92.652
G1 X93.723 Y91.324 E.05771
G1 X93.723 Y91.857
G1 X94.518 Y92.652 E.03454
; WIPE_START
G1 F12000
M204 S6000
G1 X93.723 Y91.857 E-.42712
G1 X93.723 Y91.324 E-.20264
G1 X93.966 Y91.566 E-.13024
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.187 Y89.302 Z3.3 F42000
G1 Z2.9
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4427
M204 S6000
G1 X99.187 Y87.673 E.05401
G1 X100.802 Y89.288 E.07575
G2 X100.802 Y90.712 I1.344 J.712 E.04916
G1 X99.187 Y92.327 E.07575
G1 X99.187 Y90.698 E.05401
; WIPE_START
G1 F15476.087
G1 X99.187 Y92.327 E-.61876
G1 X99.45 Y92.064 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.549 Y89.268 Z3.3 F42000
G1 Z2.9
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.119135
G1 F4427
M204 S6000
G3 X102.761 Y89.376 I-1.105 J2.415 E.00148
; WIPE_START
G1 F15000
G1 X102.549 Y89.268 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.15 Y86.388 Z3.3 F42000
G1 Z2.9
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4427
M204 S6000
G1 X99.529 Y86.228 E.05401
G1 X99.028 Y86.729 E.02354
G1 X98.243 Y86.729 E.02601
G1 X97.546 Y86.032 E.03272
G1 X95.925 Y85.872 E.05401
; WIPE_START
G1 F15476.087
G1 X97.546 Y86.032 E-.61876
G1 X97.809 Y86.295 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.032 Y91.284 Z3.3 F42000
G1 X88.281 Y94.524 Z3.3
G1 Z2.9
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.387949
G1 F4427
M204 S6000
G3 X84.745 Y93.118 I1.655 J-9.312 E.10772
G3 X82.943 Y91.596 I5.414 J-8.237 E.06647
G3 X82.282 Y90.797 I9.551 J-8.573 E.02915
; LINE_WIDTH: 0.43243
G1 X81.978 Y90.351 E.01713
; LINE_WIDTH: 0.456215
G1 X81.885 Y90.176 E.00669
; LINE_WIDTH: 0.473966
G1 X81.791 Y90.001 E.00697
G1 X82.021 Y89.587 E.01663
; LINE_WIDTH: 0.422577
G3 X83.05 Y88.288 I8.914 J6.002 E.05131
; LINE_WIDTH: 0.384676
G3 X88.489 Y85.441 I6.958 J6.671 E.174
; WIPE_START
G1 F15000
G1 X87.786 Y85.578 E-.27194
G1 X87.261 Y85.716 E-.20646
G1 X86.729 Y85.89 E-.21255
G1 X86.56 Y85.957 E-.06905
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.963 Y92.833 Z3.3 F42000
G1 Z2.9
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4427
M204 S6000
G2 X86.394 Y93.606 I8.263 J-13.588 E.05397
G1 X93.104 Y86.896 E.31478
G1 X93.104 Y86.729 E.00552
G1 X93.271 Y86.729 E.00552
G1 X94.289 Y85.711 E.0478
G1 X91.159 Y85.402 E.10436
G1 X93.104 Y87.347 E.09128
G1 X93.104 Y92.653 E.17599
G1 X91.158 Y94.599 E.09129
G3 X88.845 Y94.602 I-1.174 J-10.985 E.07687
G1 X88.653 Y94.41 E.00904
G1 X88.683 Y94.266 E.00486
G1 X88.46 Y94.217 E.00756
G1 X83.079 Y88.836 E.25246
G2 X82.229 Y90.002 I6.305 J5.489 E.04792
G2 X83.076 Y91.167 I11.942 J-7.789 E.04781
G1 X88.446 Y85.797 E.25192
G2 X86.396 Y86.396 I2.037 J10.785 E.07096
G1 X93.104 Y93.104 E.31471
G1 X93.104 Y93.271 E.00552
G1 X93.271 Y93.271 E.00551
G1 X94.29 Y94.29 E.04781
G1 X97.546 Y93.968 E.10854
G1 X98.243 Y93.271 E.03273
G1 X99.027 Y93.271 E.02601
G1 X99.529 Y93.772 E.02354
G1 X101.15 Y93.612 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 3.1
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X99.529 Y93.772 E-.61876
G1 X99.266 Y93.51 E-.14125
; WIPE_END
G1 E-.03999 F1800
; layer num/total_layer_count: 16/111
; update layer progress
M73 L16
M991 S0 P15 ;notify layer change

; OBJECT_ID: 427
M204 S10000
G17
G3 Z3.3 I.878 J-.843 P1  F42000
G1 X93.928 Y87.945 Z3.3
G1 Z3.1
G1 E.8 F1800
; FEATURE: Inner wall
G1 F4410
M204 S6000
G1 X93.928 Y87.553 E.01301
G1 X98.363 Y87.553 E.14712
G1 X98.363 Y92.447 E.16231
G1 X93.928 Y92.447 E.14712
G1 X93.928 Y88.005 E.14732
M204 S10000
G1 X94.32 Y87.945 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4410
M204 S5000
G1 X97.971 Y87.945 E.11218
G1 X97.971 Y92.055 E.12626
G1 X94.32 Y92.055 E.11218
G1 X94.32 Y88.005 E.12441
; WIPE_START
G1 F12000
M204 S6000
G1 X96.32 Y87.973 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.974 Y93.1 Z3.5 F42000
G1 X102.642 Y93.705 Z3.5
G1 Z3.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4410
M204 S6000
G3 X102.412 Y93.935 I-.234 J-.004 E.0119
G1 X90.915 Y95.091 E.38331
G3 X81.07 Y90 I-.968 J-10.192 E.38849
G3 X90.193 Y84.867 I8.874 J5.098 E.36449
G3 X90.907 Y84.908 I-.302 J11.342 E.02374
G1 X102.412 Y86.065 E.38357
G3 X102.642 Y86.307 I-.008 J.237 E.01226
G3 X102.643 Y88.264 I-308.871 J1.222 E.06493
G1 X102.68 Y88.273 E.00126
G3 X102.693 Y89.106 I-10.471 J.575 E.02763
G2 X101.125 Y90.477 I-.595 J.902 E.09331
G2 X102.644 Y90.93 I.984 J-.528 E.05844
G1 X102.644 Y91.093 E.00542
M73 P44 R10
G1 X102.693 Y91.098 E.00163
G1 X102.692 Y92.627 E.05073
G1 X102.645 Y92.627 E.00156
G1 X102.642 Y93.645 E.03376
; WIPE_START
G1 F15476.087
G1 X102.614 Y93.808 E-.06278
G1 X102.561 Y93.88 E-.03396
G1 X102.412 Y93.935 E-.06031
G1 X100.834 Y94.093 E-.60295
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.092 Y89.338 Z3.5 F42000
G1 Z3.1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4410
M204 S5000
G1 X102.226 Y89.349 E.00414
G3 X102.636 Y89.583 I-.162 J.763 E.01473
G3 X101.595 Y90.463 I-.544 J.413 E.06368
G1 X101.533 Y90.394 E.00285
G1 X101.473 Y90.295 E.00355
G1 X101.445 Y90.231 E.00214
G3 X101.445 Y89.769 I.836 J-.231 E.01439
G1 X101.473 Y89.705 E.00214
G1 X101.533 Y89.606 E.00354
G1 X101.595 Y89.537 E.00285
G3 X101.993 Y89.336 I.51 J.513 E.01394
G1 X102.032 Y89.336 E.00119
; WIPE_START
G1 F12000
M204 S6000
G1 X102.226 Y89.349 E-.07398
G1 X102.345 Y89.374 E-.04621
G1 X102.454 Y89.426 E-.04588
G1 X102.636 Y89.583 E-.09128
G1 X102.704 Y89.682 E-.04577
G1 X102.769 Y89.856 E-.07034
G1 X102.779 Y90.09 E-.08913
G1 X102.704 Y90.317 E-.09091
G1 X102.593 Y90.464 E-.06998
G1 X102.505 Y90.541 E-.04441
G1 X102.288 Y90.645 E-.09144
G1 X102.286 Y90.645 E-.00067
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.029 Y93.765 Z3.5 F42000
G1 Z3.1
G1 E.8 F1800
G1 F4410
M204 S5000
G1 X103.012 Y93.858 E.00291
G3 X102.969 Y93.978 I-.624 J-.16 E.00392
G1 X102.925 Y94.055 E.00273
G3 X102.846 Y94.151 I-.493 J-.327 E.00384
G1 X102.788 Y94.2 E.00232
G3 X102.667 Y94.271 I-.355 J-.47 E.00431
G3 X102.561 Y94.307 I-.237 J-.519 E.00345
G1 X102.464 Y94.324 E.00302
G1 X102.066 Y94.363 E.01229
G1 X101.867 Y94.383 E.00615
G1 X98.51 Y94.719 E.10368
G1 X98.112 Y94.758 E.01229
G1 X96.234 Y94.946 E.05799
G1 X95.438 Y95.026 E.02458
G1 X95.04 Y95.066 E.01229
G1 X93.692 Y95.203 E.04164
G1 X93.294 Y95.244 E.01229
G1 X91.548 Y95.421 E.05393
G3 X88.783 Y95.461 I-1.546 J-11.147 E.08517
G1 X88.333 Y95.396 E.01398
G1 X87.937 Y95.336 E.01229
G3 X87.487 Y95.238 I2.279 J-11.514 E.01417
G1 X87.133 Y95.142 E.01127
G1 X86.747 Y95.035 E.01229
G1 F3900
G1 X86.218 Y94.842 E.01732
G1 X85.842 Y94.705 E.01229
G1 F3000
G3 X84.882 Y94.244 I4.272 J-10.142 E.03273
G1 X84.556 Y94.054 E.01159
G1 X84.211 Y93.851 E.01229
G1 F2880
G3 X83.266 Y93.169 I7.028 J-10.745 E.03584
G1 F2760
G3 X82.468 Y92.456 I8.434 J-10.239 E.03287
G1 F2640
G3 X81.749 Y91.667 I9.401 J-9.295 E.03282
G1 F2520
G3 X81.114 Y90.813 I10.724 J-8.63 E.03271
G1 F2400
G3 X80.758 Y90.242 I11.213 J-7.393 E.02067
G1 F2280
G1 X80.729 Y90.186 E.00196
G1 F2160
G1 X80.71 Y90.135 E.00166
G1 F2040
G3 X80.702 Y89.889 I.686 J-.143 E.0076
G1 F2160
G1 X80.717 Y89.842 E.00152
G1 F2280
G1 X80.757 Y89.76 E.00281
G1 F2400
G1 X80.948 Y89.443 E.01137
G1 F2520
G3 X81.74 Y88.343 I10.967 J7.062 E.04165
G1 F2640
G3 X82.322 Y87.692 I9.119 J7.562 E.02685
G1 F2760
G3 X83.255 Y86.839 I9.454 J9.413 E.03886
G1 F2880
G3 X84.284 Y86.104 I9.151 J11.707 E.03886
G1 F3000
G3 X85.653 Y85.376 I5.924 J9.497 E.04769
G1 F3900
G1 X86.024 Y85.227 E.01229
G1 X86.283 Y85.127 E.00851
G3 X86.846 Y84.934 I4.693 J12.775 E.01829
G1 F4410
G1 X87.233 Y84.835 E.01229
G1 X87.774 Y84.697 E.01714
G3 X88.414 Y84.583 I2.268 J10.844 E.01997
G1 X88.812 Y84.543 E.01229
G1 X89.356 Y84.49 E.0168
G3 X90.2 Y84.475 I.632 J11.243 E.02596
G3 X91.54 Y84.578 I-.618 J16.67 E.04129
G1 X91.938 Y84.619 E.01229
G1 X93.157 Y84.743 E.03764
G1 X93.555 Y84.783 E.01229
G1 X94.773 Y84.907 E.03764
G2 X95.967 Y85.027 I38.816 J-379.256 E.03687
G1 X96.365 Y85.067 E.01229
G1 X99.901 Y85.42 E.10917
G1 X100.299 Y85.46 E.01229
G1 X102.066 Y85.637 E.05459
G1 X102.464 Y85.676 E.01229
G1 X102.557 Y85.692 E.00291
G1 X102.639 Y85.717 E.00263
G3 X102.95 Y85.987 I-.249 J.601 E.01287
G1 X102.967 Y86.019 E.00113
G1 X103 Y86.103 E.00276
G1 X103.022 Y86.19 E.00276
G1 X103.034 Y86.282 E.00285
G1 X103.035 Y86.682 E.01229
G1 X103.036 Y86.94 E.00791
G1 X103.036 Y86.98 E.00126
G1 X103.049 Y86.98 E.00039
G1 X103.085 Y86.98 E.00111
G1 X103.085 Y87.074 E.00287
G1 X103.049 Y87.083 E.00114
G1 X103.035 Y87.086 E.00042
G1 X103.035 Y87.412 E.01003
G1 X103.035 Y87.677 E.00814
G1 X103.035 Y87.956 E.00858
G1 X103.049 Y87.96 E.00043
G1 X103.085 Y87.968 E.00114
G1 X103.085 Y88.128 E.00491
G1 X103.067 Y88.129 E.00055
G1 X103.085 Y88.583 E.01396
G1 X103.085 Y89.686 E.03389
G1 X103.03 Y89.693 E.00171
G1 X103.035 Y89.897 E.00629
G1 X103.035 Y90.435 E.01651
G1 X103.036 Y90.74 E.00938
G1 X103.049 Y90.741 E.00041
G1 X103.085 Y90.745 E.00111
G1 X103.085 Y90.945 E.00615
G1 X103.085 Y91.345 E.01229
G1 X103.085 Y92.02 E.02072
G1 X103.085 Y92.42 E.01229
G1 X103.084 Y93.02 E.01844
G1 X103.049 Y93.02 E.00109
G1 X103.036 Y93.02 E.00039
G1 X103.036 Y93.061 E.00126
G1 X103.035 Y93.46 E.01229
G1 X103.034 Y93.705 E.00751
; WIPE_START
G1 F12000
M204 S6000
G1 X103.012 Y93.858 E-.05872
G1 X102.969 Y93.978 E-.04836
G1 X102.925 Y94.055 E-.03376
G1 X102.846 Y94.151 E-.04738
G1 X102.788 Y94.2 E-.02869
G1 X102.667 Y94.271 E-.05323
G1 X102.561 Y94.307 E-.04266
G1 X102.464 Y94.324 E-.03738
G1 X102.066 Y94.363 E-.152
G1 X101.867 Y94.383 E-.076
G1 X101.391 Y94.431 E-.18182
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.5 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z3.5
G1 X0 Y90.0001 F18000 ; move to safe pos
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
            G0 Z3.5 F4000
            G39.3 S1
            G0 Z3.5 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X100.986 Y93.445 F42000
G1 Z3.1
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4410
M204 S6000
G1 X99.366 Y93.609 E.05401
G1 X99.066 Y93.309 E.01409
G1 X98.164 Y93.35 E.02994
G1 X97.739 Y93.774 E.01993
G1 X97.143 Y93.835 E.01988
G1 X97.047 Y93.743 E.00443
G1 X96.155 Y93.832 E.02971
; WIPE_START
G1 F15476.087
G1 X97.047 Y93.743 E-.34031
G1 X97.143 Y93.835 E-.05077
G1 X97.739 Y93.774 E-.22768
G1 X98.002 Y93.512 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.138 Y94.298 Z3.5 F42000
G1 Z3.1
G1 E.8 F1800
; Slow Down Start
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38292
G1 F3000;_EXTRUDE_SET_SPEED
M204 S6000
G1 X94.874 Y94.377 E.00764
G1 X90.61 Y94.807 E.11872
G3 X88.382 Y94.704 I-.671 J-9.652 E.06193
; Slow Down End
; LINE_WIDTH: 0.389977
G1 F4410
G1 X88.066 Y94.649 E.00908
G1 X87.953 Y94.586 E.00367
G1 X87.275 Y94.427 E.01969
G1 X86.293 Y94.084 E.02942
G1 X85.443 Y93.693 E.02644
G1 X84.501 Y93.129 E.03107
G3 X82.208 Y90.99 I5.425 J-8.115 E.08907
G1 X81.64 Y90.15 E.02867
G1 X81.576 Y89.994 E.00477
; LINE_WIDTH: 0.48602
G1 X81.816 Y89.562 E.01787
; LINE_WIDTH: 0.4114
G3 X83.529 Y87.608 I7.846 J5.152 E.07826
; LINE_WIDTH: 0.382977
G3 X87.062 Y85.638 I6.497 J7.5 E.11289
G3 X88.254 Y85.318 I1.784 J4.257 E.03429
G1 X88.658 Y85.256 E.01133
; Slow Down Start
; LINE_WIDTH: 0.38292
G1 F3000;_EXTRUDE_SET_SPEED
G3 X90.894 Y85.214 I1.324 J11.109 E.06206
G1 X95.023 Y85.633 E.11499
G1 X95.207 Y85.692 E.00536
; Slow Down End
M204 S10000
G1 X94.978 Y86.65 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4410
M204 S6000
G1 X93.35 Y86.65 E.05401
G1 X94.146 Y85.854 E.03734
G1 X91.323 Y85.566 E.09412
G1 X93.025 Y87.268 E.07986
G1 X93.025 Y86.975 E.00973
G1 X86.289 Y93.711 E.316
G2 X88.318 Y94.322 I4.028 J-9.698 E.0704
G1 X88.304 Y94.383 E.00208
G1 X88.684 Y94.441 E.01273
G1 X82.953 Y88.71 E.26884
G2 X82.008 Y90.004 I6.772 J5.933 E.05322
G2 X82.955 Y91.288 I10.099 J-6.456 E.05295
G1 X88.682 Y85.561 E.26868
G2 X87.601 Y85.762 I.8 J7.302 E.03651
G1 X87.617 Y85.815 E.00183
G2 X86.294 Y86.294 I2.66 J9.41 E.04673
G1 X93.025 Y93.025 E.31577
G1 X93.025 Y92.732 E.00973
G1 X91.332 Y94.425 E.07943
G1 X94.14 Y94.14 E.09362
G1 X93.35 Y93.35 E.03708
G1 X94.978 Y93.35 E.05401
; WIPE_START
G1 F15476.087
G1 X93.35 Y93.35 E-.61876
G1 X93.612 Y93.612 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.266 Y90.619 Z3.5 F42000
G1 Z3.1
G1 E.8 F1800
G1 F4410
M204 S6000
G1 X99.266 Y92.248 E.05401
G1 X100.6 Y90.914 E.06258
G3 X100.6 Y89.086 I1.703 J-.914 E.06314
G1 X99.266 Y87.752 E.06258
G1 X99.266 Y89.381 E.05401
; WIPE_START
G1 F15476.087
G1 X99.266 Y87.752 E-.61876
G1 X99.529 Y88.015 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.772 Y87.144 Z3.5 F42000
G1 Z3.1
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.60284
G1 F4410
M204 S6000
G1 X98.67 Y87.123 E.00479
; LINE_WIDTH: 0.539452
G1 X98.567 Y87.102 E.00425
G1 X93.725 Y87.102 E.19592
; LINE_WIDTH: 0.560275
G1 X93.622 Y87.123 E.00442
; LINE_WIDTH: 0.588642
G1 X93.519 Y87.144 E.00467
G1 X93.477 Y87.35 E.00933
; LINE_WIDTH: 0.539
G1 X93.477 Y92.65 E.21426
; LINE_WIDTH: 0.560275
G1 X93.498 Y92.753 E.00442
; LINE_WIDTH: 0.588642
G1 X93.519 Y92.856 E.00467
G1 X93.725 Y92.898 E.00933
; LINE_WIDTH: 0.539
G1 X98.567 Y92.898 E.19574
; LINE_WIDTH: 0.56028
G1 X98.67 Y92.877 E.00442
; LINE_WIDTH: 0.588654
G1 X98.772 Y92.856 E.00467
G1 X98.815 Y92.65 E.00933
; LINE_WIDTH: 0.539
G1 X98.815 Y87.35 E.21426
; LINE_WIDTH: 0.56028
G1 X98.8 Y87.277 E.00316
; LINE_WIDTH: 0.60284
G1 X98.784 Y87.203 E.00342
; WIPE_START
G1 F11251.607
G1 X98.8 Y87.277 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.336 Y85.919 Z3.5 F42000
G1 Z3.1
G1 E.8 F1800
; Slow Down Start
; LINE_WIDTH: 0.384193
G1 F3000;_EXTRUDE_SET_SPEED
M204 S6000
G1 X97.572 Y85.892 E.0066
G1 X102.206 Y86.362 E.12954
G1 X102.304 Y86.394 E.00287
G1 X102.316 Y86.473 E.00222
G1 X102.318 Y88.403 E.05368
G1 X102.293 Y88.565 E.00454
G1 X101.777 Y88.615 E.0144
G1 X101.31 Y88.831 E.0143
G1 X100.935 Y89.185 E.01436
G1 X100.761 Y89.536 E.01089
G1 X100.675 Y90.012 E.01345
G1 X100.701 Y90.277 E.0074
G1 X100.832 Y90.645 E.01086
G1 X101.142 Y91.048 E.01415
G1 X101.546 Y91.298 E.01322
G1 X102.027 Y91.417 E.01378
G1 X102.3 Y91.427 E.0076
G1 X102.342 Y91.583 E.00449
G1 X102.342 Y92.317 E.02041
G1 X102.319 Y92.423 E.00304
G1 X102.317 Y93.527 E.03069
G1 X102.304 Y93.606 E.00223
G1 X102.207 Y93.638 E.00284
G1 X97.082 Y94.155 E.14326
G1 X96.899 Y94.135 E.0051
; Slow Down End
; WIPE_START
G1 X97.082 Y94.155 E-.06966
G1 X98.889 Y93.972 E-.69034
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.671 Y90.685 Z3.5 F42000
G1 Z3.1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.121103
G1 F4410
M204 S6000
G1 X102.839 Y90.577 E.00127
; WIPE_START
G1 F15000
G1 X102.671 Y90.685 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.861 Y89.514 Z3.5 F42000
G1 Z3.1
G1 E.8 F1800
; LINE_WIDTH: 0.120981
G1 F4410
M204 S6000
G2 X102.729 Y89.366 I-.188 J.034 E.00133
; WIPE_START
G1 F15000
G1 X102.84 Y89.448 E-.50561
G1 X102.861 Y89.514 E-.25439
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X96.846 Y85.909 Z3.5 F42000
G1 Z3.1
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4410
M204 S6000
G1 X96.563 Y86.206 E.01361
G1 X97.55 Y86.305 E.03292
G3 X97.736 Y86.222 I.125 J.03 E.00777
G1 X98.164 Y86.65 E.02011
G1 X99.066 Y86.691 E.02994
G1 X99.368 Y86.389 E.01418
G1 X100.988 Y86.554 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 3.3
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X99.368 Y86.389 E-.61876
G1 X99.105 Y86.651 E-.14125
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 17/111
; update layer progress
M73 L17
M991 S0 P16 ;notify layer change

; OBJECT_ID: 427
M204 S10000
G17
G3 Z3.5 I-.295 J-1.181 P1  F42000
G1 X93.928 Y87.945 Z3.5
G1 Z3.3
G1 E.8 F1800
M106 S255
; FEATURE: Inner wall
G1 F15476.087
M204 S6000
G1 X93.928 Y87.553 E.01301
G1 X98.363 Y87.553 E.14712
G1 X98.363 Y92.447 E.16231
G1 X93.928 Y92.447 E.14712
G1 X93.928 Y88.005 E.14732
M204 S10000
G1 X94.32 Y87.945 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X97.971 Y87.945 E.11218
G1 X97.971 Y92.055 E.12626
G1 X94.32 Y92.055 E.11218
G1 X94.32 Y88.005 E.12441
; WIPE_START
M204 S6000
G1 X96.32 Y87.973 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.976 Y93.098 Z3.7 F42000
G1 X102.717 Y93.769 Z3.7
G1 Z3.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
M204 S6000
G3 X102.494 Y94.021 I-.239 J.013 E.01238
G1 X90.934 Y95.203 E.38545
G3 X80.863 Y89.996 I-1.01 J-10.389 E.39757
G3 X90.198 Y84.753 I9.065 J5.207 E.37288
G3 X90.925 Y84.796 I-.352 J11.989 E.02416
G1 X102.483 Y85.978 E.3854
G3 X102.716 Y86.222 I-.011 J.244 E.01236
G3 X102.718 Y89.09 I-1719.202 J2.531 E.09511
G2 X101.552 Y90.888 I-.569 J.908 E.11056
G2 X102.716 Y90.924 I.613 J-.978 E.04049
G1 X102.718 Y91.259 E.01109
G3 X102.709 Y92.981 I-75.292 J.465 E.05713
G1 X102.718 Y92.98 E.0003
G3 X102.719 Y93.709 I-12.224 J.383 E.02418
; WIPE_START
G1 X102.688 Y93.892 E-.0706
G1 X102.635 Y93.966 E-.03454
G1 X102.494 Y94.021 E-.05755
G1 X100.93 Y94.181 E-.59732
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.192 Y89.333 Z3.7 F42000
G1 Z3.3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X102.226 Y89.334 E.00107
G3 X102.694 Y89.582 I-.08 J.715 E.01668
G3 X101.653 Y90.463 I-.544 J.413 E.06369
G1 X101.592 Y90.394 E.00285
G1 X101.532 Y90.295 E.00354
G1 X101.503 Y90.231 E.00214
G3 X101.503 Y89.769 I.836 J-.231 E.0144
G1 X101.532 Y89.705 E.00214
G1 X101.592 Y89.606 E.00354
G1 X101.653 Y89.537 E.00285
G3 X102.051 Y89.336 I.51 J.513 E.01393
G1 X102.132 Y89.334 E.00247
; WIPE_START
M204 S6000
G1 X102.226 Y89.334 E-.03602
G1 X102.403 Y89.374 E-.06899
G1 X102.512 Y89.426 E-.04589
G1 X102.694 Y89.582 E-.0912
G1 X102.761 Y89.681 E-.04539
G1 X102.827 Y89.853 E-.06995
G1 X102.838 Y90.09 E-.09001
G1 X102.762 Y90.317 E-.0908
G1 X102.652 Y90.464 E-.06988
G1 X102.563 Y90.541 E-.04462
G1 X102.347 Y90.645 E-.09138
G1 X102.305 Y90.65 E-.01585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.107 Y93.811 Z3.7 F42000
G1 Z3.3
G1 E.8 F1800
G1 F10742.355
M204 S5000
G1 X103.097 Y93.894 E.00258
G1 F9571.883
G1 X103.075 Y93.981 E.00274
G1 F8400
G1 X103.043 Y94.062 E.00269
G1 F7500
G3 X102.979 Y94.168 I-.529 J-.247 E.00381
G1 F6600
G3 X102.785 Y94.336 I-.517 J-.4 E.00793
G1 F7500
G3 X102.671 Y94.383 I-.283 J-.519 E.0038
G1 F8400
G1 X102.583 Y94.404 E.00278
G1 F8974.493
G1 X102.539 Y94.41 E.00137
G1 F10200
G1 X101.942 Y94.471 E.01844
G1 F9300
G1 X100.551 Y94.612 E.04296
G1 X100.153 Y94.653 E.01229
G1 F8400
G1 X96.376 Y95.037 E.11665
G1 X95.979 Y95.077 E.01229
G1 F7500
G1 X93.872 Y95.294 E.06508
G1 X93.474 Y95.335 E.01229
G1 F6600
G1 X91.566 Y95.532 E.05893
G3 X89.129 Y95.611 I-1.598 J-11.675 E.07504
G1 X88.686 Y95.571 E.01369
G1 F5700
G3 X87.92 Y95.454 I1.295 J-11.051 E.02381
G1 X87.453 Y95.347 E.01471
G1 X87.063 Y95.257 E.01229
G1 F4800
G3 X86.279 Y95.008 I3.342 J-11.89 E.0253
G1 X85.851 Y94.848 E.01403
G1 F3900
G1 X85.494 Y94.688 E.01203
G1 X85.129 Y94.524 E.01229
G1 F3000
G3 X84.43 Y94.146 I4.933 J-9.956 E.02442
G1 X84.013 Y93.879 E.01522
G1 X83.677 Y93.662 E.01229
G1 F2880
G3 X82.741 Y92.922 I6.56 J-9.266 E.03669
G1 F2760
G3 X81.912 Y92.105 I9.784 J-10.752 E.03577
G1 F2640
G3 X81.26 Y91.317 I10.409 J-9.277 E.03143
G1 F2520
G3 X80.602 Y90.333 I11.735 J-8.565 E.03638
G1 F2400
G1 X80.52 Y90.187 E.00513
G1 F2160
G1 X80.493 Y90.11 E.00252
G1 F2040
G3 X80.488 Y89.912 I.576 J-.114 E.00613
G1 F2160
G3 X80.52 Y89.812 I.458 J.094 E.00322
G1 F2280
G1 X80.548 Y89.758 E.00189
G1 F2400
G1 X80.628 Y89.623 E.00479
G1 F2520
G3 X81.311 Y88.616 I12.011 J7.408 E.0374
G1 F2640
G3 X81.949 Y87.855 I9.599 J7.399 E.03053
G1 F2760
G3 X82.582 Y87.222 I8.779 J8.141 E.02752
G1 F2880
G3 X83.585 Y86.403 I9.234 J10.303 E.03981
G1 F3000
G3 X85.03 Y85.525 I6.526 J9.104 E.052
G1 F3900
G1 X85.394 Y85.359 E.01229
G1 X85.841 Y85.157 E.01507
G1 F4800
G1 X86.216 Y85.018 E.01229
G1 X86.491 Y84.921 E.00896
G3 X87.089 Y84.736 I4.306 J12.882 E.01925
G1 F5700
G1 X87.478 Y84.643 E.01229
G1 X87.719 Y84.586 E.00759
G3 X88.677 Y84.43 I2.292 J11.046 E.02983
G1 F6600
G1 X89.075 Y84.396 E.01229
G1 X89.349 Y84.374 E.00843
G3 X90.207 Y84.361 I.606 J11.328 E.02639
G3 X91.558 Y84.467 I-.708 J17.587 E.04164
G1 F7500
G1 X91.956 Y84.508 E.01229
G1 X94.829 Y84.804 E.08876
G2 X96.023 Y84.927 I46.792 J-450.961 E.03687
G1 F8400
G1 X96.421 Y84.967 E.01229
G1 X97.995 Y85.127 E.04861
G1 F9300
G1 X98.393 Y85.168 E.01229
G1 X99.967 Y85.328 E.04861
M73 P45 R10
G1 F10200
G1 X100.365 Y85.369 E.01229
G1 X102.138 Y85.549 E.05476
G1 X102.536 Y85.589 E.01229
G1 F9300
G1 X102.629 Y85.605 E.00292
G1 F8400
G1 X102.712 Y85.631 E.00265
G1 F7500
G1 X102.788 Y85.666 E.00258
G1 F6600
G3 X102.947 Y85.794 I-.372 J.628 E.00629
G1 F7500
G3 X103.041 Y85.935 I-.553 J.469 E.00522
G1 F8400
G1 X103.075 Y86.019 E.00279
G1 F9572.278
G1 X103.097 Y86.106 E.00274
G1 F10871.948
G1 X103.108 Y86.198 E.00285
G1 F12000
G1 X103.109 Y86.598 E.01229
G1 X103.11 Y86.94 E.01049
G1 X103.11 Y86.98 E.00126
G1 X103.126 Y86.98 E.00047
G1 X103.159 Y86.98 E.00102
G1 X103.159 Y87.138 E.00483
G1 X103.11 Y87.157 E.00162
G1 X103.11 Y87.932 E.02383
G1 X103.11 Y88.168 E.00724
G1 X103.11 Y88.183 E.00045
G1 X103.121 Y88.471 E.00888
G1 X103.159 Y88.488 E.00127
G1 X103.159 Y89.206 E.02205
G1 X103.126 Y89.206 E.00102
G1 X103.11 Y89.206 E.00049
G1 X103.11 Y89.725 E.01595
G1 X103.11 Y90.022 E.00913
G1 X103.11 Y90.378 E.01094
G1 X103.109 Y90.707 E.01009
G1 X103.108 Y90.795 E.00273
G1 X103.126 Y90.792 E.00054
G1 X103.159 Y90.787 E.00103
G1 X103.159 Y90.915 E.00393
G1 X103.126 Y90.924 E.00106
G1 X103.109 Y90.928 E.00053
G1 X103.11 Y91.133 E.00629
G2 X103.11 Y91.627 I94.956 J.145 E.01518
G1 X103.126 Y91.631 E.00049
G1 X103.159 Y91.64 E.00106
G1 X103.159 Y92.051 E.01262
G1 X103.126 Y92.059 E.00106
G1 X103.113 Y92.062 E.00041
G1 X103.109 Y92.303 E.00741
G3 X103.106 Y92.555 I-7.037 J.061 E.00776
G1 X103.11 Y93.061 E.01552
G1 X103.11 Y93.751 E.02122
; WIPE_START
M204 S6000
G1 X103.097 Y93.894 E-.05462
G1 X103.075 Y93.981 E-.03392
G1 X103.043 Y94.062 E-.03322
G1 X102.979 Y94.168 E-.047
G1 X102.891 Y94.262 E-.04887
G1 X102.785 Y94.336 E-.04909
G1 X102.671 Y94.383 E-.04687
G1 X102.583 Y94.404 E-.03439
G1 X102.539 Y94.41 E-.01691
G1 X101.942 Y94.471 E-.228
G1 X101.505 Y94.515 E-.16712
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.7 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z3.7
G1 X0 Y90.0001 F18000 ; move to safe pos
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
            G0 Z3.7 F4000
            G39.3 S1
            G0 Z3.7 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X101.485 Y93.955 F42000
G1 Z3.3
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.42049
; LAYER_HEIGHT: 0.4
G1 F3000
M204 S6000
G1 X102.348 Y93.049 E.07079
G1 X102.347 Y92.366 E.0386
G1 X100.981 Y93.803 E.11217
G1 X100.262 Y93.876 E.04087
G1 X102.347 Y91.684 E.17114
G1 X102.347 Y91.427 E.01452
G3 X101.951 Y91.418 I-.169 J-1.166 E.02251
G1 X99.544 Y93.949 E.19764
G1 X98.825 Y94.022 E.04087
G1 X101.456 Y91.256 E.216
G3 X101.082 Y90.966 I.692 J-1.282 E.02688
G1 X98.106 Y94.095 E.24428
G1 X97.387 Y94.168 E.04087
G1 X100.82 Y90.558 E.28184
G1 X100.721 Y90.269 E.0173
G1 X100.697 Y90.006 E.01497
G1 X98.733 Y92.07 E.16121
G1 X98.733 Y91.388 E.03863
G1 X102.347 Y87.588 E.29674
G1 X102.348 Y88.27 E.0386
G1 X101.836 Y88.808 E.04204
M106 S201.45
M106 S255
; WIPE_START
G1 X102.348 Y88.27 E-.28234
G1 X102.347 Y87.588 E-.25925
G1 X101.951 Y88.004 E-.21841
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.788 Y89.365 Z3.7 F42000
G1 Z3.3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.109794
; LAYER_HEIGHT: 0.2
G1 F15000
M204 S6000
G1 X102.873 Y89.427 E.00057
G1 X102.895 Y89.495 E.00039
; WIPE_START
G1 X102.873 Y89.427 E-.30652
G1 X102.788 Y89.365 E-.45348
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.913 Y90.565 Z3.7 F42000
G1 Z3.3
G1 E.8 F1800
; LINE_WIDTH: 0.136655
G1 F15000
M204 S6000
G1 X102.817 Y90.633 E.0009
; LINE_WIDTH: 0.109903
G1 X102.73 Y90.685 E.00056
; WIPE_START
G1 X102.817 Y90.633 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.53 Y90.918 Z3.7 F42000
G1 Z3.3
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.42049
; LAYER_HEIGHT: 0.4
G1 F3000
M204 S6000
G1 X102.347 Y86.905 E.31333
G1 X102.347 Y86.336 E.03222
G1 X102.249 Y86.326 E.00556
G1 X98.733 Y90.022 E.28864
G1 X98.733 Y89.34 E.03863
G1 X101.657 Y86.265 E.24006
G1 X101.065 Y86.205 E.03366
G1 X98.733 Y88.657 E.19148
G1 X98.733 Y87.974 E.03863
G1 X100.473 Y86.144 E.1429
G1 X99.882 Y86.084 E.03366
G1 X98.733 Y87.292 E.09432
G1 X98.733 Y87.184 E.0061
M73 P45 R9
G1 X98.186 Y87.184 E.03094
G1 X99.29 Y86.023 E.09062
G1 X98.698 Y85.963 E.03366
G1 X97.537 Y87.184 E.09535
G1 X96.887 Y87.184 E.03674
G1 X98.106 Y85.902 E.10007
G1 X97.515 Y85.842 E.03366
G1 X96.046 Y87.386 E.12061
M106 S201.45
M106 S255
M204 S10000
G1 X95.675 Y87.161 F42000
; Slow Down Start
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41999
; LAYER_HEIGHT: 0.2
G1 F3000;_EXTRUDE_SET_SPEED
M204 S6000
G1 X95.406 Y87.161 E.00826
G1 X95.237 Y87.097 E.00555
G1 X95.328 Y86.413 E.02122
G1 X95.662 Y85.675 E.0249
G1 X96.962 Y85.808 E.04015
G1 X95.716 Y87.118 E.05556
; Slow Down End
M204 S10000
G1 X96.024 Y86.181 F42000
; LINE_WIDTH: 0.6138
G1 F11035.594
M204 S6000
G3 X95.929 Y86.119 I-.067 J-.002 E.01315
; WIPE_START
G1 X95.882 Y86.181 E-.20232
G1 X95.917 Y86.243 E-.18589
G1 X95.989 Y86.243 E-.18589
G1 X96.024 Y86.181 E-.18589
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.169 Y87.386 Z3.7 F42000
G1 Z3.3
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.40001
; LAYER_HEIGHT: 0.4
G1 F3000
M204 S6000
G1 X94.881 Y86.637 E.05292
G1 X94.926 Y86.298 E.01754
G1 X95.238 Y85.609 E.03874
G1 X86.873 Y94.404 E.62153
G1 X86.409 Y94.239 E.0252
G1 X94.672 Y85.551 E.6139
G1 X94.106 Y85.493 E.02913
G1 X85.957 Y94.061 E.60543
G1 X85.522 Y93.866 E.02444
G1 X93.54 Y85.435 E.59574
G1 X92.974 Y85.377 E.02913
G1 X85.104 Y93.652 E.58473
G1 X84.704 Y93.42 E.02369
G1 X92.408 Y85.319 E.57239
G1 X91.842 Y85.261 E.02913
G1 X84.317 Y93.173 E.55906
G3 X83.946 Y92.911 I2.047 J-3.295 E.0233
G1 X91.276 Y85.204 E.54462
G2 X90.703 Y85.153 I-.883 J6.754 E.02946
G1 X83.585 Y92.637 E.52887
G3 X83.24 Y92.347 I2.628 J-3.46 E.02309
G1 X90.11 Y85.124 E.5104
G1 X89.48 Y85.133 E.03225
G1 X82.912 Y92.039 E.48803
G3 X82.596 Y91.718 I2.8 J-3.066 E.02307
G1 X88.812 Y85.183 E.46178
G2 X88.081 Y85.298 I3.342 J23.667 E.03784
G1 X82.298 Y91.378 E.42965
G1 X82.01 Y91.029 E.02321
G1 X87.297 Y85.469 E.39286
G2 X86.397 Y85.763 I3.727 J12.948 E.04852
G1 X81.733 Y90.667 E.34652
G3 X81.473 Y90.287 I3.369 J-2.583 E.02357
G1 X85.336 Y86.226 E.28698
G1 X84.809 Y86.514 E.03072
G1 X84.028 Y87.024 E.04777
G1 X83.764 Y87.225 E.01699
G1 X81.145 Y89.979 E.19461
M106 S201.45
M106 S255
; WIPE_START
G1 X82.523 Y88.53 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.14 Y88.045 Z3.7 F42000
G1 X93.761 Y87.815 Z3.7
G1 Z3.3
G1 E.8 F1800
G1 F3000
M204 S6000
G1 X87.363 Y94.542 E.47538
G2 X87.867 Y94.665 I1.3 J-4.236 E.02658
G1 X93.559 Y88.681 E.42288
G1 X93.559 Y89.334 E.03343
G1 X88.4 Y94.757 E.38326
G2 X88.951 Y94.831 I.924 J-4.834 E.02849
G1 X93.559 Y89.987 E.3423
G1 X93.559 Y90.64 E.03343
G1 X89.539 Y94.866 E.29865
G2 X90.152 Y94.874 I.368 J-4.53 E.03142
G1 X93.559 Y91.292 E.25309
G1 X93.559 Y91.945 E.03343
G1 X90.81 Y94.835 E.20422
G1 X91.497 Y94.766 E.03538
G1 X93.559 Y92.598 E.15314
G1 X93.559 Y92.816 E.01115
G1 X93.973 Y92.816 E.02119
G1 X92.185 Y94.696 E.13282
G1 X92.872 Y94.626 E.03538
G1 X94.594 Y92.816 E.12789
G1 X94.788 Y92.816 E.00996
G1 X94.754 Y93.072 E.01319
G1 X94.862 Y93.187 E.00808
G1 X93.56 Y94.556 E.09679
G1 X94.247 Y94.486 E.03538
G1 X95.171 Y93.515 E.06863
G1 X95.227 Y93.575 E.00417
G1 X95.101 Y93.767 E.01177
G1 X95.359 Y93.971 E.0168
G1 X94.72 Y94.642 E.04743
M106 S201.45
M106 S255
; WIPE_START
G1 X95.359 Y93.971 E-.35197
G1 X95.101 Y93.767 E-.12471
G1 X95.227 Y93.575 E-.08736
G1 X95.171 Y93.515 E-.03098
G1 X94.872 Y93.83 E-.16497
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.212 Y92.955 Z3.7 F42000
G1 Z3.3
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41999
; LAYER_HEIGHT: 0.2
G1 F12000
M204 S6000
G1 X95.202 Y92.839 E.0036
G1 X97.106 Y92.839 E.05851
G1 X96.399 Y93.583 E.03156
; Slow Down Start
; LINE_WIDTH: 0.42047
G1 F3000;_EXTRUDE_SET_SPEED
G1 X96.178 Y93.859 E.01089
G1 X96.202 Y93.993 E.00417
G1 X96.452 Y94.24 E.01082
G1 X95.591 Y94.327 E.02663
G1 X95.866 Y94.019 E.0127
G1 X95.869 Y93.884 E.00417
G1 X95.676 Y93.695 E.0083
G2 X95.649 Y93.421 I-.253 J-.113 E.00889
G1 X95.392 Y93.146 E.01157
; Slow Down End
; LINE_WIDTH: 0.41999
G1 F12000
G1 X95.253 Y92.999 E.0062
M204 S10000
G1 X96.142 Y93.279 F42000
; LINE_WIDTH: 0.54698
G1 F12000
M204 S6000
G3 X96.051 Y93.225 I-.06 J-.004 E.00999
; WIPE_START
G1 X96.016 Y93.279 E-.19349
G1 X96.048 Y93.334 E-.18884
G1 X96.111 Y93.334 E-.18884
G1 X96.142 Y93.279 E-.18884
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X96.712 Y94.195 Z3.7 F42000
G1 Z3.3
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.42049
; LAYER_HEIGHT: 0.4
G1 F3000
M204 S6000
G1 X98.216 Y92.614 E.12348
M106 S201.45
; CHANGE_LAYER
; Z_HEIGHT: 3.5
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F3000
G1 X96.838 Y94.063 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 18/111
; update layer progress
M73 L18
M991 S0 P17 ;notify layer change

; OBJECT_ID: 427
M204 S10000
G17
G3 Z3.7 I1.135 J-.439 P1  F42000
G1 X94.32 Y87.553 Z3.7
G1 Z3.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8534
M204 S6000
G1 X98.363 Y87.553 E.13411
G1 X98.363 Y92.447 E.16231
G1 X93.928 Y92.447 E.14712
G1 X93.928 Y87.553 E.16231
G1 X94.26 Y87.553 E.01102
M204 S10000
G1 X94.32 Y87.945 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8534
M204 S5000
G1 X97.971 Y87.945 E.11218
G1 X97.971 Y92.055 E.12626
G1 X94.32 Y92.055 E.11218
G1 X94.32 Y88.005 E.12441
; WIPE_START
G1 F12000
M204 S6000
G1 X96.32 Y87.973 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.983 Y93.09 Z3.9 F42000
G1 X102.789 Y93.819 Z3.9
G1 Z3.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8534
M204 S6000
G3 X102.557 Y94.106 I-.247 J.037 E.0138
G1 X90.947 Y95.311 E.38717
G3 X80.654 Y90 I-1.036 J-10.621 E.40613
G3 X90.254 Y84.644 I9.269 J5.332 E.38299
G3 X90.937 Y84.688 I-.461 J12.561 E.02269
G1 X102.552 Y85.893 E.38736
G3 X102.788 Y86.142 I-.012 J.248 E.01256
G1 X102.791 Y87.373 E.04082
G1 X102.838 Y87.373 E.00158
G1 X102.839 Y87.778 E.01346
G1 X102.753 Y87.788 E.00287
G1 X102.829 Y88.553 E.02553
G1 X102.788 Y88.557 E.00136
G1 X102.789 Y89.096 E.01787
G2 X101.461 Y90.771 I-.578 J.906 E.10464
G2 X102.513 Y91.024 I.751 J-.807 E.03751
G1 X102.838 Y90.9 E.01156
G1 X102.838 Y92.627 E.0573
G1 X102.789 Y92.627 E.00162
G1 X102.789 Y93.759 E.03753
; WIPE_START
G1 F15476.087
G1 X102.772 Y93.942 E-.06974
G1 X102.739 Y94.011 E-.02919
G1 X102.666 Y94.075 E-.03674
G1 X102.557 Y94.106 E-.0434
G1 X101.036 Y94.264 E-.58093
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.32 Y89.34 Z3.9 F42000
G1 Z3.5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8534
M204 S5000
G1 X102.46 Y89.379 E.00447
G3 X102.669 Y89.496 I-.268 J.724 E.00739
G3 X101.712 Y90.463 I-.459 J.502 E.06738
G1 X101.65 Y90.394 E.00285
G1 X101.59 Y90.295 E.00355
G1 X101.562 Y90.231 E.00214
G3 X101.562 Y89.769 I.835 J-.231 E.01439
G1 X101.59 Y89.705 E.00214
G1 X101.65 Y89.606 E.00354
G1 X101.712 Y89.537 E.00285
G3 X102.11 Y89.336 I.51 J.513 E.01393
G3 X102.26 Y89.334 I.082 J.768 E.00463
; WIPE_START
G1 F12000
M204 S6000
G1 X102.46 Y89.379 E-.07778
G1 X102.669 Y89.496 E-.09101
G1 X102.82 Y89.681 E-.09064
G1 X102.885 Y89.853 E-.06996
G1 X102.901 Y89.965 E-.04296
G1 X102.885 Y90.149 E-.0702
G1 X102.847 Y90.264 E-.04584
G1 X102.713 Y90.462 E-.09112
G1 X102.518 Y90.602 E-.09116
G1 X102.405 Y90.645 E-.04587
M73 P46 R9
G1 X102.291 Y90.657 E-.04346
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.18 Y93.856 Z3.9 F42000
G1 Z3.5
G1 E.8 F1800
G1 F8534
M204 S5000
G1 X103.176 Y93.933 E.00235
G1 X103.169 Y93.971 E.0012
G1 X103.146 Y94.062 E.00289
G1 X103.114 Y94.144 E.00269
G1 F8400
G1 X103.07 Y94.222 E.00276
G1 F7500
G3 X102.858 Y94.418 I-.509 J-.339 E.00896
G1 F8400
G3 X102.743 Y94.467 I-.294 J-.525 E.00384
G1 F8534
G3 X102.607 Y94.495 I-.225 J-.755 E.00429
G1 X102.209 Y94.536 E.01229
G1 X102.01 Y94.557 E.00615
G1 X98.034 Y94.968 E.12282
G1 X97.636 Y95.009 E.01229
G1 F8400
G1 X95.449 Y95.235 E.06755
G1 X94.654 Y95.318 E.02458
G1 X94.256 Y95.359 E.01229
G1 F7500
G1 X91.58 Y95.639 E.08266
G3 X89.929 Y95.751 I-1.686 J-12.642 E.05088
G1 X89.485 Y95.745 E.01365
G1 F6600
G3 X88.567 Y95.671 I.441 J-11.206 E.02831
G1 X88.179 Y95.61 E.01207
G1 X87.784 Y95.547 E.01229
G1 F5700
G3 X86.913 Y95.337 I2.35 J-11.651 E.02752
G1 X86.433 Y95.183 E.01551
G1 X86.052 Y95.059 E.01229
G1 F4800
G1 X85.584 Y94.863 E.01559
G1 X85.215 Y94.709 E.01229
G1 F3900
G3 X84.852 Y94.528 I5.515 J-11.569 E.01246
G1 X84.58 Y94.379 E.00955
G1 X84.23 Y94.185 E.01229
G1 F3000
G3 X83.72 Y93.852 I8.8 J-14.011 E.01872
G1 X83.38 Y93.612 E.01276
G1 X83.057 Y93.376 E.01229
G1 F2880
G3 X82.289 Y92.711 I10.591 J-13.008 E.03125
G1 F2760
G3 X81.519 Y91.9 I9.731 J-10.009 E.03438
G1 F2640
G3 X80.837 Y91.019 I12.134 J-10.095 E.03421
G1 F2520
G3 X80.345 Y90.246 I10.48 J-7.218 E.02817
G1 F2280
G3 X80.298 Y90.141 I.506 J-.29 E.00355
G1 F2160
G3 X80.29 Y89.888 I.437 J-.141 E.00787
G1 F2280
G1 X80.319 Y89.805 E.00269
G1 F2400
G1 X80.345 Y89.754 E.00175
G1 F2520
G3 X80.804 Y89.029 I9.492 J5.505 E.0264
G1 F2640
G3 X81.576 Y88.035 I11.707 J8.284 E.03868
G1 F2760
G3 X82.204 Y87.37 I9.281 J8.157 E.02811
G1 F2880
G3 X83.29 Y86.445 I10.379 J11.077 E.04384
G1 F3000
G3 X84.358 Y85.74 I8.421 J11.588 E.03935
G1 F3900
G1 X84.712 Y85.554 E.01229
G1 X85.205 Y85.296 E.01708
G1 F4800
G1 X85.572 Y85.138 E.01229
G1 X85.856 Y85.02 E.00945
G3 X86.423 Y84.811 I5.194 J13.166 E.01856
G1 F5700
G1 X86.806 Y84.695 E.01229
G1 X87 Y84.642 E.00619
G3 X87.678 Y84.475 I4.092 J15.088 E.02145
G1 F6600
G1 X88.073 Y84.411 E.01229
G1 X88.654 Y84.32 E.01809
G3 X89.337 Y84.262 I1.311 J11.425 E.02106
G1 F7500
G1 X89.737 Y84.258 E.01229
G1 X90.266 Y84.252 E.01626
G3 X91.571 Y84.36 I-.794 J17.601 E.04025
G1 X94.88 Y84.706 E.10223
G1 F8400
G1 X95.278 Y84.747 E.01229
G1 X96.074 Y84.83 E.02458
G1 F8534
G1 X96.472 Y84.871 E.01229
G1 X100.03 Y85.239 E.10992
G1 X100.428 Y85.28 E.01229
G1 X102.207 Y85.464 E.05496
G1 X102.605 Y85.505 E.01229
G1 X102.699 Y85.521 E.00292
G1 F8400
G1 X102.781 Y85.546 E.00265
G1 F7500
G3 X103.071 Y85.779 I-.242 J.597 E.01158
G1 F8400
G1 X103.114 Y85.856 E.00272
G1 F8534
G1 X103.146 Y85.938 E.0027
G1 X103.168 Y86.025 E.00276
G1 X103.18 Y86.117 E.00286
G1 X103.181 Y86.517 E.01229
G1 X103.182 Y86.94 E.01297
G1 F6675.535
G1 X103.182 Y86.98 E.00126
G1 X103.2 Y86.98 E.00055
G1 F6024.397
G1 X103.23 Y86.98 E.00094
G1 F5700
G1 X103.231 Y88.13 E.03532
G1 F8534
G1 X103.181 Y88.135 E.00153
G1 X103.23 Y88.628 E.01522
G1 X103.23 Y88.907 E.00855
G1 X103.2 Y88.91 E.00094
G1 X103.181 Y88.912 E.00059
G1 X103.182 Y89.247 E.0103
G1 F8239.844
G1 X103.182 Y89.419 E.00529
G1 F6215.811
G1 X103.23 Y89.417 E.00148
G1 F5700
G1 X103.231 Y89.641 E.00686
G1 F6219.307
G1 X103.182 Y89.647 E.00149
G1 F8534
G1 X103.181 Y90.156 E.01564
G1 F6235.569
G1 X103.23 Y90.152 E.00154
G1 F5700
G1 X103.23 Y93.02 E.0881
G1 F6221.508
G1 X103.181 Y93.02 E.0015
G1 F6460.492
G1 X103.181 Y93.041 E.00067
G1 F6677.571
G1 X103.181 Y93.061 E.00059
G1 F8534
G1 X103.181 Y93.46 E.01229
G1 X103.181 Y93.796 E.01032
; WIPE_START
G1 F12000
M204 S6000
G1 X103.176 Y93.933 E-.05186
G1 X103.169 Y93.971 E-.0149
G1 X103.146 Y94.062 E-.03568
G1 X103.114 Y94.144 E-.03326
G1 X103.07 Y94.222 E-.03416
G1 X102.962 Y94.345 E-.06237
G1 X102.858 Y94.418 E-.04814
G1 X102.743 Y94.467 E-.04738
G1 X102.607 Y94.495 E-.05301
G1 X102.209 Y94.536 E-.152
G1 X102.01 Y94.557 E-.076
G1 X101.614 Y94.598 E-.15125
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.9 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z3.9
G1 X0 Y90.0001 F18000 ; move to safe pos
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
            G0 Z3.9 F4000
            G39.3 S1
            G0 Z3.9 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X101.767 Y93.964 F42000
G1 Z3.5
G1 E.8 F1800
; FEATURE: Internal solid infill
G1 F8534
M204 S6000
G1 X102.567 Y93.164 E.03476
G1 X102.567 Y92.631
G1 X101.173 Y94.025 E.06059
G1 X100.578 Y94.086
G1 X102.616 Y92.049 E.08855
G1 X102.616 Y91.515
G1 X99.984 Y94.148 E.11439
G1 X99.389 Y94.209
G1 X102.316 Y91.282 E.12719
G1 X101.835 Y91.23
G1 X98.794 Y94.27 E.1321
G1 X98.2 Y94.332
G1 X101.471 Y91.061 E.14213
G1 X101.193 Y90.805
G1 X97.605 Y94.393 E.15592
G1 X97.011 Y94.454
G1 X100.996 Y90.469 E.17316
G1 X100.905 Y90.027
G1 X98.586 Y92.346 E.10078
G1 X98.586 Y91.813
G1 X101.147 Y89.252 E.11129
G1 X102.217 Y88.714
G1 X102.565 Y88.367 E.01512
G1 X102.537 Y87.862
G1 X101.418 Y88.98 E.0486
; WIPE_START
G1 F15000
G1 X102.537 Y87.862 E-.60099
G1 X102.56 Y88.28 E-.15901
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.568 Y87.297 Z3.9 F42000
G1 Z3.5
G1 E.8 F1800
G1 F8534
M204 S6000
G1 X98.586 Y91.28 E.17306
G1 X98.586 Y90.746
G1 X102.567 Y86.765 E.17301
G1 X102.566 Y86.233
G1 X98.586 Y90.213 E.17295
G1 X98.586 Y89.68
G1 X102.186 Y86.079 E.15647
G1 X101.703 Y86.029
G1 X98.586 Y89.147 E.13547
G1 X98.586 Y88.613
G1 X101.22 Y85.979 E.11448
G1 X100.737 Y85.929
G1 X98.586 Y88.08 E.09349
G1 X98.586 Y87.547
G1 X100.254 Y85.879 E.07249
G1 X99.771 Y85.828
G1 X98.268 Y87.331 E.0653
G1 X97.735 Y87.331
G1 X99.288 Y85.778 E.06748
G1 X98.805 Y85.728
G1 X97.202 Y87.331 E.06966
G1 X96.668 Y87.331
G1 X98.321 Y85.678 E.07184
G1 X97.838 Y85.628
G1 X96.135 Y87.331 E.07402
G1 X95.602 Y87.331
G1 X97.355 Y85.578 E.07619
G1 X96.872 Y85.527
G1 X95.069 Y87.331 E.07837
G1 X94.535 Y87.331
G1 X96.389 Y85.477 E.08055
G1 X95.906 Y85.427
G1 X94.002 Y87.331 E.08273
; WIPE_START
G1 F15000
G1 X95.416 Y85.917 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.263 Y92.669 Z3.9 F42000
G1 Z3.5
G1 E.8 F1800
G1 F8534
M204 S6000
G1 X96.416 Y94.515 E.08024
G1 X95.822 Y94.577
G1 X97.73 Y92.669 E.0829
G1 X97.196 Y92.669
G1 X95.227 Y94.638 E.08556
G1 X94.633 Y94.699
G1 X96.663 Y92.669 E.08822
G1 X96.13 Y92.669
G1 X94.038 Y94.76 E.09089
G1 X93.444 Y94.822
G1 X95.596 Y92.669 E.09355
G1 X95.063 Y92.669
G1 X92.849 Y94.883 E.09621
G1 X92.255 Y94.944
G1 X94.53 Y92.669 E.09888
G1 X93.997 Y92.669
G1 X91.66 Y95.006 E.10154
G1 X91.066 Y95.067
G1 X93.706 Y92.427 E.11474
G1 X93.706 Y91.893
G1 X90.478 Y95.121 E.14028
G1 X89.927 Y95.138
G1 X93.706 Y91.36 E.16419
G1 X93.706 Y90.827
G1 X89.414 Y95.119 E.18651
G1 X88.911 Y95.088
G1 X93.706 Y90.294 E.20835
G1 X93.706 Y89.76
G1 X88.437 Y95.029 E.22894
G1 X87.977 Y94.956
G1 X93.706 Y89.227 E.24894
G1 X93.706 Y88.694
G1 X87.542 Y94.858 E.26786
G1 X87.111 Y94.755
G1 X93.706 Y88.16 E.28657
G1 X93.706 Y87.627
G1 X86.7 Y94.633 E.30442
G1 X86.311 Y94.489
G1 X95.423 Y85.377 E.39597
G1 X94.94 Y85.327
G1 X85.923 Y94.344 E.39184
G1 X86.095 Y93.638
G1 X94.457 Y85.277 E.36334
G1 X93.973 Y85.227
G1 X86.095 Y93.105 E.34234
G1 X86.095 Y92.571
G1 X93.49 Y85.176 E.32135
G1 X93.007 Y85.126
G1 X86.095 Y92.038 E.30036
G1 X86.095 Y91.505
G1 X92.524 Y85.076 E.27936
G1 X92.041 Y85.026
G1 X86.095 Y90.972 E.25837
G1 X86.095 Y90.438
G1 X91.558 Y84.976 E.23738
G1 X91.075 Y84.926
G1 X86.095 Y89.905 E.21638
G1 X86.095 Y89.372
G1 X90.579 Y84.888 E.19486
G1 X90.065 Y84.869
G1 X86.095 Y88.839 E.17252
G1 X86.095 Y88.305
G1 X89.527 Y84.874 E.1491
G1 X88.958 Y84.91
G1 X86.095 Y87.772 E.12438
G1 X86.095 Y87.239
G1 X88.351 Y84.984 E.098
G1 X87.7 Y85.101
G1 X86.095 Y86.706 E.06972
G1 X86.028 Y86.24
G1 X86.986 Y85.282 E.04162
G1 X86.181 Y85.553
G1 X85.719 Y86.016 E.02009
; WIPE_START
G1 F15000
G1 X86.181 Y85.553 E-.2484
G1 X86.986 Y85.282 E-.32273
G1 X86.634 Y85.633 E-.18887
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.498 Y89.703 Z3.9 F42000
G1 Z3.5
G1 E.8 F1800
G1 F8534
M204 S6000
G1 X81.023 Y90.179 E.02068
; WIPE_START
G1 F15000
G1 X81.498 Y89.703 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X89.029 Y88.463 Z3.9 F42000
G1 X102.584 Y86.231 Z3.9
G1 Z3.5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.11597
G1 F8534
M204 S6000
G2 X102.441 Y86.087 I-.204 J.06 E.00126
; WIPE_START
G1 F15000
G1 X102.538 Y86.147 E-.41321
G1 X102.584 Y86.231 E-.34679
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.325 Y88.887 Z3.9 F42000
G1 Z3.5
G1 E.8 F1800
; LINE_WIDTH: 0.127835
G1 F8534
M204 S6000
G1 X101.229 Y88.957 E.00082
; LINE_WIDTH: 0.101395
G1 X101.132 Y89.027 E.00057
; WIPE_START
G1 F15000
G1 X101.229 Y88.957 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.635 Y91.531 Z3.9 F42000
G1 Z3.5
G1 E.8 F1800
; LINE_WIDTH: 0.217465
G1 F8534
M204 S6000
G1 X102.545 Y91.317 E.00331
G1 X102.452 Y91.316 E.00131
; LINE_WIDTH: 0.174927
G1 X102.448 Y91.363 E.0005
; LINE_WIDTH: 0.149808
G1 X102.443 Y91.409 E.00041
M204 S10000
G1 X102.635 Y92.371 F42000
; LINE_WIDTH: 0.109037
G1 F8534
M204 S6000
G1 X102.586 Y92.391 E.00028
G1 X102.457 Y92.52 E.00098
; WIPE_START
G1 F15000
G1 X102.586 Y92.391 E-.58947
G1 X102.635 Y92.371 E-.17053
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.118 Y93.694 Z3.9 F42000
G1 X87.955 Y94.955 Z3.9
G1 Z3.5
G1 E.8 F1800
; LINE_WIDTH: 0.0989064
G1 F8534
M204 S6000
G1 X87.793 Y94.873 E.00083
; WIPE_START
G1 F15000
G1 X87.955 Y94.955 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.15 Y89.999 Z3.9 F42000
G1 X81.478 Y89.426 Z3.9
G1 Z3.5
G1 E.8 F1800
; LINE_WIDTH: 0.38451
G1 F8534
M204 S6000
G1 X81.443 Y89.434 E.00102
; LINE_WIDTH: 0.336028
G1 X81.407 Y89.442 E.00088
; LINE_WIDTH: 0.286935
G1 X81.356 Y89.476 E.00122
; LINE_WIDTH: 0.237205
G1 X81.305 Y89.509 E.00097
; LINE_WIDTH: 0.191646
G1 X81.184 Y89.661 E.00236
; LINE_WIDTH: 0.150253
G1 X81.062 Y89.813 E.0017
; LINE_WIDTH: 0.10886
G1 X80.941 Y89.965 E.00105
; WIPE_START
G1 F15000
G1 X81.062 Y89.813 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.484 Y85.981 Z3.9 F42000
G1 Z3.5
G1 E.8 F1800
; LINE_WIDTH: 0.344684
G1 F8534
M204 S6000
G2 X82.913 Y87.748 I4.679 J9.565 E.07698
; LINE_WIDTH: 0.388613
G2 X81.478 Y89.426 I7.692 J8.026 E.0623
G1 X81.519 Y89.706 E.00797
; WIPE_START
G1 F15000
G1 X81.478 Y89.426 E-.10752
G1 X81.798 Y88.982 E-.20801
G1 X82.259 Y88.422 E-.27535
G1 X82.569 Y88.103 E-.16912
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.817 Y93.98 Z3.9 F42000
G1 Z3.5
G1 E.8 F1800
; LINE_WIDTH: 0.227987
G1 F8534
M204 S6000
G1 X85.76 Y94.018 E.00104
; LINE_WIDTH: 0.266684
G1 X85.702 Y94.056 E.00126
; LINE_WIDTH: 0.326063
G1 X85.64 Y94.091 E.00166
G3 X84.777 Y93.645 I5.289 J-11.279 E.02242
; LINE_WIDTH: 0.357619
G3 X82.394 Y91.726 I5.221 J-8.923 E.07874
; LINE_WIDTH: 0.399187
G3 X81.25 Y90.218 I7.454 J-6.843 E.05504
; WIPE_START
G1 F15000
G1 X81.596 Y90.743 E-.25206
G1 X81.923 Y91.18 E-.2188
G1 X82.394 Y91.726 E-.28914
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.91 Y87.369 Z3.9 F42000
G1 Z3.5
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8534
M204 S6000
G2 X82.72 Y88.477 I5.773 J7.391 E.05401
G1 X85.873 Y91.63 E.14791
G1 X85.873 Y88.37 E.10814
G1 X82.715 Y91.528 E.14815
G2 X83.915 Y92.625 I6.78 J-6.213 E.05401
; WIPE_START
G1 F15476.087
G1 X82.715 Y91.528 E-.61786
G1 X82.979 Y91.264 E-.14215
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.609 Y91.041 Z3.9 F42000
G1 X102.788 Y90.685 Z3.9
G1 Z3.5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.120636
G1 F8534
M204 S6000
G2 X103.034 Y90.529 I-1.617 J-2.82 E.00185
M204 S10000
G1 X103.018 Y90.409 F42000
; LINE_WIDTH: 0.133592
G1 F8534
M204 S6000
G1 X102.944 Y90.65 E.00186
; WIPE_START
G1 F15000
G1 X103.018 Y90.409 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.986 Y89.474 Z3.9 F42000
G1 Z3.5
G1 E.8 F1800
; LINE_WIDTH: 0.118119
G1 F8534
M204 S6000
G1 X102.846 Y89.366 E.00108
; CHANGE_LAYER
; Z_HEIGHT: 3.7
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X102.986 Y89.474 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 19/111
; update layer progress
M73 L19
M991 S0 P18 ;notify layer change

; OBJECT_ID: 427
M204 S10000
G17
G3 Z3.9 I.263 J-1.188 P1  F42000
G1 X94.32 Y87.553 Z3.9
G1 Z3.7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8404
M204 S6000
G1 X98.363 Y87.553 E.13411
G1 X98.363 Y92.447 E.16231
G1 X93.928 Y92.447 E.14712
G1 X93.928 Y87.553 E.16231
G1 X94.26 Y87.553 E.01102
M204 S10000
G1 X94.32 Y87.945 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8404
M204 S5000
G1 X97.971 Y87.945 E.11218
G1 X97.971 Y92.055 E.12626
G1 X94.32 Y92.055 E.11218
G1 X94.32 Y88.005 E.12441
; WIPE_START
G1 F12000
M204 S6000
G1 X96.32 Y87.973 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.975 Y93.099 Z4.1 F42000
G1 X102.857 Y93.898 Z4.1
G1 Z3.7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8404
M204 S6000
G1 X102.857 Y93.936 E.00126
G3 X102.617 Y94.189 I-.26 J-.007 E.01267
G1 X90.955 Y95.416 E.38898
G3 X80.461 Y89.999 I-1.06 J-10.823 E.41414
G3 X90.195 Y84.537 I9.435 J5.41 E.38881
G3 X90.946 Y84.583 I-.293 J10.798 E.02498
G1 X102.616 Y85.811 E.38924
G3 X102.857 Y86.052 I-.008 J.248 E.01246
G1 X102.86 Y87.271 E.04042
G1 X102.907 Y87.284 E.00164
G1 X102.907 Y89.125 E.06106
G2 X101.202 Y89.809 I-.62 J.922 E.07178
G2 X102.571 Y91.024 I1.067 J.177 E.07243
G1 X102.907 Y90.896 E.01193
G1 X102.907 Y92.723 E.0606
G1 X102.858 Y92.737 E.00169
G1 X102.857 Y93.838 E.03653
; WIPE_START
G1 F15476.087
G1 X102.857 Y93.936 E-.03719
G1 X102.828 Y94.053 E-.04571
G1 X102.777 Y94.125 E-.03348
G1 X102.689 Y94.177 E-.03899
G1 X102.617 Y94.189 E-.02762
G1 X101.107 Y94.348 E-.57703
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.403 Y89.346 Z4.1 F42000
G1 Z3.7
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8404
M204 S5000
G1 X102.518 Y89.379 E.0037
G3 X102.727 Y89.496 I-.268 J.724 E.00739
G3 X101.77 Y90.463 I-.459 J.503 E.06739
G1 X101.708 Y90.393 E.00285
G1 X101.648 Y90.295 E.00354
G1 X101.62 Y90.232 E.00214
G3 X101.62 Y89.768 I.834 J-.232 E.0144
G1 X101.648 Y89.705 E.00214
G1 X101.708 Y89.606 E.00354
G1 X101.77 Y89.537 E.00285
G3 X102.168 Y89.336 I.51 J.513 E.01393
G3 X102.342 Y89.337 I.082 J.768 E.00537
G1 X102.343 Y89.337 E.00003
; WIPE_START
G1 F12000
M204 S6000
G1 X102.518 Y89.379 E-.0684
G1 X102.727 Y89.496 E-.09097
G1 X102.878 Y89.681 E-.09067
G1 X102.944 Y89.853 E-.06991
G1 X102.959 Y89.965 E-.04308
G1 X102.944 Y90.149 E-.07018
G1 X102.905 Y90.264 E-.04586
G1 X102.771 Y90.462 E-.09105
G1 X102.576 Y90.602 E-.09121
G1 X102.463 Y90.645 E-.04583
M73 P47 R9
G1 X102.325 Y90.66 E-.05284
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.25 Y93.899 Z4.1 F42000
G1 Z3.7
G1 E.8 F1800
G1 F8404
M204 S5000
G1 X103.25 Y93.91 E.00036
G1 X103.248 Y93.968 E.00177
G1 X103.237 Y94.053 E.00265
G1 X103.215 Y94.141 E.00279
G1 X103.183 Y94.223 E.0027
G1 X103.138 Y94.302 E.00277
G1 F8400
G3 X102.958 Y94.479 I-.663 J-.49 E.0078
G1 F7500
G1 X102.928 Y94.498 E.00109
G1 F8400
G3 X102.807 Y94.55 I-.303 J-.532 E.00407
G1 F8404
G1 X102.768 Y94.561 E.00124
G1 X102.37 Y94.606 E.01229
G1 X102.074 Y94.64 E.00916
G1 X99.325 Y94.928 E.08494
G1 X98.927 Y94.97 E.01229
G1 X95.78 Y95.3 E.09723
G1 X94.984 Y95.384 E.02458
G1 X94.587 Y95.426 E.01229
G1 F8400
G1 X91.589 Y95.743 E.09263
G3 X90.606 Y95.83 I-2.006 J-16.976 E.03033
G1 X90.225 Y95.848 E.01171
G1 X89.825 Y95.859 E.01229
G1 F7500
G3 X89.034 Y95.826 I.078 J-11.471 E.02434
G1 X88.537 Y95.769 E.01537
G1 X88.14 Y95.723 E.01229
G1 F6600
G3 X87.646 Y95.629 I2.769 J-15.805 E.01545
G1 X87.243 Y95.537 E.01269
G1 X86.854 Y95.443 E.01229
G1 F5700
G3 X86.194 Y95.233 I3.702 J-12.798 E.02129
G1 X85.969 Y95.151 E.00737
G1 X85.595 Y95.01 E.01229
G1 F4800
G3 X85.031 Y94.756 I4.988 J-11.863 E.01899
G1 X84.74 Y94.609 E.01003
G1 X84.385 Y94.425 E.01229
G1 F3900
G1 X83.932 Y94.146 E.01635
G1 X83.591 Y93.936 E.01229
G1 F3000
G1 X83.078 Y93.554 E.01965
G1 X82.757 Y93.316 E.01229
G1 F2880
G3 X81.693 Y92.324 I7.435 J-9.046 E.04472
G1 F2760
G3 X81.019 Y91.539 I9.846 J-9.13 E.03181
G1 F2640
G3 X80.367 Y90.612 I11.441 J-8.745 E.03484
G1 F2520
G1 X80.156 Y90.264 E.0125
G1 F2400
G1 X80.115 Y90.184 E.00276
G1 F2280
G3 X80.078 Y90.038 I.504 J-.204 E.00463
G1 F2160
G1 X80.077 Y89.987 E.00157
G1 F2280
G3 X80.121 Y89.803 I.528 J.028 E.00587
G1 F2400
G1 X80.148 Y89.749 E.00186
G1 F2520
G3 X80.414 Y89.315 I10.137 J5.896 E.01564
G1 F2640
G3 X81.01 Y88.473 I10.487 J6.799 E.03169
G1 F2760
G3 X81.683 Y87.686 I10.213 J8.057 E.03184
G1 F2880
G3 X82.647 Y86.775 I10.496 J10.14 E.04078
G1 F3000
G3 X83.754 Y85.956 I9.942 J12.279 E.0423
G1 F3900
G1 X84.098 Y85.753 E.01229
G1 X84.557 Y85.481 E.0164
G1 F4800
G1 X84.917 Y85.306 E.01229
G1 X85.394 Y85.075 E.01627
G1 F5700
G1 X85.765 Y84.928 E.01229
G1 X86.066 Y84.813 E.00988
G3 X86.647 Y84.617 I4.924 J13.625 E.01885
G1 F6600
G1 X87.034 Y84.514 E.01229
G1 X87.338 Y84.437 E.00965
G3 X88.032 Y84.294 I3.12 J13.397 E.02176
G1 F7500
G1 X88.429 Y84.246 E.01229
G1 X89.026 Y84.175 E.01848
G3 X90.208 Y84.145 I.885 J11.554 E.03635
G1 F8400
G1 X90.696 Y84.171 E.01503
G3 X91.581 Y84.256 I-1.064 J15.58 E.0273
G1 X94.926 Y84.61 E.10337
G1 F8404
G1 X95.324 Y84.652 E.01229
G1 X96.119 Y84.736 E.02458
G1 X96.517 Y84.777 E.01229
G1 X102.074 Y85.36 E.17166
G1 X102.367 Y85.393 E.00908
G1 X102.765 Y85.439 E.01229
G1 X102.848 Y85.464 E.00267
G1 F8400
G3 X103.138 Y85.698 I-.243 J.6 E.01163
G1 F8404
G3 X103.199 Y85.814 I-.53 J.354 E.00401
G1 X103.228 Y85.902 E.00286
G1 X103.245 Y85.996 E.00292
G1 X103.249 Y86.036 E.00123
G1 X103.25 Y86.435 E.01229
G1 X103.251 Y86.94 E.01549
G1 X103.251 Y86.973 E.00102
G1 X103.271 Y86.978 E.00065
G1 X103.299 Y86.986 E.00089
G1 X103.299 Y93.016 E.18529
G1 X103.271 Y93.024 E.0009
G1 X103.25 Y93.03 E.00067
G1 X103.25 Y93.061 E.00092
G1 X103.25 Y93.839 E.02391
; WIPE_START
G1 F12000
M204 S6000
G1 X103.25 Y93.91 E-.02722
G1 X103.248 Y93.968 E-.02192
G1 X103.237 Y94.053 E-.03273
G1 X103.215 Y94.141 E-.03453
G1 X103.183 Y94.223 E-.03336
G1 X103.138 Y94.302 E-.03431
G1 X103.057 Y94.4 E-.04853
G1 X102.958 Y94.479 E-.04805
G1 X102.928 Y94.498 E-.01352
G1 X102.807 Y94.55 E-.05024
G1 X102.768 Y94.561 E-.01539
G1 X102.37 Y94.606 E-.152
G1 X102.074 Y94.64 E-.1133
G1 X101.721 Y94.677 E-.13491
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.1 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z4.1
G1 X0 Y90.0001 F18000 ; move to safe pos
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
            G0 Z4.1 F4000
            G39.3 S1
            G0 Z4.1 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X102.847 Y90.685 F42000
G1 Z3.7
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.120788
G1 F8404
M204 S6000
G2 X103.103 Y90.522 I-1.715 J-2.982 E.00193
M204 S10000
G1 X103.082 Y89.605 F42000
; LINE_WIDTH: 0.100021
G1 F8404
M204 S6000
G2 X103.03 Y89.401 I-2.392 J.501 E.00098
M204 S10000
G1 X102.905 Y89.366 F42000
; LINE_WIDTH: 0.120051
G1 F8404
M204 S6000
G3 X103.103 Y89.516 I-1.557 J2.262 E.00157
; WIPE_START
G1 F15000
G1 X102.905 Y89.366 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.261 Y85.997 Z4.1 F42000
G1 Z3.7
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42
G1 F8404
M204 S6000
G1 X102.635 Y86.371 E.01624
G1 X102.636 Y86.905
G1 X101.665 Y85.934 E.04219
G1 X101.07 Y85.872
G1 X102.685 Y87.487 E.0702
G1 X102.685 Y88.02
G1 X100.474 Y85.809 E.09609
G1 X99.878 Y85.746
G1 X102.685 Y88.554 E.12199
G1 X102.318 Y88.72
G1 X99.282 Y85.684 E.13194
G1 X98.686 Y85.621
G1 X101.853 Y88.788 E.13763
G1 X101.496 Y88.965
G1 X98.09 Y85.558 E.14803
G1 X97.494 Y85.496
G1 X101.224 Y89.226 E.16211
G1 X101.037 Y89.572
G1 X96.898 Y85.433 E.17987
G1 X96.302 Y85.37
G1 X98.263 Y87.331 E.0852
G1 X97.729 Y87.331
G1 X95.706 Y85.308 E.08793
G1 X95.11 Y85.245
G1 X97.196 Y87.331 E.09065
G1 X96.663 Y87.331
G1 X94.514 Y85.182 E.09337
G1 X93.918 Y85.12
G1 X96.13 Y87.331 E.0961
G1 X95.596 Y87.331
G1 X93.322 Y85.057 E.09882
G1 X92.726 Y84.994
G1 X95.063 Y87.331 E.10154
G1 X94.53 Y87.331
G1 X92.13 Y84.932 E.10427
G1 X91.535 Y84.869
G1 X93.997 Y87.331 E.10699
G1 X93.706 Y87.573
G1 X90.939 Y84.806 E.12025
G1 X90.37 Y84.77
G1 X93.706 Y88.107 E.14498
G1 X93.706 Y88.64
G1 X89.829 Y84.763 E.16846
G1 X89.305 Y84.773
G1 X93.706 Y89.173 E.19122
G1 X93.706 Y89.706
G1 X88.812 Y84.813 E.21265
G1 X88.344 Y84.878
G1 X93.706 Y90.24 E.23299
G1 X93.706 Y90.773
G1 X87.883 Y84.951 E.25301
G1 X87.443 Y85.044
G1 X93.706 Y91.306 E.27215
G1 X93.706 Y91.84
G1 X87.02 Y85.153 E.29054
G1 X86.608 Y85.275
G1 X93.706 Y92.373 E.30843
; WIPE_START
G1 F15000
G1 X92.292 Y90.959 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.586 Y87.654 Z4.1 F42000
G1 Z3.7
G1 E.8 F1800
G1 F8404
M204 S6000
G1 X100.964 Y90.032 E.10334
; WIPE_START
G1 F15000
G1 X99.549 Y88.618 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.217 Y91.286 Z4.1 F42000
G1 Z3.7
G1 E.8 F1800
G1 F8404
M204 S6000
G1 X102.685 Y91.753 E.02032
G1 X102.685 Y92.286
G1 X98.586 Y88.187 E.17813
G1 X98.586 Y88.72
G1 X102.636 Y92.771 E.17601
G1 X102.635 Y93.303
G1 X98.586 Y89.254 E.17598
G1 X98.586 Y89.787
G1 X102.635 Y93.836 E.17596
G1 X102.268 Y94.002
G1 X98.586 Y90.32 E.16
G1 X98.586 Y90.853
G1 X101.785 Y94.053 E.13903
G1 X101.303 Y94.104
G1 X98.586 Y91.387 E.11807
G1 X98.586 Y91.92
G1 X100.82 Y94.154 E.0971
G1 X100.338 Y94.205
G1 X98.586 Y92.453 E.07613
G1 X98.268 Y92.669
G1 X99.855 Y94.256 E.06896
G1 X99.373 Y94.307
G1 X97.735 Y92.669 E.07117
G1 X97.202 Y92.669
G1 X98.89 Y94.357 E.07337
G1 X98.408 Y94.408
G1 X96.668 Y92.669 E.07558
G1 X96.135 Y92.669
G1 X97.925 Y94.459 E.07778
G1 X97.443 Y94.51
G1 X95.602 Y92.669 E.07999
G1 X95.069 Y92.669
G1 X96.96 Y94.56 E.08219
G1 X96.477 Y94.611
G1 X94.535 Y92.669 E.0844
G1 X94.002 Y92.669
G1 X95.995 Y94.662 E.0866
G1 X95.512 Y94.713
G1 X86.213 Y85.413 E.4041
G1 X85.83 Y85.563
G1 X95.03 Y94.763 E.39979
G1 X94.547 Y94.814
G1 X86.095 Y86.362 E.36729
G1 X86.095 Y86.895
G1 X94.065 Y94.865 E.34632
G1 X93.582 Y94.916
G1 X86.095 Y87.429 E.32535
G1 X86.095 Y87.962
G1 X93.1 Y94.966 E.30438
G1 X92.617 Y95.017
G1 X86.095 Y88.495 E.28341
G1 X86.095 Y89.028
G1 X92.135 Y95.068 E.26245
G1 X91.652 Y95.119
G1 X86.095 Y89.562 E.24148
G1 X86.095 Y90.095
G1 X91.17 Y95.169 E.22051
G1 X90.677 Y95.21
G1 X86.095 Y90.628 E.19912
G1 X86.095 Y91.161
G1 X90.174 Y95.24 E.17725
G1 X89.638 Y95.237
G1 X86.095 Y91.695 E.15393
G1 X86.095 Y92.228
G1 X89.078 Y95.211 E.12962
G1 X88.476 Y95.142
G1 X86.095 Y92.761 E.10347
G1 X86.095 Y93.294
G1 X87.843 Y95.042 E.07595
G1 X87.154 Y94.886
G1 X86.028 Y93.76 E.04892
G1 X85.87 Y94.136
G1 X86.387 Y94.652 E.02245
M204 S10000
G1 X85.917 Y94.479 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.130401
G1 F8404
M204 S6000
G1 X85.736 Y94.354 E.00157
; WIPE_START
G1 F15000
G1 X85.917 Y94.479 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.412 Y93.038 Z4.1 F42000
G1 X102.142 Y91.361 Z4.1
G1 Z3.7
G1 E.8 F1800
; LINE_WIDTH: 0.0926791
G1 F8404
M204 S6000
G3 X101.931 Y91.242 I1.266 J-2.48 E.00098
; WIPE_START
G1 F15000
G1 X102.142 Y91.361 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.005 Y90.322 Z4.1 F42000
G1 Z3.7
G1 E.8 F1800
; LINE_WIDTH: 0.126077
G1 F8404
M204 S6000
G1 X100.891 Y90.105 E.00166
; WIPE_START
G1 F15000
G1 X101.005 Y90.322 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.81 Y85.814 Z4.1 F42000
G1 Z3.7
G1 E.8 F1800
; LINE_WIDTH: 0.167103
G1 F8404
M204 S6000
G1 X99.559 Y85.694 E.00282
; WIPE_START
G1 F15000
G1 X99.81 Y85.814 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.426 Y85.563 Z4.1 F42000
G1 Z3.7
G1 E.8 F1800
; LINE_WIDTH: 0.171507
G1 F8404
M204 S6000
G1 X97.175 Y85.443 E.00292
; WIPE_START
G1 F15000
G1 X97.426 Y85.563 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.659 Y85.062 Z4.1 F42000
G1 Z3.7
G1 E.8 F1800
; LINE_WIDTH: 0.175831
G1 F8404
M204 S6000
G1 X92.407 Y84.942 E.00302
; WIPE_START
G1 F15000
G1 X92.659 Y85.062 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.576 Y85.282 Z4.1 F42000
G1 Z3.7
G1 E.8 F1800
; LINE_WIDTH: 0.0905129
G1 F8404
M204 S6000
G1 X86.434 Y85.367 E.00064
; WIPE_START
G1 F15000
G1 X86.576 Y85.282 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.12 Y86.023 Z4.1 F42000
G1 Z3.7
G1 E.8 F1800
; LINE_WIDTH: 0.337322
G1 F8404
M204 S6000
G2 X82.892 Y87.564 I4.547 J8.95 E.06519
; LINE_WIDTH: 0.376047
G2 X81.659 Y88.897 I6.538 J7.288 E.04936
; LINE_WIDTH: 0.396859
G2 X80.994 Y89.863 I7.59 J5.93 E.03385
; LINE_WIDTH: 0.419753
G1 X80.952 Y89.959 E.0032
; LINE_WIDTH: 0.448058
G1 X80.863 Y90.272 E.01075
; WIPE_START
G1 F15000
G1 X80.952 Y89.959 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.111 Y93.979 Z4.1 F42000
G1 Z3.7
G1 E.8 F1800
; LINE_WIDTH: 0.340172
G1 F8404
M204 S6000
G3 X82.623 Y92.188 I4.822 J-9.318 E.07452
; LINE_WIDTH: 0.387796
G1 X82.244 Y91.799 E.01528
G3 X80.996 Y90.144 I8.352 J-7.592 E.05832
; LINE_WIDTH: 0.419375
G1 X80.834 Y89.779 E.01224
; WIPE_START
G1 F15000
G1 X80.996 Y90.144 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.146 Y86.312 Z4.1 F42000
G1 Z3.7
G1 E.8 F1800
; LINE_WIDTH: 0.150555
G1 F8404
M204 S6000
G1 X85.878 Y85.947 E.00397
G1 X85.743 Y85.838 E.00152
; LINE_WIDTH: 0.192385
G1 X85.592 Y85.773 E.00199
; LINE_WIDTH: 0.223414
G1 X85.442 Y85.709 E.0024
M204 S10000
G1 X86.169 Y86.288 F42000
; LINE_WIDTH: 0.21691
G1 F8404
M204 S6000
G3 X85.542 Y85.666 I46.18 J-47.197 E.01253
; WIPE_START
G1 F15000
G1 X86.169 Y86.288 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.807 Y92.733 Z4.1 F42000
G1 Z3.7
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8404
M204 S6000
G3 X82.602 Y91.641 I8.617 J-10.708 E.05397
G1 X85.873 Y88.37 E.15344
G1 X85.873 Y91.63 E.10813
G1 X82.603 Y88.36 E.15342
G3 X83.806 Y87.266 I7.724 J7.29 E.054
; CHANGE_LAYER
; Z_HEIGHT: 3.9
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X82.603 Y88.36 E-.61803
G1 X82.867 Y88.624 E-.14198
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 20/111
; update layer progress
M73 L20
M991 S0 P19 ;notify layer change

; OBJECT_ID: 427
M204 S10000
G17
G3 Z4.1 I.072 J1.215 P1  F42000
G1 X94.32 Y87.945 Z4.1
G1 Z3.9
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8630
M204 S5000
G1 X97.971 Y87.945 E.11218
G1 X97.971 Y92.055 E.12626
G1 X94.32 Y92.055 E.11218
G1 X94.32 Y88.005 E.12441
; WIPE_START
G1 F12000
M204 S6000
G1 X96.32 Y87.973 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X89.807 Y91.952 Z4.3 F42000
G1 X86.517 Y93.962 Z4.3
G1 Z3.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8630
M204 S6000
G1 X86.519 Y95.051 E.03614
G3 X80.268 Y89.997 I3.315 J-10.493 E.27297
G3 X86.516 Y84.95 I9.613 J5.509 E.27265
G1 X86.517 Y86.219 E.04211
G1 X86.3 Y86.207 E.00718
G1 X86.3 Y93.793 E.25163
G1 X86.517 Y93.781 E.00718
G1 X86.517 Y93.902 E.00401
; WIPE_START
G1 F15476.087
G1 X86.519 Y95.051 E-.43681
G1 X86.039 Y94.887 E-.19249
G1 X85.72 Y94.759 E-.13069
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.984 Y92.416 Z4.3 F42000
G1 X102.484 Y89.352 Z4.3
G1 Z3.9
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8630
M204 S5000
G1 X102.577 Y89.379 E.00297
G3 X102.786 Y89.496 I-.268 J.724 E.00738
G3 X101.829 Y90.463 I-.459 J.502 E.06738
G1 X101.767 Y90.394 E.00285
G1 X101.707 Y90.295 E.00355
G1 X101.679 Y90.232 E.00213
G3 X101.679 Y89.769 I.834 J-.232 E.0144
G1 X101.707 Y89.705 E.00214
G1 X101.767 Y89.606 E.00355
G1 X101.829 Y89.537 E.00284
G3 X102.226 Y89.336 I.51 J.513 E.01392
G3 X102.4 Y89.337 I.082 J.768 E.00537
G1 X102.425 Y89.341 E.00077
; WIPE_START
G1 F12000
M204 S6000
G1 X102.577 Y89.379 E-.05948
G1 X102.786 Y89.496 E-.09095
G1 X102.936 Y89.681 E-.09053
G1 X103.002 Y89.853 E-.06997
G1 X103.019 Y89.97 E-.04499
G1 X103 Y90.154 E-.0701
G1 X102.964 Y90.264 E-.04402
G1 X102.829 Y90.462 E-.09115
G1 X102.635 Y90.602 E-.09117
G1 X102.522 Y90.645 E-.04583
G1 X102.36 Y90.662 E-.06182
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.316 Y93.937 Z4.3 F42000
G1 Z3.9
G1 E.8 F1800
G1 F8630
M204 S5000
G1 X103.316 Y93.987 E.00152
G1 X103.315 Y94.034 E.00146
G1 X103.304 Y94.123 E.00275
G1 X103.28 Y94.218 E.00302
G1 X103.248 Y94.301 E.00273
G3 X103.122 Y94.478 I-.612 J-.302 E.00671
G1 F8400
G3 X102.989 Y94.578 I-.607 J-.666 E.00512
G1 F8630
G3 X102.866 Y94.631 I-.314 J-.567 E.00412
G1 X102.83 Y94.641 E.00113
G1 X102.433 Y94.686 E.01229
G1 X102.137 Y94.721 E.00916
G1 X97.262 Y95.239 E.15062
G1 X96.865 Y95.281 E.01229
M73 P48 R9
G1 X91.593 Y95.842 E.16291
G1 X91.002 Y95.899 E.01822
G1 X90.604 Y95.937 E.01229
G1 F8400
G3 X89.412 Y95.948 I-.709 J-12.516 E.03665
G1 X88.909 Y95.912 E.01548
G1 X88.511 Y95.881 E.01229
G1 F7500
G3 X87.598 Y95.734 I1.412 J-11.677 E.02841
G1 X87.183 Y95.635 E.01312
G1 X86.794 Y95.542 E.01229
G1 F6600
G3 X86.099 Y95.322 I3.744 J-13.011 E.02239
G1 X85.884 Y95.243 E.00705
G1 X85.51 Y95.102 E.01229
G1 F5700
G1 X85.015 Y94.874 E.01674
G1 X84.651 Y94.707 E.01229
G1 F4800
G1 X84.172 Y94.437 E.01689
G1 X83.824 Y94.24 E.01229
G1 F3900
G1 X83.452 Y93.99 E.01378
G1 X83.12 Y93.767 E.01229
G1 F3000
G3 X82.458 Y93.245 I7.206 J-9.827 E.02592
G1 X82.058 Y92.891 E.0164
G1 F2880
G3 X81.11 Y91.896 I7.921 J-8.487 E.04226
G1 F2760
G3 X80.469 Y91.06 I11.842 J-9.75 E.03236
G1 F2640
G3 X79.957 Y90.256 I10.527 J-7.27 E.02929
G1 F2520
G1 X79.915 Y90.17 E.00296
G1 F2400
G1 X79.899 Y90.119 E.00164
G1 F2280
G3 X79.894 Y89.904 I.53 J-.12 E.00663
G1 F2400
G3 X79.927 Y89.801 I.484 J.1 E.00334
G1 F2520
G1 X79.956 Y89.746 E.00191
G1 F2640
G3 X80.339 Y89.13 I10.089 J5.853 E.02231
G1 F2760
G3 X81.169 Y88.035 I12.356 J8.502 E.04221
G1 F2880
G3 X82.125 Y87.047 I12.018 J10.67 E.04227
G1 F3000
G3 X83.11 Y86.241 I10.109 J11.349 E.03912
G1 F3900
G1 X83.443 Y86.019 E.01229
G1 X83.902 Y85.712 E.01697
G1 F4800
G1 X84.252 Y85.52 E.01229
G1 X84.828 Y85.204 E.02017
G1 F5700
G1 X85.195 Y85.044 E.01229
G1 X85.694 Y84.825 E.01675
G1 F6600
G1 X86.071 Y84.691 E.01229
G1 X86.386 Y84.584 E.01022
G3 X86.984 Y84.407 I4.486 J14.022 E.01916
G1 F7500
G1 X87.374 Y84.322 E.01229
G1 X87.89 Y84.21 E.01622
G1 F8400
G1 X88.291 Y84.148 E.01247
G3 X90.297 Y84.047 I1.59 J11.594 E.06177
G1 X90.498 Y84.056 E.0062
G1 F8630
G1 X90.986 Y84.101 E.01506
G3 X95.101 Y84.531 I-16.272 J175.421 E.12714
G1 X95.499 Y84.574 E.01229
G1 X98.619 Y84.905 E.09641
G1 X99.017 Y84.948 E.01229
G1 X102.336 Y85.301 E.10255
G1 X102.733 Y85.343 E.01229
G3 X102.91 Y85.385 I-.065 J.661 E.0056
G1 X102.988 Y85.422 E.00265
G1 F8400
G3 X103.124 Y85.525 I-.309 J.55 E.00526
G1 F8630
G3 X103.248 Y85.702 I-.469 J.462 E.00666
G1 X103.27 Y85.753 E.00172
G1 X103.293 Y85.825 E.00232
G1 X103.31 Y85.917 E.00286
G1 X103.316 Y86.017 E.00308
G1 X103.316 Y86.948 E.02863
G1 X103.316 Y93.054 E.18761
G1 X103.316 Y93.877 E.02529
; WIPE_START
G1 F12000
M204 S6000
G1 X103.316 Y93.987 E-.04164
G1 X103.315 Y94.034 E-.01806
G1 X103.304 Y94.123 E-.03404
G1 X103.28 Y94.218 E-.03729
G1 X103.248 Y94.301 E-.03371
G1 X103.122 Y94.478 E-.08265
G1 X102.989 Y94.578 E-.06323
G1 X102.866 Y94.631 E-.05083
G1 X102.83 Y94.641 E-.01398
G1 X102.433 Y94.686 E-.152
G1 X102.137 Y94.721 E-.11333
G1 X101.825 Y94.754 E-.11925
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.3 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z4.3
G1 X0 Y90.0001 F18000 ; move to safe pos
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
            G0 Z4.3 F4000
            G39.3 S1
            G0 Z4.3 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X102.303 Y94.494 F42000
G1 Z3.9
G1 E.8 F1800
; FEATURE: Top surface
G1 F8630
M204 S2000
G1 X103.109 Y93.689 E.03501
G1 X103.109 Y93.155
G1 X101.706 Y94.558 E.06095
G1 X101.11 Y94.621
G1 X103.109 Y92.622 E.08688
G1 X103.109 Y92.089
G1 X100.513 Y94.685 E.11281
G1 X99.916 Y94.748
G1 X103.109 Y91.556 E.13874
G1 X103.109 Y91.022
G1 X99.319 Y94.812 E.16467
G1 X98.723 Y94.875
G1 X102.93 Y90.668 E.18281
G1 X102.197 Y90.868
G1 X98.126 Y94.939 E.1769
G1 X97.529 Y95.002
G1 X101.812 Y90.72 E.1861
G1 X101.555 Y90.444
G1 X96.933 Y95.066 E.20085
G1 X96.336 Y95.129
G1 X101.431 Y90.034 E.22141
; WIPE_START
G1 F12000
M204 S6000
G1 X100.017 Y91.448 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.109 Y88.889 Z4.3 F42000
G1 Z3.9
G1 E.8 F1800
G1 F8630
M204 S2000
G1 X102.765 Y89.233 E.01494
G1 X102.343 Y89.122
G1 X103.109 Y88.356 E.03329
G1 X103.109 Y87.823
G1 X95.739 Y95.193 E.32025
G1 X95.142 Y95.256
G1 X98.137 Y92.262 E.13011
G1 X97.603 Y92.262
G1 X94.546 Y95.32 E.13287
G1 X93.949 Y95.383
G1 X97.07 Y92.262 E.13563
G1 X96.537 Y92.262
G1 X93.352 Y95.446 E.13839
G1 X92.755 Y95.51
G1 X96.004 Y92.262 E.14114
G1 X95.47 Y92.262
G1 X92.159 Y95.573 E.1439
G1 X91.562 Y95.637
G1 X94.937 Y92.262 E.14666
G1 X94.404 Y92.262
G1 X90.966 Y95.7 E.1494
G1 X90.393 Y95.74
G1 X94.113 Y92.019 E.16167
G1 X93.893 Y91.706
G1 X89.846 Y95.753 E.17587
G1 X89.326 Y95.74
G1 X93.544 Y91.522 E.18331
G1 X93.544 Y90.989
G1 X88.828 Y95.704 E.20492
G1 X88.35 Y95.65
G1 X93.544 Y90.455 E.22571
G1 X93.544 Y89.922
G1 X87.888 Y95.578 E.24579
G1 X87.444 Y95.489
G1 X93.544 Y89.389 E.26506
G1 X93.544 Y88.856
G1 X87.015 Y95.385 E.28373
G1 X86.741 Y95.125
G1 X93.544 Y88.322 E.29562
G1 X93.572 Y88.294
G1 X94.113 Y87.753 E.02349
; WIPE_START
G1 F12000
M204 S6000
G1 X93.572 Y88.294 E-.29044
G1 X93.544 Y88.322 E-.01527
G1 X92.699 Y89.168 E-.45429
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.179 Y92.22 Z4.3 F42000
G1 Z3.9
G1 E.8 F1800
G1 F8630
M204 S2000
G1 X103.109 Y87.29 E.21425
G1 X103.109 Y86.756
G1 X98.179 Y91.687 E.21425
G1 X98.179 Y91.153
G1 X103.109 Y86.223 E.21425
G1 X103.042 Y85.757
G1 X98.179 Y90.62 E.21133
G1 X98.179 Y90.087
G1 X102.715 Y85.55 E.19714
G1 X102.234 Y85.498
G1 X98.179 Y89.554 E.17623
G1 X98.179 Y89.02
G1 X101.752 Y85.447 E.15528
G1 X101.27 Y85.396
G1 X98.179 Y88.487 E.13433
G1 X98.179 Y87.954
G1 X100.788 Y85.344 E.11339
G1 X100.306 Y85.293
G1 X97.861 Y87.738 E.10624
G1 X97.328 Y87.738
G1 X99.824 Y85.242 E.10847
G1 X99.342 Y85.191
G1 X96.795 Y87.738 E.1107
G1 X96.261 Y87.738
G1 X98.86 Y85.139 E.11292
G1 X98.378 Y85.088
G1 X95.728 Y87.738 E.11515
G1 X95.195 Y87.738
G1 X97.896 Y85.037 E.11738
G1 X97.414 Y84.986
G1 X94.661 Y87.738 E.11961
G1 X94.128 Y87.738
G1 X96.932 Y84.934 E.12183
G1 X96.45 Y84.883
G1 X86.74 Y94.593 E.42193
G1 X86.74 Y94.06
G1 X95.968 Y84.832 E.40101
G1 X95.486 Y84.781
G1 X86.72 Y93.547 E.38092
G1 X86.523 Y93.21
G1 X95.004 Y84.729 E.36854
G1 X94.522 Y84.678
G1 X86.54 Y92.661 E.34687
G1 X86.54 Y92.127
G1 X94.04 Y84.627 E.32592
G1 X93.558 Y84.576
G1 X86.54 Y91.594 E.30498
G1 X86.54 Y91.061
G1 X93.076 Y84.524 E.28403
G1 X92.594 Y84.473
G1 X86.54 Y90.527 E.26309
G1 X86.54 Y89.994
G1 X92.112 Y84.422 E.24214
G1 X91.63 Y84.371
G1 X86.54 Y89.461 E.2212
G1 X86.54 Y88.928
G1 X91.148 Y84.319 E.20025
G1 X90.659 Y84.275
G1 X86.54 Y88.394 E.17901
G1 X86.54 Y87.861
G1 X90.15 Y84.251 E.15688
G1 X89.618 Y84.249
G1 X86.54 Y87.328 E.13377
G1 X86.523 Y86.811
G1 X89.058 Y84.276 E.11017
G1 X88.466 Y84.335
G1 X86.739 Y86.062 E.07507
G1 X86.739 Y85.529
G1 X87.836 Y84.432 E.04769
G1 X87.156 Y84.578
G1 X86.738 Y84.996 E.01816
; WIPE_START
G1 F12000
M204 S6000
G1 X87.156 Y84.578 E-.22459
G1 X87.836 Y84.432 E-.26426
G1 X87.332 Y84.936 E-.27116
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.957 Y85.263 Z4.3 F42000
G1 X102.922 Y85.604 Z4.3
G1 Z3.9
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.126935
G1 F8630
M204 S6000
G1 X102.849 Y85.617 E.00051
G1 X102.743 Y85.542 E.00088
; WIPE_START
G1 F15000
G1 X102.849 Y85.617 E-.48211
G1 X102.922 Y85.604 E-.27789
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.108 Y93.234 Z4.3 F42000
G1 X103.127 Y94.016 Z4.3
G1 Z3.9
G1 E.8 F1800
; LINE_WIDTH: 0.220535
G1 F8630
M204 S6000
G3 X102.663 Y94.475 I-1.203 J-.752 E.00953
; WIPE_START
G1 F15000
G1 X102.916 Y94.283 E-.36677
G1 X103.127 Y94.016 E-.39323
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.09 Y91.003 Z4.3 F42000
G1 Z3.9
G1 E.8 F1800
; LINE_WIDTH: 0.118731
G1 F8630
M204 S6000
G1 X103.09 Y90.551 E.00279
; WIPE_START
G1 F15000
G1 X103.09 Y91.003 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.519 Y90.382 Z4.3 F42000
G1 Z3.9
G1 E.8 F1800
; LINE_WIDTH: 0.103089
G1 F8630
M204 S6000
G1 X101.47 Y90.31 E.00042
G1 X101.484 Y90.248 E.00031
M204 S10000
G1 X101.466 Y89.751 F42000
; LINE_WIDTH: 0.127202
G1 F8630
M204 S6000
G1 X101.356 Y89.959 E.00162
; WIPE_START
G1 F15000
G1 X101.466 Y89.751 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.291 Y92.374 Z4.3 F42000
G1 Z3.9
G1 E.8 F1800
; LINE_WIDTH: 0.0992617
G1 F8630
M204 S6000
G1 X98.181 Y92.264 E.00071
G1 X98.172 Y92.213 E.00024
; WIPE_START
G1 F15000
G1 X98.181 Y92.264 E-.18875
G1 X98.291 Y92.374 E-.57125
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.847 Y91.68 Z4.3 F42000
G1 Z3.9
G1 E.8 F1800
; LINE_WIDTH: 0.59669
G1 F8630
M204 S6000
G1 X93.847 Y88.32 E.15159
; WIPE_START
G1 F11376.564
G1 X93.847 Y90.32 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.204 Y86.563 Z4.3 F42000
G1 X86.205 Y85.998 Z4.3
G1 Z3.9
G1 E.8 F1800
; LINE_WIDTH: 0.258682
G1 F8630
M204 S6000
G1 X86.205 Y85.271 E.01278
; WIPE_START
G1 F15000
G1 X86.205 Y85.998 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
M73 P49 R9
G1 X81.471 Y90.485 Z4.3 F42000
G1 Z3.9
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8630
M204 S6000
G2 X82.496 Y91.747 I10.963 J-7.859 E.05396
G1 X85.952 Y88.291 E.16212
G1 X85.952 Y86.346 E.06451
G1 X85.727 Y86.346 E.00746
G1 X85.727 Y85.727 E.02054
G1 X85.648 Y85.648 E.00373
G2 X84.754 Y86.08 I4.24 J9.906 E.03295
G1 X84.919 Y86.367 E.01097
G2 X82.492 Y88.249 I5.129 J9.116 E.10224
G1 X85.952 Y91.709 E.16231
G1 X85.952 Y93.654 E.06451
G1 X85.727 Y93.654 E.00748
G1 X85.727 Y94.273 E.02053
G1 X85.645 Y94.355 E.00383
G3 X84.516 Y93.785 I10.859 J-22.96 E.04197
G1 X84.689 Y93.517 E.01058
G1 X84.653 Y93.493 E.00144
M204 S10000
G1 X84.221 Y93.613 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.384695
G1 F8630
M204 S6000
G3 X80.795 Y90.146 I5.725 J-9.084 E.13694
; LINE_WIDTH: 0.426454
G1 X80.741 Y90.004 E.00475
G1 X80.984 Y89.56 E.01581
; LINE_WIDTH: 0.384841
G3 X84.4 Y86.279 I8.849 J5.793 E.1331
; WIPE_START
G1 F15000
G1 X83.571 Y86.825 E-.37759
G1 X83.029 Y87.252 E-.26177
G1 X82.794 Y87.465 E-.12065
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.205 Y94.002 Z4.3 F42000
G1 Z3.9
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.259948
G1 F8630
M204 S6000
G1 X86.206 Y94.73 E.01288
; CHANGE_LAYER
; Z_HEIGHT: 4.1
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X86.205 Y94.002 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 21/111
; update layer progress
M73 L21
M991 S0 P20 ;notify layer change

; OBJECT_ID: 427
M204 S10000
G17
G3 Z4.3 I.925 J.791 P1  F42000
G1 X87.168 Y92.875 Z4.3
G1 Z4.1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3851
M204 S5000
G1 X87.168 Y87.125 E.1767
G1 X87.785 Y87.159 E.01897
G1 X87.819 Y86.518 E.01971
G1 X87.384 Y86.495 E.01337
G1 X87.384 Y85.273 E.03754
G3 X87.67 Y84.851 I.517 J.043 E.01636
G3 X89.567 Y84.622 I2.174 J10.011 E.0588
G3 X91.002 Y84.677 I.29 J11.166 E.04416
G1 X102.413 Y85.891 E.35259
G3 X102.726 Y86.237 I-.042 J.353 E.01566
G1 X102.726 Y89.12 E.08858
G3 X102.558 Y89.351 I-.292 J-.035 E.00919
G3 X102.559 Y90.649 I-.149 J.649 E.05499
G3 X102.726 Y90.88 I-.124 J.265 E.00914
G1 X102.726 Y93.765 E.08863
G3 X102.412 Y94.109 I-.385 J-.035 E.01539
G1 X91.115 Y95.311 E.34907
G3 X87.738 Y95.171 I-1.238 J-10.903 E.10428
G3 X87.386 Y94.772 I.155 J-.491 E.01718
G1 X87.384 Y93.505 E.03891
G1 X87.819 Y93.482 E.01338
G1 X87.785 Y92.841 E.01971
G1 X87.228 Y92.872 E.01713
M204 S10000
G1 X86.776 Y93.29 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3851
M204 S6000
G1 X86.992 Y93.278 E.00716
G1 X86.994 Y94.817 E.05105
G1 X87.034 Y94.992 E.00597
G1 X87.195 Y95.351 E.01304
G3 X80.08 Y89.997 I2.618 J-10.884 E.30377
G3 X87.223 Y84.637 I9.794 J5.613 E.30457
G1 X87.055 Y84.952 E.01182
G2 X86.992 Y85.253 I.707 J.307 E.01029
G1 X86.992 Y86.722 E.04872
G1 X86.776 Y86.71 E.00719
G1 X86.776 Y93.23 E.21627
; WIPE_START
G1 F15476.087
G1 X86.992 Y93.278 E-.08392
G1 X86.994 Y94.817 E-.58478
G1 X87.034 Y94.992 E-.06839
G1 X87.059 Y95.047 E-.02292
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.291 Y92.606 Z4.5 F42000
G1 X103.379 Y89.539 Z4.5
G1 Z4.1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3851
M204 S5000
G1 X103.379 Y94.056 E.13879
G1 X103.372 Y94.162 E.00325
G1 X103.355 Y94.25 E.00277
G3 X103.29 Y94.413 I-.693 J-.183 E.00541
G1 X103.242 Y94.486 E.00267
G3 X103.006 Y94.676 I-.503 J-.382 E.00941
G1 X102.929 Y94.706 E.00253
G3 X102.796 Y94.734 I-.204 J-.648 E.0042
G1 X102.199 Y94.798 E.01844
G1 X99.056 Y95.135 E.09714
G1 X98.658 Y95.178 E.01229
G1 X91.377 Y95.959 E.22501
G1 X90.979 Y96.002 E.01229
G3 X89.695 Y96.054 I-1.146 J-12.294 E.03951
G1 X89.279 Y96.037 E.01278
G1 X88.88 Y96.018 E.01229
G1 X88.661 Y95.998 E.00675
G1 X88.369 Y95.965 E.00902
G3 X87.533 Y95.826 I1.754 J-13.116 E.02606
G1 X87.123 Y95.737 E.0129
G3 X86.326 Y95.514 I2.904 J-11.934 E.02543
G1 X86.102 Y95.438 E.00727
G1 X85.724 Y95.307 E.01229
G1 X85.209 Y95.088 E.0172
G1 X84.84 Y94.931 E.01229
G3 X84.457 Y94.738 I5.608 J-11.631 E.01321
G1 X84.056 Y94.512 E.01415
G1 X83.708 Y94.314 E.01229
G1 X83.31 Y94.046 E.01473
G1 X82.978 Y93.823 E.01229
G3 X82.55 Y93.495 I6.616 J-9.09 E.01656
G1 F3000
G3 X81.91 Y92.941 I7.704 J-9.539 E.02603
G1 X81.524 Y92.565 E.01656
G1 F2880
G3 X80.544 Y91.426 I8.757 J-8.52 E.0462
G1 F2760
G3 X79.934 Y90.533 I14.144 J-10.315 E.03323
G1 F2640
G1 X79.771 Y90.262 E.00973
G1 F2520
G1 X79.729 Y90.173 E.00302
G1 F2400
G3 X79.712 Y89.881 I.493 J-.175 E.00911
G1 F2520
G3 X79.77 Y89.741 I.556 J.148 E.00468
G1 F2640
G1 X79.877 Y89.56 E.00646
G1 F2760
G3 X80.535 Y88.586 I10.808 J6.589 E.03611
G1 F2880
G3 X81.439 Y87.521 I11.841 J9.139 E.04294
G1 F3000
G3 X82.385 Y86.64 I11.171 J11.039 E.03974
G1 F3851
G1 X82.703 Y86.397 E.01229
G1 X83.157 Y86.049 E.01758
G1 X83.491 Y85.829 E.01229
G1 X83.71 Y85.685 E.00806
G1 X84.06 Y85.49 E.01229
G1 X84.635 Y85.169 E.02026
G1 X84.999 Y85.002 E.01229
G1 X85.319 Y84.861 E.01076
G3 X85.912 Y84.624 I6.224 J14.735 E.01961
G1 X86.293 Y84.501 E.01229
G1 X86.62 Y84.4 E.01052
G3 X87.231 Y84.238 I4.122 J14.27 E.01943
G1 X87.623 Y84.159 E.01229
G1 X87.847 Y84.119 E.00697
G3 X88.564 Y84.012 I2.794 J16.203 E.02228
G1 X88.962 Y83.981 E.01229
G1 X89.28 Y83.957 E.0098
G3 X90.19 Y83.948 I.578 J12.188 E.02798
G3 X90.688 Y83.973 I-.335 J11.461 E.01532
G1 X91.086 Y84.015 E.01229
G1 X95.12 Y84.442 E.12463
G1 X95.518 Y84.485 E.01229
G1 X98.658 Y84.822 E.09704
G1 X99.055 Y84.865 E.01229
G1 X102.394 Y85.223 E.10319
G1 X102.792 Y85.266 E.01229
G1 X102.887 Y85.282 E.00295
G1 X102.97 Y85.309 E.0027
G3 X103.242 Y85.514 I-.356 J.753 E.01054
G3 X103.309 Y85.623 I-.474 J.366 E.00391
G1 X103.344 Y85.711 E.00292
G1 X103.36 Y85.769 E.00185
G1 X103.373 Y85.842 E.00229
G1 X103.379 Y85.944 E.00311
G1 X103.379 Y89.479 E.10864
; WIPE_START
G1 F12000
M204 S6000
G1 X103.379 Y91.479 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.5 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z4.5
G1 X0 Y90.0001 F18000 ; move to safe pos
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
            G0 Z4.5 F4000
            G39.3 S1
            G0 Z4.5 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X102.922 Y91.245 F42000
G1 Z4.1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.103851
G1 F3851
M204 S6000
G2 X103.163 Y90.457 I-8.272 J-2.955 E.00409
M204 S10000
G1 X103.031 Y90.597 F42000
; LINE_WIDTH: 0.304754
G1 F3851
M204 S6000
G3 X103.053 Y90.864 I-3.14 J.387 E.00572
G1 X103.053 Y93.781 E.06223
G3 X103.04 Y93.951 I-2.119 J-.075 E.00365
; LINE_WIDTH: 0.353476
G3 X102.914 Y94.5 I-3.739 J-.568 E.01426
M204 S10000
G1 X102.776 Y94.36 F42000
; LINE_WIDTH: 0.383955
G1 F3851
M204 S6000
G1 X102.736 Y94.375 E.00121
; LINE_WIDTH: 0.353503
G1 X102.604 Y94.412 E.00346
; LINE_WIDTH: 0.320346
G3 X102.457 Y94.437 I-.542 J-2.718 E.00337
G1 X91.148 Y95.646 E.25713
G3 X87.453 Y95.448 I-1.272 J-10.849 E.08404
; WIPE_START
G1 F15000
G1 X87.661 Y95.503 E-.08168
G1 X88.414 Y95.627 E-.2898
G1 X89.305 Y95.706 E-.33997
G1 X89.432 Y95.707 E-.04855
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.606 Y92.932 Z4.5 F42000
G1 Z4.1
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3851
M204 S6000
G3 X82.385 Y91.858 I7.974 J-10.291 E.05398
G1 X85.873 Y88.37 E.16363
G1 X85.873 Y91.63 E.10813
G1 X82.386 Y88.143 E.16359
G3 X83.605 Y87.067 I8.686 J8.616 E.05399
M204 S10000
G1 X84.032 Y86.359 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38292
G1 F3851
M204 S6000
G2 X80.603 Y89.864 I5.764 J9.068 E.13705
; LINE_WIDTH: 0.396545
G1 X80.576 Y89.934 E.00215
; LINE_WIDTH: 0.416612
G1 X80.549 Y90.003 E.00227
G1 X80.704 Y90.309 E.01046
; LINE_WIDTH: 0.383827
G2 X84.168 Y93.729 I9.082 J-5.736 E.1364
; WIPE_START
G1 F12000
G1 X83.856 Y93.532 E-.14042
G1 X83.263 Y93.113 E-.27572
G1 X82.574 Y92.527 E-.34386
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.325 Y86.495 Z4.5 F42000
G1 Z4.1
G1 E.8 F1800
; LINE_WIDTH: 0.539
G1 F3851
M204 S6000
G1 X86.325 Y93.488 E.2827
; WIPE_START
G1 F12000
G1 X86.325 Y91.488 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.556 Y94.711 Z4.5 F42000
G1 Z4.1
G1 E.8 F1800
; LINE_WIDTH: 0.516285
G1 F3851
M204 S6000
G2 X86.551 Y93.736 I-35.428 J-.312 E.0376
G1 X86.385 Y93.662 E.00699
G1 X86.326 Y93.548 E.00494
G1 X86.292 Y93.786 E.00929
G1 X86.086 Y94.001 E.01147
G1 X86.063 Y94.539 E.02081
G1 X86.499 Y94.691 E.0178
; WIPE_START
G1 F12000
G1 X86.063 Y94.539 E-.17533
G1 X86.086 Y94.001 E-.20498
G1 X86.292 Y93.786 E-.11296
G1 X86.326 Y93.548 E-.09148
G1 X86.385 Y93.662 E-.04871
G1 X86.551 Y93.736 E-.0689
G1 X86.552 Y93.888 E-.05765
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.325 Y86.495 Z4.5 F42000
G1 Z4.1
G1 E.8 F1800
; LINE_WIDTH: 0.514943
G1 F3851
M204 S6000
G1 X86.387 Y86.34 E.00644
G1 X86.553 Y86.266 E.00698
G2 X86.554 Y85.299 I-183.326 J-.719 E.03719
G1 X86.066 Y85.47 E.0199
G1 X86.086 Y86 E.0204
G1 X86.29 Y86.215 E.0114
G1 X86.317 Y86.435 E.00856
; WIPE_START
G1 F12000
G1 X86.29 Y86.215 E-.08454
G1 X86.086 Y86 E-.1126
G1 X86.066 Y85.47 E-.20156
G1 X86.554 Y85.299 E-.19656
G1 X86.553 Y85.732 E-.16475
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.405 Y84.714 Z4.5 F42000
G1 Z4.1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.319701
G1 F3851
M204 S6000
G3 X87.688 Y84.491 I3.831 J4.595 E.00813
G3 X91.034 Y84.342 I2.17 J11.085 E.07582
G1 X102.459 Y85.563 E.25913
G3 X102.605 Y85.588 I-.392 J2.714 E.00335
; LINE_WIDTH: 0.353596
G1 X102.736 Y85.625 E.00344
; LINE_WIDTH: 0.384383
G1 X102.777 Y85.64 E.00121
; LINE_WIDTH: 0.421978
G3 X102.978 Y85.828 I-.127 J.337 E.00874
; LINE_WIDTH: 0.392842
G1 X103.02 Y85.946 E.00355
; LINE_WIDTH: 0.345295
G1 X103.043 Y86.08 E.00335
; LINE_WIDTH: 0.303624
G3 X103.052 Y86.212 I-1.173 J.147 E.00281
G1 X103.046 Y89.231 E.06414
G3 X103.183 Y89.528 I-3.45 J1.773 E.00696
; WIPE_START
G1 F15000
G1 X103.046 Y89.231 E-.12447
G1 X103.049 Y87.558 E-.63553
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.183 Y93.58 Z4.5 F42000
G1 Z4.1
G1 E.8 F1800
; LINE_WIDTH: 0.405713
G1 F3851
M204 S6000
G3 X102.986 Y94.159 I-6.446 J-1.874 E.01807
G1 X102.89 Y94.292 E.00486
G3 X102.776 Y94.36 I-.346 J-.45 E.0039
; WIPE_START
G1 F15000
G1 X102.89 Y94.292 E-.11039
G1 X102.986 Y94.159 E-.13763
G1 X103.183 Y93.58 E-.51198
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X96.634 Y89.66 Z4.5 F42000
G1 X93.928 Y88.041 Z4.5
G1 Z4.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3851
M204 S6000
G1 X93.928 Y91.959 E.12999
G1 X93.291 Y91.959 E.02114
G1 X93.291 Y88.041 E.12999
G1 X93.868 Y88.041 E.01915
M204 S10000
G1 X94.32 Y87.945 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3851
M204 S5000
G1 X97.971 Y87.945 E.11218
G1 X97.971 Y92.055 E.12626
G1 X94.32 Y92.055 E.11218
G1 X94.32 Y88.005 E.12441
; WIPE_START
G1 F12000
M204 S6000
G1 X96.32 Y87.973 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.899 Y92.557 Z4.5 F42000
G1 Z4.1
G1 E.8 F1800
G1 F3851
M204 S5000
G1 X92.899 Y87.443 E.15712
G1 X91.447 Y87.362 E.04468
G1 X91.483 Y86.722 E.01971
G1 X91.754 Y86.737 E.00836
G1 X91.747 Y86.875 E.00426
G1 X93.392 Y86.971 E.05063
G1 X93.403 Y87.649 E.02083
G1 X97.881 Y87.649 E.1376
G3 X98.268 Y88.037 I.003 J.384 E.01876
G1 X98.267 Y91.994 E.12161
G3 X97.911 Y92.35 I-.381 J-.025 E.01686
G1 X93.402 Y92.351 E.13856
G1 X93.402 Y93 E.01992
G1 X93.389 Y93.031 E.00103
G1 X91.747 Y93.125 E.05056
G1 X91.754 Y93.263 E.00426
G1 X91.483 Y93.278 E.00836
G1 X91.447 Y92.638 E.01971
G1 X92.839 Y92.56 E.04284
M204 S10000
G1 X93.15 Y92.156 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.154369
G1 F3851
M204 S6000
G1 X93.142 Y92.786 E.00573
G1 X91.657 Y92.878 E.01351
; WIPE_START
G1 F15000
G1 X93.142 Y92.786 E-.56534
G1 X93.149 Y92.274 E-.19466
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.61 Y91.756 Z4.5 F42000
G1 Z4.1
G1 E.8 F1800
; LINE_WIDTH: 0.27325
G1 F3851
M204 S6000
G1 X93.61 Y88.244 E.06591
M204 S10000
G1 X93.151 Y87.845 F42000
; LINE_WIDTH: 0.154427
G1 F3851
M204 S6000
G1 X93.141 Y87.213 E.00574
G1 X91.657 Y87.122 E.01351
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 4.3
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X93.141 Y87.213 E-.56511
G1 X93.149 Y87.726 E-.1949
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 22/111
; update layer progress
M73 L22
M991 S0 P21 ;notify layer change

; OBJECT_ID: 427
M204 S10000
G17
G3 Z4.5 I-.793 J-.923 P1  F42000
G1 X87.152 Y92.881 Z4.5
G1 Z4.3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4268
M204 S5000
G1 X87.152 Y87.119 E.17708
G1 X87.769 Y87.153 E.01897
G1 X87.803 Y86.512 E.01971
G1 X87.205 Y86.479 E.01839
G1 X87.205 Y85.239 E.03811
G3 X87.595 Y84.695 I.617 J.03 E.02174
G3 X89.307 Y84.465 I2.18 J9.735 E.05313
G3 X90.973 Y84.506 I.555 J11.399 E.05125
G1 X102.489 Y85.732 E.35588
G3 X102.892 Y86.18 I-.054 J.454 E.0202
G1 X102.89 Y89.161 E.09159
G3 X102.713 Y89.382 I-.285 J-.046 E.00912
G3 X102.716 Y90.616 I-.244 J.617 E.04866
G3 X102.891 Y90.827 I-.149 J.301 E.00867
G1 X102.892 Y93.816 E.09183
G3 X102.49 Y94.268 I-.467 J-.01 E.02025
G1 X91.037 Y95.488 E.3539
G3 X87.834 Y95.361 I-1.134 J-11.822 E.09878
G3 X87.207 Y94.811 I.017 J-.652 E.02779
G1 X87.205 Y93.521 E.03966
G1 X87.803 Y93.488 E.0184
G1 X87.769 Y92.847 E.01971
G1 X87.212 Y92.878 E.01713
M204 S10000
G1 X86.76 Y93.296 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4268
M204 S6000
G1 X86.813 Y93.293 E.00174
G1 X86.815 Y94.851 E.05169
G1 X86.855 Y95.045 E.00656
G1 X87.01 Y95.411 E.01318
G3 X79.896 Y89.993 I2.822 J-11.087 E.30477
G3 X87.029 Y84.585 I9.923 J5.68 E.3051
G1 X86.884 Y84.876 E.01079
G2 X86.813 Y85.22 I.818 J.347 E.01173
G1 X86.813 Y86.707 E.04932
G1 X86.76 Y86.704 E.00177
G1 X86.76 Y93.236 E.21668
; WIPE_START
G1 F15476.087
G1 X86.813 Y93.293 E-.02947
G1 X86.815 Y94.851 E-.59211
G1 X86.855 Y95.045 E-.07511
G1 X86.92 Y95.198 E-.06331
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.143 Y92.732 Z4.7 F42000
G1 X103.501 Y89.536 Z4.7
G1 Z4.3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4268
M204 S5000
G1 X103.501 Y93.512 E.12216
G1 X103.499 Y93.809 E.00913
G1 X103.497 Y94.209 E.01229
G1 F3000
G3 X103.492 Y94.278 I-.128 J.026 E.00214
G1 F2880
G1 X103.499 Y94.33 E.00161
G1 F2640
G1 X103.494 Y94.368 E.00118
G1 F2400
G1 X103.498 Y94.457 E.00275
G1 F2040
G1 X103.485 Y94.518 E.00193
G1 F1800
G1 X103.471 Y94.556 E.00124
M106 S201.45
M106 S255
G1 F1680
G1 X103.422 Y94.647 E.00317
M106 S201.45
M106 S255
G1 F1560
G3 X103.299 Y94.79 I-.627 J-.415 E.00582
M106 S201.45
M106 S255
G1 F1440
G3 X103.168 Y94.879 I-.511 J-.615 E.00487
M106 S201.45
M106 S255
G1 F1560
G3 X102.973 Y94.946 I-.331 J-.641 E.00636
M106 S201.45
M106 S255
G1 F1800
G1 X102.659 Y94.987 E.00973
M106 S201.45
M106 S255
G1 F1680
G3 X98.853 Y95.393 I-35.146 J-311.462 E.11761
M106 S201.45
M106 S255
G1 F1800
G1 X98.55 Y95.41 E.00932
M106 S201.45
M106 S255
G1 F1920
G1 X98.538 Y95.411 E.00036
G1 F2280
G1 X98.532 Y95.364 E.00145
G1 F2880
G1 X98.27 Y95.339 E.00809
G1 F3889.532
G1 X98.144 Y95.339 E.00386
G1 F4268
G1 X97.822 Y95.357 E.00991
M73 P50 R9
G1 X97.424 Y95.4 E.01229
G1 X91.45 Y96.039 E.18462
G3 X90.853 Y96.101 I-1.799 J-14.257 E.01844
G1 X90.378 Y96.128 E.01462
G1 X89.979 Y96.148 E.01229
G3 X89.157 Y96.13 I-.109 J-13.498 E.02525
G1 X88.742 Y96.101 E.01279
G3 X87.705 Y95.958 I1.223 J-12.67 E.03219
G1 X87.228 Y95.856 E.01498
G1 X86.837 Y95.77 E.01229
G1 X86.33 Y95.616 E.0163
G1 X85.947 Y95.501 E.01229
G3 X85.141 Y95.187 I4.391 J-12.473 E.02658
G1 X84.71 Y94.994 E.0145
G1 X84.229 Y94.739 E.01672
G1 X83.876 Y94.552 E.01229
G1 X83.565 Y94.358 E.01127
G1 X83.225 Y94.146 E.01229
G3 X82.692 Y93.763 I8.02 J-11.742 E.02018
G1 X82.316 Y93.47 E.01464
G1 F3900
G1 X82.067 Y93.253 E.01015
G1 X81.766 Y92.99 E.01229
G1 F3000
G3 X81.303 Y92.525 I11.626 J-12.049 E.02015
G1 X81.029 Y92.231 E.01236
G1 X80.762 Y91.933 E.01229
G1 F2880
G3 X80.061 Y91.009 I11.784 J-9.667 E.03565
G1 F2760
G3 X79.592 Y90.266 I11.279 J-7.639 E.02699
G1 F2640
G1 X79.549 Y90.176 E.00307
G1 F2520
G3 X79.521 Y90.072 I.461 J-.177 E.00333
G1 F2400
G3 X79.521 Y89.931 I.472 J-.072 E.00433
G1 F2520
G3 X79.573 Y89.768 I.587 J.099 E.00531
G1 F2760
G3 X79.991 Y89.094 I9.513 J5.435 E.02434
G1 F2880
G3 X80.869 Y87.94 I12.704 J8.757 E.04457
G1 F3000
G3 X81.835 Y86.946 I11.216 J9.932 E.04262
G1 F3900
G1 X82.138 Y86.684 E.01229
G1 X82.334 Y86.515 E.00795
G1 F4268
G1 X82.654 Y86.275 E.01229
G1 X83.123 Y85.924 E.01803
G1 X83.463 Y85.713 E.01229
G1 X84.054 Y85.346 E.02139
G1 X84.412 Y85.166 E.01229
G1 X84.93 Y84.904 E.01783
G1 X85.299 Y84.751 E.01229
G1 X85.633 Y84.617 E.01105
G3 X86.243 Y84.401 I5.372 J14.183 E.01989
G1 X86.63 Y84.298 E.01229
G1 X87.277 Y84.125 E.02058
G1 X87.67 Y84.05 E.01229
G1 X87.936 Y84.001 E.00831
G3 X88.941 Y83.883 I1.956 J12.266 E.03111
G1 X89.341 Y83.87 E.01229
G1 X89.901 Y83.851 E.01723
G1 X90.377 Y83.864 E.01464
G1 X90.678 Y83.883 E.00927
G1 X90.979 Y83.909 E.00927
G1 X91.376 Y83.952 E.01229
G1 X96.839 Y84.543 E.16882
G1 X97.425 Y84.603 E.01811
G1 X97.823 Y84.643 E.01229
G1 X98.144 Y84.661 E.00988
G1 F3862.534
G1 X98.266 Y84.66 E.00376
G1 F2880
G1 X98.57 Y84.635 E.00937
G1 F2160
G1 X98.568 Y84.59 E.0014
G1 F1920
G1 X98.581 Y84.59 E.0004
G1 F1800
G1 X98.768 Y84.6 E.00576
M106 S201.45
M106 S255
G1 F1680
G3 X102.994 Y85.058 I-19.358 J198.565 E.13061
M106 S201.45
M106 S255
G1 F1560
G3 X103.212 Y85.147 I-.174 J.738 E.00725
M106 S201.45
M106 S255
G1 F1440
G3 X103.323 Y85.232 I-.291 J.492 E.00432
M106 S201.45
M106 S255
G1 F1560
G3 X103.411 Y85.335 I-.478 J.5 E.00415
M106 S201.45
M106 S255
G1 F1680
G1 X103.437 Y85.376 E.00151
M106 S201.45
M106 S255
G1 F1800
G1 X103.478 Y85.461 E.00289
M106 S201.45
G1 F1920
G1 X103.493 Y85.519 E.00184
G1 F2160
G1 X103.495 Y85.575 E.00173
G1 F2280
G1 X103.496 Y85.579 E.00013
G1 F2400
G1 X103.492 Y85.621 E.0013
G1 F2640
G1 X103.499 Y85.652 E.00097
G1 F2880
G1 X103.495 Y85.742 E.00278
G1 F3000
G1 X103.496 Y85.78 E.00116
G1 F4268
G1 X103.499 Y86.18 E.01229
G1 X103.501 Y86.495 E.00968
G1 X103.501 Y89.476 E.0916
; WIPE_START
G1 F4800
M204 S6000
G1 X103.501 Y91.476 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.7 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z4.7
G1 X0 Y90.0001 F18000 ; move to safe pos
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
            G0 Z4.7 F4000
            G39.3 S1
            G0 Z4.7 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X103.166 Y90.503 F42000
G1 Z4.3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.261288
G1 F4268
M204 S6000
G1 X103.196 Y90.785 E.00504
G1 X103.193 Y93.917 E.05573
; LINE_WIDTH: 0.30876
G3 X103.175 Y94.073 I-1.833 J-.138 E.00339
G3 X103.019 Y94.729 I-5.974 J-1.074 E.01461
; WIPE_START
G1 F15000
G1 X103.175 Y94.073 E-.61693
G1 X103.193 Y93.917 E-.14307
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.305 Y93.691 Z4.7 F42000
G1 Z4.3
G1 E.8 F1800
; LINE_WIDTH: 0.372643
G1 F4268
M204 S6000
G1 X103.114 Y94.304 E.01725
; LINE_WIDTH: 0.42227
G1 X103.103 Y94.336 E.00104
; LINE_WIDTH: 0.4469
G1 X103.089 Y94.37 E.00122
; LINE_WIDTH: 0.484198
G3 X102.87 Y94.555 I-.295 J-.127 E.01069
; LINE_WIDTH: 0.428484
G3 X102.721 Y94.599 I-.553 J-1.596 E.00488
; LINE_WIDTH: 0.389283
G3 X102.133 Y94.676 I-.824 J-3.98 E.01676
G3 X98.78 Y95.031 I-18.091 J-154.968 E.09516
M204 S10000
G1 X98.721 Y95.204 F42000
; LINE_WIDTH: 0.114072
G1 F4268
M204 S6000
G1 X98.73 Y95.175 E.00018
; LINE_WIDTH: 0.162818
G1 X98.74 Y95.146 E.0003
; LINE_WIDTH: 0.211564
G1 X98.75 Y95.117 E.00042
; LINE_WIDTH: 0.26031
G1 X98.76 Y95.089 E.00054
; LINE_WIDTH: 0.309057
G1 X98.77 Y95.06 E.00066
; LINE_WIDTH: 0.357803
G1 X98.78 Y95.031 E.00078
; LINE_WIDTH: 0.370888
G1 X98.721 Y95.026 E.00159
; LINE_WIDTH: 0.33799
G1 X98.505 Y95.027 E.00518
; LINE_WIDTH: 0.293647
G1 X98.278 Y95.029 E.00463
; LINE_WIDTH: 0.24454
G1 X97.406 Y95.103 E.01439
G1 X91.065 Y95.783 E.10478
G3 X87.482 Y95.597 I-1.225 J-11.042 E.0592
; LINE_WIDTH: 0.256603
G3 X87.397 Y95.548 I.004 J-.105 E.00178
G1 X87.183 Y95.316 E.00549
M204 S10000
G1 X86.422 Y94.823 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.422625
G1 F4268
M204 S6000
G1 X86.421 Y94.062 E.02354
; LINE_WIDTH: 0.40369
G1 X86.439 Y93.909 E.00453
; LINE_WIDTH: 0.36605
G1 X86.458 Y93.756 E.00406
; LINE_WIDTH: 0.32841
G1 X86.476 Y93.603 E.00359
; LINE_WIDTH: 0.283528
G1 X86.437 Y93.511 E.00197
G1 X86.437 Y86.489 E.13768
G1 X86.477 Y86.315 E.0035
; LINE_WIDTH: 0.328364
G1 X86.458 Y86.189 E.00295
; LINE_WIDTH: 0.36585
G1 X86.439 Y86.063 E.00334
; LINE_WIDTH: 0.420928
G1 X86.42 Y85.938 E.00391
G2 X86.419 Y85.177 I-9.447 J-.363 E.02345
G1 X86.015 Y85.319 E.0132
G3 X86.041 Y86.019 I-8.146 J.661 E.02159
; LINE_WIDTH: 0.406185
G1 X86.113 Y86.11 E.00343
; LINE_WIDTH: 0.374395
G1 X86.185 Y86.201 E.00313
; LINE_WIDTH: 0.33963
G1 X86.191 Y86.345 E.00349
; LINE_WIDTH: 0.2834
G1 X86.197 Y93.511 E.14043
; LINE_WIDTH: 0.301965
G1 X86.191 Y93.656 E.00305
; LINE_WIDTH: 0.339855
G1 X86.185 Y93.8 E.00349
; LINE_WIDTH: 0.374728
G1 X86.113 Y93.891 E.00314
; LINE_WIDTH: 0.421114
G1 X86.041 Y93.981 E.00357
G1 X86.042 Y94.601 E.0191
G1 X86.012 Y94.684 E.00271
G1 X86.365 Y94.804 E.01149
; WIPE_START
G1 F12000
G1 X86.012 Y94.684 E-.23691
G1 X86.042 Y94.601 E-.05581
G1 X86.041 Y93.981 E-.3936
G1 X86.113 Y93.891 E-.07368
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.009 Y93.21 Z4.7 F42000
G1 Z4.3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.29195
G1 F4268
M204 S6000
G1 X87.59 Y93.178 E.01182
; WIPE_START
G1 F15000
G1 X87.009 Y93.21 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.237 Y90.715 Z4.7 F42000
G1 Z4.3
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4268
M204 S6000
G2 X82.284 Y91.959 I7.256 J-5.049 E.05403
G1 X85.873 Y88.37 E.16834
G1 X85.873 Y86.409 E.06504
G1 X85.648 Y86.185 E.01055
G1 X85.648 Y85.648 E.0178
G1 X85.477 Y85.477 E.00802
G2 X83.636 Y86.476 I6.617 J14.393 E.06953
G1 X83.823 Y86.74 E.01075
G2 X82.281 Y88.038 I6.541 J9.341 E.06694
G1 X85.873 Y91.63 E.16852
G1 X85.873 Y93.59 E.06503
G1 X85.648 Y93.816 E.01058
G1 X85.648 Y94.352 E.01778
G1 X85.475 Y94.525 E.0081
G3 X84.031 Y93.776 I5.991 J-13.326 E.05398
M204 S10000
G1 X83.344 Y93.321 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.385646
G1 F4268
M204 S6000
G3 X80.565 Y90.382 I6.385 J-8.825 E.11363
G1 X80.36 Y89.997 E.01219
G1 X80.626 Y89.519 E.01528
G3 X83.301 Y86.702 I9.235 J6.091 E.10905
; WIPE_START
G1 F15000
G1 X82.672 Y87.196 E-.304
G1 X82.001 Y87.824 E-.34934
G1 X81.81 Y88.029 E-.10666
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.59 Y86.822 Z4.7 F42000
G1 Z4.3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.291981
G1 F4268
M204 S6000
G1 X87.01 Y86.79 E.0118
; WIPE_START
G1 F15000
G1 X87.59 Y86.822 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.311 Y84.457 Z4.7 F42000
G1 Z4.3
G1 E.8 F1800
; LINE_WIDTH: 0.245528
G1 F4268
M204 S6000
G1 X87.482 Y84.403 E.00296
G3 X91 Y84.21 I2.361 J10.89 E.05842
G1 X97.405 Y84.897 E.10636
G1 X98.275 Y84.971 E.01441
; LINE_WIDTH: 0.2962
G1 X98.536 Y84.974 E.00538
; LINE_WIDTH: 0.34436
G1 X98.788 Y84.977 E.00619
; LINE_WIDTH: 0.375938
G1 X98.836 Y84.974 E.0013
M204 S10000
G1 X98.785 Y84.799 F42000
; LINE_WIDTH: 0.0957155
G1 F4268
M204 S6000
G1 X98.793 Y84.824 E.00011
; LINE_WIDTH: 0.140041
G1 X98.8 Y84.849 E.00021
; LINE_WIDTH: 0.184367
G1 X98.807 Y84.874 E.0003
; LINE_WIDTH: 0.228692
G1 X98.814 Y84.899 E.0004
; LINE_WIDTH: 0.273018
G1 X98.821 Y84.924 E.00049
; LINE_WIDTH: 0.317343
G1 X98.829 Y84.949 E.00058
; LINE_WIDTH: 0.361669
G1 X98.836 Y84.974 E.00068
; LINE_WIDTH: 0.389285
G3 X102.103 Y85.321 I-16.418 J170.498 E.09273
G3 X102.738 Y85.406 I-.287 J4.565 E.01811
; LINE_WIDTH: 0.432083
G1 X102.866 Y85.444 E.00423
; LINE_WIDTH: 0.484139
G3 X103.075 Y85.587 I-.135 J.422 E.00922
G1 X103.083 Y85.61 E.00089
; LINE_WIDTH: 0.425375
G2 X103.305 Y86.127 I3.394 J-1.153 E.01755
M204 S10000
G1 X102.98 Y85.257 F42000
; LINE_WIDTH: 0.379269
G1 F4268
M204 S6000
G2 X103.147 Y85.804 I10.908 J-3.03 E.0157
; LINE_WIDTH: 0.331499
G3 X103.169 Y85.903 I-.804 J.233 E.00238
; LINE_WIDTH: 0.2948
G3 X103.189 Y86.023 I-1.044 J.232 E.00249
; LINE_WIDTH: 0.262692
G1 X103.196 Y89.191 E.05673
G3 X103.154 Y89.48 I-1.935 J-.131 E.00525
; WIPE_START
G1 F15000
G1 X103.196 Y89.191 E-.11126
G1 X103.192 Y87.483 E-.64874
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.572 Y87.927 Z4.7 F42000
G1 X93.928 Y88.023 Z4.7
G1 Z4.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4268
M204 S6000
G1 X93.928 Y91.977 E.13115
G1 X93.296 Y91.977 E.02097
G1 X93.296 Y88.023 E.13115
G1 X93.868 Y88.023 E.01898
M204 S10000
G1 X94.32 Y87.945 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4268
M204 S5000
G1 X97.971 Y87.945 E.11218
G1 X97.971 Y92.055 E.12626
G1 X94.32 Y92.055 E.11218
G1 X94.32 Y88.005 E.12441
; WIPE_START
G1 F12000
M204 S6000
G1 X96.32 Y87.973 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.904 Y92.561 Z4.7 F42000
G1 Z4.3
G1 E.8 F1800
G1 F4268
M204 S5000
G1 X92.904 Y87.438 E.15742
G1 X91.452 Y87.357 E.04469
G1 X91.488 Y86.717 E.01971
G1 X91.76 Y86.732 E.00836
G1 X91.752 Y86.87 E.00426
G1 X93.395 Y86.964 E.05056
G1 X93.407 Y87.631 E.02049
G1 X97.902 Y87.631 E.1381
G3 X98.286 Y88.02 I.001 J.383 E.01868
G1 X98.286 Y91.981 E.12171
G3 X97.932 Y92.368 I-.387 J.001 E.01768
G1 X93.407 Y92.369 E.13905
G1 X93.407 Y93.005 E.01954
G1 X93.394 Y93.036 E.00103
G1 X91.752 Y93.13 E.05055
G1 X91.76 Y93.268 E.00426
G1 X91.488 Y93.283 E.00836
G1 X91.452 Y92.643 E.01971
G1 X92.844 Y92.565 E.04284
M204 S10000
G1 X93.156 Y92.173 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.154497
G1 F4268
M204 S6000
G1 X93.147 Y92.791 E.00562
G1 X91.662 Y92.883 E.01353
; WIPE_START
G1 F15000
G1 X93.147 Y92.791 E-.56531
G1 X93.154 Y92.279 E-.19469
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.612 Y91.773 Z4.7 F42000
G1 Z4.3
G1 E.8 F1800
; LINE_WIDTH: 0.26803
G1 F4268
M204 S6000
G1 X93.612 Y88.227 E.06506
M204 S10000
G1 X93.156 Y87.827 F42000
; LINE_WIDTH: 0.154362
G1 F4268
M204 S6000
G1 X93.147 Y87.209 E.00562
G1 X91.662 Y87.117 E.01351
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 4.5
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X93.147 Y87.209 E-.56535
G1 X93.154 Y87.721 E-.19465
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 23/111
; update layer progress
M73 L23
M991 S0 P22 ;notify layer change

; OBJECT_ID: 427
M204 S10000
G17
G3 Z4.7 I-.793 J-.923 P1  F42000
G1 X87.137 Y92.888 Z4.7
G1 Z4.5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3862
M204 S5000
G1 X87.137 Y87.112 E.17746
G1 X87.753 Y87.147 E.01897
G1 X87.787 Y86.506 E.01971
G1 X87.064 Y86.466 E.02225
G1 X87.064 Y85.163 E.04005
G3 X87.504 Y84.601 I.618 J.031 E.02335
G3 X89.53 Y84.358 I2.393 J11.363 E.06279
G3 X91.034 Y84.417 I.289 J11.707 E.0463
G1 X102.549 Y85.655 E.35585
G3 X102.956 Y86.117 I-.067 J.469 E.02058
G1 X102.954 Y89.16 E.0935
G3 X102.781 Y89.387 I-.33 J-.073 E.00904
G3 X102.781 Y90.613 I-.253 J.613 E.0481
G3 X102.954 Y90.84 I-.158 J.299 E.00903
G1 X102.956 Y93.883 E.0935
G3 X102.549 Y94.345 I-.49 J-.021 E.02044
G1 X91.034 Y95.583 E.35586
G3 X87.507 Y95.4 I-1.171 J-11.527 E.10894
G3 X87.066 Y94.888 I.162 J-.585 E.02203
G1 X87.064 Y93.534 E.0416
G1 X87.787 Y93.494 E.02226
G1 X87.753 Y92.853 E.01971
G1 X87.197 Y92.884 E.01713
M204 S10000
G1 X86.671 Y93.314 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3862
M204 S6000
G1 X86.674 Y94.928 E.05354
G1 X86.714 Y95.121 E.00656
G1 X86.863 Y95.471 E.01262
G3 X79.727 Y90.006 I2.91 J-11.192 E.30623
G3 X80.989 Y88.193 I8.545 J4.601 E.07346
G3 X86.867 Y84.528 I8.79 J7.553 E.23336
G1 X86.729 Y84.838 E.01125
G2 X86.672 Y85.143 I.824 J.313 E.01036
G1 X86.672 Y86.837 E.0562
G1 X86.745 Y86.841 E.0024
M73 P50 R8
G1 X86.745 Y93.159 E.20956
G1 X86.671 Y93.163 E.00244
G1 X86.671 Y93.254 E.00301
; WIPE_START
G1 F15476.087
G1 X86.674 Y94.928 E-.63615
G1 X86.714 Y95.121 E-.07518
G1 X86.764 Y95.239 E-.04867
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.994 Y92.793 Z4.9 F42000
G1 X103.631 Y89.533 Z4.9
G1 Z4.5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3862
M204 S5000
G1 X103.631 Y93.629 E.12584
G3 X103.626 Y94.298 I-4.47 J.3 E.02059
G1 X103.616 Y94.359 E.00189
G1 X103.601 Y94.421 E.00196
G1 X103.579 Y94.485 E.00208
G1 X103.554 Y94.543 E.00193
G1 X103.524 Y94.599 E.00195
G1 X103.491 Y94.649 E.00186
G1 X103.454 Y94.699 E.00191
G1 X103.417 Y94.74 E.00171
G1 X103.36 Y94.793 E.00239
G1 X103.333 Y94.814 E.00104
G1 X103.183 Y94.902 E.00535
G3 X102.977 Y94.967 I-.36 J-.785 E.00666
G2 X101.252 Y95.145 I15.425 J158.428 E.05329
G1 X99.483 Y95.351 E.05472
G1 X99.086 Y95.397 E.01229
G1 X98.689 Y95.443 E.01229
G1 X98.411 Y95.477 E.0086
G1 F2520
G1 X98.213 Y95.504 E.00615
G1 X97.816 Y95.556 E.01229
G1 F2160
G1 X97.423 Y95.608 E.01217
G1 F1920
G1 X96.829 Y95.687 E.01844
G1 F1800
G3 X96.203 Y95.754 I-1.227 J-8.593 E.01934
M106 S201.45
M106 S255
G1 F1920
G1 X96.074 Y95.757 E.00395
G1 F2160
G1 X96.072 Y95.738 E.00056
G1 F2760
G1 X95.873 Y95.686 E.00631
G1 F3446.188
G1 X95.785 Y95.677 E.00274
G1 F3862
G1 X95.581 Y95.681 E.00626
G1 X95.331 Y95.702 E.00771
G1 X94.934 Y95.745 E.01229
G1 X92.17 Y96.046 E.08542
G1 X91.772 Y96.089 E.01229
G1 X91.176 Y96.154 E.01844
G1 X90.77 Y96.194 E.01251
G3 X89.54 Y96.231 I-.994 J-12.463 E.03785
G1 X89.102 Y96.209 E.01347
G1 X88.702 Y96.187 E.01229
G3 X88.178 Y96.124 I1.75 J-16.674 E.01623
G1 X87.833 Y96.071 E.01072
G1 X87.438 Y96.006 E.01229
G3 X86.756 Y95.84 I4.015 J-17.984 E.02159
G1 X86.302 Y95.713 E.01448
G1 X85.919 Y95.598 E.01229
G1 X85.424 Y95.408 E.01628
G1 X85.051 Y95.265 E.01229
G1 X84.516 Y95.008 E.01823
G1 X84.155 Y94.836 E.01229
G3 X83.767 Y94.618 I6.896 J-12.714 E.01366
G1 X83.54 Y94.48 E.00816
G1 X83.2 Y94.269 E.01229
G1 X82.89 Y94.051 E.01165
G1 X82.563 Y93.82 E.01229
G1 X82.098 Y93.438 E.01851
G1 X81.789 Y93.184 E.01229
G1 X81.436 Y92.844 E.01505
G1 X81.149 Y92.566 E.01229
G1 F3000
G3 X80.63 Y91.99 I8.84 J-8.479 E.02381
G1 X80.465 Y91.785 E.0081
G1 X80.216 Y91.472 E.01229
G1 F2880
G3 X79.537 Y90.471 I12.258 J-9.042 E.03715
G1 F2760
G3 X79.376 Y90.183 I1.457 J-1.003 E.01017
G1 F2640
G1 X79.351 Y90.096 E.00278
G1 F2520
G3 X79.366 Y89.846 I.733 J-.081 E.00774
G1 F2640
G1 X79.39 Y89.784 E.00204
G1 F2760
G3 X79.529 Y89.543 I2.017 J1.005 E.00855
G1 F2880
G3 X80.011 Y88.808 I11.496 J7.014 E.02701
G1 F3000
G3 X81.139 Y87.444 I10.175 J7.263 E.05443
G1 F3862
G1 X81.423 Y87.163 E.01229
G1 X81.614 Y86.976 E.0082
G1 X81.919 Y86.717 E.01229
G1 X82.463 Y86.256 E.02193
G1 X82.791 Y86.027 E.01229
G1 X83.375 Y85.618 E.0219
G1 X83.719 Y85.414 E.01229
G1 X83.948 Y85.277 E.0082
G1 X84.303 Y85.092 E.01229
G1 X84.539 Y84.974 E.00811
G3 X85.141 Y84.697 I6.89 J14.163 E.02036
G1 X85.516 Y84.56 E.01229
G1 X86.17 Y84.32 E.02138
G1 X86.556 Y84.216 E.01229
G1 X87.166 Y84.052 E.01943
G1 X87.559 Y83.976 E.01229
G1 X87.851 Y83.924 E.0091
G3 X88.483 Y83.834 I2.478 J15.188 E.01961
G1 X88.881 Y83.804 E.01229
G1 X89.218 Y83.779 E.01036
G3 X90.048 Y83.768 I.583 J12.579 E.02553
G3 X90.965 Y83.824 I-.361 J13.415 E.02821
G1 X91.362 Y83.867 E.01229
G1 X94.666 Y84.225 E.10211
G1 X95.064 Y84.268 E.01229
G1 X95.461 Y84.311 E.01229
G1 X95.688 Y84.323 E.00696
G1 X95.785 Y84.322 E.003
G1 F3322.37
G1 X95.875 Y84.315 E.00278
G1 F2640
G1 X96.096 Y84.254 E.00703
G1 F2040
G1 X96.096 Y84.244 E.00032
G1 F1920
G1 X96.201 Y84.246 E.00322
G1 F1800
G3 X96.829 Y84.313 I-.536 J8.064 E.01944
M106 S201.45
G1 F1920
G1 X97.424 Y84.392 E.01844
G1 F2160
G1 X97.633 Y84.42 E.00648
G1 F2280
G1 X98.228 Y84.499 E.01844
G1 F3862
G1 X98.676 Y84.554 E.01388
G1 X99.074 Y84.599 E.01229
G1 X99.471 Y84.645 E.01229
G1 X103.074 Y85.054 E.11141
G3 X103.171 Y85.094 I-.373 J1.043 E.00323
G1 X103.338 Y85.191 E.00595
G1 X103.36 Y85.207 E.00084
G1 X103.416 Y85.26 E.00236
G1 X103.461 Y85.311 E.0021
G1 X103.507 Y85.374 E.00239
G1 X103.551 Y85.451 E.0027
G1 X103.585 Y85.53 E.00264
G1 X103.61 Y85.612 E.00266
G1 X103.626 Y85.703 E.00283
G3 X103.631 Y86.375 I-4.688 J.372 E.02067
G1 X103.631 Y89.473 E.0952
; WIPE_START
G1 F3900
M204 S6000
G1 X103.631 Y91.473 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.9 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z4.9
G1 X0 Y90.0001 F18000 ; move to safe pos
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
            G0 Z4.9 F4000
            G39.3 S1
            G0 Z4.9 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X103.15 Y91.125 F42000
G1 Z4.5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.252277
G1 F3862
M204 S6000
G1 X103.435 Y90.197 E.01656
M204 S10000
G1 X103.435 Y89.852 F42000
; LINE_WIDTH: 0.206444
G1 F3862
M204 S6000
G1 X103.15 Y88.775 E.01485
M204 S10000
G1 X103.296 Y89.361 F42000
; LINE_WIDTH: 0.31165
G1 F3862
M204 S6000
G1 X103.435 Y89.749 E.00902
M204 S10000
G1 X103.296 Y89.361 F42000
; LINE_WIDTH: 0.32822
G1 F3862
M204 S6000
G3 X103.292 Y89.19 I.321 J-.093 E.00403
G1 X103.293 Y86.093 E.072
G2 X103.283 Y85.933 I-1.456 J.011 E.00371
; LINE_WIDTH: 0.371248
G1 X103.258 Y85.783 E.00408
; LINE_WIDTH: 0.426534
G1 X103.248 Y85.743 E.00129
G2 X103.173 Y85.589 I-.71 J.248 E.00536
; LINE_WIDTH: 0.438361
G1 X103.129 Y85.538 E.0022
G2 X102.973 Y85.423 I-.399 J.378 E.00626
; LINE_WIDTH: 0.400144
G1 X102.908 Y85.396 E.00206
; LINE_WIDTH: 0.362486
G1 X102.771 Y85.357 E.00371
; LINE_WIDTH: 0.316541
G2 X102.595 Y85.327 I-.683 J3.478 E.00398
G1 X98.183 Y84.84 E.09897
; LINE_WIDTH: 0.362632
G2 X96.171 Y84.607 I-7.298 J54.253 E.05277
; LINE_WIDTH: 0.350082
G1 X96.056 Y84.617 E.00288
; LINE_WIDTH: 0.303184
G3 X95.919 Y84.627 I-.177 J-1.48 E.00292
; LINE_WIDTH: 0.238753
G1 X95.435 Y84.599 E.00773
G1 X91.063 Y84.128 E.07017
G2 X87.292 Y84.347 I-1.243 J11.185 E.06057
G2 X87.053 Y84.594 I2.586 J2.74 E.0055
; WIPE_START
G1 F15000
G1 X87.292 Y84.347 E-.13082
G1 X87.591 Y84.273 E-.11703
G1 X88.207 Y84.171 E-.23731
G1 X88.927 Y84.103 E-.27484
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.941 Y86.78 Z4.9 F42000
G1 Z4.5
G1 E.8 F1800
; LINE_WIDTH: 0.2921
G1 F3862
M204 S6000
G1 X87.574 Y86.816 E.01289
; WIPE_START
G1 F15000
G1 X86.941 Y86.78 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.477 Y87.197 Z4.9 F42000
G1 Z4.5
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.384359
G1 F3862
M204 S6000
G2 X80.23 Y89.869 I7.2 J8.334 E.09754
G1 X80.179 Y89.997 E.00382
G2 X81.006 Y91.266 I6.927 J-3.609 E.04224
G2 X82.541 Y92.857 I8.661 J-6.823 E.06159
; WIPE_START
G1 F15000
G1 X82.128 Y92.494 E-.20857
G1 X81.683 Y92.05 E-.2392
G1 X81.146 Y91.428 E-.31223
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.953 Y93.862 Z4.9 F42000
G1 Z4.5
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3862
M204 S6000
G2 X85.403 Y94.597 I4.844 J-7.767 E.05401
G1 X86.324 Y93.676 E.04319
G1 X86.322 Y92.833 E.02797
G1 X86.396 Y92.829 E.00245
G1 X86.396 Y92.153 E.02241
G1 X82.188 Y87.945 E.19743
G3 X82.952 Y87.233 I5.138 J4.746 E.03467
M73 P51 R8
G1 X82.748 Y86.99 E.01052
G3 X85.401 Y85.401 I6.284 J7.483 E.10303
G1 X86.324 Y86.324 E.0433
G1 X86.396 Y87.847 E.05057
G1 X82.181 Y92.062 E.19775
G3 X81.122 Y90.827 I13.435 J-12.592 E.05398
; WIPE_START
G1 F15476.087
G1 X82.181 Y92.062 E-.61815
G1 X82.445 Y91.798 E-.14186
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.941 Y93.22 Z4.9 F42000
G1 Z4.5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.292105
G1 F3862
M204 S6000
G1 X87.574 Y93.184 E.01289
; WIPE_START
G1 F15000
G1 X86.941 Y93.22 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.047 Y95.403 Z4.9 F42000
G1 Z4.5
G1 E.8 F1800
; LINE_WIDTH: 0.261454
G1 F3862
M204 S6000
G2 X87.281 Y95.65 I2.777 J-2.397 E.00606
G1 X87.413 Y95.689 E.00246
; LINE_WIDTH: 0.237104
G2 X91.061 Y95.873 I2.396 J-11.299 E.05805
G2 X95.302 Y95.414 I-42.143 J-409.958 E.0675
G1 X95.563 Y95.389 E.00414
; LINE_WIDTH: 0.252927
G1 X95.919 Y95.374 E.0061
; LINE_WIDTH: 0.303878
G1 X96.057 Y95.384 E.00293
; LINE_WIDTH: 0.350356
G1 X96.174 Y95.393 E.00295
; LINE_WIDTH: 0.360733
G2 X98.367 Y95.138 I-5.962 J-60.962 E.05716
; LINE_WIDTH: 0.31504
G3 X102.61 Y94.671 I37.755 J323.461 E.09467
; LINE_WIDTH: 0.33309
G2 X102.845 Y94.622 I-.13 J-1.211 E.00567
; LINE_WIDTH: 0.377484
G1 X102.918 Y94.601 E.00208
; LINE_WIDTH: 0.397505
G1 X102.958 Y94.585 E.00123
; LINE_WIDTH: 0.435333
G2 X103.171 Y94.412 I-.201 J-.466 E.00888
G1 X103.244 Y94.266 E.00523
; LINE_WIDTH: 0.393177
G1 X103.27 Y94.149 E.00341
; LINE_WIDTH: 0.328904
G2 X103.293 Y93.907 I-2.049 J-.313 E.00567
G1 X103.292 Y90.81 E.07217
G2 X103.277 Y90.688 I-.842 J.041 E.00288
G1 X103.262 Y90.685 E.00037
; LINE_WIDTH: 0.316021
G1 X103.246 Y90.682 E.00036
; LINE_WIDTH: 0.285438
G1 X103.227 Y90.677 E.00038
; LINE_WIDTH: 0.252472
G1 X103.209 Y90.673 E.00033
; LINE_WIDTH: 0.217221
G1 X103.187 Y90.666 E.00032
; LINE_WIDTH: 0.179681
G1 X103.166 Y90.66 E.00025
; LINE_WIDTH: 0.141744
G1 X103.094 Y90.644 E.00059
; WIPE_START
G1 F15000
G1 X103.166 Y90.66 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.83 Y88.553 Z4.9 F42000
G1 X93.924 Y88.006 Z4.9
G1 Z4.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3862
M204 S6000
G1 X93.928 Y88.006 E.00015
G1 X93.928 Y91.994 E.13231
G1 X93.301 Y91.994 E.0208
G1 X93.301 Y88.006 E.13231
G1 X93.864 Y88.006 E.01865
M204 S10000
G1 X94.32 Y87.945 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3862
M204 S5000
G1 X97.971 Y87.945 E.11218
G1 X97.971 Y92.055 E.12626
G1 X94.32 Y92.055 E.11218
G1 X94.32 Y88.005 E.12441
; WIPE_START
G1 F12000
M204 S6000
G1 X96.32 Y87.973 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.909 Y92.567 Z4.9 F42000
G1 Z4.5
G1 E.8 F1800
G1 F3862
M204 S5000
G1 X92.909 Y87.433 E.15773
G1 X91.457 Y87.352 E.04469
G1 X91.493 Y86.712 E.01971
G1 X91.765 Y86.727 E.00836
G1 X91.757 Y86.865 E.00426
G1 X93.4 Y86.96 E.05057
G1 X93.412 Y87.614 E.0201
G1 X97.919 Y87.614 E.13847
G3 X98.303 Y88.002 I-.008 J.392 E.01857
G1 X98.303 Y92.002 E.12289
G3 X97.95 Y92.385 I-.388 J-.003 E.01757
G1 X93.412 Y92.386 E.13943
G1 X93.412 Y93.01 E.01915
G1 X93.399 Y93.041 E.00103
G1 X91.757 Y93.135 E.05055
G1 X91.765 Y93.273 E.00426
G1 X91.493 Y93.288 E.00836
G1 X91.457 Y92.648 E.01971
G1 X92.849 Y92.57 E.04284
M204 S10000
G1 X93.161 Y92.191 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.15435
G1 F3862
M204 S6000
G1 X93.152 Y92.796 E.0055
G1 X91.667 Y92.888 E.01351
; WIPE_START
G1 F15000
G1 X93.152 Y92.796 E-.56535
G1 X93.159 Y92.284 E-.19466
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.615 Y91.791 Z4.9 F42000
G1 Z4.5
G1 E.8 F1800
; LINE_WIDTH: 0.26279
G1 F3862
M204 S6000
G1 X93.615 Y88.209 E.06417
M204 S10000
G1 X93.161 Y87.81 F42000
; LINE_WIDTH: 0.154345
G1 F3862
M204 S6000
G1 X93.152 Y87.204 E.0055
G1 X91.667 Y87.112 E.01351
; CHANGE_LAYER
; Z_HEIGHT: 4.7
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X93.152 Y87.204 E-.56535
G1 X93.159 Y87.716 E-.19465
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 24/111
; update layer progress
M73 L24
M991 S0 P23 ;notify layer change

; OBJECT_ID: 427
M204 S10000
G17
G3 Z4.9 I-.792 J-.924 P1  F42000
G1 X87.121 Y92.894 Z4.9
G1 Z4.7
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3731
M204 S5000
G1 X87.121 Y87.527 E.16491
G1 X87.121 Y87.106 E.01293
G1 X87.737 Y87.141 E.01897
G1 X87.772 Y86.5 E.01971
G1 X87.498 Y86.485 E.00843
G1 X87.49 Y86.623 E.00425
G1 X86.923 Y86.591 E.01746
G1 X86.923 Y85.093 E.04605
G3 X87.361 Y84.53 I.627 J.035 E.02331
G3 X89.495 Y84.267 I2.519 J11.668 E.06616
G3 X91.025 Y84.328 I.286 J12.015 E.04708
G1 X102.605 Y85.582 E.3579
G3 X103.012 Y86.045 I-.068 J.471 E.02061
G1 X103.011 Y89.171 E.09605
G3 X102.836 Y89.385 I-.426 J-.169 E.00863
G3 X102.838 Y90.614 I-.249 J.615 E.04828
G3 X103.011 Y90.829 I-.135 J.286 E.00877
G1 X103.012 Y93.949 E.09588
G3 X102.605 Y94.418 I-.49 J-.014 E.02066
G1 X91.024 Y95.672 E.35792
G3 X87.365 Y95.472 I-1.212 J-11.41 E.11307
G3 X86.925 Y94.958 I.216 J-.631 E.02184
G1 X86.923 Y93.409 E.04759
G1 X87.49 Y93.377 E.01747
G1 X87.498 Y93.515 E.00425
G1 X87.772 Y93.5 E.00843
G1 X87.737 Y92.859 E.01971
G1 X87.181 Y92.89 E.01712
M204 S10000
G1 X86.531 Y93.32 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3731
M204 S6000
G1 X86.533 Y94.997 E.05564
G1 X86.573 Y95.194 E.00666
G1 X86.718 Y95.528 E.01207
G3 X79.562 Y90.023 I3.03 J-11.342 E.30741
G1 X79.575 Y89.951 E.0024
G3 X86.721 Y84.466 I10.221 J5.917 E.30661
G1 X86.579 Y84.792 E.0118
G2 X86.531 Y85.074 I.88 J.295 E.00952
G1 X86.531 Y86.962 E.06265
G1 X86.729 Y86.973 E.00658
G1 X86.729 Y93.027 E.20081
G1 X86.53 Y93.038 E.0066
G1 X86.531 Y93.26 E.00736
; WIPE_START
G1 F15476.087
G1 X86.533 Y94.997 E-.66019
G1 X86.573 Y95.194 E-.07633
G1 X86.597 Y95.251 E-.02348
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.833 Y92.821 Z5.1 F42000
G1 X103.631 Y89.531 Z5.1
G1 Z4.7
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3731
M204 S5000
G1 X103.631 Y94.228 E.14434
G3 X102.983 Y94.966 I-.776 J-.027 E.03268
G2 X97.98 Y95.534 I14.769 J152.473 E.15473
G1 X96.839 Y95.689 E.03538
G1 X96.443 Y95.744 E.01229
G1 X96.046 Y95.798 E.01229
G1 X95.811 Y95.831 E.0073
G1 F2160
G1 X95.225 Y95.918 E.01821
G1 X94.829 Y95.976 E.01229
G1 F1920
G1 X94.715 Y95.989 E.00353
G1 F2040
G3 X94.437 Y96.006 I-.295 J-2.545 E.00857
G1 F2160
G1 X94.414 Y96.005 E.00071
G1 F2280
G1 X94.402 Y95.986 E.0007
G1 F2760
G1 X94.288 Y95.941 E.00375
G1 F3438.171
G1 X94.201 Y95.928 E.00271
G1 F3731
G1 X94.032 Y95.926 E.0052
G1 X93.822 Y95.943 E.00646
G1 X93.425 Y95.986 E.01229
G1 X91.549 Y96.19 E.05799
G3 X90.647 Y96.282 I-2.63 J-21.38 E.02784
G3 X89.923 Y96.309 I-.947 J-15.903 E.02226
G1 X89.482 Y96.306 E.01358
G1 X89.082 Y96.298 E.01229
G1 X88.871 Y96.285 E.00648
G1 X88.553 Y96.258 E.00982
G3 X87.914 Y96.176 I1.456 J-13.814 E.01981
G1 X87.558 Y96.113 E.0111
G1 X87.165 Y96.04 E.01229
G1 X86.597 Y95.892 E.01803
G1 X86.21 Y95.791 E.01229
G1 X85.75 Y95.633 E.01495
G1 X85.372 Y95.503 E.01229
G3 X84.892 Y95.3 I6.293 J-15.595 E.01601
G1 X84.512 Y95.125 E.01286
G1 X84.151 Y94.952 E.01229
G3 X83.593 Y94.641 I6.965 J-13.116 E.01963
G1 X83.178 Y94.388 E.01492
G1 X82.704 Y94.055 E.0178
G1 X82.377 Y93.825 E.01229
G1 X81.878 Y93.408 E.01999
G1 X81.571 Y93.152 E.01229
G1 X81.213 Y92.801 E.01542
G1 X80.927 Y92.52 E.01229
G3 X80.551 Y92.103 I9.215 J-8.684 E.01726
G1 F3000
G3 X80.063 Y91.49 I10.97 J-9.239 E.02409
G1 X79.778 Y91.089 E.01512
G1 X79.549 Y90.761 E.01229
G1 F2880
G3 X79.251 Y90.274 I9.782 J-6.32 E.01754
G1 F2760
G3 X79.207 Y90.182 I.538 J-.315 E.00313
G1 F2640
G3 X79.208 Y89.813 I.54 J-.182 E.01154
G1 F2760
G1 X79.233 Y89.759 E.00185
G1 F2880
G1 X79.421 Y89.442 E.01133
G1 F3000
G3 X80.396 Y88.081 I13.936 J8.961 E.05146
G1 F3731
G1 X80.664 Y87.784 E.01229
G1 X81.073 Y87.328 E.0188
G1 X81.36 Y87.051 E.01229
G1 X81.559 Y86.858 E.0085
G1 X81.866 Y86.601 E.01229
G1 X82.337 Y86.205 E.01891
G1 X82.66 Y85.97 E.01229
G1 X82.885 Y85.807 E.00852
G1 X83.222 Y85.592 E.01229
G1 X83.553 Y85.386 E.01198
G3 X84.138 Y85.054 I8.158 J13.699 E.02069
G1 X84.501 Y84.884 E.01229
G1 X85.051 Y84.626 E.01868
G1 X85.424 Y84.482 E.01229
G1 X85.673 Y84.387 E.0082
G3 X86.094 Y84.245 I4.453 J12.491 E.01366
G1 X86.479 Y84.135 E.01229
G1 X86.73 Y84.067 E.00799
G3 X87.369 Y83.917 I4.011 J15.627 E.02015
G1 X87.763 Y83.852 E.01229
G1 X88.117 Y83.797 E.01099
G3 X88.755 Y83.724 I2.114 J15.562 E.01975
G1 X89.155 Y83.704 E.01229
G1 X89.496 Y83.692 E.01049
G3 X90.019 Y83.687 I.41 J17.912 E.01607
G3 X90.842 Y83.734 I-.362 J13.583 E.02534
G1 X93.134 Y83.981 E.07083
G1 X93.531 Y84.024 E.01229
G1 X93.929 Y84.067 E.01229
G1 X94.12 Y84.075 E.00587
G1 X94.205 Y84.071 E.00261
G1 F3472.224
G1 X94.28 Y84.06 E.00233
G1 F2880
G1 X94.397 Y84.022 E.00378
G1 F2400
G1 X94.413 Y83.996 E.00092
G1 F2160
G1 X94.513 Y83.995 E.00308
G1 F2040
G3 X94.956 Y84.042 I-.205 J4.079 E.01369
G1 F2280
G1 X96.017 Y84.198 E.03295
G1 F2541.434
G1 X96.055 Y84.204 E.00118
G1 F3731
G1 X96.451 Y84.256 E.01229
G1 X96.848 Y84.309 E.01229
G1 X97.244 Y84.362 E.01229
G1 X98.993 Y84.591 E.05418
G2 X103.073 Y85.054 I23.898 J-192.567 E.12619
G3 X103.631 Y85.779 I-.23 J.754 E.03
G1 X103.631 Y89.471 E.11343
; WIPE_START
G1 F12000
M204 S6000
G1 X103.631 Y91.471 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.1 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z5.1
G1 X0 Y90.0001 F18000 ; move to safe pos
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
            G0 Z5.1 F4000
            G39.3 S1
            G0 Z5.1 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X103.207 Y91.025 F42000
G1 Z4.7
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.188302
G1 F3731
M204 S6000
G1 X103.426 Y90.313 E.00883
M204 S10000
G1 X103.291 Y90.494 F42000
; LINE_WIDTH: 0.271988
G1 F3731
M204 S6000
G1 X103.321 Y90.789 E.00554
G3 X103.322 Y93.96 I-129.194 J1.617 E.05919
G1 X103.32 Y94.034 E.00138
G3 X103.299 Y94.218 I-7.213 J-.708 E.00346
; LINE_WIDTH: 0.343049
G3 X102.966 Y94.631 I-.548 J-.1 E.01352
; LINE_WIDTH: 0.304906
G1 X102.932 Y94.645 E.00079
; LINE_WIDTH: 0.274463
G3 X102.785 Y94.685 I-.427 J-1.282 E.00287
; LINE_WIDTH: 0.23626
G1 X102.658 Y94.705 E.00202
G2 X97.94 Y95.23 I32.342 J312.23 E.07479
; LINE_WIDTH: 0.272943
G1 X97.02 Y95.341 E.01737
; LINE_WIDTH: 0.304607
G1 X95.763 Y95.498 E.02701
; LINE_WIDTH: 0.347639
G3 X94.513 Y95.65 I-3.039 J-19.8 E.03127
M204 S10000
G1 X94.386 Y95.632 F42000
; LINE_WIDTH: 0.271829
G1 F3731
M204 S6000
G2 X94.217 Y95.628 I-.169 J3.362 E.00314
; LINE_WIDTH: 0.229218
G1 X93.795 Y95.659 E.00643
G1 X91.051 Y95.957 E.0419
G3 X87.227 Y95.744 I-1.27 J-11.612 E.0584
; LINE_WIDTH: 0.25403
G3 X87.125 Y95.702 I-.01 J-.122 E.00198
G1 X86.908 Y95.473 E.00543
; WIPE_START
G1 F15000
G1 X87.125 Y95.702 E-.56241
G1 X87.227 Y95.744 E-.19759
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.925 Y93.157 Z5.1 F42000
G1 Z4.7
G1 E.8 F1800
; LINE_WIDTH: 0.153991
G1 F3731
M204 S6000
G1 X87.555 Y93.122 E.00571
; WIPE_START
G1 F15000
G1 X86.925 Y93.157 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.555 Y86.878 Z5.1 F42000
G1 Z4.7
G1 E.8 F1800
; LINE_WIDTH: 0.154036
G1 F3731
M204 S6000
G1 X86.925 Y86.843 E.00571
; WIPE_START
G1 F15000
G1 X87.555 Y86.878 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.912 Y84.519 Z5.1 F42000
G1 Z4.7
G1 E.8 F1800
; LINE_WIDTH: 0.231021
G1 F3731
M204 S6000
G1 X87.133 Y84.29 E.00486
G3 X90.435 Y83.992 I2.57 J10.033 E.05104
G1 X90.586 Y84.002 E.00233
G3 X93.911 Y84.353 I-8.151 J93.192 E.05124
G1 X94.229 Y84.372 E.00488
; LINE_WIDTH: 0.270558
G1 X94.363 Y84.368 E.00249
M204 S10000
G1 X94.529 Y84.351 F42000
; LINE_WIDTH: 0.344271
G1 F3731
M204 S6000
G3 X95.969 Y84.528 I-3.125 J31.42 E.03563
; LINE_WIDTH: 0.299958
G1 X97.094 Y84.668 E.02374
; LINE_WIDTH: 0.272944
G1 X97.841 Y84.758 E.01411
; LINE_WIDTH: 0.236665
G1 X102.647 Y85.293 E.07635
; LINE_WIDTH: 0.252828
G1 X102.887 Y85.341 E.00419
; LINE_WIDTH: 0.301868
G1 X102.985 Y85.377 E.00218
; LINE_WIDTH: 0.343665
G3 X103.159 Y85.503 I-.234 J.508 E.00532
G1 X103.254 Y85.645 E.00419
G1 X103.299 Y85.791 E.00372
; LINE_WIDTH: 0.271883
G3 X103.321 Y86.023 I-1.243 J.236 E.00436
G1 X103.321 Y89.21 E.05948
G1 X103.291 Y89.51 E.00561
M204 S10000
G1 X103.419 Y89.689 F42000
; LINE_WIDTH: 0.144163
G1 F3731
M204 S6000
G1 X103.207 Y88.887 E.00684
M204 S10000
G1 X103.207 Y89.039 F42000
; LINE_WIDTH: 0.245713
G1 F3731
M204 S6000
G1 X103.435 Y89.677 E.0112
; WIPE_START
G1 F15000
G1 X103.207 Y89.039 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.609 Y89.764 Z5.1 F42000
G1 X80.767 Y91.18 Z5.1
G1 Z4.7
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3731
M204 S6000
G2 X81.848 Y92.395 I8.012 J-6.041 E.05401
G1 X86.381 Y87.862 E.21263
G1 X86.381 Y87.303 E.01857
G1 X86.183 Y87.292 E.00658
G1 X86.183 Y86.183 E.03678
G1 X85.324 Y85.324 E.04026
G2 X81.85 Y87.607 I5.387 J11.987 E.13848
G1 X86.381 Y92.138 E.21255
G1 X86.381 Y92.697 E.01857
G1 X86.182 Y92.708 E.00661
G1 X86.183 Y93.817 E.03677
G1 X85.324 Y94.676 E.04027
G3 X83.874 Y93.94 I3.481 J-8.656 E.05401
; WIPE_START
G1 F15476.087
G1 X85.324 Y94.676 E-.61793
G1 X85.589 Y94.411 E-.14208
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.635 Y89.753 Z5.1 F42000
G1 X93.926 Y87.988 Z5.1
G1 Z4.7
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3731
M204 S6000
G1 X93.928 Y87.988 E.00008
G1 X93.928 Y92.012 E.13347
G1 X93.307 Y92.012 E.02062
G1 X93.307 Y87.988 E.13347
G1 X93.866 Y87.988 E.01855
M204 S10000
G1 X94.32 Y87.945 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3731
M204 S5000
G1 X97.971 Y87.945 E.11218
G1 X97.971 Y92.055 E.12626
G1 X94.32 Y92.055 E.11218
G1 X94.32 Y88.005 E.12441
; WIPE_START
G1 F12000
M204 S6000
G1 X96.32 Y87.973 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.914 Y92.572 Z5.1 F42000
G1 Z4.7
G1 E.8 F1800
G1 F3731
M204 S5000
G1 X92.915 Y87.429 E.15803
G1 X91.462 Y87.347 E.04469
G1 X91.498 Y86.707 E.01971
G1 X91.77 Y86.722 E.00836
G1 X91.762 Y86.86 E.00426
G1 X93.405 Y86.955 E.05057
G1 X93.418 Y87.596 E.01972
G1 X97.939 Y87.596 E.13894
G3 X98.321 Y87.985 I-.011 J.392 E.01846
G1 X98.321 Y92.019 E.12396
G3 X97.967 Y92.403 I-.388 J-.003 E.01756
G1 X93.418 Y92.404 E.1398
G1 X93.418 Y93.015 E.01876
G1 X93.404 Y93.046 E.00104
G1 X91.762 Y93.14 E.05054
G1 X91.77 Y93.278 E.00426
G1 X91.498 Y93.293 E.00836
G1 X91.462 Y92.653 E.01971
G1 X92.855 Y92.575 E.04284
M204 S10000
G1 X93.166 Y92.208 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.154374
G1 F3731
M204 S6000
G1 X93.157 Y92.801 E.00539
G1 X91.672 Y92.893 E.01351
; WIPE_START
G1 F15000
G1 X93.157 Y92.801 E-.56535
G1 X93.165 Y92.289 E-.19465
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.617 Y91.808 Z5.1 F42000
G1 Z4.7
G1 E.8 F1800
; LINE_WIDTH: 0.257455
G1 F3731
M204 S6000
G1 X93.617 Y88.192 E.06322
M204 S10000
G1 X93.166 Y87.792 F42000
; LINE_WIDTH: 0.154347
G1 F3731
M204 S6000
G1 X93.157 Y87.199 E.00539
G1 X91.672 Y87.107 E.01351
; CHANGE_LAYER
; Z_HEIGHT: 4.9
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X93.157 Y87.199 E-.56536
G1 X93.165 Y87.711 E-.19464
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 25/111
; update layer progress
M73 L25
M991 S0 P24 ;notify layer change

; OBJECT_ID: 427
M204 S10000
G17
G3 Z5.1 I-.792 J-.924 P1  F42000
G1 X87.105 Y92.9 Z5.1
G1 Z4.9
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3747
M204 S5000
G1 X87.105 Y87.955 E.15194
G1 X87.105 Y87.1 E.02627
M73 P52 R8
G1 X87.722 Y87.134 E.01897
G1 X87.756 Y86.494 E.01971
G1 X87.482 Y86.479 E.00843
G1 X87.475 Y86.617 E.00425
G1 X86.782 Y86.578 E.02132
G1 X86.782 Y85.028 E.04764
G3 X87.167 Y84.482 I.608 J.021 E.02174
G3 X89.46 Y84.182 I2.607 J10.994 E.07115
G3 X91.008 Y84.244 I.292 J12.012 E.04764
G1 X102.65 Y85.512 E.35985
G3 X103.065 Y85.975 I-.063 J.474 E.0208
G1 X103.063 Y89.171 E.09822
G3 X102.893 Y89.385 I-.332 J-.09 E.00862
G3 X102.893 Y90.615 I-.249 J.615 E.0484
G3 X103.064 Y90.829 I-.162 J.304 E.00864
G1 X103.065 Y94.017 E.09797
G3 X102.65 Y94.488 I-.493 J-.017 E.0209
G1 X91.007 Y95.756 E.35988
G3 X87.226 Y95.538 I-1.199 J-12.123 E.11685
G3 X86.783 Y95.022 I.169 J-.593 E.02215
G1 X86.781 Y93.422 E.04916
G1 X87.475 Y93.383 E.02133
G1 X87.482 Y93.521 E.00425
G1 X87.756 Y93.506 E.00843
G1 X87.722 Y92.866 E.01971
G1 X87.165 Y92.896 E.01712
M204 S10000
G1 X86.686 Y93.034 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3747
M204 S6000
G1 X86.389 Y93.051 E.00988
G1 X86.391 Y95.062 E.0667
G2 X86.57 Y95.578 I1.314 J-.166 E.01826
G3 X79.403 Y90.015 I3.099 J-11.392 E.30892
G3 X79.422 Y89.934 I.172 J-.002 E.00282
G3 X86.574 Y84.414 I10.342 J6.006 E.3073
G1 X86.438 Y84.728 E.01135
G2 X86.389 Y85.009 I.88 J.296 E.00949
G1 X86.39 Y86.949 E.06437
G1 X86.713 Y86.967 E.01075
G1 X86.713 Y93 E.20012
; WIPE_START
G1 F15476.087
G1 X86.389 Y93.051 E-.12472
G1 X86.391 Y94.723 E-.63528
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.699 Y92.521 Z5.3 F42000
G1 X103.631 Y89.528 Z5.3
G1 Z4.9
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3747
M204 S5000
G1 X103.631 Y94.228 E.14441
G3 X102.982 Y94.966 I-.772 J-.024 E.03275
G2 X95.802 Y95.836 I15.663 J159.349 E.22226
G1 X95.582 Y95.866 E.00682
G1 X95.186 Y95.926 E.01229
G1 X94.791 Y95.985 E.01229
G1 X94.395 Y96.045 E.01229
G1 F2400
G1 X93.939 Y96.117 E.01419
G1 X93.544 Y96.179 E.01229
G1 F2160
G3 X93.127 Y96.214 I-.408 J-2.341 E.01288
G1 F2280
G1 X93.124 Y96.209 E.00017
G1 F2760
G1 X93.014 Y96.156 E.00375
G1 F3445.867
G1 X92.926 Y96.14 E.00273
G1 F3747
G1 X92.771 Y96.136 E.00477
G1 X92.585 Y96.149 E.00573
G1 X92.188 Y96.192 E.01229
G1 X90.927 Y96.33 E.03898
G1 X90.423 Y96.37 E.01553
G3 X89.689 Y96.391 I-.72 J-12.184 E.02255
G3 X88.609 Y96.343 I.058 J-13.468 E.03324
G1 X87.929 Y96.252 E.02109
G1 X87.532 Y96.199 E.01229
G3 X86.777 Y96.035 I2.661 J-14.099 E.02376
G1 X86.518 Y95.967 E.00821
G1 X86.133 Y95.861 E.01229
G3 X85.618 Y95.687 I5.122 J-16.005 E.01669
G1 X85.24 Y95.545 E.0124
G1 X84.868 Y95.4 E.01229
G3 X84.253 Y95.113 I6.015 J-13.719 E.02084
G1 X83.849 Y94.906 E.01396
G1 X83.452 Y94.681 E.01401
G1 X83.259 Y94.564 E.00695
G1 X82.983 Y94.388 E.01004
G1 X82.552 Y94.082 E.01624
G1 X82.226 Y93.851 E.01229
G3 X81.62 Y93.352 I8.199 J-10.575 E.0241
G1 X81.27 Y93.035 E.01451
G1 X81.025 Y92.797 E.01051
G3 X80.635 Y92.382 I11.668 J-11.386 E.0175
G1 X80.26 Y91.955 E.01746
G1 X79.952 Y91.555 E.01553
G1 X79.708 Y91.237 E.01229
G1 F3000
G3 X79.335 Y90.674 I14.365 J-9.904 E.02075
G1 X79.075 Y90.25 E.01528
G1 F2880
G1 X79.037 Y90.156 E.00312
G1 F2760
G3 X79.048 Y89.81 I.567 J-.154 E.01082
G1 F2880
G1 X79.073 Y89.753 E.0019
G1 F3000
G3 X79.764 Y88.685 I11.568 J6.721 E.03912
G1 F3747
G1 X80.009 Y88.368 E.01229
G1 X80.249 Y88.057 E.01207
G1 X80.517 Y87.76 E.01229
G1 X80.934 Y87.296 E.01917
G1 X81.225 Y87.022 E.01229
G1 X81.682 Y86.592 E.01927
G1 X81.996 Y86.344 E.01229
G1 X82.488 Y85.953 E.01932
G1 X82.818 Y85.727 E.01229
G1 X83.053 Y85.566 E.00876
G1 X83.395 Y85.358 E.01229
G1 X83.638 Y85.212 E.00871
G3 X84.037 Y84.993 I6.655 J11.667 E.01399
G1 X84.4 Y84.824 E.01229
G1 X84.96 Y84.561 E.01901
G1 X85.335 Y84.422 E.01229
G1 X85.908 Y84.209 E.0188
G1 X86.292 Y84.096 E.01229
G1 X86.551 Y84.026 E.00825
G3 X87.304 Y83.845 I4.411 J16.666 E.02379
G1 X87.699 Y83.779 E.01229
G1 X88.061 Y83.723 E.01127
G3 X88.707 Y83.649 I2.084 J15.378 E.01997
G3 X89.758 Y83.61 I1.067 J14.397 E.03234
G1 X90.194 Y83.619 E.01339
G3 X91.02 Y83.685 I-3.466 J48.721 E.02548
G1 X91.885 Y83.774 E.02672
G1 X92.283 Y83.817 E.01229
G1 X92.681 Y83.86 E.01229
G1 X92.851 Y83.864 E.00523
G1 X92.934 Y83.859 E.00255
G1 F3350.318
G1 X93.009 Y83.844 E.00237
G1 F2760
G1 X93.122 Y83.797 E.00376
G1 F2280
G1 X93.129 Y83.784 E.00044
G1 F2160
G3 X93.441 Y83.806 I.017 J1.972 E.00962
G1 F2400
G1 X94.395 Y83.956 E.02967
G1 F3747
G1 X94.791 Y84.015 E.01229
G1 X95.186 Y84.075 E.01229
G1 X95.582 Y84.134 E.01229
G1 X95.786 Y84.163 E.00633
G2 X103.074 Y85.054 I23.989 J-165.916 E.22561
G3 X103.631 Y85.783 I-.214 J.742 E.03021
G1 X103.631 Y89.468 E.11323
; WIPE_START
G1 F12000
M204 S6000
G1 X103.631 Y91.468 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.3 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z5.3
G1 X0 Y90.0001 F18000 ; move to safe pos
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
            G0 Z5.3 F4000
            G39.3 S1
            G0 Z5.3 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X103.347 Y91.319 F42000
G1 Z4.9
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.218751
G1 F3747
M204 S6000
G3 X103.348 Y94.027 I-99.56 J1.381 E.0388
G1 X103.345 Y94.117 E.00129
G3 X103.316 Y94.3 I-.96 J-.057 E.00266
; LINE_WIDTH: 0.262833
G3 X102.985 Y94.67 I-.55 J-.159 E.0092
; LINE_WIDTH: 0.214414
G1 X102.911 Y94.698 E.0011
; LINE_WIDTH: 0.157498
G1 X102.683 Y94.741 E.00217
G1 X98.752 Y95.174 E.03693
; WIPE_START
G1 F15000
G1 X100.74 Y94.955 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.225 Y95.356 Z5.3 F42000
G1 Z4.9
G1 E.8 F1800
; LINE_WIDTH: 0.22514
G1 F3747
M204 S6000
G1 X95.758 Y95.538 E.02194
; LINE_WIDTH: 0.264766
G1 X94.814 Y95.66 E.01721
; LINE_WIDTH: 0.298923
G1 X94.154 Y95.747 E.01388
; LINE_WIDTH: 0.335559
G3 X93.212 Y95.866 I-2.695 J-17.622 E.02265
M204 S10000
G1 X93.874 Y95.929 F42000
; LINE_WIDTH: 0.293652
G1 F3747
M204 S6000
G1 X93.096 Y95.848 E.01597
; LINE_WIDTH: 0.265588
G1 X92.95 Y95.844 E.00265
; LINE_WIDTH: 0.221003
G1 X92.558 Y95.87 E.0057
G1 X91.034 Y96.036 E.02226
G3 X87.132 Y95.818 I-1.293 J-11.922 E.05696
; LINE_WIDTH: 0.251624
G1 X86.989 Y95.773 E.00255
G1 X86.766 Y95.537 E.00552
; WIPE_START
G1 F15000
G1 X86.989 Y95.773 E-.51968
G1 X87.132 Y95.818 E-.24032
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.909 Y93.163 Z5.3 F42000
G1 Z4.9
G1 E.8 F1800
; LINE_WIDTH: 0.15403
G1 F3747
M204 S6000
G1 X87.539 Y93.128 E.00571
; WIPE_START
G1 F15000
G1 X86.909 Y93.163 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.69 Y88.739 Z5.3 F42000
G1 X80.666 Y88.722 Z5.3
G1 Z4.9
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3747
M204 S6000
G3 X81.764 Y87.521 I12.777 J10.569 E.05399
G1 X86.365 Y92.122 E.21586
G1 X86.365 Y92.703 E.01929
G1 X86.04 Y92.722 E.01078
G1 X86.042 Y93.958 E.04102
G1 X85.25 Y94.75 E.03713
G3 X81.762 Y92.481 I4.86 J-11.287 E.1387
G1 X86.365 Y87.878 E.21592
G1 X86.365 Y87.297 E.01929
G1 X86.042 Y87.279 E.01074
G1 X86.041 Y86.041 E.04104
G1 X85.252 Y85.252 E.03704
G2 X83.797 Y85.978 I4.03 J9.889 E.054
; WIPE_START
G1 F15476.087
G1 X85.252 Y85.252 E-.61804
G1 X85.516 Y85.516 E-.14197
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.539 Y86.872 Z5.3 F42000
G1 Z4.9
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.154067
G1 F3747
M204 S6000
G1 X86.909 Y86.837 E.00571
; WIPE_START
G1 F15000
G1 X87.539 Y86.872 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.845 Y84.282 Z5.3 F42000
G1 Z4.9
G1 E.8 F1800
; LINE_WIDTH: 0.258986
G1 F3747
M204 S6000
G1 X87.045 Y84.207 E.00376
; LINE_WIDTH: 0.221552
G3 X90.053 Y83.899 I2.666 J11.166 E.04414
G3 X92.665 Y84.141 I-1.563 J31.003 E.03821
G1 X92.966 Y84.156 E.00438
; LINE_WIDTH: 0.287448
G2 X93.897 Y84.076 I-.292 J-8.835 E.01864
M204 S10000
G1 X93.217 Y84.135 F42000
; LINE_WIDTH: 0.338395
G1 F3747
M204 S6000
G3 X93.991 Y84.232 I-1.181 J12.544 E.01878
; LINE_WIDTH: 0.307238
G1 X94.585 Y84.311 E.01292
; LINE_WIDTH: 0.270042
G1 X95.742 Y84.46 E.02159
; LINE_WIDTH: 0.22519
G1 X97.224 Y84.644 E.02217
; WIPE_START
G1 F15000
G1 X95.742 Y84.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.752 Y84.826 Z5.3 F42000
G1 Z4.9
G1 E.8 F1800
; LINE_WIDTH: 0.157469
G1 F3747
M204 S6000
G1 X102.683 Y85.259 E.03692
G1 X102.911 Y85.302 E.00217
; LINE_WIDTH: 0.215444
G1 X102.993 Y85.333 E.00122
; LINE_WIDTH: 0.26316
G3 X103.296 Y85.64 I-.238 J.539 E.00792
G1 X103.299 Y85.647 E.00014
; LINE_WIDTH: 0.219672
G3 X103.348 Y85.954 I-.872 J.296 E.00451
G1 X103.347 Y88.68 E.03926
; WIPE_START
G1 F15000
G1 X103.348 Y86.68 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.786 Y87.716 Z5.3 F42000
G1 X93.928 Y87.971 Z5.3
G1 Z4.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3747
M204 S6000
G1 X93.928 Y92.029 E.13463
G1 X93.312 Y92.029 E.02045
G1 X93.312 Y87.971 E.13463
G1 X93.868 Y87.971 E.01846
M204 S10000
G1 X94.32 Y87.945 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3747
M204 S5000
G1 X97.971 Y87.945 E.11218
G1 X97.971 Y92.055 E.12626
G1 X94.32 Y92.055 E.11218
G1 X94.32 Y88.005 E.12441
; WIPE_START
G1 F12000
M204 S6000
G1 X96.32 Y87.973 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.92 Y92.577 Z5.3 F42000
G1 Z4.9
G1 E.8 F1800
G1 F3747
M204 S5000
G1 X92.92 Y87.423 E.15834
G1 X91.468 Y87.342 E.04469
G1 X91.504 Y86.702 E.01971
G1 X91.775 Y86.717 E.00836
G1 X91.768 Y86.855 E.00426
G1 X93.411 Y86.95 E.05057
G1 X93.423 Y87.579 E.01933
G1 X97.963 Y87.579 E.13951
G3 X98.338 Y87.967 I-.006 J.381 E.01842
G1 X98.338 Y92.037 E.12504
G3 X97.985 Y92.42 I-.389 J-.004 E.01755
G1 X93.423 Y92.421 E.14018
G1 X93.423 Y93.02 E.01839
G1 X93.409 Y93.051 E.00105
G1 X91.768 Y93.145 E.05052
G1 X91.775 Y93.283 E.00426
G1 X91.504 Y93.298 E.00836
G1 X91.468 Y92.658 E.01971
G1 X92.86 Y92.58 E.04284
M204 S10000
G1 X93.171 Y92.226 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.154365
G1 F3747
M204 S6000
G1 X93.162 Y92.806 E.00527
G1 X91.678 Y92.898 E.01351
; WIPE_START
G1 F15000
G1 X93.162 Y92.806 E-.56535
G1 X93.17 Y92.294 E-.19465
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.62 Y91.826 Z5.3 F42000
G1 Z4.9
G1 E.8 F1800
; LINE_WIDTH: 0.25231
G1 F3747
M204 S6000
G1 X93.62 Y88.174 E.0623
M204 S10000
G1 X93.171 Y87.775 F42000
; LINE_WIDTH: 0.154343
G1 F3747
M204 S6000
G1 X93.163 Y87.194 E.00527
G1 X91.678 Y87.102 E.01351
; CHANGE_LAYER
; Z_HEIGHT: 5.1
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X93.163 Y87.194 E-.56536
G1 X93.17 Y87.706 E-.19465
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 26/111
; update layer progress
M73 L26
M991 S0 P25 ;notify layer change

; OBJECT_ID: 427
M204 S10000
G17
G3 Z5.3 I-.215 J1.198 P1  F42000
G1 X103.087 Y89.484 Z5.3
G1 Z5.1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.378512
G1 F3002
M204 S5000
G3 X103.086 Y90.516 I-.282 J.516 E.03442
G2 X103.108 Y89.505 I-.401 J-.514 E.03164
; WIPE_START
G1 F12000
M204 S6000
G1 X103.237 Y89.609 E-.06284
G1 X103.309 Y89.706 E-.04604
G1 X103.366 Y89.83 E-.05202
G1 X103.393 Y90 E-.06532
G1 X103.368 Y90.162 E-.0623
G1 X103.313 Y90.287 E-.05196
G1 X103.205 Y90.424 E-.06625
G1 X103.086 Y90.516 E-.05705
G1 X103.239 Y90.357 E-.08365
G1 X103.295 Y90.256 E-.04412
G1 X103.342 Y90.092 E-.06462
G1 X103.348 Y89.972 E-.04569
G1 X103.333 Y89.856 E-.04439
G1 X103.319 Y89.823 E-.01376
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.834 Y88.333 Z5.5 F42000
G1 X93.928 Y87.953 Z5.5
G1 Z5.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3002
M204 S6000
G1 X93.928 Y92.047 E.13578
G1 X93.317 Y92.047 E.02028
G1 X93.317 Y87.953 E.13579
G1 X93.868 Y87.953 E.01828
M204 S10000
G1 X94.32 Y87.945 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3002
M204 S5000
G1 X97.971 Y87.945 E.11218
G1 X97.971 Y92.055 E.12626
G1 X94.32 Y92.055 E.11218
G1 X94.32 Y88.005 E.12441
; WIPE_START
G1 F12000
M204 S6000
G1 X96.32 Y87.973 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.925 Y92.582 Z5.5 F42000
G1 Z5.1
G1 E.8 F1800
G1 F3002
M204 S5000
G1 X92.925 Y87.418 E.15864
G1 X91.473 Y87.338 E.04469
G1 X91.509 Y86.697 E.01971
G1 X91.781 Y86.712 E.00836
G1 X91.773 Y86.85 E.00426
G1 X93.416 Y86.945 E.05057
G1 X93.428 Y87.561 E.01894
G1 X97.983 Y87.562 E.13997
G3 X98.356 Y87.95 I-.014 J.386 E.01827
G1 X98.356 Y92.048 E.12592
G3 X98.002 Y92.438 I-.384 J.007 E.0178
G1 X93.428 Y92.439 E.14056
G1 X93.428 Y93.025 E.018
G1 X93.415 Y93.056 E.00105
G1 X91.773 Y93.15 E.05053
G1 X91.781 Y93.288 E.00426
G1 X91.509 Y93.303 E.00836
G1 X91.473 Y92.662 E.01971
G1 X92.865 Y92.585 E.04284
; WIPE_START
G1 F12000
M204 S6000
G1 X92.888 Y90.585 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.5 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z5.5
G1 X0 Y90.0001 F18000 ; move to safe pos
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
            G0 Z5.5 F4000
            G39.3 S1
            G0 Z5.5 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X93.623 Y91.843 F42000
G1 Z5.1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.24707
G1 F3002
M204 S6000
G1 X93.623 Y88.157 E.06133
M204 S10000
G1 X93.177 Y87.757 F42000
; LINE_WIDTH: 0.154339
G1 F3002
M204 S6000
G1 X93.168 Y87.189 E.00516
G1 X91.683 Y87.097 E.01351
; WIPE_START
G1 F15000
G1 X93.168 Y87.189 E-.56535
G1 X93.176 Y87.701 E-.19465
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.177 Y92.243 Z5.5 F42000
G1 Z5.1
G1 E.8 F1800
; LINE_WIDTH: 0.154363
G1 F3002
M204 S6000
G1 X93.168 Y92.811 E.00516
G1 X91.683 Y92.903 E.01351
; WIPE_START
G1 F15000
G1 X93.168 Y92.811 E-.56535
G1 X93.176 Y92.299 E-.19465
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.671 Y93.041 Z5.5 F42000
G1 Z5.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3002
M204 S6000
G1 X86.248 Y93.064 E.01403
G1 X86.248 Y95.034 E.06534
G2 X86.407 Y95.622 I1.482 J-.085 E.02036
G3 X79.252 Y90.028 I3.244 J-11.522 E.309
G3 X79.281 Y89.906 I.182 J-.022 E.00427
G3 X86.407 Y84.379 I10.42 J6.079 E.30657
G1 X86.288 Y84.698 E.01129
G1 X86.25 Y84.879 E.00612
G1 X86.248 Y86.936 E.06823
G1 X86.698 Y86.961 E.01495
G1 X86.697 Y93.006 E.20052
M204 S10000
G1 X87.09 Y92.906 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3002
M204 S5000
G1 X87.706 Y92.872 E.01897
M73 P53 R8
G1 X87.74 Y93.512 E.01971
G1 X87.466 Y93.527 E.00843
G1 X87.459 Y93.389 E.00425
G1 X86.64 Y93.435 E.02519
G1 X86.64 Y95.024 E.04884
G2 X87.086 Y95.599 I.634 J-.032 E.02377
G2 X90.909 Y95.841 I2.672 J-11.861 E.11822
G1 X97.434 Y95.131 E.20167
G3 X97.896 Y95.103 I.482 J4.124 E.01423
G1 X97.897 Y95.494 E.01201
G3 X95.791 Y95.834 I-4.649 J-22.088 E.06557
G1 X94.287 Y96.068 E.04676
G1 X93.892 Y96.129 E.01229
G1 X93.497 Y96.191 E.01229
G1 X93.101 Y96.252 E.01229
G1 F2520
G1 X92.756 Y96.309 E.01076
G1 X92.361 Y96.374 E.01229
G1 F2160
G3 X92.121 Y96.403 I-.406 J-2.362 E.00744
G1 F2280
G1 X92.023 Y96.399 E.003
G1 F2760
G1 X91.914 Y96.345 E.00375
G1 F3002
G1 X91.837 Y96.328 E.00241
G1 X91.761 Y96.321 E.00234
G1 X91.679 Y96.321 E.00252
G1 X91.51 Y96.332 E.00522
G1 X91.112 Y96.375 E.01229
G1 X90.893 Y96.399 E.00677
G3 X89.204 Y96.452 I-1.302 J-14.418 E.05196
G3 X88.338 Y96.39 I.497 J-13.071 E.02666
G3 X87.467 Y96.266 I1.417 J-13.051 E.02706
G3 X86.922 Y96.152 I3.123 J-16.287 E.01711
G1 X86.378 Y96.019 E.01718
G3 X85.625 Y95.785 I3.562 J-12.791 E.02426
G1 X85.092 Y95.589 E.01743
G1 X84.621 Y95.382 E.01579
G1 X84.255 Y95.222 E.01229
G3 X83.845 Y95.01 I7.207 J-14.462 E.01419
G1 X83.595 Y94.871 E.00878
G1 X83.247 Y94.674 E.01229
G1 X82.717 Y94.322 E.01955
G1 X82.384 Y94.101 E.01229
G3 X81.834 Y93.677 I8.153 J-11.138 E.02132
G1 X81.476 Y93.376 E.01437
G1 X81.102 Y93.021 E.01586
G1 X80.811 Y92.746 E.01229
G1 X80.461 Y92.362 E.01598
G1 X80.192 Y92.066 E.01229
G3 X79.834 Y91.616 I13.049 J-10.741 E.01764
G1 X79.495 Y91.158 E.01753
G3 X79.18 Y90.684 I9.582 J-6.71 E.01747
G1 F3000
G3 X78.922 Y90.255 I7.568 J-4.837 E.0154
G1 F2880
G3 X78.869 Y90.105 I.489 J-.259 E.0049
G1 F2760
G3 X78.884 Y89.835 I.776 J-.092 E.00835
G1 F2880
G1 X78.907 Y89.777 E.00193
G1 F3000
G3 X79.111 Y89.426 I2.694 J1.336 E.01247
G1 F3002
G1 X79.333 Y89.094 E.01229
G1 X79.617 Y88.67 E.01568
G1 X79.863 Y88.354 E.01229
G1 X80.181 Y87.947 E.01588
G1 X80.452 Y87.652 E.01229
G1 X80.881 Y87.183 E.01955
G1 X81.174 Y86.91 E.01229
G1 X81.556 Y86.555 E.01604
G1 X81.868 Y86.305 E.01229
G1 X82.281 Y85.975 E.01623
G1 X82.612 Y85.75 E.01229
G1 X83.136 Y85.394 E.01948
G1 X83.484 Y85.196 E.01229
G1 X83.937 Y84.939 E.01601
G1 X84.299 Y84.769 E.01229
G1 X84.868 Y84.502 E.01932
G1 X85.243 Y84.363 E.01229
G1 X85.826 Y84.146 E.01911
G1 X86.21 Y84.033 E.01229
G1 X86.481 Y83.954 E.00866
G3 X87.347 Y83.756 I3.325 J12.545 E.02731
G1 X87.784 Y83.681 E.01362
G3 X89.301 Y83.545 I1.895 J12.56 E.04684
G3 X90.154 Y83.55 I.351 J12.884 E.02622
G3 X90.885 Y83.601 I-.853 J17.559 E.02252
G1 X91.112 Y83.625 E.007
G1 X91.509 Y83.668 E.01229
G1 X91.684 Y83.68 E.00537
G1 X91.832 Y83.673 E.00458
G1 X91.915 Y83.655 E.00261
G1 F2760
G1 X92.025 Y83.6 E.00376
G1 F2280
G1 X92.059 Y83.595 E.00107
G1 F2160
G3 X92.363 Y83.626 I-.063 J2.091 E.0094
G1 F2520
G1 X93.102 Y83.749 E.02301
G1 F3002
G1 X93.497 Y83.809 E.01229
G1 X93.893 Y83.869 E.01229
G1 X94.288 Y83.93 E.01229
G1 X97.47 Y84.415 E.09889
G3 X97.896 Y84.506 I-.672 J4.202 E.01339
G1 X97.895 Y84.899 E.01209
G3 X97.434 Y84.869 I.167 J-6.1 E.01422
G1 X90.981 Y84.166 E.19944
G2 X87.082 Y84.403 I-1.251 J11.62 E.12059
G2 X86.642 Y84.92 I.181 J.6 E.02205
G1 X86.64 Y86.565 E.05055
G1 X87.459 Y86.611 E.0252
G1 X87.466 Y86.473 E.00425
G1 X87.74 Y86.488 E.00843
G1 X87.706 Y87.128 E.01971
G1 X87.09 Y87.094 E.01897
G1 X87.089 Y87.632 E.01652
G1 X87.09 Y92.846 E.16022
M204 S10000
G1 X86.894 Y93.169 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.154019
G1 F3002
M204 S6000
G1 X87.524 Y93.134 E.00571
; WIPE_START
G1 F15000
G1 X86.894 Y93.169 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.665 Y95.752 Z5.5 F42000
G1 Z5.1
G1 E.8 F1800
; LINE_WIDTH: 0.254581
G1 F3002
M204 S6000
G2 X86.985 Y95.871 I.899 J-1.913 E.0059
; LINE_WIDTH: 0.214015
G2 X90.935 Y96.116 I2.716 J-11.834 E.05542
G1 X91.876 Y96.034 E.01318
; LINE_WIDTH: 0.264093
G1 X92.005 Y96.041 E.00232
; LINE_WIDTH: 0.291735
G1 X92.693 Y96.121 E.01404
M204 S10000
G1 X92.083 Y96.207 F42000
; LINE_WIDTH: 0.288057
G1 F3002
M204 S6000
G1 X92.096 Y96.132 E.00152
; LINE_WIDTH: 0.32301
G1 X92.11 Y96.057 E.00174
; LINE_WIDTH: 0.324025
G2 X92.984 Y95.942 I-1.915 J-17.899 E.0202
; LINE_WIDTH: 0.281786
G1 X93.661 Y95.85 E.0133
; LINE_WIDTH: 0.24963
G1 X94.284 Y95.767 E.01058
; LINE_WIDTH: 0.22283
G1 X94.906 Y95.685 E.0092
; WIPE_START
G1 F15000
G1 X94.284 Y95.767 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X96.434 Y95.491 Z5.5 F42000
G1 Z5.1
G1 E.8 F1800
; LINE_WIDTH: 0.139201
G1 F3002
M204 S6000
G1 X97.022 Y95.417 E.00465
; LINE_WIDTH: 0.115027
G3 X97.536 Y95.346 I3.475 J23.114 E.00305
; WIPE_START
G1 F15000
G1 X97.022 Y95.417 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.388 Y87.793 Z5.5 F42000
G1 X97.539 Y84.655 Z5.5
G1 Z5.1
G1 E.8 F1800
; LINE_WIDTH: 0.114928
G1 F3002
M204 S6000
G1 X97.455 Y84.643 E.0005
G2 X97.02 Y84.583 I-1.982 J12.65 E.00258
; LINE_WIDTH: 0.139193
G1 X96.433 Y84.509 E.00464
; WIPE_START
G1 F15000
G1 X97.02 Y84.583 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.905 Y84.314 Z5.5 F42000
G1 Z5.1
G1 E.8 F1800
; LINE_WIDTH: 0.225469
G1 F3002
M204 S6000
G1 X94.195 Y84.22 E.01065
; LINE_WIDTH: 0.25638
G1 X93.484 Y84.126 E.01247
; LINE_WIDTH: 0.288231
G1 X92.898 Y84.046 E.01183
; LINE_WIDTH: 0.325773
G2 X92.108 Y83.943 I-2.277 J14.335 E.01836
M204 S10000
G1 X92.69 Y83.879 F42000
; LINE_WIDTH: 0.291815
G1 F3002
M204 S6000
G1 X92.007 Y83.959 E.01396
; LINE_WIDTH: 0.261684
G1 X91.863 Y83.966 E.00256
; LINE_WIDTH: 0.213577
G1 X91.007 Y83.892 E.01194
G2 X86.984 Y84.13 I-1.311 J11.962 E.05632
; LINE_WIDTH: 0.253758
G2 X86.665 Y84.249 I.571 J2.013 E.00585
; WIPE_START
G1 F15000
G1 X86.984 Y84.13 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.894 Y86.831 Z5.5 F42000
G1 Z5.1
G1 E.8 F1800
; LINE_WIDTH: 0.154038
G1 F3002
M204 S6000
G1 X87.524 Y86.866 E.00571
; WIPE_START
G1 F15000
G1 X86.894 Y86.831 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.727 Y85.909 Z5.5 F42000
G1 Z5.1
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3002
M204 S6000
G3 X85.182 Y85.182 I8.026 J14.243 E.05396
G1 X85.901 Y85.901 E.03373
G1 X85.899 Y87.265 E.04527
G1 X86.349 Y87.29 E.01496
G1 X86.349 Y87.894 E.02001
G1 X81.682 Y92.561 E.21894
G2 X85.178 Y94.822 I8.353 J-9.084 E.13877
G1 X85.902 Y94.098 E.03398
G1 X85.899 Y92.735 E.04521
G1 X86.349 Y92.71 E.01494
G1 X86.349 Y92.106 E.02002
G1 X81.684 Y87.441 E.21888
G2 X80.58 Y88.635 I13.725 J13.789 E.05397
; CHANGE_LAYER
; Z_HEIGHT: 5.3
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X81.684 Y87.441 E-.61811
G1 X81.948 Y87.705 E-.1419
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 27/111
; update layer progress
M73 L27
M991 S0 P26 ;notify layer change

; OBJECT_ID: 427
M204 S10000
G17
G3 Z5.5 I-.023 J1.217 P1  F42000
G1 X93.928 Y87.936 Z5.5
G1 Z5.3
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2780
M204 S6000
G1 X93.928 Y92.064 E.13695
G1 X93.322 Y92.064 E.0201
G1 X93.322 Y87.936 E.13695
G1 X93.868 Y87.936 E.01811
M204 S10000
G1 X94.32 Y87.945 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2780
M204 S5000
G1 X97.971 Y87.945 E.11218
G1 X97.971 Y92.055 E.12626
G1 X94.32 Y92.055 E.11218
G1 X94.32 Y88.005 E.12441
; WIPE_START
G1 F12000
M204 S6000
G1 X96.32 Y87.973 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.93 Y92.586 Z5.7 F42000
G1 Z5.3
G1 E.8 F1800
G1 F2780
M204 S5000
G1 X92.93 Y87.414 E.15895
G1 X91.478 Y87.333 E.04469
G1 X91.514 Y86.692 E.01971
G1 X91.786 Y86.707 E.00836
G1 X91.778 Y86.846 E.00426
G1 X93.421 Y86.94 E.05058
G1 X93.433 Y87.544 E.01856
G1 X97.982 Y87.544 E.13977
G3 X98.373 Y87.932 I.004 J.387 E.01885
G1 X98.373 Y92.066 E.127
G3 X98.02 Y92.455 I-.385 J.006 E.01778
G1 X93.433 Y92.456 E.14093
G1 X93.433 Y93.03 E.01761
G1 X93.419 Y93.061 E.00106
G1 X91.778 Y93.154 E.05051
G1 X91.786 Y93.293 E.00426
G1 X91.514 Y93.308 E.00836
G1 X91.478 Y92.667 E.01971
G1 X92.87 Y92.59 E.04284
; WIPE_START
G1 F12000
M204 S6000
G1 X92.893 Y90.59 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.7 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z5.7
G1 X0 Y90.0001 F18000 ; move to safe pos
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
            G0 Z5.7 F4000
            G39.3 S1
            G0 Z5.7 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X93.625 Y91.861 F42000
G1 Z5.3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.24183
G1 F2780
M204 S6000
G1 X93.625 Y88.139 E.06032
M204 S10000
G1 X93.182 Y87.74 F42000
; LINE_WIDTH: 0.154334
G1 F2780
M204 S6000
G1 X93.173 Y87.184 E.00505
G1 X91.688 Y87.092 E.01351
; WIPE_START
G1 F15000
G1 X93.173 Y87.184 E-.56535
G1 X93.181 Y87.696 E-.19465
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.182 Y92.261 Z5.7 F42000
G1 Z5.3
G1 E.8 F1800
; LINE_WIDTH: 0.154358
G1 F2780
M204 S6000
G1 X93.173 Y92.816 E.00505
G1 X91.688 Y92.908 E.01351
; WIPE_START
G1 F15000
G1 X93.173 Y92.816 E-.56535
G1 X93.181 Y92.304 E-.19465
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.655 Y93.047 Z5.7 F42000
G1 Z5.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2780
M204 S6000
G1 X86.107 Y93.077 E.01819
G1 X86.107 Y95.103 E.0672
G2 X86.28 Y95.667 I1.273 J-.083 E.01975
G3 X79.115 Y90.061 I3.362 J-11.679 E.30932
G3 X79.119 Y89.93 I.12 J-.062 E.00455
G3 X86.245 Y84.347 I10.526 J6.097 E.3077
G1 X86.125 Y84.728 E.01326
G1 X86.107 Y84.897 E.00564
G1 X86.107 Y86.923 E.0672
G1 X86.682 Y86.955 E.01909
G1 X86.682 Y93.012 E.20093
M204 S10000
G1 X87.074 Y92.912 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2780
M204 S5000
G1 X87.69 Y92.878 E.01897
G1 X87.724 Y93.518 E.01971
G1 X87.451 Y93.534 E.00843
G1 X87.443 Y93.395 E.00425
G1 X86.499 Y93.448 E.02905
G1 X86.499 Y95.082 E.0502
G2 X87.002 Y95.667 I.628 J-.031 E.02555
G2 X90.756 Y95.925 I2.691 J-11.754 E.11607
G1 X95.246 Y95.437 E.13878
G3 X95.577 Y95.415 I.321 J2.424 E.01022
G1 X95.577 Y95.829 E.0127
G3 X95.127 Y95.931 I-1.36 J-4.967 E.01419
G1 X93.181 Y96.245 E.06057
G1 X92.786 Y96.309 E.01229
G1 X92.391 Y96.373 E.01229
G1 X91.997 Y96.437 E.01229
G1 F2520
G1 X91.722 Y96.484 E.00857
G1 X91.328 Y96.553 E.01229
G1 F2160
G3 X91.053 Y96.58 I-.318 J-1.843 E.00849
G1 F2760
G1 X90.946 Y96.517 E.0038
G1 F2780
G1 X90.868 Y96.495 E.0025
G1 X90.791 Y96.486 E.00238
G1 X90.643 Y96.483 E.00454
G1 X90.243 Y96.5 E.01229
G1 X89.691 Y96.523 E.017
G3 X88.716 Y96.492 I-.037 J-13.993 E.02997
G3 X87.729 Y96.382 I1.081 J-14.193 E.03052
G3 X87.18 Y96.286 I1.737 J-11.54 E.01713
G3 X86.302 Y96.078 I2.878 J-14.14 E.02773
G3 X85.758 Y95.911 I5.408 J-18.515 E.01748
G1 X85.217 Y95.726 E.01758
G3 X84.684 Y95.511 I4.658 J-12.314 E.01766
G1 X84.292 Y95.329 E.01327
G1 X83.93 Y95.159 E.01229
G1 X83.489 Y94.914 E.0155
G1 X83.14 Y94.719 E.01229
G3 X82.652 Y94.404 I9.086 J-14.598 E.01786
G1 X82.173 Y94.071 E.0179
G1 X81.757 Y93.739 E.01636
G1 X81.445 Y93.489 E.01229
G1 X80.973 Y93.047 E.01987
G1 X80.681 Y92.773 E.01229
G3 X80.287 Y92.347 I11.846 J-11.351 E.01786
G1 X79.908 Y91.907 E.01783
G3 X79.554 Y91.45 I10.245 J-8.303 E.01775
G3 X79.225 Y90.978 I13.696 J-9.884 E.01769
G1 X78.915 Y90.497 E.01759
G1 X78.793 Y90.292 E.00734
G3 X78.738 Y90.171 I.502 J-.301 E.00409
G3 X78.721 Y89.896 I.637 J-.178 E.00853
G3 X78.774 Y89.744 I.558 J.108 E.00496
G1 X78.906 Y89.517 E.00806
G1 X79.122 Y89.181 E.01229
G1 X79.281 Y88.94 E.00885
G3 X79.544 Y88.564 I13.89 J9.426 E.01411
G1 X79.793 Y88.251 E.01229
G1 X80.12 Y87.839 E.01617
G3 X80.508 Y87.407 I8.844 J7.553 E.01783
G1 X80.835 Y87.075 E.01432
G3 X81.433 Y86.521 I10.116 J10.307 E.02507
G1 X81.744 Y86.268 E.01229
G1 X82 Y86.068 E.00999
G3 X82.445 Y85.734 I12.928 J16.755 E.01712
G1 X82.782 Y85.518 E.01229
G1 X83.327 Y85.169 E.01989
G1 X83.733 Y84.943 E.01428
G1 X84.148 Y84.735 E.01425
G3 X84.991 Y84.361 I6.147 J12.727 E.02834
G1 X85.421 Y84.201 E.0141
M73 P54 R8
G3 X86.29 Y83.925 I4.811 J13.623 E.02803
G3 X86.838 Y83.787 I3.363 J12.206 E.01735
G3 X87.719 Y83.62 I2.76 J12.131 E.02755
G3 X88.814 Y83.501 I2.155 J14.801 E.03387
G3 X89.575 Y83.476 I.796 J12.629 E.02338
G1 X89.897 Y83.479 E.00989
G1 X90.108 Y83.486 E.00651
G1 X90.639 Y83.517 E.01634
G1 X90.724 Y83.518 E.0026
G1 X90.866 Y83.506 E.00437
G1 X90.945 Y83.483 E.00254
G1 F2760
G1 X91.056 Y83.421 E.00392
G1 F2160
G3 X91.179 Y83.427 I.023 J.769 E.00377
G1 X91.327 Y83.447 E.00461
G1 F2520
G1 X91.997 Y83.564 E.02089
G1 F2780
G1 X92.392 Y83.629 E.01229
G1 X92.786 Y83.693 E.01229
G1 X93.181 Y83.758 E.01229
G1 X95.386 Y84.121 E.06866
G1 X95.576 Y84.171 E.00604
G1 X95.577 Y84.585 E.01271
G3 X95.375 Y84.576 I-.02 J-1.845 E.00622
G1 X90.853 Y84.085 E.13974
G2 X86.891 Y84.368 I-1.166 J11.556 E.12267
G2 X86.499 Y84.918 I.226 J.576 E.02195
G1 X86.499 Y86.552 E.0502
G1 X87.443 Y86.605 E.02905
G1 X87.451 Y86.467 E.00425
G1 X87.724 Y86.482 E.00843
G1 X87.69 Y87.122 E.01971
G1 X87.074 Y87.088 E.01897
G1 X87.074 Y87.684 E.01832
G1 X87.074 Y92.852 E.1588
M204 S10000
G1 X86.878 Y93.175 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.153998
G1 F2780
M204 S6000
G1 X87.508 Y93.14 E.00571
; WIPE_START
G1 F15000
G1 X86.878 Y93.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.48 Y95.631 Z5.7 F42000
G1 Z5.3
G1 E.8 F1800
; LINE_WIDTH: 0.245543
G1 F2780
M204 S6000
G1 X86.704 Y95.874 E.00545
; LINE_WIDTH: 0.208949
G2 X90.281 Y96.232 I2.93 J-11.233 E.04883
G1 X90.932 Y96.205 E.00882
; LINE_WIDTH: 0.268646
G1 X91.056 Y96.214 E.00228
; LINE_WIDTH: 0.325254
G1 X91.091 Y96.22 E.00082
G2 X91.725 Y96.15 I-.005 J-2.967 E.01469
; LINE_WIDTH: 0.293945
G1 X92.174 Y96.087 E.00929
; LINE_WIDTH: 0.264209
G1 X92.757 Y96.007 E.0106
; LINE_WIDTH: 0.233746
G1 X93.338 Y95.927 E.00913
; WIPE_START
G1 F15000
G1 X92.757 Y96.007 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.866 Y95.724 Z5.7 F42000
G1 Z5.3
G1 E.8 F1800
; LINE_WIDTH: 0.122678
G1 F2780
M204 S6000
G2 X95.381 Y95.649 I-1.192 J-10.089 E.00338
; WIPE_START
G1 F15000
G1 X94.866 Y95.724 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.211 Y88.099 Z5.7 F42000
G1 X95.38 Y84.351 Z5.7
G1 Z5.3
G1 E.8 F1800
; LINE_WIDTH: 0.122187
G1 F2780
M204 S6000
G2 X94.866 Y84.275 I-1.728 J9.979 E.00336
; WIPE_START
G1 F15000
G1 X95.38 Y84.351 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.338 Y84.072 Z5.7 F42000
G1 Z5.3
G1 E.8 F1800
; LINE_WIDTH: 0.23228
G1 F2780
M204 S6000
G1 X92.763 Y83.993 E.00896
; LINE_WIDTH: 0.262378
G1 X92.187 Y83.914 E.0104
; LINE_WIDTH: 0.292106
G1 X91.731 Y83.85 E.00936
; LINE_WIDTH: 0.325249
G2 X91.139 Y83.769 I-2.668 J17.31 E.01373
M204 S10000
G1 X91.055 Y83.785 F42000
; LINE_WIDTH: 0.298913
G1 F2780
M204 S6000
G1 X91.637 Y83.7 E.01227
M204 S10000
G1 X91.055 Y83.785 F42000
; LINE_WIDTH: 0.266807
G1 F2780
M204 S6000
G1 X90.928 Y83.795 E.00232
; LINE_WIDTH: 0.207989
G1 X90.077 Y83.759 E.01147
G2 X86.773 Y84.102 I-.452 J11.73 E.04483
; LINE_WIDTH: 0.255051
G1 X86.629 Y84.156 E.00265
G1 X86.43 Y84.414 E.00564
; WIPE_START
G1 F15000
G1 X86.629 Y84.156 E-.51676
G1 X86.773 Y84.102 E-.24324
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.878 Y86.825 Z5.7 F42000
G1 Z5.3
G1 E.8 F1800
; LINE_WIDTH: 0.154008
G1 F2780
M204 S6000
G1 X87.508 Y86.86 E.00571
; WIPE_START
G1 F15000
G1 X86.878 Y86.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.494 Y88.551 Z5.7 F42000
G1 Z5.3
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2780
M204 S6000
G3 X81.609 Y87.366 I11.28 J9.491 E.05399
G1 X86.333 Y92.09 E.22164
G1 X86.333 Y92.716 E.02074
G1 X85.759 Y92.748 E.01909
G1 X85.759 Y94.241 E.04955
G1 X85.113 Y94.887 E.03027
G3 X81.605 Y92.638 I4.518 J-10.909 E.13896
G1 X86.334 Y87.91 E.22181
G1 X86.334 Y87.284 E.02074
G1 X85.759 Y87.252 E.01909
G1 X85.759 Y85.759 E.04955
G1 X85.115 Y85.115 E.0302
G2 X83.659 Y85.84 I3.892 J9.641 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 5.5
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X85.115 Y85.115 E-.61812
G1 X85.379 Y85.379 E-.14188
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 28/111
; update layer progress
M73 L28
M991 S0 P27 ;notify layer change

; OBJECT_ID: 427
M204 S10000
G17
G3 Z5.7 I-.35 J1.166 P1  F42000
G1 X93.928 Y87.945 Z5.7
G1 Z5.5
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2730
M204 S6000
G1 X93.928 Y92.082 E.1372
G1 X93.327 Y92.082 E.01993
G1 X93.328 Y87.918 E.13811
G1 X93.895 Y87.918 E.01884
M204 S10000
G1 X94.32 Y87.945 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2730
M204 S5000
G1 X97.971 Y87.945 E.11218
G1 X97.971 Y92.055 E.12626
G1 X94.32 Y92.055 E.11218
G1 X94.32 Y88.005 E.12441
; WIPE_START
G1 F12000
M204 S6000
G1 X96.32 Y87.973 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.935 Y92.591 Z5.9 F42000
G1 Z5.5
G1 E.8 F1800
G1 F2730
M204 S5000
G1 X92.935 Y87.409 E.15926
G1 X91.483 Y87.328 E.04469
G1 X91.519 Y86.687 E.01971
G1 X91.791 Y86.702 E.00836
G1 X91.783 Y86.841 E.00426
G1 X93.426 Y86.935 E.05055
G1 X93.439 Y86.966 E.00103
G1 X93.439 Y87.526 E.01723
G1 X98.024 Y87.527 E.1409
G3 X98.39 Y87.915 I-.016 J.382 E.01815
G1 X98.39 Y92.083 E.12808
G3 X98.038 Y92.473 I-.385 J.005 E.01777
G1 X93.439 Y92.474 E.14132
G1 X93.439 Y93.035 E.01723
G1 X93.424 Y93.066 E.00106
G1 X91.783 Y93.159 E.05051
G1 X91.791 Y93.298 E.00426
G1 X91.519 Y93.313 E.00836
G1 X91.483 Y92.672 E.01971
G1 X92.876 Y92.595 E.04284
; WIPE_START
G1 F12000
M204 S6000
G1 X92.899 Y90.595 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.9 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z5.9
G1 X0 Y90.0001 F18000 ; move to safe pos
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
            G0 Z5.9 F4000
            G39.3 S1
            G0 Z5.9 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X93.628 Y91.878 F42000
G1 Z5.5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.23659
G1 F2730
M204 S6000
G1 X93.628 Y88.122 E.05928
M204 S10000
G1 X93.187 Y87.722 F42000
; LINE_WIDTH: 0.15433
G1 F2730
M204 S6000
G1 X93.178 Y87.179 E.00493
G1 X91.693 Y87.087 E.01351
; WIPE_START
G1 F15000
G1 X93.178 Y87.179 E-.56535
G1 X93.186 Y87.691 E-.19465
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.187 Y92.278 Z5.9 F42000
G1 Z5.5
G1 E.8 F1800
; LINE_WIDTH: 0.154354
G1 F2730
M204 S6000
G1 X93.178 Y92.821 E.00493
G1 X91.693 Y92.913 E.01351
; WIPE_START
G1 F15000
G1 X93.178 Y92.821 E-.56535
G1 X93.186 Y92.309 E-.19465
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.639 Y93.053 Z5.9 F42000
G1 Z5.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2730
M204 S6000
G1 X85.966 Y93.09 E.02237
G1 X85.966 Y95.129 E.06763
G2 X86.133 Y95.698 I1.238 J-.055 E.01988
G3 X78.965 Y90.032 I3.397 J-11.665 E.31075
G1 X78.978 Y89.928 E.00348
G3 X86.137 Y84.292 I10.676 J6.197 E.30955
G1 X86.009 Y84.584 E.01057
G2 X85.966 Y84.871 I.857 J.277 E.00967
G1 X85.966 Y86.91 E.06763
G1 X86.666 Y86.949 E.02327
G1 X86.666 Y93.018 E.20133
M204 S10000
G1 X87.058 Y92.918 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2730
M204 S5000
G1 X87.674 Y92.884 E.01897
G1 X87.709 Y93.525 E.01971
G1 X87.435 Y93.54 E.00843
G1 X87.427 Y93.402 E.00425
G1 X86.358 Y93.461 E.03292
G1 X86.358 Y95.12 E.05097
G2 X86.813 Y95.702 I.647 J-.037 E.02416
G2 X90.908 Y95.971 I2.83 J-11.753 E.12672
G1 X93.78 Y95.659 E.08877
G3 X94.01 Y95.645 I.197 J1.277 E.00708
G1 X94.01 Y96.073 E.01317
G3 X93.692 Y96.153 I-1.006 J-3.341 E.01008
G1 X92.204 Y96.407 E.04639
G1 X91.809 Y96.474 E.01229
G1 X91.415 Y96.541 E.01229
G1 X91.021 Y96.608 E.01229
G1 X90.619 Y96.679 E.01253
G1 F2160
G1 X90.4 Y96.714 E.00682
G1 F1920
G3 X90.199 Y96.73 I-.182 J-1.032 E.00621
G1 F2520
G1 X90.076 Y96.638 E.00472
G1 F2730
G1 X89.999 Y96.61 E.00251
G1 X89.931 Y96.596 E.00214
G1 X89.856 Y96.587 E.00231
G1 X89.734 Y96.582 E.00377
G1 X89.422 Y96.582 E.00958
G1 X89.022 Y96.56 E.01229
G1 X88.324 Y96.522 E.02148
G3 X87.218 Y96.363 I1.818 J-16.608 E.03434
G3 X86.553 Y96.218 I2.395 J-12.609 E.02092
G3 X85.741 Y95.989 I3.019 J-12.254 E.02595
G3 X85.02 Y95.736 I3.796 J-11.944 E.02347
G1 X84.389 Y95.46 E.02116
G1 X84.022 Y95.3 E.01229
G1 X83.692 Y95.126 E.01147
G1 X83.338 Y94.939 E.01229
G3 X82.74 Y94.57 I8.489 J-14.433 E.02161
G1 X82.389 Y94.334 E.01299
G1 X82.06 Y94.107 E.01229
G1 X81.877 Y93.964 E.00712
G1 X81.562 Y93.718 E.01229
G3 X81.064 Y93.283 I10.242 J-12.23 E.02032
G1 X80.637 Y92.881 E.01802
G1 X80.195 Y92.399 E.02009
G1 X79.925 Y92.104 E.01229
G1 X79.571 Y91.65 E.01769
G1 X79.325 Y91.334 E.01229
G1 X78.934 Y90.737 E.02195
G1 X78.715 Y90.402 E.01229
G1 X78.652 Y90.295 E.00382
G1 X78.619 Y90.232 E.00219
G3 X78.619 Y89.768 I.529 J-.232 E.01464
G1 X78.652 Y89.705 E.0022
G1 X78.705 Y89.614 E.00325
G1 X78.921 Y89.277 E.01229
G1 X79.207 Y88.833 E.01622
G1 X79.45 Y88.515 E.01229
G1 X79.915 Y87.908 E.02349
G1 X80.185 Y87.613 E.01229
G1 X80.626 Y87.131 E.0201
G1 X80.918 Y86.857 E.01229
G1 X81.225 Y86.568 E.01297
G1 X81.534 Y86.313 E.01229
G1 X81.865 Y86.049 E.013
G3 X82.431 Y85.629 I10.948 J14.152 E.02167
G1 X82.767 Y85.411 E.01229
G1 X83.022 Y85.247 E.00934
G1 X83.371 Y85.05 E.01229
G1 X83.739 Y84.849 E.0129
G3 X84.366 Y84.538 I7.846 J15.007 E.02152
G1 X84.738 Y84.389 E.01229
G1 X85.375 Y84.133 E.02109
G3 X86.101 Y83.902 I4.335 J12.345 E.02341
G1 X86.431 Y83.812 E.01052
G3 X87.54 Y83.58 I3.58 J14.325 E.03482
G3 X88.204 Y83.491 I1.96 J12.034 E.0206
G3 X88.975 Y83.431 I1.345 J12.418 E.02377
G1 X89.386 Y83.424 E.01263
G1 X89.786 Y83.417 E.01229
G1 X89.927 Y83.405 E.00435
G1 X89.999 Y83.389 E.00227
G1 X90.069 Y83.364 E.00227
G1 F2640
G1 X90.209 Y83.273 E.00514
G1 F1920
G1 X90.209 Y83.269 E.00012
G3 X90.331 Y83.277 I.009 J.853 E.00375
G1 F2040
G1 X90.556 Y83.311 E.007
G1 F2730
G1 X91.022 Y83.393 E.01455
G1 X91.417 Y83.461 E.01229
G1 X91.811 Y83.528 E.01229
G1 X92.205 Y83.596 E.01229
G1 X93.833 Y83.877 E.05076
G3 X94.01 Y83.926 I-.265 J1.295 E.00565
G1 X94.01 Y84.355 E.01318
G3 X93.885 Y84.351 I-.029 J-.874 E.00385
G1 X90.714 Y84.009 E.098
G2 X86.809 Y84.299 I-1.069 J12.06 E.12085
G2 X86.358 Y84.88 I.197 J.619 E.02404
G1 X86.358 Y86.539 E.05097
G1 X87.427 Y86.598 E.03292
G1 X87.435 Y86.46 E.00425
G1 X87.709 Y86.475 E.00843
G1 X87.674 Y87.116 E.01971
G1 X87.058 Y87.082 E.01897
G1 X87.058 Y87.736 E.02011
G1 X87.058 Y92.858 E.15738
M204 S10000
G1 X86.862 Y93.181 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.154008
G1 F2730
M204 S6000
G1 X87.492 Y93.146 E.00571
; WIPE_START
G1 F15000
G1 X86.862 Y93.181 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.418 Y95.859 Z5.9 F42000
G1 Z5.5
G1 E.8 F1800
; LINE_WIDTH: 0.236449
G1 F2730
M204 S6000
G1 X86.623 Y95.938 E.00346
; LINE_WIDTH: 0.20225
G2 X89.618 Y96.311 I2.946 J-11.466 E.03929
G1 X89.875 Y96.312 E.00334
; LINE_WIDTH: 0.219491
G1 X90.088 Y96.327 E.00307
; LINE_WIDTH: 0.26931
G1 X90.212 Y96.346 E.00233
; LINE_WIDTH: 0.304208
G1 X90.715 Y96.463 E.01099
M204 S10000
G1 X89.941 Y96.4 F42000
; LINE_WIDTH: 0.347694
G1 F2730
M204 S6000
G1 X90.562 Y96.344 E.0155
; LINE_WIDTH: 0.313568
G1 X90.94 Y96.294 E.00841
; LINE_WIDTH: 0.280999
G1 X91.51 Y96.213 E.01116
; LINE_WIDTH: 0.246528
G1 X92.077 Y96.132 E.00951
; WIPE_START
G1 F15000
G1 X91.51 Y96.213 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.605 Y95.922 Z5.9 F42000
G1 Z5.5
G1 E.8 F1800
; LINE_WIDTH: 0.125466
G1 F2730
M204 S6000
G2 X93.814 Y95.888 I-.424 J-3.288 E.00142
; WIPE_START
G1 F15000
G1 X93.605 Y95.922 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.739 Y88.291 Z5.9 F42000
G1 X93.812 Y84.074 Z5.9
G1 Z5.5
G1 E.8 F1800
; LINE_WIDTH: 0.121301
G1 F2730
M204 S6000
G1 X93.776 Y84.104 E.0003
G1 X93.605 Y84.078 E.00111
; WIPE_START
G1 F15000
G1 X93.776 Y84.104 E-.59894
G1 X93.812 Y84.074 E-.16106
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X89.683 Y83.765 Z5.9 F42000
G1 Z5.5
G1 E.8 F1800
; LINE_WIDTH: 0.295372
G1 F2730
M204 S6000
G1 X90.738 Y83.542 E.02218
; WIPE_START
G1 F15000
G1 X89.683 Y83.765 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.077 Y83.868 Z5.9 F42000
G1 Z5.5
G1 E.8 F1800
; LINE_WIDTH: 0.250451
G1 F2730
M204 S6000
G1 X91.412 Y83.774 E.01137
; LINE_WIDTH: 0.291933
G1 X90.742 Y83.679 E.01373
; LINE_WIDTH: 0.333623
G2 X90.307 Y83.628 I-2.062 J15.626 E.01037
; LINE_WIDTH: 0.331059
G1 X90.29 Y83.549 E.00191
; LINE_WIDTH: 0.286864
G1 X90.273 Y83.469 E.00162
M204 S10000
G1 X90.088 Y83.673 F42000
; LINE_WIDTH: 0.21425
G1 F2730
M204 S6000
G1 X89.796 Y83.69 E.00409
; LINE_WIDTH: 0.20486
G1 X89.41 Y83.691 E.00509
G2 X86.556 Y84.086 I.119 J11.366 E.03812
G1 X86.417 Y84.144 E.00199
; WIPE_START
G1 F15000
G1 X86.556 Y84.086 E-.05728
G1 X87.105 Y83.945 E-.21531
G1 X87.943 Y83.8 E-.32322
G1 X88.373 Y83.755 E-.16419
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.862 Y86.819 Z5.9 F42000
G1 Z5.5
G1 E.8 F1800
; LINE_WIDTH: 0.154009
G1 F2730
M204 S6000
G1 X87.492 Y86.854 E.00571
; WIPE_START
G1 F15000
G1 X86.862 Y86.819 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.594 Y85.774 Z5.9 F42000
G1 Z5.5
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2730
M204 S6000
G3 X85.053 Y85.053 I5.919 J10.138 E.054
G1 X85.617 Y85.617 E.02649
G1 X85.617 Y87.239 E.0538
G1 X86.318 Y87.278 E.02327
G1 X86.318 Y87.925 E.02146
G1 X81.533 Y92.71 E.22446
G2 X85.051 Y94.949 I8.351 J-9.237 E.13898
G1 X85.62 Y94.38 E.02671
G1 X85.617 Y92.761 E.0537
G1 X86.318 Y92.722 E.02329
G1 X86.318 Y92.075 E.02147
G1 X81.534 Y87.291 E.22442
G2 X80.415 Y88.472 I18.433 J18.582 E.05396
; CHANGE_LAYER
; Z_HEIGHT: 5.7
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X81.534 Y87.291 E-.61809
G1 X81.798 Y87.555 E-.14192
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 29/111
; update layer progress
M73 L29
M991 S0 P28 ;notify layer change

; OBJECT_ID: 427
M204 S10000
G17
G3 Z5.9 I-.035 J1.216 P1  F42000
G1 X93.928 Y87.901 Z5.9
G1 Z5.7
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2622
M204 S6000
G1 X93.928 Y92.099 E.13927
G1 X93.333 Y92.099 E.01975
G1 X93.333 Y87.901 E.13927
G1 X93.868 Y87.901 E.01776
M204 S10000
G1 X94.32 Y87.945 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2622
M204 S5000
G1 X97.971 Y87.945 E.11218
G1 X97.971 Y92.055 E.12626
G1 X94.32 Y92.055 E.11218
G1 X94.32 Y88.005 E.12441
; WIPE_START
G1 F12000
M204 S6000
G1 X96.32 Y87.973 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.941 Y92.596 Z6.1 F42000
G1 Z5.7
G1 E.8 F1800
G1 F2622
M204 S5000
G1 X92.941 Y87.404 E.15956
G1 X91.489 Y87.323 E.04469
G1 X91.525 Y86.682 E.01971
G1 X91.796 Y86.697 E.00836
G1 X91.788 Y86.836 E.00426
G1 X93.431 Y86.93 E.05055
G1 X93.444 Y86.961 E.00103
G1 X93.444 Y87.509 E.01684
G1 X98.018 Y87.509 E.14054
G3 X98.408 Y87.898 I.004 J.387 E.01885
G1 X98.408 Y92.101 E.12916
G3 X98.055 Y92.49 I-.385 J.005 E.01776
G1 X93.444 Y92.491 E.14169
G1 X93.444 Y93.039 E.01684
G1 X93.429 Y93.071 E.00106
G1 X91.788 Y93.164 E.05051
G1 X91.796 Y93.303 E.00426
G1 X91.525 Y93.318 E.00836
G1 X91.489 Y92.677 E.01971
G1 X92.881 Y92.6 E.04284
; WIPE_START
G1 F12000
M204 S6000
G1 X92.904 Y90.6 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.1 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z6.1
M106 S255
G1 X0 Y90.0001 F18000 ; move to safe pos
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
            G0 Z6.1 F4000
            G39.3 S1
            G0 Z6.1 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X93.63 Y91.896 F42000
G1 Z5.7
M73 P55 R8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.231351
G1 F2622
M204 S6000
G1 X93.63 Y88.104 E.05822
M204 S10000
G1 X93.192 Y87.705 F42000
; LINE_WIDTH: 0.154335
G1 F2622
M204 S6000
G1 X93.183 Y87.174 E.00482
G1 X91.698 Y87.083 E.01351
; WIPE_START
G1 F15000
G1 X93.183 Y87.174 E-.56536
G1 X93.192 Y87.686 E-.19464
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.192 Y92.295 Z6.1 F42000
G1 Z5.7
G1 E.8 F1800
; LINE_WIDTH: 0.154341
G1 F2622
M204 S6000
G1 X93.183 Y92.826 E.00482
G1 X91.698 Y92.917 E.01351
; WIPE_START
G1 F15000
G1 X93.183 Y92.826 E-.56536
G1 X93.192 Y92.314 E-.19464
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.623 Y93.059 Z6.1 F42000
G1 Z5.7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2622
M204 S6000
G1 X85.824 Y93.103 E.02654
G1 X85.824 Y95.185 E.06905
G2 X85.994 Y95.737 I1.226 J-.075 E.01934
G3 X78.83 Y90.033 I3.523 J-11.776 E.31127
G1 X78.838 Y89.936 E.00323
G3 X85.992 Y84.265 I10.75 J6.214 E.31009
G1 X85.875 Y84.529 E.00957
G2 X85.824 Y84.815 I.88 J.303 E.00968
G1 X85.824 Y86.897 E.06905
G1 X86.65 Y86.943 E.02744
G1 X86.65 Y93.024 E.20174
M204 S10000
G1 X87.042 Y92.924 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2622
M204 S5000
G1 X87.659 Y92.89 E.01897
G1 X87.693 Y93.531 E.01971
G1 X87.419 Y93.546 E.00843
G1 X87.412 Y93.408 E.00425
G1 X86.216 Y93.474 E.03678
G1 X86.216 Y95.165 E.05195
G2 X86.723 Y95.758 I.638 J-.032 E.02579
G2 X90.762 Y96.042 I2.856 J-11.749 E.12501
G1 X92.749 Y95.837 E.06137
G1 X92.749 Y96.281 E.01365
G3 X92.502 Y96.348 I-.488 J-1.298 E.00788
G1 X91.338 Y96.547 E.03627
G1 X90.944 Y96.614 E.01229
G1 X90.55 Y96.682 E.01229
G1 X90.156 Y96.749 E.01229
G1 X89.844 Y96.793 E.00967
G1 F1800
G1 X89.555 Y96.828 E.00894
M106 S201.45
M106 S255
G1 F1560
G1 X89.433 Y96.835 E.00376
M106 S201.45
M106 S255
G1 F1440
G1 X89.394 Y96.835 E.0012
M106 S201.45
M106 S255
G1 F1800
G1 X89.395 Y96.794 E.00125
M106 S201.45
M106 S255
G1 F2622
G1 X89.255 Y96.695 E.00527
G1 X89.197 Y96.668 E.00196
G1 X89.126 Y96.648 E.00226
G1 X88.995 Y96.627 E.0041
G1 X88.481 Y96.594 E.01582
G1 X88.083 Y96.55 E.01229
G1 X87.702 Y96.507 E.01178
G1 X87.256 Y96.435 E.0139
G3 X86.475 Y96.268 I2.207 J-12.249 E.02454
G3 X85.638 Y96.031 I3.022 J-12.257 E.02673
G3 X84.931 Y95.781 I3.801 J-11.897 E.02304
G3 X84.178 Y95.462 I4.558 J-11.807 E.02514
G3 X83.755 Y95.255 I5.891 J-12.598 E.01447
G1 X83.486 Y95.11 E.0094
G1 X83.134 Y94.919 E.01229
G1 X82.718 Y94.657 E.0151
G1 X82.38 Y94.444 E.01229
G3 X82.046 Y94.208 I8.299 J-12.073 E.01256
G1 X81.706 Y93.946 E.0132
G1 X81.39 Y93.7 E.01229
G3 X80.772 Y93.149 I9.355 J-11.114 E.02545
G1 X80.434 Y92.819 E.01452
G1 X80.068 Y92.416 E.01672
G1 X79.799 Y92.12 E.01229
G1 X79.538 Y91.79 E.01294
G1 X79.29 Y91.476 E.01229
G3 X78.891 Y90.899 I12.284 J-8.941 E.02155
G1 X78.64 Y90.506 E.01433
G1 X78.517 Y90.299 E.00741
G3 X78.461 Y90.174 I.487 J-.293 E.0042
G1 X78.445 Y90.111 E.00202
G3 X78.439 Y89.92 I.626 J-.113 E.00588
G3 X78.472 Y89.796 I.554 J.077 E.00396
G1 X78.499 Y89.735 E.00205
G1 X78.632 Y89.508 E.00807
G1 X78.753 Y89.311 E.00712
G1 X79.009 Y88.92 E.01434
G1 X79.246 Y88.598 E.01229
G1 X79.567 Y88.167 E.01653
G3 X79.865 Y87.803 I11.367 J8.996 E.01445
G1 X80.18 Y87.451 E.01452
G3 X80.759 Y86.861 I10.699 J9.913 E.02539
G1 X81.11 Y86.542 E.01458
G3 X81.748 Y86.013 I9.49 J10.808 E.02548
G1 X82.073 Y85.779 E.01229
G1 X82.421 Y85.528 E.01318
G1 X82.76 Y85.316 E.01229
G1 X83.122 Y85.089 E.01313
G1 X83.535 Y84.86 E.0145
G3 X84.271 Y84.495 I6.829 J12.854 E.02526
G3 X85.028 Y84.182 I5.155 J11.376 E.02516
G3 X85.686 Y83.954 I4.696 J12.485 E.02143
G1 X86.078 Y83.837 E.01256
G3 X86.909 Y83.633 I3.434 J12.21 E.0263
G3 X87.691 Y83.495 I2.514 J11.922 E.0244
G1 X88.074 Y83.451 E.01184
G1 X88.471 Y83.407 E.01229
G1 X88.994 Y83.372 E.01608
G1 X89.127 Y83.352 E.00414
G1 X89.196 Y83.332 E.00222
G1 X89.267 Y83.3 E.00237
G1 F2520
G1 X89.391 Y83.198 E.00494
G1 F1609.116
G1 X89.391 Y83.167 E.00096
M106 S201.45
M106 S255
G1 F1440
G1 X89.449 Y83.165 E.00178
M106 S201.45
M106 S255
G1 F1560
G1 X89.582 Y83.175 E.00409
M106 S201.45
G1 F2040
G1 X90.03 Y83.231 E.01386
G1 F2622
G1 X90.166 Y83.252 E.00425
G1 X90.561 Y83.32 E.01229
G1 X90.955 Y83.387 E.01229
G1 X92.499 Y83.663 E.04819
G3 X92.738 Y83.713 I-8.61 J42.022 E.0075
G1 X92.749 Y84.165 E.01389
G1 X92.663 Y84.162 E.00266
G2 X90.268 Y83.92 I-5.373 J41.191 E.07396
G2 X86.608 Y84.28 I-.649 J12.162 E.11345
G2 X86.216 Y84.835 I.238 J.584 E.02205
G1 X86.216 Y86.526 E.05194
G1 X87.412 Y86.592 E.03678
G1 X87.419 Y86.454 E.00425
G1 X87.693 Y86.469 E.00843
G1 X87.659 Y87.11 E.01971
G1 X87.042 Y87.076 E.01896
G1 X87.042 Y87.789 E.02191
G1 X87.042 Y92.864 E.15596
M204 S10000
G1 X86.846 Y93.187 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.154009
G1 F2622
M204 S6000
G1 X87.476 Y93.152 E.00571
; WIPE_START
G1 F15000
G1 X86.846 Y93.187 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.278 Y95.889 Z6.1 F42000
G1 Z5.7
G1 E.8 F1800
; LINE_WIDTH: 0.2002
G1 F2622
M204 S6000
G1 X86.41 Y95.948 E.00186
G2 X88.502 Y96.324 I2.84 J-9.801 E.02729
G1 X89.021 Y96.357 E.00666
; LINE_WIDTH: 0.212627
G1 X89.307 Y96.393 E.00399
M204 S10000
G1 X89.242 Y96.477 F42000
; LINE_WIDTH: 0.362072
G1 F2622
M204 S6000
G2 X89.974 Y96.433 I-.723 J-17.903 E.01907
; LINE_WIDTH: 0.309361
G1 X90.369 Y96.394 E.0086
; LINE_WIDTH: 0.26476
G1 X90.99 Y96.313 E.01132
; WIPE_START
G1 F15000
G1 X90.369 Y96.394 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X89.984 Y96.575 Z6.1 F42000
G1 Z5.7
G1 E.8 F1800
; LINE_WIDTH: 0.290498
G1 F2622
M204 S6000
G1 X88.907 Y96.277 E.02254
; WIPE_START
G1 F15000
G1 X89.984 Y96.575 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.163 Y91.639 Z6.1 F42000
G1 X80.337 Y88.394 Z6.1
G1 Z5.7
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2622
M204 S6000
G3 X81.463 Y87.22 I17.615 J15.777 E.05398
G1 X86.302 Y92.059 E.22701
G1 X86.302 Y92.728 E.02219
G1 X85.476 Y92.774 E.02744
G1 X85.476 Y94.524 E.05805
G1 X84.995 Y95.005 E.02255
G3 X81.463 Y92.78 I4.983 J-11.831 E.1391
G1 X86.302 Y87.941 E.22701
G1 X86.302 Y87.272 E.02219
G1 X85.476 Y87.226 E.02744
G1 X85.476 Y85.476 E.05805
G1 X84.996 Y84.996 E.02251
G2 X83.536 Y85.712 I4.505 J11.043 E.054
; WIPE_START
G1 F15476.087
G1 X84.996 Y84.996 E-.61807
G1 X85.26 Y85.26 E-.14193
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.476 Y86.848 Z6.1 F42000
G1 Z5.7
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.154009
G1 F2622
M204 S6000
G1 X86.847 Y86.813 E.00571
; WIPE_START
G1 F15000
G1 X87.476 Y86.848 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.278 Y84.104 Z6.1 F42000
G1 Z5.7
G1 E.8 F1800
; LINE_WIDTH: 0.200274
G1 F2622
M204 S6000
G1 X86.487 Y84.023 E.00287
G3 X88.511 Y83.675 I2.905 J10.835 E.02637
G1 X89.193 Y83.625 E.00876
; LINE_WIDTH: 0.25664
G2 X90.074 Y83.436 I-1.55 J-9.349 E.01569
M204 S10000
G1 X89.976 Y83.422 F42000
; LINE_WIDTH: 0.300287
G1 F2622
M204 S6000
G1 X88.932 Y83.722 E.02277
M204 S10000
G1 X89.501 Y83.366 F42000
; LINE_WIDTH: 0.356811
G1 F2622
M204 S6000
G1 X89.55 Y83.538 E.00457
G1 X89.976 Y83.567 E.01091
; LINE_WIDTH: 0.313575
G1 X90.286 Y83.597 E.00687
; LINE_WIDTH: 0.269302
G3 X90.789 Y83.658 I-4.156 J36.686 E.00934
G1 X90.99 Y83.686 E.00375
; CHANGE_LAYER
; Z_HEIGHT: 5.9
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X90.789 Y83.658 E-.21765
G1 X90.286 Y83.597 E-.54235
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 30/111
; update layer progress
M73 L30
M991 S0 P29 ;notify layer change

; OBJECT_ID: 427
M204 S10000
G17
G3 Z6.1 I-.933 J.781 P1  F42000
G1 X93.928 Y87.946 Z6.1
G1 Z5.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2719
M204 S6000
G1 X93.928 Y92.117 E.13836
G1 X93.338 Y92.117 E.01958
G1 X93.338 Y87.883 E.14043
G1 X93.928 Y87.883 E.01958
G1 X93.928 Y87.886 E.00007
M204 S10000
G1 X94.32 Y87.945 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2719
M204 S5000
G1 X97.971 Y87.945 E.11218
G1 X97.971 Y92.055 E.12626
G1 X94.32 Y92.055 E.11218
G1 X94.32 Y88.005 E.12441
; WIPE_START
G1 F12000
M204 S6000
G1 X96.32 Y87.973 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.946 Y92.601 Z6.3 F42000
G1 Z5.9
G1 E.8 F1800
G1 F2719
M204 S5000
G1 X92.946 Y87.399 E.15986
G1 X91.494 Y87.318 E.04469
G1 X91.53 Y86.677 E.01971
G1 X91.802 Y86.692 E.00836
G1 X91.794 Y86.831 E.00426
G1 X93.436 Y86.925 E.05055
G1 X93.449 Y86.956 E.00104
G1 X93.449 Y87.491 E.01646
G1 X98.035 Y87.491 E.14093
G3 X98.425 Y87.88 I.003 J.387 E.01883
G1 X98.425 Y92.119 E.13025
G3 X98.073 Y92.508 I-.385 J.005 E.01775
G1 X93.449 Y92.509 E.14207
G1 X93.449 Y93.044 E.01645
G1 X93.435 Y93.076 E.00106
G1 X91.794 Y93.169 E.05051
G1 X91.802 Y93.308 E.00426
G1 X91.53 Y93.323 E.00836
G1 X91.494 Y92.682 E.01971
G1 X92.886 Y92.605 E.04284
; WIPE_START
G1 F12000
M204 S6000
G1 X92.909 Y90.605 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.3 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z6.3
G1 X0 Y90.0001 F18000 ; move to safe pos
M106 S255
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
            G0 Z6.3 F4000
            G39.3 S1
            G0 Z6.3 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X93.633 Y91.913 F42000
G1 Z5.9
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.226111
G1 F2719
M204 S6000
G1 X93.633 Y88.087 E.05712
M204 S10000
G1 X93.197 Y87.687 F42000
; LINE_WIDTH: 0.154331
G1 F2719
M204 S6000
G1 X93.189 Y87.169 E.0047
G1 X91.704 Y87.078 E.01351
; WIPE_START
G1 F15000
G1 X93.189 Y87.169 E-.56536
G1 X93.197 Y87.681 E-.19464
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.124 Y87.718 Z6.3 F42000
G1 Z5.9
G1 E.8 F1800
; LINE_WIDTH: 0.10502
G1 F2719
M204 S6000
G1 X98.026 Y87.718 E.01974
G3 X98.118 Y87.727 I.01 J.401 E.00047
M204 S10000
G1 X98.19 Y87.801 F42000
; LINE_WIDTH: 0.104967
G1 F2719
M204 S6000
G3 X98.198 Y87.888 I-.346 J.077 E.00044
G1 X98.198 Y92.109 E.02134
G3 X98.19 Y92.201 I-.404 J.01 E.00047
M204 S10000
G1 X98.118 Y92.273 F42000
; LINE_WIDTH: 0.10434
G1 F2719
M204 S6000
G1 X94.124 Y92.282 E.01999
M204 S10000
G1 X93.197 Y92.313 F42000
; LINE_WIDTH: 0.154336
G1 F2719
M204 S6000
G1 X93.189 Y92.831 E.0047
G1 X91.704 Y92.922 E.01351
; WIPE_START
G1 F15000
G1 X93.189 Y92.831 E-.56536
G1 X93.197 Y92.319 E-.19464
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.608 Y93.065 Z6.3 F42000
G1 Z5.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2719
M204 S6000
G1 X85.683 Y93.116 E.03072
G1 X85.683 Y95.217 E.06969
G1 X85.701 Y95.39 E.00575
G1 X85.816 Y95.744 E.01237
G3 X78.701 Y90.035 I3.651 J-11.838 E.30992
G1 X78.71 Y89.933 E.0034
G3 X85.818 Y84.249 I10.838 J6.267 E.30898
G1 X85.701 Y84.61 E.0126
G1 X85.683 Y84.783 E.00575
G1 X85.683 Y86.884 E.0697
G1 X86.635 Y86.937 E.03161
G1 X86.635 Y93.03 E.20214
M204 S10000
G1 X87.027 Y92.93 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2719
M204 S5000
G1 X87.643 Y92.896 E.01897
G1 X87.677 Y93.537 E.01971
G1 X87.403 Y93.552 E.00843
G1 X87.396 Y93.414 E.00425
G1 X86.075 Y93.487 E.04065
G1 X86.075 Y95.197 E.05255
G2 X86.689 Y95.821 I.674 J-.05 E.02922
G2 X90.512 Y96.115 I2.84 J-11.917 E.11831
G1 X91.662 Y96.003 E.03549
G1 X91.661 Y96.47 E.01435
G3 X91.381 Y96.543 I-.495 J-1.318 E.00893
G1 X90.457 Y96.698 E.02879
G1 X90.062 Y96.764 E.01229
G1 X89.75 Y96.8 E.00965
G1 X89.353 Y96.847 E.01229
G1 F2160
G1 X88.949 Y96.885 E.01246
G1 F1200
G1 X88.771 Y96.898 E.00548
M106 S201.45
M106 S255
G1 F1080
G1 X88.663 Y96.9 E.00333
M106 S201.45
M106 S255
G1 F960
G1 X88.627 Y96.897 E.00113
M106 S201.45
M106 S255
G1 F1440
G1 X88.626 Y96.818 E.00242
M106 S201.45
M106 S255
G1 F2337.492
G1 X88.515 Y96.717 E.00461
G1 F2719
G1 X88.449 Y96.682 E.00231
G1 X88.382 Y96.658 E.0022
G1 X88.256 Y96.63 E.00396
G1 X87.743 Y96.569 E.01586
M73 P56 R8
G1 X87.327 Y96.505 E.01293
G3 X86.62 Y96.366 I2.392 J-14.018 E.02217
G1 X86.171 Y96.254 E.01421
G3 X84.95 Y95.863 I3.598 J-13.314 E.03939
G3 X83.976 Y95.449 I5.088 J-13.341 E.03252
G3 X82.931 Y94.893 I6.034 J-12.586 E.0364
G1 X82.627 Y94.706 E.01096
G3 X82.036 Y94.307 I7.625 J-11.945 E.02193
G1 X81.651 Y94.024 E.01467
G3 X81.308 Y93.747 I8.907 J-11.441 E.01355
G1 X81.044 Y93.518 E.01073
G1 X80.743 Y93.255 E.01229
G1 X80.353 Y92.863 E.01697
G1 X80.071 Y92.58 E.01229
G3 X79.529 Y91.954 I9.644 J-8.896 E.02547
G1 X79.2 Y91.518 E.01676
G1 X78.96 Y91.199 E.01229
G1 X78.668 Y90.746 E.01655
G1 X78.451 Y90.41 E.01229
G1 X78.39 Y90.304 E.00375
G3 X78.332 Y90.176 I.572 J-.332 E.00432
G1 X78.316 Y90.113 E.00202
G3 X78.31 Y89.919 I.64 J-.115 E.00598
G3 X78.343 Y89.792 I.564 J.079 E.00403
G1 X78.37 Y89.731 E.00205
G1 X78.564 Y89.404 E.01168
G1 X78.785 Y89.071 E.01229
G1 X79.017 Y88.719 E.01295
G1 X79.26 Y88.402 E.01229
G1 X79.598 Y87.974 E.01674
G3 X80.14 Y87.345 I13.971 J11.491 E.0255
G1 X80.423 Y87.063 E.01229
G1 X80.73 Y86.758 E.0133
G1 X81.032 Y86.496 E.01229
G1 X81.424 Y86.156 E.01594
G1 X81.744 Y85.915 E.01229
G1 X82.124 Y85.638 E.01446
G3 X82.716 Y85.239 I10.191 J14.491 E.02194
G1 X83.061 Y85.037 E.01229
G1 X83.332 Y84.879 E.00962
G3 X83.964 Y84.556 I6.074 J11.119 E.02181
G3 X84.687 Y84.24 I5.679 J11.977 E.02426
G1 X85.048 Y84.101 E.0119
G3 X86.159 Y83.749 I4.826 J13.292 E.03582
M73 P56 R7
G3 X87.024 Y83.549 I3.36 J12.59 E.02727
G1 X87.337 Y83.497 E.00974
G1 X87.731 Y83.432 E.01229
G1 X88.256 Y83.37 E.01622
G1 X88.382 Y83.342 E.00397
G1 X88.448 Y83.318 E.00217
G1 F2709.779
G1 X88.515 Y83.283 E.00231
G1 F2194.489
G1 X88.626 Y83.18 E.00466
G1 F1321.263
G1 X88.626 Y83.103 E.00238
M106 S201.45
M106 S255
G1 F960
G1 X88.662 Y83.1 E.00111
M106 S201.45
M106 S255
G1 F1080
G1 X88.764 Y83.102 E.00313
M106 S201.45
M106 S255
G1 F1440
G1 X89.141 Y83.131 E.01162
M106 S201.45
G1 F2719
G1 X89.35 Y83.152 E.00646
G1 X89.747 Y83.205 E.01229
G1 X90.143 Y83.258 E.01229
G1 X90.637 Y83.325 E.01533
G3 X91.661 Y83.529 I-3.15 J18.499 E.03208
G1 X91.662 Y83.999 E.01443
G1 X91.599 Y83.996 E.00192
G2 X87.944 Y83.947 I-2.021 J14.405 E.11262
G2 X86.474 Y84.242 I1.248 J10.053 E.04612
G2 X86.075 Y84.802 I.232 J.587 E.02234
G1 X86.075 Y86.513 E.05256
G1 X87.396 Y86.586 E.04065
G1 X87.403 Y86.448 E.00425
G1 X87.677 Y86.463 E.00842
G1 X87.643 Y87.104 E.01971
G1 X87.027 Y87.07 E.01897
G1 X87.026 Y88.645 E.04841
G1 X87.027 Y92.87 E.12983
M204 S10000
G1 X86.831 Y93.193 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.153998
G1 F2719
M204 S6000
G1 X87.461 Y93.158 E.00571
; WIPE_START
G1 F15000
G1 X86.831 Y93.193 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.35 Y96.01 Z6.3 F42000
G1 Z5.9
G1 E.8 F1800
; LINE_WIDTH: 0.193338
G1 F2719
M204 S6000
G2 X87.799 Y96.305 I2.751 J-9.813 E.01815
G1 X88.334 Y96.369 E.0066
; LINE_WIDTH: 0.213565
G1 X88.576 Y96.414 E.00343
M204 S10000
G1 X88.556 Y96.516 F42000
; LINE_WIDTH: 0.397845
G1 F2719
M204 S6000
G2 X89.072 Y96.509 I-.064 J-23.516 E.01494
; LINE_WIDTH: 0.351667
G1 X89.495 Y96.493 E.01065
; LINE_WIDTH: 0.301543
G2 X89.812 Y96.472 I-.495 J-9.939 E.00669
G1 X90.024 Y96.455 E.00449
M204 S10000
G1 X89.288 Y96.656 F42000
; LINE_WIDTH: 0.290122
G1 F2719
M204 S6000
G2 X88.055 Y96.263 I-4.384 J11.651 E.02609
; WIPE_START
G1 F15000
G1 X88.688 Y96.447 E-.38716
G1 X89.288 Y96.656 E-.37284
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.35 Y96.01 Z6.3 F42000
G1 Z5.9
G1 E.8 F1800
; LINE_WIDTH: 0.239874
G1 F2719
M204 S6000
G1 X86.069 Y95.888 E.00492
; WIPE_START
G1 F15000
G1 X86.35 Y96.01 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.263 Y91.679 Z6.3 F42000
G1 Z5.9
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2719
M204 S6000
G2 X81.398 Y92.845 I8.612 J-7.25 E.05402
G1 X86.286 Y87.957 E.2293
G1 X86.286 Y87.266 E.02291
G1 X85.335 Y87.213 E.03162
G1 X85.335 Y85.335 E.0623
G1 X84.938 Y84.938 E.01861
G2 X81.397 Y87.154 I4.997 J11.925 E.13918
G1 X86.286 Y92.043 E.22937
G1 X86.286 Y92.734 E.02292
G1 X85.335 Y92.787 E.03162
G1 X85.335 Y94.665 E.0623
G1 X84.938 Y95.062 E.0186
G3 X83.475 Y94.35 I12.752 J-28.1 E.05398
; WIPE_START
G1 F15476.087
G1 X84.938 Y95.062 E-.61825
G1 X85.202 Y94.798 E-.14176
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.726 Y87.319 Z6.3 F42000
G1 X86.831 Y86.807 Z6.3
G1 Z5.9
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.15399
G1 F2719
M204 S6000
G1 X87.461 Y86.842 E.00571
; WIPE_START
G1 F15000
G1 X86.831 Y86.807 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.359 Y83.987 Z6.3 F42000
G1 Z5.9
G1 E.8 F1800
; LINE_WIDTH: 0.23818
G1 F2719
M204 S6000
G1 X86.069 Y84.11 E.005
M204 S10000
G1 X86.359 Y83.987 F42000
; LINE_WIDTH: 0.193907
G1 F2719
M204 S6000
G3 X87.909 Y83.681 I2.91 J10.676 E.01945
G1 X88.438 Y83.614 E.00656
; LINE_WIDTH: 0.222731
G1 X88.574 Y83.586 E.00204
M204 S10000
G1 X88.557 Y83.482 F42000
; LINE_WIDTH: 0.391465
G1 F2719
M204 S6000
G1 X89.073 Y83.49 E.01466
; LINE_WIDTH: 0.354885
G3 X89.46 Y83.505 I-.423 J15.963 E.00986
; LINE_WIDTH: 0.302906
G3 X89.811 Y83.528 I-.694 J13.302 E.00745
G1 X90.024 Y83.545 E.00454
M204 S10000
G1 X89.208 Y83.335 F42000
; LINE_WIDTH: 0.317515
G1 F2719
M204 S6000
G3 X88.226 Y83.72 I-4.04 J-8.858 E.0236
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 6.1
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X88.719 Y83.542 E-.37748
G1 X89.208 Y83.335 E-.38252
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 31/111
; update layer progress
M73 L31
M991 S0 P30 ;notify layer change

; OBJECT_ID: 427
M204 S10000
G17
G3 Z6.3 I-1.175 J-.316 P1  F42000
G1 X86.592 Y93.071 Z6.3
G1 Z6.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2764
M204 S6000
G1 X85.542 Y93.129 E.03489
G1 X85.542 Y95.246 E.07021
G1 X85.56 Y95.417 E.0057
G1 X85.669 Y95.762 E.01201
G3 X78.58 Y90.048 I3.766 J-11.926 E.30913
G1 X78.574 Y89.998 E.00168
G3 X78.707 Y89.719 I.668 J.147 E.01034
G3 X85.672 Y84.237 I10.769 J6.518 E.30046
G1 X85.56 Y84.581 E.01199
G1 X85.542 Y84.754 E.00577
G1 X85.542 Y86.871 E.07022
G1 X86.619 Y86.93 E.03578
G1 X86.619 Y93.037 E.20255
M204 S10000
G1 X87.011 Y92.937 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2764
M204 S5000
G1 X87.627 Y92.902 E.01897
G1 X87.661 Y93.543 E.01971
G1 X87.388 Y93.558 E.00843
G1 X87.38 Y93.42 E.00425
G1 X85.934 Y93.5 E.04451
G1 X85.934 Y95.225 E.053
G2 X86.395 Y95.812 I.652 J-.038 E.02439
G2 X90.696 Y96.148 I3.109 J-12.094 E.13324
G1 X90.696 Y96.644 E.01525
G3 X90.013 Y96.773 I-2.328 J-10.443 E.02136
G1 X89.77 Y96.797 E.00751
G1 X89.373 Y96.84 E.01229
G1 X88.975 Y96.883 E.01229
G1 X88.586 Y96.909 E.01199
G1 F1434.191
G1 X88.513 Y96.914 E.00222
G1 F1080
G1 X88.046 Y96.932 E.01439
M106 S201.45
M106 S255
G1 F840
G1 X88.046 Y96.894 E.00118
M106 S201.45
M106 S255
G1 F1162.488
G1 X88.031 Y96.822 E.00227
M106 S201.45
M106 S255
G1 F1583.646
G1 X87.99 Y96.751 E.00253
G1 F2048.96
G1 X87.933 Y96.696 E.00243
G1 F2764
G1 X87.839 Y96.645 E.00329
G1 X87.747 Y96.622 E.00291
G1 X87.217 Y96.542 E.01647
G1 X86.878 Y96.478 E.01058
G3 X86.089 Y96.294 I2.434 J-12.183 E.02491
G3 X85.194 Y96.019 I3.401 J-12.696 E.02879
G3 X84.423 Y95.725 I4.274 J-12.324 E.02535
G3 X83.775 Y95.431 I5.009 J-11.919 E.02186
G3 X83.142 Y95.101 I5.732 J-11.765 E.02194
G3 X82.526 Y94.734 I6.321 J-11.316 E.02204
G1 X82.263 Y94.557 E.00976
G1 X81.931 Y94.334 E.01229
G3 X81.361 Y93.895 I10.614 J-14.367 E.0221
G1 X81.024 Y93.615 E.01348
G1 X80.72 Y93.355 E.01229
G3 X80.385 Y93.036 I9.624 J-10.437 E.01421
G1 X80.153 Y92.797 E.01022
G1 X79.876 Y92.508 E.01229
G3 X79.563 Y92.147 I10.92 J-9.779 E.01467
G1 X79.223 Y91.715 E.01693
G1 X78.976 Y91.399 E.01229
G1 X78.802 Y91.145 E.00948
G1 X78.576 Y90.814 E.01229
G3 X78.269 Y90.312 I12.012 J-7.693 E.01809
G3 X78.221 Y90.211 I.571 J-.336 E.00344
G3 X78.182 Y90.031 I.627 J-.228 E.00567
G3 X78.187 Y89.916 I.573 J-.033 E.00354
G3 X78.234 Y89.757 I.685 J.113 E.0051
G1 X78.267 Y89.692 E.00227
G1 X78.371 Y89.516 E.00628
G1 X78.589 Y89.18 E.01229
G1 X78.831 Y88.809 E.01362
G3 X79.097 Y88.437 I12.238 J8.468 E.01404
G1 X79.401 Y88.049 E.01515
G3 X79.864 Y87.505 I11.09 J8.984 E.02195
G1 X80.142 Y87.217 E.01229
G1 X80.45 Y86.906 E.01346
G3 X80.976 Y86.418 I11.402 J11.741 E.02205
G1 X81.287 Y86.167 E.01229
G1 X81.711 Y85.827 E.0167
G1 X82.04 Y85.6 E.01229
G1 X82.513 Y85.274 E.01764
G3 X83.129 Y84.906 I7.128 J11.241 E.02206
G3 X83.763 Y84.575 I6.154 J10.997 E.02197
G3 X84.411 Y84.281 I5.65 J11.59 E.02186
G3 X85.182 Y83.985 I4.848 J11.481 E.02537
G1 X85.628 Y83.839 E.01445
G3 X86.965 Y83.504 I4.21 J13.985 E.04235
G1 X87.319 Y83.441 E.01105
G1 X87.746 Y83.378 E.01328
G1 X87.838 Y83.355 E.00291
G1 X87.933 Y83.304 E.00329
G1 F2066.873
G1 X87.99 Y83.249 E.00246
G1 F1592.559
G1 X88.033 Y83.175 E.00261
G1 F1157.305
G1 X88.046 Y83.103 E.00223
M106 S201.45
M106 S255
G1 F840
G1 X88.046 Y83.067 E.00112
M106 S201.45
M106 S255
G1 F600
G1 X88.054 Y83.067 E.00024
M106 S201.45
M106 S255
G1 F1080
G1 X88.464 Y83.083 E.01263
M106 S201.45
G1 F1703.483
G1 X88.585 Y83.091 E.00373
G1 F2764
G1 X88.984 Y83.124 E.01229
G1 X89.543 Y83.171 E.01722
G1 X89.938 Y83.228 E.01229
G1 X90.598 Y83.324 E.02048
G1 X90.696 Y83.356 E.00317
G1 X90.696 Y83.852 E.01526
G2 X86.392 Y84.189 I-1.197 J12.375 E.13335
G2 X85.934 Y84.775 I.194 J.624 E.02429
G1 X85.934 Y86.5 E.05301
G1 X87.38 Y86.58 E.04452
G1 X87.388 Y86.442 E.00425
G1 X87.661 Y86.457 E.00842
G1 X87.627 Y87.098 E.01971
G1 X87.011 Y87.063 E.01897
G1 X87.011 Y88.783 E.05284
G1 X87.011 Y92.877 E.12578
; WIPE_START
G1 F12000
M204 S6000
G1 X87.627 Y92.902 E-.23438
G1 X87.661 Y93.543 E-.2438
G1 X87.388 Y93.558 E-.10422
G1 X87.38 Y93.42 E-.05255
G1 X87.052 Y93.438 E-.12505
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.5 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z6.5
G1 X0 Y90.0001 F18000 ; move to safe pos
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
            G0 Z6.5 F4000
            G39.3 S1
            G0 Z6.5 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X86.815 Y93.199 F42000
G1 Z6.1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.153997
G1 F2764
M204 S6000
G1 X87.445 Y93.164 E.00571
; WIPE_START
G1 F15000
G1 X86.815 Y93.199 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.666 Y96.269 Z6.5 F42000
G1 Z6.1
G1 E.8 F1800
; LINE_WIDTH: 0.275364
G1 F2764
M204 S6000
G1 X88.782 Y96.7 E.02266
M204 S10000
G1 X89.146 Y96.532 F42000
; LINE_WIDTH: 0.344443
G1 F2764
M204 S6000
G3 X88.788 Y96.54 I-.561 J-17.046 E.0088
; LINE_WIDTH: 0.379738
G1 X88.494 Y96.54 E.00809
; LINE_WIDTH: 0.400745
G1 X88.311 Y96.536 E.00534
G2 X87.881 Y96.298 I-2.001 J3.103 E.01433
M204 S10000
G1 X88.046 Y96.42 F42000
; LINE_WIDTH: 0.220753
G1 F2764
M204 S6000
G1 X88.043 Y96.419 E.00004
G2 X87.928 Y96.384 I-.336 J.883 E.00175
; LINE_WIDTH: 0.189968
G1 X87.294 Y96.283 E.00769
G3 X86.163 Y96.019 I1.275 J-8.036 E.01393
; LINE_WIDTH: 0.239308
G1 X85.921 Y95.91 E.00425
; WIPE_START
G1 F15000
G1 X86.163 Y96.019 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.767 Y93.645 Z6.5 F42000
G1 Z6.1
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2764
M204 S6000
G3 X81.846 Y92.959 I6.916 J-10.245 E.03809
G1 X81.904 Y92.902 E.00269
G3 X81.603 Y92.64 I2.411 J-3.079 E.01323
G1 X85.894 Y88.349 E.20129
G1 X85.894 Y91.651 E.10951
G1 X81.602 Y87.359 E.20134
G1 X81.156 Y87.767 E.02004
G1 X80.895 Y87.505 E.01226
G1 X80.447 Y87.983 E.02171
M204 S10000
G1 X81.167 Y87.29 F42000
; Slow Down Start
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.386176
G1 F3000;_EXTRUDE_SET_SPEED
M204 S6000
G3 X82.014 Y86.556 I4.62 J4.477 E.03139
G3 X82.898 Y85.883 I2.95 J2.956 E.03116
G3 X84.828 Y84.894 I7.208 J11.705 E.06073
G1 X85.075 Y84.852 E.007
G1 X85.138 Y85.024 E.00512
G1 X85.138 Y86.994 E.05512
G1 X85.203 Y87.186 E.00566
G1 X86.09 Y87.262 E.02491
G1 X86.231 Y87.297 E.00407
G1 X86.256 Y87.424 E.00361
G1 X86.256 Y92.576 E.14411
G1 X86.231 Y92.703 E.00361
G1 X85.329 Y92.781 E.02531
G1 X85.203 Y92.814 E.00366
G1 X85.137 Y93.006 E.00567
G1 X85.139 Y94.979 E.05518
G1 X85.08 Y95.147 E.00499
G1 X84.638 Y95.029 E.01277
G3 X81.471 Y93.057 I4.868 J-11.352 E.10475
G1 X81.366 Y92.925 E.00474
; Slow Down End
; WIPE_START
G1 X81.471 Y93.057 E-.06444
G1 X81.806 Y93.336 E-.16557
G1 X82.629 Y93.943 E-.38835
G1 X82.947 Y94.136 E-.14165
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.951 Y87.638 Z6.5 F42000
G1 X87.445 Y86.836 Z6.5
G1 Z6.1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.153979
G1 F2764
M204 S6000
G1 X86.815 Y86.801 E.00571
; WIPE_START
G1 F15000
G1 X87.445 Y86.836 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.927 Y84.085 Z6.5 F42000
G1 Z6.1
G1 E.8 F1800
; LINE_WIDTH: 0.235615
G1 F2764
M204 S6000
G1 X86.136 Y83.99 E.0036
; LINE_WIDTH: 0.190394
G3 X87.401 Y83.699 I2.466 J7.83 E.01561
G1 X87.83 Y83.634 E.00522
; LINE_WIDTH: 0.205473
G2 X88.025 Y83.587 I-.257 J-1.49 E.00266
; LINE_WIDTH: 0.250613
G1 X88.103 Y83.562 E.00137
; LINE_WIDTH: 0.278859
G1 X88.721 Y83.295 E.01295
M204 S10000
G1 X89.146 Y83.604 F42000
; LINE_WIDTH: 0.319828
G1 F2764
M204 S6000
G1 X89 Y83.463 E.00457
; LINE_WIDTH: 0.354547
G2 X88.682 Y83.459 I-.361 J15.426 E.0081
; LINE_WIDTH: 0.39863
G2 X88.31 Y83.464 I-.115 J4.754 E.01077
G1 X87.883 Y83.7 E.01415
; WIPE_START
G1 F15000
G1 X88.31 Y83.464 E-.43159
G1 X88.682 Y83.459 E-.32841
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.928 Y87.945 Z6.5 F42000
G1 Z6.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2764
M204 S6000
G1 X93.928 Y92.134 E.13894
G1 X93.343 Y92.134 E.01941
G1 X93.343 Y87.866 E.14159
G1 X93.928 Y87.866 E.01941
G1 X93.928 Y87.885 E.00065
M204 S10000
G1 X94.32 Y87.945 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2764
M204 S5000
G1 X97.971 Y87.945 E.11218
G1 X97.971 Y92.055 E.12626
G1 X94.32 Y92.055 E.11218
G1 X94.32 Y88.005 E.12441
; WIPE_START
G1 F12000
M204 S6000
G1 X96.32 Y87.973 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.951 Y92.606 Z6.5 F42000
G1 Z6.1
G1 E.8 F1800
G1 F2764
M204 S5000
G1 X92.951 Y87.394 E.16017
G1 X91.499 Y87.313 E.04469
G1 X91.535 Y86.672 E.01971
G1 X91.807 Y86.687 E.00836
G1 X91.799 Y86.826 E.00426
G1 X93.441 Y86.92 E.05055
G1 X93.454 Y86.951 E.00103
G1 X93.454 Y87.474 E.01607
G1 X98.053 Y87.474 E.14131
G3 X98.443 Y87.863 I.003 J.387 E.01883
G1 X98.443 Y92.137 E.13132
G3 X98.09 Y92.525 I-.386 J.004 E.01773
G1 X93.454 Y92.526 E.14245
G1 X93.454 Y93.049 E.01607
G1 X93.44 Y93.081 E.00106
G1 X91.799 Y93.174 E.05051
G1 X91.807 Y93.313 E.00426
G1 X91.535 Y93.328 E.00836
G1 X91.499 Y92.687 E.01971
G1 X92.891 Y92.61 E.04284
M204 S10000
G1 X93.203 Y92.33 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.154343
G1 F2764
M204 S6000
G1 X93.194 Y92.836 E.00459
G1 X91.709 Y92.927 E.01351
; WIPE_START
G1 F15000
G1 X93.194 Y92.836 E-.56724
G1 X93.203 Y92.33 E-.19276
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.124 Y87.71 Z6.5 F42000
G1 Z6.1
G1 E.8 F1800
; LINE_WIDTH: 0.122254
G1 F2764
M204 S6000
G1 X98.044 Y87.71 E.02534
G3 X98.172 Y87.731 I.009 J.344 E.00084
M204 S10000
G1 X98.187 Y87.743 F42000
; LINE_WIDTH: 0.121943
G1 F2764
M204 S6000
G3 X98.207 Y87.871 I-.439 J.135 E.00084
G1 X98.207 Y92.127 E.02741
G3 X98.186 Y92.255 I-.343 J.009 E.00084
M204 S10000
G1 X98.172 Y92.27 F42000
; LINE_WIDTH: 0.121586
G1 F2764
M204 S6000
G3 X98.075 Y92.29 I-.114 J-.317 E.00063
G1 X94.124 Y92.29 E.02532
M204 S10000
G1 X93.636 Y91.931 F42000
; LINE_WIDTH: 0.220871
G1 F2764
M204 S6000
G1 X93.636 Y88.069 E.05599
M204 S10000
G1 X93.203 Y87.67 F42000
; LINE_WIDTH: 0.154341
G1 F2764
M204 S6000
G1 X93.194 Y87.164 E.00459
G1 X91.709 Y87.073 E.01351
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 6.3
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X93.194 Y87.164 E-.56721
G1 X93.203 Y87.67 E-.19279
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 32/111
; update layer progress
M73 L32
M991 S0 P31 ;notify layer change

; OBJECT_ID: 427
M204 S10000
G17
G3 Z6.5 I-.769 J-.943 P1  F42000
G1 X86.576 Y93.077 Z6.5
G1 Z6.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3300
M204 S6000
G1 X85.399 Y93.143 E.03909
G1 X85.403 Y95.34 E.07288
G2 X85.557 Y95.79 I1.106 J-.128 E.01593
G3 X78.467 Y90.065 I3.812 J-11.974 E.30937
G3 X78.491 Y89.882 I.207 J-.065 E.00629
G3 X85.556 Y84.212 I10.885 J6.325 E.30742
G1 X85.445 Y84.459 E.00899
G2 X85.401 Y84.747 I.921 J.291 E.00972
G1 X85.4 Y86.857 E.07001
G1 X86.603 Y86.924 E.03996
G1 X86.603 Y93.043 E.20296
M204 S10000
G1 X86.995 Y92.943 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3300
M204 S5000
G1 X87.611 Y92.908 E.01896
G1 X87.646 Y93.549 E.01971
G1 X87.372 Y93.564 E.00843
M73 P57 R7
G1 X87.364 Y93.426 E.00425
G1 X85.792 Y93.513 E.04839
G1 X85.795 Y95.299 E.05485
G2 X86.413 Y95.88 I.699 J-.124 E.02793
G2 X89.818 Y96.248 I3.061 J-12.373 E.10556
G1 X89.818 Y96.779 E.01632
G3 X89.119 Y96.869 I-2.049 J-13.179 E.02167
G1 X88.803 Y96.889 E.00972
G1 X88.404 Y96.912 E.01229
G1 X88.005 Y96.935 E.01229
G1 F2760
G1 X87.769 Y96.94 E.00723
G1 F1440
G1 X87.768 Y96.853 E.00266
M106 S201.45
M106 S255
G1 F2251.779
G1 X87.7 Y96.734 E.00422
G1 F3127.413
G1 X87.599 Y96.664 E.00376
G1 F3300
G1 X87.51 Y96.638 E.00286
G1 X87.117 Y96.564 E.01229
G1 X86.724 Y96.491 E.01229
G1 X86.46 Y96.442 E.00825
G1 X86.004 Y96.328 E.01444
G3 X85.108 Y96.052 I4.017 J-14.649 E.02881
G3 X84.333 Y95.755 I4.377 J-12.569 E.02551
G3 X83.682 Y95.46 I5.078 J-12.067 E.02195
G3 X83.149 Y95.185 I5.311 J-10.931 E.01844
G3 X82.427 Y94.759 I6.171 J-11.292 E.02576
G3 X81.347 Y93.994 I8.151 J-12.66 E.04069
G1 X81.009 Y93.71 E.01358
G1 X80.702 Y93.453 E.01229
G3 X80.351 Y93.123 I9.617 J-10.596 E.0148
G1 X79.962 Y92.72 E.01721
G1 X79.685 Y92.432 E.01229
G1 X79.373 Y92.067 E.01475
G3 X78.794 Y91.308 I11.216 J-9.156 E.02932
G1 X78.46 Y90.819 E.01821
G3 X78.154 Y90.318 I10.716 J-6.9 E.01803
G1 X78.116 Y90.245 E.00252
G3 X78.07 Y90.084 I.684 J-.286 E.00517
G3 X78.066 Y89.948 I.775 J-.09 E.00418
G3 X78.091 Y89.823 I.595 J.053 E.00392
G3 X78.15 Y89.689 I.675 J.218 E.00451
G1 X78.388 Y89.294 E.01417
G1 X78.58 Y88.998 E.01087
G1 X78.715 Y88.801 E.00732
G1 X78.956 Y88.482 E.01229
G1 X79.362 Y87.946 E.02067
G1 X79.625 Y87.644 E.01229
G1 X79.834 Y87.404 E.0098
G1 X80.115 Y87.118 E.01229
G1 X80.425 Y86.804 E.01357
G1 X80.723 Y86.538 E.01229
G1 X81.057 Y86.247 E.0136
G3 X81.719 Y85.723 I10.247 J12.275 E.02594
G3 X82.313 Y85.314 I7.822 J10.723 E.02217
G3 X82.929 Y84.938 I7.262 J11.215 E.02217
G3 X83.777 Y84.494 I7.517 J13.31 E.02943
G1 X84.101 Y84.345 E.01096
G3 X84.984 Y83.991 I5.316 J11.989 E.02923
G3 X85.768 Y83.737 I4.508 J12.598 E.02533
G1 X86.221 Y83.616 E.01439
G3 X86.675 Y83.513 I3.657 J15.097 E.01433
G1 X87.147 Y83.426 E.01473
G1 X87.541 Y83.356 E.01229
G1 X87.602 Y83.333 E.00202
G1 F3187.018
G1 X87.667 Y83.291 E.00237
G1 F2612.243
G1 X87.731 Y83.221 E.00293
G1 F1980.255
G1 X87.769 Y83.134 E.00291
G1 F1440
G1 X87.77 Y83.06 E.00226
M106 S201.45
M106 S255
G1 F2760
G1 X88.005 Y83.065 E.00722
G1 F2974.66
G1 X88.034 Y83.066 E.00089
G1 F3300
G1 X88.433 Y83.09 E.01229
G1 X88.832 Y83.114 E.01229
G1 X89.197 Y83.133 E.01123
G3 X89.818 Y83.221 I-1.196 J10.651 E.01926
G1 X89.818 Y83.753 E.01636
G2 X86.194 Y84.186 I-.389 J12.129 E.11257
G2 X85.793 Y84.758 I.263 J.612 E.02259
G1 X85.792 Y86.487 E.05312
G1 X87.364 Y86.574 E.04838
G1 X87.372 Y86.436 E.00425
G1 X87.646 Y86.451 E.00843
G1 X87.611 Y87.092 E.01971
G1 X86.995 Y87.057 E.01896
G1 X86.995 Y88.921 E.05727
G1 X86.995 Y92.883 E.12173
; WIPE_START
G1 F12000
M204 S6000
G1 X87.611 Y92.908 E-.23438
G1 X87.646 Y93.549 E-.2438
G1 X87.372 Y93.564 E-.10423
G1 X87.364 Y93.426 E-.05255
G1 X87.036 Y93.444 E-.12504
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.7 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z6.7
G1 X0 Y90.0001 F18000 ; move to safe pos
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
            G0 Z6.7 F4000
            G39.3 S1
            G0 Z6.7 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X86.799 Y93.205 F42000
G1 Z6.3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.153988
G1 F3300
M204 S6000
G1 X87.429 Y93.17 E.00571
; WIPE_START
G1 F15000
G1 X86.799 Y93.205 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.518 Y96.301 Z6.7 F42000
G1 Z6.3
G1 E.8 F1800
; LINE_WIDTH: 0.33158
G1 F3300
M204 S6000
G3 X87.963 Y96.508 I-1.339 J3.446 E.01154
G1 X88.326 Y96.725 E.00994
M204 S10000
G1 X88.337 Y96.596 F42000
; LINE_WIDTH: 0.193377
G1 F3300
M204 S6000
G1 X87.708 Y96.409 E.00804
G1 X87.32 Y96.34 E.00483
G3 X85.854 Y95.97 I.866 J-6.535 E.01858
; WIPE_START
G1 F15000
G1 X86.075 Y96.061 E-.09089
G1 X86.346 Y96.138 E-.107
G1 X87.32 Y96.34 E-.37815
G1 X87.708 Y96.409 E-.14975
G1 X87.794 Y96.435 E-.0342
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.554 Y95.241 Z6.7 F42000
G1 Z6.3
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.41621
; LAYER_HEIGHT: 0.4
G1 F3000
M204 S6000
G1 X85.032 Y94.763 E.0375
G1 X85.031 Y94.104 E.03649
G1 X84.253 Y94.883 E.06102
G3 X83.808 Y94.668 I1.866 J-4.433 E.02738
G1 X85.03 Y93.446 E.0958
G1 X85.029 Y92.793 E.0362
G1 X85.722 Y92.754 E.03845
G1 X86.233 Y92.243 E.0401
G1 X86.233 Y91.584 E.03655
G1 X83.382 Y94.435 E.22354
G1 X82.972 Y94.186 E.0266
G1 X86.233 Y90.924 E.25568
G1 X86.233 Y90.265 E.03655
G1 X82.562 Y93.936 E.28781
G1 X82.521 Y93.909 E.00275
G3 X82.174 Y93.665 I2.22 J-3.529 E.02351
G1 X86.233 Y89.606 E.31823
G1 X86.233 Y88.946 E.03655
G1 X81.803 Y93.376 E.34728
G3 X81.44 Y93.08 I2.139 J-2.991 E.02599
G1 X86.233 Y88.287 E.37574
G1 X86.233 Y87.628 E.03655
G1 X83.928 Y89.933 E.18071
G1 X83.599 Y89.603 E.02584
G1 X85.944 Y87.258 E.18385
G1 X85.319 Y87.223 E.03468
G1 X83.269 Y89.273 E.16073
G1 X82.939 Y88.944 E.02584
G1 X85.031 Y86.852 E.16396
G1 X85.031 Y86.193 E.03655
G1 X82.61 Y88.614 E.1898
G1 X82.28 Y88.284 E.02584
G1 X85.031 Y85.534 E.21565
G1 X85.031 Y84.874 E.03655
G1 X81.95 Y87.955 E.2415
G1 X81.621 Y87.625 E.02584
G1 X84.022 Y85.224 E.18827
G2 X82.441 Y86.146 I5.357 J11.004 E.10157
G1 X81.148 Y87.439 E.10137
M106 S201.45
; WIPE_START
G1 X82.441 Y86.146 E-.69487
G1 X82.585 Y86.052 E-.06513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.429 Y86.83 Z6.7 F42000
G1 Z6.3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.15399
; LAYER_HEIGHT: 0.2
G1 F3300
M204 S6000
G1 X86.799 Y86.795 E.00571
; WIPE_START
G1 F15000
G1 X87.429 Y86.83 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.788 Y84.191 Z6.7 F42000
G1 Z6.3
G1 E.8 F1800
; LINE_WIDTH: 0.19345
G1 F3300
M204 S6000
G3 X85.976 Y83.979 I3.363 J2.772 E.00348
G3 X86.781 Y83.762 I1.54 J4.114 E.01024
G2 X88.337 Y83.398 I-1.293 J-9.037 E.01963
M204 S10000
G1 X88.337 Y83.438 F42000
; LINE_WIDTH: 0.406373
G1 F3300
M204 S6000
G1 X88.039 Y83.447 E.0088
G1 X87.564 Y83.692 E.01584
M204 S10000
G1 X87.476 Y83.706 F42000
; LINE_WIDTH: 0.293318
G1 F3300
M204 S6000
G2 X87.908 Y83.513 I-1.267 J-3.42 E.00965
G1 X88.337 Y83.293 E.00983
; WIPE_START
G1 F15000
G1 X87.908 Y83.513 E-.38375
G1 X87.476 Y83.706 E-.37625
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.855 Y87.897 Z6.7 F42000
G1 X93.928 Y87.945 Z6.7
G1 Z6.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3300
M204 S6000
G1 X93.928 Y92.152 E.13952
G1 X93.348 Y92.152 E.01923
G1 X93.348 Y87.848 E.14275
G1 X93.928 Y87.848 E.01923
G1 X93.928 Y87.885 E.00123
M204 S10000
G1 X94.32 Y87.945 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3300
M204 S5000
G1 X97.971 Y87.945 E.11218
G1 X97.971 Y92.055 E.12626
G1 X94.32 Y92.055 E.11218
G1 X94.32 Y88.005 E.12441
; WIPE_START
G1 F12000
M204 S6000
G1 X96.32 Y87.973 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.956 Y92.611 Z6.7 F42000
G1 Z6.3
G1 E.8 F1800
G1 F3300
M204 S5000
G1 X92.956 Y87.389 E.16047
G1 X91.504 Y87.308 E.04469
G1 X91.54 Y86.667 E.01971
G1 X91.812 Y86.682 E.00836
G1 X91.804 Y86.821 E.00426
G1 X93.447 Y86.915 E.05055
G1 X93.46 Y86.946 E.00104
G1 X93.46 Y87.456 E.01569
G1 X98.071 Y87.456 E.1417
G3 X98.46 Y87.846 I.003 J.386 E.01884
G1 X98.46 Y92.154 E.13239
G3 X98.103 Y92.543 I-.38 J.009 E.01793
G1 X93.46 Y92.544 E.14267
G1 X93.46 Y93.054 E.01567
G1 X93.445 Y93.086 E.00108
G1 X91.804 Y93.179 E.05051
G1 X91.812 Y93.318 E.00426
G1 X91.54 Y93.333 E.00836
G1 X91.504 Y92.692 E.01971
G1 X92.896 Y92.615 E.04284
M204 S10000
G1 X93.208 Y92.348 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.154346
G1 F3300
M204 S6000
G1 X93.199 Y92.841 E.00448
G1 X91.714 Y92.932 E.01351
; WIPE_START
G1 F15000
G1 X93.199 Y92.841 E-.57083
G1 X93.208 Y92.348 E-.18917
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.124 Y87.701 Z6.7 F42000
G1 Z6.3
G1 E.8 F1800
; LINE_WIDTH: 0.139846
G1 F3300
M204 S6000
G1 X98.062 Y87.701 E.0311
G3 X98.154 Y87.711 I.01 J.317 E.00073
G1 X98.167 Y87.713 E.00011
M204 S10000
G1 X98.244 Y87.746 F42000
; LINE_WIDTH: 0.0657746
G1 F3300
M204 S6000
G1 X98.225 Y87.752 E.00004
; LINE_WIDTH: 0.104339
G1 X98.206 Y87.763 E.00011
; LINE_WIDTH: 0.139736
G3 X98.216 Y87.855 I-.321 J.082 E.00073
G1 X98.216 Y92.145 E.03385
G3 X98.204 Y92.25 I-.808 J-.037 E.00083
; LINE_WIDTH: 0.101745
G1 X98.227 Y92.254 E.00011
; LINE_WIDTH: 0.0718283
G1 X98.25 Y92.259 E.00005
M204 S10000
G1 X98.158 Y92.288 F42000
; LINE_WIDTH: 0.139221
G1 F3300
M204 S6000
G1 X98.153 Y92.289 E.00004
G3 X98.084 Y92.299 I-.076 J-.293 E.00055
G1 X94.124 Y92.299 E.03108
M204 S10000
G1 X93.638 Y91.948 F42000
; LINE_WIDTH: 0.215631
G1 F3300
M204 S6000
G1 X93.638 Y88.052 E.05483
M204 S10000
G1 X93.208 Y87.652 F42000
; LINE_WIDTH: 0.154342
G1 F3300
M204 S6000
G1 X93.199 Y87.159 E.00448
G1 X91.714 Y87.068 E.01351
; CHANGE_LAYER
; Z_HEIGHT: 6.5
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X93.199 Y87.159 E-.5708
G1 X93.208 Y87.652 E-.1892
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 33/111
; update layer progress
M73 L33
M991 S0 P32 ;notify layer change

; OBJECT_ID: 427
M204 S10000
G17
G3 Z6.7 I-.77 J-.942 P1  F42000
G1 X86.56 Y93.083 Z6.7
G1 Z6.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3481
M204 S6000
G1 X85.258 Y93.156 E.04326
G1 X85.261 Y95.358 E.07307
G1 X85.354 Y95.781 E.01436
G3 X78.349 Y90.042 I3.91 J-11.917 E.30735
G1 X78.344 Y89.993 E.0016
G3 X78.427 Y89.798 I.418 J.062 E.0071
G3 X85.358 Y84.219 I10.934 J6.489 E.30152
G1 X85.269 Y84.598 E.01289
G1 X85.259 Y86.844 E.07452
G1 X86.587 Y86.918 E.04413
G1 X86.587 Y93.049 E.20336
M204 S10000
G1 X86.979 Y92.949 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3481
M204 S5000
G1 X87.596 Y92.914 E.01896
G1 X87.63 Y93.555 E.01971
G1 X87.356 Y93.57 E.00843
G1 X87.349 Y93.432 E.00425
G1 X85.651 Y93.527 E.05225
G1 X85.653 Y95.316 E.05498
G2 X86.112 Y95.857 I.669 J-.102 E.02295
G2 X89.009 Y96.289 I3.402 J-12.871 E.09016
G1 X89.009 Y96.865 E.01771
G3 X88.571 Y96.915 I-1.077 J-7.634 E.01353
G1 X88.128 Y96.925 E.01362
G1 X87.728 Y96.938 E.01229
G1 X87.594 Y96.941 E.00415
G1 F2520
G1 X87.593 Y96.892 E.00149
G1 F2640
G1 X87.563 Y96.81 E.00269
G1 F3481
G1 X87.491 Y96.722 E.00348
G1 X87.389 Y96.667 E.00357
G1 X86.996 Y96.591 E.01229
G1 X86.604 Y96.516 E.01229
G1 X86.378 Y96.473 E.00705
G3 X85.452 Y96.222 I3.126 J-13.403 E.02949
G3 X84.798 Y96 I3.846 J-12.425 E.02122
G3 X84.244 Y95.782 I4.391 J-11.927 E.0183
G3 X83.591 Y95.485 I4.961 J-11.787 E.02205
G3 X82.743 Y95.031 I6.638 J-13.423 E.02955
G3 X82.028 Y94.582 I6.606 J-11.304 E.02595
G1 X81.632 Y94.304 E.01487
G3 X80.965 Y93.784 I7.652 J-10.495 E.026
G3 X80.335 Y93.221 I9.445 J-11.203 E.02595
G1 X79.99 Y92.883 E.01485
G3 X79.422 Y92.259 I10.827 J-10.429 E.02591
G1 X79.115 Y91.891 E.01474
G3 X78.825 Y91.509 I11.809 J-9.263 E.01473
G1 X78.511 Y91.052 E.01704
G1 X78.285 Y90.722 E.01229
G3 X78.021 Y90.281 I8.231 J-5.241 E.01579
G1 X77.991 Y90.215 E.00224
G3 X77.954 Y90.051 I.715 J-.247 E.00518
G1 X77.952 Y89.983 E.00209
G1 X77.958 Y89.912 E.00217
G1 X77.963 Y89.885 E.00086
G3 X77.991 Y89.785 I.625 J.124 E.00318
G1 X78.021 Y89.719 E.00225
G1 X78.228 Y89.377 E.01229
G1 X78.339 Y89.193 E.00659
G1 X78.569 Y88.866 E.01229
G1 X78.956 Y88.314 E.02071
G1 X79.209 Y88.004 E.01229
G1 X79.492 Y87.665 E.01358
G3 X80.063 Y87.043 I12.179 J10.61 E.02594
G1 X80.353 Y86.767 E.01229
G1 X80.603 Y86.529 E.0106
G3 X81.54 Y85.764 I9.602 J10.797 E.03719
G1 X81.817 Y85.563 E.01051
G3 X82.73 Y84.976 I8.683 J12.498 E.03337
G3 X83.363 Y84.629 I6.5 J11.106 E.02218
G3 X84.011 Y84.319 I6.096 J11.903 E.02209
G3 X84.898 Y83.963 I5.369 J12.095 E.02934
G1 X85.252 Y83.841 E.01152
G3 X86.025 Y83.614 I4.056 J12.384 E.02476
G1 X86.452 Y83.517 E.01346
G1 X86.842 Y83.429 E.01229
G1 X87.379 Y83.335 E.01674
G1 X87.448 Y83.306 E.00229
G1 X87.536 Y83.234 E.00349
G1 F2760
G1 X87.593 Y83.119 E.00394
G1 F2520
G1 X87.594 Y83.059 E.00186
G1 F3481
G1 X87.729 Y83.06 E.00415
G1 X87.787 Y83.06 E.00178
G1 X88.186 Y83.078 E.01229
G1 X88.586 Y83.096 E.01229
G1 X88.84 Y83.116 E.00783
G3 X89.008 Y83.133 I-1.252 J13.597 E.00519
G1 X89.008 Y83.711 E.01776
G2 X86.11 Y84.144 I.494 J13.205 E.09025
G2 X85.651 Y84.739 I.202 J.63 E.02453
G1 X85.651 Y86.473 E.0533
G1 X87.349 Y86.568 E.05224
G1 X87.356 Y86.43 E.00425
G1 X87.63 Y86.445 E.00843
G1 X87.596 Y87.086 E.01971
G1 X86.979 Y87.051 E.01896
G1 X86.979 Y89.059 E.06169
G1 X86.979 Y92.889 E.11768
; WIPE_START
G1 F12000
M204 S6000
G1 X87.596 Y92.914 E-.23437
G1 X87.63 Y93.555 E-.24381
G1 X87.356 Y93.57 E-.10422
G1 X87.349 Y93.432 E-.05256
G1 X87.02 Y93.45 E-.12505
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.9 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z6.9
G1 X0 Y90.0001 F18000 ; move to safe pos
M73 P58 R7
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
            G0 Z6.9 F4000
            G39.3 S1
            G0 Z6.9 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X86.783 Y93.212 F42000
G1 Z6.5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.153988
G1 F3481
M204 S6000
G1 X87.413 Y93.177 E.00571
; WIPE_START
G1 F15000
G1 X86.783 Y93.212 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.582 Y96.448 Z6.9 F42000
G1 Z6.5
G1 E.8 F1800
; LINE_WIDTH: 0.182139
G1 F3481
M204 S6000
G2 X86.26 Y96.171 I-21.791 J100.485 E.01532
G3 X85.857 Y96.049 I.671 J-2.953 E.00477
; LINE_WIDTH: 0.24869
G1 X85.71 Y95.981 E.00273
G1 X85.537 Y95.7 E.00553
M204 S10000
G1 X85.547 Y95.68 F42000
; LINE_WIDTH: 0.14758
G1 F3481
M204 S6000
G1 X85.764 Y96.11 E.00411
; WIPE_START
G1 F15000
G1 X85.547 Y95.68 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.222 Y93.021 Z6.9 F42000
G1 Z6.5
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3481
M204 S6000
G1 X82.449 Y91.794 E.05758
G1 X82.449 Y93.963 E.07194
G1 X79.124 Y90.638 E.15596
G3 X78.727 Y89.976 I1.982 J-1.64 E.02571
G1 X79.117 Y89.37 E.02391
G1 X82.45 Y86.037 E.15636
G1 X82.449 Y88.206 E.07198
G1 X81.22 Y86.977 E.05766
; WIPE_START
G1 F15476.087
G1 X82.449 Y88.206 E-.66051
G1 X82.449 Y87.944 E-.09949
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.838 Y86.412 Z6.9 F42000
G1 Z6.5
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41999
G1 F3481
M204 S6000
G1 X82.837 Y85.839 E.01759
G1 X83.421 Y85.486 E.02098
G1 X84.332 Y85.035 E.03121
G1 X84.876 Y84.82 E.01799
G1 X84.866 Y87.036 E.06809
G1 X84.912 Y87.16 E.00405
G1 X85.044 Y87.225 E.00454
G1 X86.195 Y87.289 E.03542
G1 X86.195 Y92.711 E.16659
G1 X85.044 Y92.775 E.03543
G1 X84.912 Y92.84 E.00453
G1 X84.866 Y92.963 E.00404
G1 X84.869 Y95.18 E.0681
G3 X82.877 Y94.19 I3.661 J-9.87 E.06845
G1 X82.841 Y94.126 E.00227
G1 X82.838 Y86.472 E.23519
M204 S10000
G1 X83.215 Y86.052 F42000
G1 F3481
M204 S6000
G1 X83.626 Y85.806 E.01471
G1 X84.497 Y85.375 E.02985
G2 X84.498 Y87.135 I70.655 J.838 E.05407
G1 X84.626 Y87.405 E.0092
G1 X84.892 Y87.578 E.00975
G1 X85.023 Y87.602 E.0041
G1 X85.818 Y87.646 E.02446
G1 X85.818 Y92.354 E.14467
G1 X84.892 Y92.422 E.02854
G1 X84.626 Y92.594 E.00973
G1 X84.489 Y92.963 E.01211
G1 X84.491 Y94.619 E.05086
G1 X84.091 Y94.437 E.0135
G1 X83.218 Y93.954 E.03066
G1 X83.215 Y86.112 E.24097
; WIPE_START
G1 F12000
G1 X83.216 Y88.112 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.593 Y87.928 Z6.9 F42000
G1 Z6.5
G1 E.8 F1800
; LINE_WIDTH: 0.43818
G1 F3481
M204 S6000
G1 X83.61 Y87.48 E.01445
; LINE_WIDTH: 0.489227
G2 X83.629 Y86.285 I-15.429 J-.832 E.04348
G1 X84.08 Y86.042 E.01864
G1 X84.078 Y86.412 E.01348
; LINE_WIDTH: 0.47456
G1 X84.083 Y86.81 E.01398
; LINE_WIDTH: 0.450548
G1 X84.087 Y87.207 E.0132
G1 X84.34 Y87.651 E.01698
; LINE_WIDTH: 0.41999
G1 X84.783 Y87.94 E.01626
G1 X85.441 Y88.002 E.02031
G1 X85.441 Y91.998 E.12276
G1 X84.783 Y92.06 E.02031
; LINE_WIDTH: 0.437513
G1 X84.562 Y92.204 E.00848
; LINE_WIDTH: 0.460098
G1 X84.341 Y92.348 E.00897
G1 X84.077 Y92.964 E.02278
; LINE_WIDTH: 0.490284
G1 X84.078 Y93.966 E.03653
G1 X83.63 Y93.719 E.01863
G1 X83.63 Y93.592 E.00464
; LINE_WIDTH: 0.47279
G1 X83.63 Y93.278 E.01101
; LINE_WIDTH: 0.450498
G2 X83.594 Y92.071 I-15.499 J-.148 E.04013
; LINE_WIDTH: 0.41999
G1 X83.593 Y87.988 E.12544
M204 S10000
G1 X83.97 Y87.72 F42000
G1 F3481
M204 S6000
G1 X83.971 Y92.326 E.14155
G1 X84.055 Y92.101 E.00737
G1 X84.675 Y91.699 E.0227
G1 X85.064 Y91.641 E.01209
G1 X85.064 Y88.359 E.10084
G1 X84.675 Y88.301 E.0121
G1 X84.054 Y87.897 E.02276
G1 X83.995 Y87.774 E.00419
M204 S10000
G1 X84.338 Y88.503 F42000
; LINE_WIDTH: 0.401128
G1 F3481
M204 S6000
G1 X84.339 Y91.497 E.0874
G1 X84.569 Y91.347 E.00802
G1 X84.697 Y91.325 E.00378
G1 X84.696 Y88.675 E.07734
G1 X84.569 Y88.653 E.00378
G1 X84.388 Y88.535 E.00629
; WIPE_START
G1 F12000
G1 X84.569 Y88.653 E-.08188
G1 X84.696 Y88.675 E-.04923
G1 X84.696 Y90.33 E-.62889
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.783 Y86.788 Z6.9 F42000
G1 Z6.5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.15398
G1 F3481
M204 S6000
G1 X87.413 Y86.823 E.00571
; WIPE_START
G1 F15000
G1 X86.783 Y86.788 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.582 Y83.555 Z6.9 F42000
G1 Z6.5
G1 E.8 F1800
; LINE_WIDTH: 0.182029
G1 F3481
M204 S6000
G2 X86.013 Y83.895 I6.423 J33.416 E.0182
G1 X85.858 Y83.951 E.00187
; LINE_WIDTH: 0.243428
G1 X85.768 Y83.992 E.00161
G2 X85.714 Y84.02 I-.002 J.061 E.00103
G1 X85.543 Y84.289 E.00521
M204 S10000
G1 X85.559 Y84.315 F42000
; LINE_WIDTH: 0.135048
G1 F3481
M204 S6000
G3 X85.772 Y83.887 I4.45 J1.944 E.00358
; WIPE_START
G1 F15000
G1 X85.559 Y84.315 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.561 Y87.352 Z6.9 F42000
G1 X93.928 Y87.945 Z6.9
G1 Z6.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3481
M204 S6000
G1 X93.928 Y92.165 E.13997
G1 X93.354 Y92.165 E.01906
G1 X93.354 Y87.835 E.14365
G1 X93.928 Y87.835 E.01906
G1 X93.928 Y87.885 E.00168
M204 S10000
G1 X94.32 Y87.945 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3481
M204 S5000
G1 X97.971 Y87.945 E.11218
G1 X97.971 Y92.055 E.12626
G1 X94.32 Y92.055 E.11218
G1 X94.32 Y88.005 E.12441
; WIPE_START
G1 F12000
M204 S6000
G1 X96.32 Y87.973 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.962 Y92.616 Z6.9 F42000
G1 Z6.5
G1 E.8 F1800
G1 F3481
M204 S5000
G1 X92.962 Y87.384 E.16078
G1 X91.51 Y87.303 E.04469
G1 X91.546 Y86.662 E.01971
G1 X91.817 Y86.677 E.00836
G1 X91.809 Y86.816 E.00426
G1 X93.452 Y86.91 E.05055
G1 X93.465 Y86.941 E.00104
G1 X93.465 Y87.443 E.01543
G1 X98.084 Y87.443 E.14195
G3 X98.474 Y87.832 I0 J.389 E.01881
G1 X98.474 Y92.168 E.13322
G3 X98.116 Y92.556 I-.383 J.006 E.01789
G1 X93.465 Y92.557 E.14293
G1 X93.465 Y93.059 E.0154
G1 X93.45 Y93.091 E.00108
G1 X91.809 Y93.184 E.05051
G1 X91.817 Y93.323 E.00426
G1 X91.546 Y93.338 E.00836
G1 X91.51 Y92.697 E.01971
G1 X92.902 Y92.62 E.04284
M204 S10000
G1 X93.213 Y92.361 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.154326
G1 F3481
M204 S6000
G1 X93.204 Y92.846 E.0044
G1 X91.719 Y92.937 E.01351
; WIPE_START
G1 F15000
G1 X93.204 Y92.846 E-.5733
G1 X93.213 Y92.361 E-.1867
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.124 Y87.694 Z6.9 F42000
G1 Z6.5
G1 E.8 F1800
; LINE_WIDTH: 0.152829
G1 F3481
M204 S6000
G1 X98.075 Y87.694 E.03538
G3 X98.223 Y87.842 I.029 J.119 E.00224
G1 X98.223 Y92.158 E.03866
G3 X98.097 Y92.305 I-.113 J.031 E.00204
G1 X94.124 Y92.306 E.03558
M204 S10000
G1 X93.641 Y91.962 F42000
; LINE_WIDTH: 0.21038
G1 F3481
M204 S6000
G1 X93.641 Y88.038 E.05354
M204 S10000
G1 X93.213 Y87.639 F42000
; LINE_WIDTH: 0.154303
G1 F3481
M204 S6000
G1 X93.204 Y87.154 E.0044
G1 X91.719 Y87.063 E.0135
; CHANGE_LAYER
; Z_HEIGHT: 6.7
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X93.204 Y87.154 E-.57326
G1 X93.213 Y87.639 E-.18674
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 34/111
; update layer progress
M73 L34
M991 S0 P33 ;notify layer change

; OBJECT_ID: 427
M204 S10000
G17
G3 Z6.9 I-.77 J-.942 P1  F42000
G1 X86.545 Y93.089 Z6.9
G1 Z6.7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3967
M204 S6000
G1 X85.113 Y93.169 E.04755
G1 X85.114 Y95.298 E.07061
G2 X85.24 Y95.797 I1.287 J-.058 E.01718
G3 X78.245 Y90.056 I4.009 J-12.016 E.30695
G1 X78.239 Y89.981 E.00249
G3 X78.263 Y89.896 I.251 J.027 E.00295
G3 X85.207 Y84.218 I11.044 J6.422 E.30399
G1 X85.116 Y84.633 E.01408
G1 X85.113 Y86.831 E.0729
G1 X86.572 Y86.912 E.04847
G1 X86.572 Y93.055 E.20377
M204 S10000
G1 X86.964 Y92.955 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3967
M204 S5000
G1 X87.58 Y92.921 E.01896
G1 X87.614 Y93.561 E.01971
G1 X87.34 Y93.576 E.00843
G1 X87.333 Y93.438 E.00425
G1 X85.506 Y93.54 E.05624
G1 X85.506 Y95.276 E.05334
G2 X86.015 Y95.885 I.702 J-.069 E.02591
G2 X88.254 Y96.282 I3.342 J-12.354 E.06994
G1 X88.253 Y96.922 E.01968
G1 X88.206 Y96.928 E.00148
G1 X87.952 Y96.934 E.00778
G1 X87.553 Y96.942 E.01229
G1 F3811.994
G1 X87.452 Y96.942 E.00309
G1 F3000
G1 X87.451 Y96.899 E.0013
G1 F3900
G1 X87.394 Y96.784 E.00396
G1 F3967
G1 X87.306 Y96.714 E.00346
G1 X87.239 Y96.685 E.00223
G1 X87.047 Y96.65 E.006
G1 X86.807 Y96.606 E.00749
G3 X86.297 Y96.5 I1.319 J-7.654 E.01601
G3 X85.273 Y96.218 I3.343 J-14.142 E.03264
G3 X84.711 Y96.024 I3.956 J-12.404 E.01829
G3 X83.682 Y95.593 I5.076 J-13.55 E.03429
G1 X83.284 Y95.398 E.0136
G3 X82.546 Y94.989 I6.12 J-11.907 E.02595
G3 X81.933 Y94.599 I6.983 J-11.656 E.02231
G3 X81.246 Y94.102 I7.385 J-10.941 E.02608
G3 X80.591 Y93.561 I7.974 J-10.317 E.02609
G1 X80.233 Y93.233 E.01492
G3 X79.726 Y92.715 I11.93 J-12.186 E.02227
G1 X79.427 Y92.385 E.0137
G1 X79.163 Y92.084 E.01229
G3 X78.865 Y91.707 I11.437 J-9.331 E.01479
G1 X78.54 Y91.252 E.01717
G1 X78.308 Y90.926 E.01229
G1 X78.124 Y90.625 E.01086
G1 X77.914 Y90.284 E.01229
G1 X77.886 Y90.22 E.00216
G3 X77.886 Y89.78 I.591 J-.22 E.01381
G1 X77.914 Y89.716 E.00216
G1 X78.125 Y89.376 E.01229
G1 X78.365 Y88.989 E.01397
G1 X78.64 Y88.597 E.01473
G3 X79.229 Y87.836 I12.108 J8.771 E.02959
G1 X79.495 Y87.536 E.01229
G1 X79.715 Y87.298 E.00997
G3 X80.309 Y86.695 I13.368 J12.574 E.02603
G1 X80.609 Y86.424 E.01241
G3 X81.33 Y85.833 I8.565 J9.733 E.02865
G3 X81.921 Y85.409 I8.076 J10.624 E.02236
G3 X82.742 Y84.897 I8.357 J12.467 E.02973
G3 X83.38 Y84.554 I6.521 J11.362 E.02225
G3 X84.364 Y84.109 I6.653 J13.43 E.03319
G1 X84.811 Y83.939 E.01469
G3 X85.602 Y83.682 I4.28 J11.802 E.02556
G3 X86.401 Y83.476 I3.678 J12.644 E.02535
G1 X86.855 Y83.389 E.01423
G1 X87.248 Y83.314 E.01229
G1 X87.35 Y83.259 E.00355
G1 X87.429 Y83.16 E.00388
G1 F3000
G1 X87.453 Y83.059 E.00319
G1 F3647.374
G1 X87.535 Y83.058 E.00249
G1 F3800.599
G1 X87.553 Y83.059 E.00056
G1 F3967
G1 X87.989 Y83.064 E.01341
G1 X88.253 Y83.078 E.00814
G1 X88.254 Y83.718 E.01969
G2 X85.973 Y84.128 I1.38 J14.24 E.07126
G2 X85.508 Y84.676 I.222 J.659 E.02321
G1 X85.505 Y86.46 E.05483
G1 X87.333 Y86.562 E.05625
G1 X87.34 Y86.424 E.00425
G1 X87.614 Y86.439 E.00843
G1 X87.58 Y87.079 E.01971
G1 X86.964 Y87.045 E.01896
G1 X86.963 Y89.197 E.06612
G1 X86.964 Y92.895 E.11362
; WIPE_START
G1 F12000
M204 S6000
G1 X87.58 Y92.921 E-.23437
G1 X87.614 Y93.561 E-.2438
G1 X87.34 Y93.576 E-.10422
G1 X87.333 Y93.438 E-.05256
G1 X87.004 Y93.457 E-.12505
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.1 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z7.1
G1 X0 Y90.0001 F18000 ; move to safe pos
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
            G0 Z7.1 F4000
            G39.3 S1
            G0 Z7.1 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X86.768 Y93.218 F42000
G1 Z6.7
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.153987
G1 F3967
M204 S6000
G1 X87.398 Y93.183 E.00571
; WIPE_START
G1 F15000
G1 X86.768 Y93.218 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.138 Y96.334 Z7.1 F42000
G1 Z6.7
G1 E.8 F1800
; LINE_WIDTH: 0.255324
G1 F3967
M204 S6000
G1 X88.057 Y96.734 E.01736
M204 S10000
G1 X88.057 Y96.69 F42000
; LINE_WIDTH: 0.188601
G1 F3967
M204 S6000
G2 X87.308 Y96.431 I-2.121 J4.923 E.00942
G1 X86.934 Y96.364 E.00451
G3 X85.692 Y96.05 I1.072 J-6.845 E.01523
; LINE_WIDTH: 0.231234
G1 X85.496 Y95.953 E.00335
; WIPE_START
G1 F15000
G1 X85.692 Y96.05 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.297 Y96.362 Z7.1 F42000
G1 Z6.7
G1 E.8 F1800
; LINE_WIDTH: 0.344054
G1 F3967
M204 S6000
G1 X87.974 Y96.738 E.01901
; WIPE_START
G1 F15000
G1 X87.297 Y96.362 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.93 Y93.699 Z7.1 F42000
G1 Z6.7
G1 E.8 F1800
; Slow Down Start
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38292
G1 F3000;_EXTRUDE_SET_SPEED
M204 S6000
G3 X79.988 Y91.947 I8.24 J-11.086 E.07256
G3 X78.609 Y90.059 I10.832 J-9.356 E.06484
G1 X78.605 Y89.96 E.00276
G3 X81.868 Y86.348 I10.546 J6.25 E.13576
; Slow Down End
; WIPE_START
G1 X81.406 Y86.693 E-.21899
G1 X80.592 Y87.423 E-.41561
G1 X80.361 Y87.658 E-.12541
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.375 Y93.951 Z7.1 F42000
G1 Z6.7
G1 E.8 F1800
; Slow Down Start
; LINE_WIDTH: 0.403839
G1 F3000;_EXTRUDE_SET_SPEED
M204 S6000
G1 X81.93 Y93.699 E.01505
G1 X82.174 Y93.588 E.0079
G1 X82.175 Y86.409 E.21114
G1 X81.916 Y86.312 E.00811
G2 X82.653 Y85.882 I-1.692 J-3.74 E.02515
; Slow Down End
; LINE_WIDTH: 0.41999
G1 F3967
G3 X83.463 Y85.396 I4.689 J6.895 E.02903
G1 X84.724 Y84.823 E.04257
G1 X84.72 Y87.023 E.06761
G1 X84.789 Y87.169 E.00494
G1 X84.898 Y87.212 E.00362
G1 X86.18 Y87.283 E.03943
G1 X86.18 Y92.717 E.16697
G1 X84.899 Y92.788 E.0394
G1 X84.79 Y92.831 E.00362
G1 X84.721 Y92.976 E.00493
G1 X84.722 Y95.178 E.06764
G3 X82.426 Y93.983 I4.571 J-11.59 E.07968
; WIPE_START
G1 F12000
G1 X82.948 Y94.315 E-.23538
G1 X83.64 Y94.699 E-.30061
G1 X84.173 Y94.951 E-.22401
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.802 Y88.566 Z7.1 F42000
G1 Z6.7
G1 E.8 F1800
G1 F3967
M204 S6000
G1 X85.802 Y92.36 E.11658
G1 X84.721 Y92.443 E.03334
G1 X84.549 Y92.541 E.00605
G1 X84.403 Y92.724 E.00721
G1 X84.344 Y92.976 E.00796
G1 X84.345 Y94.615 E.05034
G3 X82.652 Y93.659 I3.741 J-8.601 E.05983
; Slow Down Start
G1 F3000;_EXTRUDE_SET_SPEED
G1 X82.551 Y93.588 E.0038
G1 X82.552 Y86.409 E.22059
G1 X82.653 Y86.332 E.0039
; Slow Down End
G1 F3967
G1 X82.79 Y86.228 E.00528
G3 X84.346 Y85.386 I5.871 J8.998 E.05442
G1 X84.343 Y87.022 E.05027
G1 X84.402 Y87.275 E.00798
G1 X84.548 Y87.459 E.00722
G2 X84.877 Y87.588 I.36 J-.436 E.01104
G1 X85.802 Y87.64 E.02847
G1 X85.802 Y88.506 E.02663
M204 S10000
G1 X85.425 Y88.566 F42000
G1 F3967
M204 S6000
G1 X85.425 Y87.996 E.01751
G1 X84.856 Y87.965 E.01751
G1 X84.594 Y87.912 E.00822
G1 X84.308 Y87.75 E.01009
G1 X84.065 Y87.443 E.01203
G1 X83.966 Y87.022 E.0133
G1 X83.968 Y85.989 E.03174
G2 X82.929 Y86.593 I6.131 J11.733 E.03695
G1 X82.928 Y93.409 E.20942
G1 X83.968 Y94.018 E.03702
G1 X83.967 Y92.976 E.03201
G1 X84.066 Y92.556 E.01326
G1 X84.309 Y92.25 E.01201
G1 X84.594 Y92.088 E.01008
G1 X84.857 Y92.035 E.00824
G1 X85.425 Y92.004 E.01748
G1 X85.425 Y88.626 E.10378
M204 S10000
G1 X85.048 Y88.566 F42000
; LINE_WIDTH: 0.410263
G1 F3967
M204 S6000
G1 X85.048 Y88.353 E.00638
G1 X84.468 Y88.267 E.01756
G1 X84.068 Y88.041 E.01377
G1 X83.727 Y87.611 E.01641
G1 X83.626 Y87.248 E.01127
G1 X83.613 Y86.59 E.0197
G1 X83.282 Y86.786 E.0115
G1 X83.306 Y87.71 E.02768
G1 X83.305 Y92.289 E.13705
G2 X83.282 Y93.214 I13.755 J.807 E.02773
G1 X83.613 Y93.417 E.01162
G1 X83.613 Y92.976 E.01319
G1 X83.728 Y92.388 E.01794
G1 X84.069 Y91.959 E.01639
G1 X84.468 Y91.733 E.01375
G1 X85.048 Y91.647 E.01755
G1 X85.048 Y88.626 E.09042
M204 S10000
G1 X84.671 Y88.689 F42000
; LINE_WIDTH: 0.41999
G1 F3967
M204 S6000
G1 X84.342 Y88.623 E.01032
M73 P59 R7
G1 X83.828 Y88.331 E.01817
G1 X83.683 Y88.149 E.00716
G1 X83.683 Y91.853 E.1138
G1 X83.829 Y91.669 E.00722
G1 X84.342 Y91.377 E.01815
G1 X84.671 Y91.311 E.01031
G1 X84.671 Y88.749 E.07873
M204 S10000
G1 X84.33 Y88.965 F42000
; LINE_WIDTH: 0.348658
G1 F3967
M204 S6000
G1 X84.024 Y88.829 E.00834
G1 X84.024 Y91.171 E.05835
G1 X84.33 Y91.035 E.00834
G1 X84.33 Y89.025 E.05008
; WIPE_START
G1 F12000
G1 X84.33 Y91.025 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.768 Y86.782 Z7.1 F42000
G1 Z6.7
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.15397
G1 F3967
M204 S6000
G1 X87.398 Y86.817 E.00571
; WIPE_START
G1 F15000
G1 X86.768 Y86.782 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.45 Y83.527 Z7.1 F42000
G1 Z6.7
G1 E.8 F1800
; LINE_WIDTH: 0.17994
G1 F3967
M204 S6000
G1 X87.346 Y83.561 E.00122
G2 X85.681 Y83.955 I1.332 J9.351 E.01913
; LINE_WIDTH: 0.243856
G1 X85.438 Y84.078 E.00446
; WIPE_START
G1 F15000
G1 X85.681 Y83.955 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.45 Y83.527 Z7.1 F42000
G1 Z6.7
G1 E.8 F1800
; LINE_WIDTH: 0.232394
G1 F3967
M204 S6000
G1 X87.526 Y83.503 E.00124
; LINE_WIDTH: 0.259378
G1 X88.057 Y83.267 E.01025
; WIPE_START
G1 F15000
G1 X87.526 Y83.503 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.455 Y89.207 Z7.1 F42000
G1 X80.22 Y91.721 Z7.1
G1 Z6.7
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3967
M204 S6000
G2 X81.385 Y92.858 I8.224 J-7.261 E.05403
G1 X81.782 Y92.461 E.01863
G1 X81.783 Y87.54 E.16325
G1 X81.383 Y87.14 E.01876
G2 X80.223 Y88.281 I35.787 J37.512 E.05397
; WIPE_START
G1 F15476.087
G1 X81.383 Y87.14 E-.61823
G1 X81.646 Y87.403 E-.14177
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X89.274 Y87.671 Z7.1 F42000
G1 X93.928 Y87.835 Z7.1
G1 Z6.7
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3967
M204 S6000
G1 X93.928 Y92.165 E.14364
G1 X93.359 Y92.165 E.01888
G1 X93.359 Y87.835 E.14365
G1 X93.868 Y87.835 E.01689
M204 S10000
G1 X94.32 Y87.945 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3967
M204 S5000
G1 X97.971 Y87.945 E.11218
G1 X97.971 Y92.055 E.12626
G1 X94.32 Y92.055 E.11218
G1 X94.32 Y88.005 E.12441
; WIPE_START
G1 F12000
M204 S6000
G1 X96.32 Y87.973 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.967 Y92.621 Z7.1 F42000
G1 Z6.7
G1 E.8 F1800
G1 F3967
M204 S5000
G1 X92.967 Y87.379 E.16108
G1 X91.515 Y87.298 E.04469
G1 X91.551 Y86.657 E.01971
G1 X91.819 Y86.672 E.00826
G1 X91.815 Y86.811 E.00426
G1 X93.457 Y86.905 E.05054
G1 X93.47 Y86.936 E.00104
G1 X93.47 Y87.443 E.01558
G1 X98.084 Y87.443 E.14178
G3 X98.474 Y87.833 I.001 J.389 E.01883
G1 X98.474 Y92.167 E.13319
G3 X98.118 Y92.556 I-.383 J.007 E.01787
G1 X93.47 Y92.557 E.14281
G1 X93.47 Y93.063 E.01555
G1 X93.456 Y93.096 E.00108
G1 X91.815 Y93.189 E.0505
G1 X91.822 Y93.328 E.00426
G1 X91.551 Y93.343 E.00836
G1 X91.515 Y92.702 E.01971
G1 X92.907 Y92.625 E.04284
M204 S10000
G1 X93.218 Y92.361 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.154279
G1 F3967
M204 S6000
G1 X93.21 Y92.851 E.00444
G1 X91.725 Y92.942 E.0135
; WIPE_START
G1 F15000
G1 X93.21 Y92.851 E-.57185
G1 X93.218 Y92.361 E-.18815
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.124 Y87.694 Z7.1 F42000
G1 Z6.7
G1 E.8 F1800
; LINE_WIDTH: 0.152811
G1 F3967
M204 S6000
G1 X98.074 Y87.694 E.03537
G3 X98.223 Y87.842 I.029 J.119 E.00225
G1 X98.211 Y92.251 E.03948
G3 X98.098 Y92.305 I-.097 J-.057 E.00118
G1 X94.124 Y92.306 E.03559
M204 S10000
G1 X93.644 Y91.962 F42000
; LINE_WIDTH: 0.20514
G1 F3967
M204 S6000
G1 X93.644 Y88.038 E.05186
M204 S10000
G1 X93.218 Y87.639 F42000
; LINE_WIDTH: 0.154261
G1 F3967
M204 S6000
G1 X93.21 Y87.149 E.00444
G1 X91.725 Y87.058 E.0135
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 6.9
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X93.21 Y87.149 E-.57181
G1 X93.218 Y87.639 E-.18819
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 35/111
; update layer progress
M73 L35
M991 S0 P34 ;notify layer change

; OBJECT_ID: 427
M204 S10000
G17
G3 Z7.1 I-.768 J-.944 P1  F42000
G1 X86.556 Y93.064 Z7.1
G1 Z6.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4519
M204 S6000
G1 X83.543 Y92.074 E.10518
G2 X83.544 Y95.156 I1173.211 J1.4 E.10225
G3 X78.144 Y90.058 I5.647 J-11.389 E.24999
G1 X78.139 Y90.031 E.0009
G3 X78.217 Y89.798 I.315 J-.025 E.00839
G3 X83.544 Y84.85 I11.002 J6.504 E.24457
G1 X83.544 Y87.921 E.1019
G1 X86.556 Y86.938 E.1051
G1 X86.556 Y93.004 E.20121
M204 S10000
G1 X86.948 Y92.961 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4519
M204 S5000
G1 X87.564 Y92.927 E.01896
G1 X87.598 Y93.567 E.01971
G1 X87.325 Y93.583 E.00843
G1 X87.317 Y93.444 E.00425
G1 X85.079 Y93.569 E.06888
G1 X85.079 Y95.165 E.04903
G2 X85.296 Y95.536 I.569 J-.083 E.01356
G2 X86.15 Y95.97 I1.128 J-1.165 E.02989
G2 X87.883 Y96.281 I3.117 J-12.367 E.05414
G1 X87.883 Y96.537 E.00788
G1 X87.883 Y96.937 E.01229
G1 X87.411 Y96.941 E.01451
G1 F3829.987
G1 X87.308 Y96.94 E.00316
G1 F3000
G1 X87.287 Y96.855 E.00271
G1 F4022.834
G1 X87.209 Y96.757 E.00384
G1 F4519
G1 X87.11 Y96.703 E.00346
G1 X87.108 Y96.702 E.00008
G1 X86.716 Y96.624 E.01229
G1 X86.261 Y96.533 E.01426
G3 X85.416 Y96.31 I3.481 J-14.881 E.02685
G3 X84.18 Y95.87 I4.533 J-14.694 E.04034
G1 X83.738 Y95.678 E.0148
G3 X83.196 Y95.416 I5.441 J-11.927 E.01849
G3 X82.56 Y95.066 I6.273 J-12.171 E.0223
G3 X81.943 Y94.681 I6.676 J-11.385 E.02237
G3 X81.056 Y94.039 I8.306 J-12.409 E.03362
G1 X80.773 Y93.81 E.01121
G3 X79.878 Y92.989 I9.98 J-11.784 E.03734
G3 X79.38 Y92.459 I8.99 J-8.953 E.02233
G3 X79.066 Y92.09 I11.104 J-9.754 E.01489
G1 X78.722 Y91.643 E.01734
G1 X78.478 Y91.325 E.01229
G1 X78.172 Y90.858 E.01718
G1 X77.952 Y90.523 E.01229
G3 X77.798 Y90.254 I1.99 J-1.319 E.00957
G3 X77.75 Y90.087 I.737 J-.3 E.00534
G3 X77.75 Y89.913 I.598 J-.087 E.00535
G3 X77.799 Y89.744 I.687 J.106 E.00541
G1 X77.834 Y89.675 E.00238
G1 X78.049 Y89.338 E.01229
G1 X78.399 Y88.788 E.02005
G1 X78.637 Y88.466 E.01229
G1 X78.907 Y88.115 E.01361
G3 X79.449 Y87.464 I13.839 J10.973 E.02601
G3 X80.039 Y86.852 I9.58 J8.644 E.02613
G3 X80.62 Y86.321 I8.749 J8.983 E.02419
G3 X81.334 Y85.748 I8.581 J9.96 E.02814
G3 X81.93 Y85.327 I8.028 J10.755 E.02242
G1 X82.236 Y85.13 E.01119
G3 X83.183 Y84.591 I7.755 J12.523 E.0335
G3 X83.836 Y84.278 I6.149 J11.969 E.02224
G3 X84.555 Y83.982 I5.45 J12.225 E.0239
G3 X85.291 Y83.728 I4.731 J12.547 E.02393
G3 X86.347 Y83.447 I6.618 J22.722 E.03357
G1 X86.719 Y83.374 E.01167
G1 X87.112 Y83.296 E.01229
G1 X87.209 Y83.243 E.00342
G1 F3975.933
G1 X87.284 Y83.149 E.00367
G1 F3000
G1 X87.311 Y83.06 E.00288
G1 F3811.83
G1 X87.411 Y83.059 E.00309
G1 F4519
G3 X87.883 Y83.064 I.131 J9.966 E.0145
G1 X87.883 Y83.464 E.01229
G1 X87.883 Y83.719 E.00782
G2 X85.713 Y84.167 I1.103 J10.818 E.06821
G2 X85.134 Y84.653 I.956 J1.724 E.02335
G2 X85.079 Y84.837 I.322 J.198 E.00598
G1 X85.079 Y86.431 E.04898
G1 X87.317 Y86.556 E.06888
G1 X87.325 Y86.418 E.00425
G1 X87.598 Y86.433 E.00843
G1 X87.564 Y87.073 E.01972
G1 X86.948 Y87.039 E.01896
G1 X86.948 Y88.495 E.04474
G1 X86.948 Y88.895 E.01229
G1 X86.948 Y89.295 E.01229
G1 X86.948 Y89.695 E.01229
G1 F2586.419
G1 X87.004 Y89.719 E.00188
G1 F2172.349
G1 X87.247 Y89.823 E.00809
G1 F804.237
G1 X87.295 Y89.851 E.00171
M106 S201.45
M106 S255
G1 F600
G1 X87.295 Y90.149 E.00918
M106 S201.45
M106 S255
G1 F840
G1 X87.247 Y90.177 E.00171
M106 S201.45
M106 S255
G1 F2231.203
G1 X87.004 Y90.281 E.0081
G1 F2651.052
G1 X86.948 Y90.305 E.00189
G1 F4519
G1 X86.948 Y90.705 E.01229
G1 X86.948 Y91.105 E.01229
G1 X86.948 Y91.505 E.01229
G1 X86.948 Y92.901 E.0429
; WIPE_START
G1 F12000
M204 S6000
G1 X87.564 Y92.927 E-.23437
G1 X87.598 Y93.567 E-.24381
G1 X87.325 Y93.583 E-.10422
G1 X87.317 Y93.444 E-.05256
G1 X86.989 Y93.463 E-.12504
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.3 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z7.3
G1 X0 Y90.0001 F18000 ; move to safe pos
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
            G0 Z7.3 F4000
            G39.3 S1
            G0 Z7.3 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X86.752 Y93.224 F42000
G1 Z6.9
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.153965
G1 F4519
M204 S6000
G1 X87.382 Y93.189 E.00571
; WIPE_START
G1 F15000
G1 X86.752 Y93.224 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.081 Y92.814 Z7.3 F42000
G1 Z6.9
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F4519
M204 S2000
G1 X85.6 Y93.332 E.02253
G1 X85.095 Y93.36
G1 X84.287 Y92.552 E.0351
G1 X83.766 Y92.565
G1 X84.871 Y93.67 E.04804
G1 X84.871 Y94.204
G1 X83.766 Y93.098 E.04805
G1 X83.766 Y93.631
G1 X84.871 Y94.737 E.04805
G1 X84.889 Y95.288
G1 X83.766 Y94.164 E.04882
G1 X83.766 Y94.698
G1 X85.037 Y95.969 E.05525
M204 S10000
G1 X85.211 Y95.795 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.161354
G1 F4519
M204 S6000
G1 X84.889 Y95.447 E.00457
; LINE_WIDTH: 0.199681
G1 X84.825 Y95.352 E.00147
M204 S10000
G1 X84.578 Y95.811 F42000
; LINE_WIDTH: 0.243852
G1 F4519
M204 S6000
G1 X84.37 Y95.67 E.00411
; LINE_WIDTH: 0.28514
G1 X84.163 Y95.528 E.00496
; LINE_WIDTH: 0.326429
G1 X83.955 Y95.387 E.0058
; LINE_WIDTH: 0.367717
G1 X83.748 Y95.246 E.00665
; WIPE_START
G1 F15000
G1 X83.955 Y95.387 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.764 Y93.018 Z7.3 F42000
G1 Z6.9
G1 E.8 F1800
; LINE_WIDTH: 0.102326
G1 F4519
M204 S6000
G1 X85.746 Y93.343 E.00157
; WIPE_START
G1 F15000
G1 X85.764 Y93.018 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.17 Y92.185 Z7.3 F42000
G1 Z6.9
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.366978
G1 F4519
M204 S6000
G1 X83.123 Y92.044 E.00392
; LINE_WIDTH: 0.320956
G1 X83.077 Y91.903 E.00336
G1 X83.077 Y88.092 E.08634
; LINE_WIDTH: 0.335983
G1 X83.124 Y87.951 E.00354
; LINE_WIDTH: 0.382218
G1 X83.171 Y87.81 E.0041
G1 X83.171 Y85.482 E.06437
G1 X82.831 Y85.675 E.0108
G1 X82.831 Y87.81 E.05904
; LINE_WIDTH: 0.367088
G1 X82.815 Y87.951 E.00374
; LINE_WIDTH: 0.320935
G1 X82.8 Y88.092 E.00321
G1 X82.799 Y91.903 E.08633
; LINE_WIDTH: 0.335873
G1 X82.815 Y92.044 E.00338
; LINE_WIDTH: 0.382203
G1 X82.831 Y92.185 E.00392
G1 X82.83 Y94.33 E.05932
G1 X83.17 Y94.527 E.01086
G1 X83.17 Y92.245 E.06311
; WIPE_START
G1 F15000
G1 X83.17 Y94.245 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.658 Y93.783 Z7.3 F42000
G1 Z6.9
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.42296
; LAYER_HEIGHT: 0.4
G1 F3000
M204 S6000
G1 X82.436 Y93.783 E.04452
G1 X82.436 Y93.31 E.02708
G1 X81.374 Y93.31 E.06079
G1 X81.29 Y93.246 E.00606
G3 X80.827 Y92.837 I2.517 J-3.315 E.03537
G1 X82.436 Y92.837 E.09208
G1 X82.436 Y92.364 E.02708
G1 X80.347 Y92.364 E.11955
G1 X80.109 Y92.118 E.01964
G3 X79.899 Y91.891 I1.336 J-1.451 E.0177
G1 X82.436 Y91.891 E.14523
G1 X82.436 Y91.419 E.02708
G1 X79.508 Y91.418 E.16759
G3 X79.153 Y90.945 I3.06 J-2.667 E.03389
G1 X82.436 Y90.946 E.18792
G1 X82.436 Y90.473 E.02708
G1 X78.821 Y90.472 E.20694
G1 X78.528 Y89.999 E.03183
G1 X82.436 Y90 E.22369
G1 X82.436 Y89.527 E.02708
G1 X78.824 Y89.526 E.20676
G1 X79.152 Y89.053 E.03296
G1 X82.436 Y89.054 E.18797
G1 X82.436 Y88.581 E.02708
G1 X79.516 Y88.581 E.16716
G1 X79.905 Y88.108 E.03507
G1 X82.436 Y88.108 E.14488
G1 X82.436 Y87.635 E.02708
G1 X80.342 Y87.635 E.11986
G3 X80.829 Y87.162 I3.994 J3.622 E.03887
G1 X82.436 Y87.162 E.09201
G1 X82.436 Y86.689 E.02708
G1 X81.368 Y86.689 E.06115
G3 X81.989 Y86.216 I5.157 J6.128 E.04471
G1 X82.639 Y86.216 E.03719
M106 S201.45
; WIPE_START
G1 X81.989 Y86.216 E-.24687
G1 X81.368 Y86.689 E-.29664
G1 X81.938 Y86.689 E-.21649
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.912 Y84.645 Z7.3 F42000
G1 Z6.9
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.2
G1 F4519
M204 S2000
G1 X84.495 Y84.229 E.01811
G1 X84.116 Y84.383
G1 X84.871 Y85.138 E.03281
G1 X84.871 Y85.671
G1 X83.777 Y84.577 E.04758
G1 X83.767 Y85.1
G1 X84.872 Y86.205 E.04801
G1 X85.319 Y86.652
G1 X85.663 Y86.996 E.01492
G1 X85.261 Y87.127
G1 X83.767 Y85.633 E.06491
G1 X83.767 Y86.166
G1 X84.859 Y87.258 E.04744
G1 X84.456 Y87.389
G1 X83.767 Y86.7 E.02998
; WIPE_START
G1 F12000
M204 S6000
G1 X84.456 Y87.389 E-.3707
G1 X84.859 Y87.258 E-.1607
G1 X84.433 Y86.833 E-.22859
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.333 Y87.667 Z7.3 F42000
G1 Z6.9
G1 E.8 F1800
G1 F4519
M204 S2000
G1 X86.015 Y87.349 E.01382
G1 X85.613 Y87.48
G1 X86.333 Y88.2 E.03129
G1 X86.333 Y88.733
G1 X85.211 Y87.611 E.04876
G1 X84.809 Y87.742
G1 X86.333 Y89.266 E.06623
G1 X86.333 Y89.8
G1 X84.407 Y87.874 E.0837
G1 X84.005 Y88.005
G1 X86.333 Y90.333 E.10117
G1 X86.333 Y90.866
G1 X83.603 Y88.136 E.11864
G1 X83.235 Y88.301
G1 X86.333 Y91.399 E.13465
G1 X86.333 Y91.933
G1 X83.235 Y88.834 E.13465
G1 X83.235 Y89.367
G1 X86.333 Y92.466 E.13466
G1 X85.972 Y92.638
G1 X83.235 Y89.9 E.11897
G1 X83.234 Y90.434
G1 X85.178 Y92.377 E.08446
G1 X84.384 Y92.116
G1 X83.234 Y90.967 E.04994
; WIPE_START
G1 F12000
M204 S6000
G1 X84.384 Y92.116 E-.61764
G1 X84.74 Y92.233 E-.14236
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.955 Y91.97 Z7.3 F42000
G1 Z6.9
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.383778
G1 F4519
M204 S6000
G1 X83.387 Y91.628 E.01843
; LINE_WIDTH: 0.363685
G1 X83.365 Y91.661 E.00103
; LINE_WIDTH: 0.320055
G1 X83.343 Y91.694 E.00089
; LINE_WIDTH: 0.276424
G1 X83.321 Y91.727 E.00075
; LINE_WIDTH: 0.232794
G1 X83.299 Y91.76 E.00061
; LINE_WIDTH: 0.171026
G1 X83.278 Y91.793 E.00041
G1 X83.278 Y91.989 E.00205
; WIPE_START
G1 F15000
G1 X83.278 Y91.793 E-.63243
G1 X83.299 Y91.76 E-.12757
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.411 Y96.3 Z7.3 F42000
G1 Z6.9
G1 E.8 F1800
; LINE_WIDTH: 0.17362
G1 F4519
M204 S6000
G3 X87.296 Y96.487 I-2.139 J12.342 E.00964
; LINE_WIDTH: 0.225838
G1 X87.386 Y96.517 E.0014
; LINE_WIDTH: 0.256539
G1 X87.687 Y96.659 E.0058
; WIPE_START
G1 F15000
G1 X87.386 Y96.517 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.3 I1.217 J0 P1  F42000
G1 X87.382 Y86.811 Z7.3
G1 Z6.9
G1 E.8 F1800
; LINE_WIDTH: 0.153973
G1 F4519
M204 S6000
G1 X86.752 Y86.776 E.00571
; WIPE_START
G1 F15000
G1 X87.382 Y86.811 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.41 Y83.701 Z7.3 F42000
G1 Z6.9
G1 E.8 F1800
; LINE_WIDTH: 0.172948
G1 F4519
M204 S6000
G2 X87.286 Y83.517 I-15.584 J-76.324 E.00949
; LINE_WIDTH: 0.224625
G1 X87.387 Y83.484 E.00157
; LINE_WIDTH: 0.256146
G1 X87.687 Y83.349 E.00572
; WIPE_START
G1 F15000
G1 X87.387 Y83.484 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.692 Y87.784 Z7.3 F42000
G1 X93.928 Y87.946 Z7.3
G1 Z6.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4519
M204 S6000
G1 X93.928 Y92.165 E.13997
G1 X93.364 Y92.165 E.01871
G1 X93.364 Y87.835 E.14365
M73 P60 R7
G1 X93.928 Y87.835 E.01871
G1 X93.928 Y87.886 E.00168
M204 S10000
G1 X94.32 Y87.945 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4519
M204 S5000
G1 X97.971 Y87.945 E.11218
G1 X97.971 Y92.055 E.12626
G1 X94.32 Y92.055 E.11218
G1 X94.32 Y88.005 E.12441
; WIPE_START
G1 F12000
M204 S6000
G1 X96.32 Y87.973 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.972 Y92.626 Z7.3 F42000
G1 Z6.9
G1 E.8 F1800
G1 F4519
M204 S5000
G1 X92.972 Y87.374 E.16139
G1 X91.52 Y87.293 E.04469
G1 X91.556 Y86.652 E.01971
G1 X91.809 Y86.666 E.00777
G1 X91.828 Y86.668 E.00059
G1 X91.82 Y86.806 E.00426
G1 X93.462 Y86.9 E.05054
G1 X93.475 Y86.931 E.00103
G1 X93.475 Y87.443 E.01573
G1 X98.084 Y87.443 E.14161
G3 X98.474 Y87.833 I.001 J.389 E.01884
G1 X98.474 Y92.167 E.13318
G3 X98.119 Y92.556 I-.383 J.007 E.01783
G1 X93.475 Y92.557 E.14269
G1 X93.475 Y93.068 E.0157
G1 X93.461 Y93.101 E.00109
G1 X91.82 Y93.194 E.05051
G1 X91.828 Y93.332 E.00426
G1 X91.556 Y93.348 E.00836
G1 X91.52 Y92.707 E.01971
G1 X92.912 Y92.629 E.04284
M204 S10000
G1 X93.224 Y92.361 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.154272
G1 F4519
M204 S6000
G1 X93.215 Y92.856 E.00449
G1 X91.73 Y92.947 E.0135
; WIPE_START
G1 F15000
G1 X93.215 Y92.856 E-.57043
G1 X93.224 Y92.361 E-.18957
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.124 Y87.694 Z7.3 F42000
G1 Z6.9
G1 E.8 F1800
; LINE_WIDTH: 0.152793
G1 F4519
M204 S6000
G1 X98.074 Y87.694 E.03537
G3 X98.223 Y87.842 I.029 J.12 E.00225
G1 X98.223 Y92.158 E.03864
G3 X98.1 Y92.305 I-.112 J.031 E.00202
G1 X94.124 Y92.306 E.03559
M204 S10000
G1 X93.646 Y91.962 F42000
; LINE_WIDTH: 0.1999
G1 F4519
M204 S6000
G1 X93.646 Y88.038 E.05019
M204 S10000
G1 X93.224 Y87.639 F42000
; LINE_WIDTH: 0.154256
G1 F4519
M204 S6000
G1 X93.215 Y87.144 E.00449
G1 X91.73 Y87.053 E.0135
; CHANGE_LAYER
; Z_HEIGHT: 7.1
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X93.215 Y87.144 E-.57038
G1 X93.224 Y87.639 E-.18962
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 36/111
; update layer progress
M73 L36
M991 S0 P35 ;notify layer change

; OBJECT_ID: 427
M204 S10000
G17
G3 Z7.3 I-.328 J1.172 P1  F42000
G1 X94.32 Y87.945 Z7.3
G1 Z7.1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4365
M204 S5000
G1 X97.971 Y87.945 E.11218
G1 X97.971 Y92.055 E.12626
G1 X94.32 Y92.055 E.11218
G1 X94.32 Y88.005 E.12441
; WIPE_START
G1 F12000
M204 S6000
G1 X96.32 Y87.973 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.977 Y92.631 Z7.5 F42000
G1 Z7.1
G1 E.8 F1800
M106 S255
G1 F4365
M204 S5000
G1 X92.977 Y87.369 E.16169
G1 X91.525 Y87.288 E.04469
G1 X91.561 Y86.648 E.01971
G1 X91.798 Y86.661 E.00728
G1 X91.833 Y86.663 E.00108
G1 X91.825 Y86.801 E.00425
G1 X93.467 Y86.895 E.05054
G1 X93.481 Y86.926 E.00104
G1 X93.48 Y87.443 E.01588
G1 X98.083 Y87.443 E.14144
G3 X98.474 Y87.833 I.001 J.389 E.01886
G1 X98.474 Y92.167 E.13316
G3 X98.12 Y92.555 I-.383 J.007 E.0178
G1 X93.48 Y92.557 E.14257
G1 X93.481 Y93.073 E.01585
G1 X93.466 Y93.105 E.00109
G1 X91.825 Y93.199 E.05051
G1 X91.833 Y93.337 E.00426
G1 X91.561 Y93.352 E.00836
G1 X91.525 Y92.712 E.01971
G1 X92.917 Y92.634 E.04284
; WIPE_START
G1 F12000
M204 S6000
G1 X92.94 Y90.635 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.5 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z7.5
G1 X0 Y90.0001 F18000 ; move to safe pos
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
            G0 Z7.5 F4000
            G39.3 S1
            G0 Z7.5 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X94.113 Y91.486 F42000
G1 Z7.1
G1 E.8 F1800
; FEATURE: Top surface
G1 F4365
M204 S2000
G1 X93.249 Y92.35 E.03754
G1 X93.185 Y91.881
G1 X94.113 Y90.953 E.04033
G1 X94.113 Y90.42
G1 X93.185 Y91.348 E.04033
G1 X93.185 Y90.815
G1 X94.113 Y89.886 E.04033
G1 X94.113 Y89.353
G1 X93.185 Y90.281 E.04033
G1 X93.185 Y89.748
G1 X94.113 Y88.82 E.04033
G1 X94.113 Y88.287
G1 X93.185 Y89.215 E.04033
G1 X93.185 Y88.682
G1 X94.113 Y87.753 E.04033
G1 X93.683 Y87.65
G1 X93.185 Y88.148 E.02165
; WIPE_START
G1 F12000
M204 S6000
G1 X93.683 Y87.65 E-.26772
G1 X94.113 Y87.753 E-.16805
G1 X93.51 Y88.357 E-.32424
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.814 Y87.108 Z7.5 F42000
G1 Z7.1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.154031
G1 F4365
M204 S6000
G1 X91.735 Y87.048 E.00978
; WIPE_START
G1 F15000
G1 X92.814 Y87.108 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.342 Y87.694 Z7.5 F42000
G1 Z7.1
G1 E.8 F1800
; LINE_WIDTH: 0.152752
G1 F4365
M204 S6000
G1 X98.074 Y87.694 E.0334
G3 X98.223 Y87.843 I.028 J.12 E.00225
G1 X98.223 Y92.157 E.03861
G3 X98.101 Y92.305 I-.112 J.032 E.00201
G1 X94.342 Y92.306 E.03364
; WIPE_START
G1 F15000
G1 X96.342 Y92.305 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.814 Y92.892 Z7.5 F42000
G1 Z7.1
G1 E.8 F1800
; LINE_WIDTH: 0.153876
G1 F4365
M204 S6000
G1 X91.735 Y92.952 E.00977
; WIPE_START
G1 F15000
G1 X92.814 Y92.892 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.513 Y93.102 Z7.5 F42000
G1 Z7.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4365
M204 S6000
G1 X85.665 Y93.149 E.02817
G1 X85.665 Y86.853 E.20884
G1 X86.54 Y86.901 E.02906
G1 X86.54 Y89.481 E.08561
G1 X86.887 Y89.537 E.01166
G1 X86.887 Y90.463 E.0307
G1 X86.54 Y90.519 E.01165
G1 X86.54 Y93.067 E.08454
M204 S10000
G1 X86.932 Y92.967 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4365
M204 S5000
G1 X87.548 Y92.933 E.01896
G1 X87.583 Y93.574 E.01971
G1 X87.309 Y93.589 E.00843
G1 X87.301 Y93.45 E.00425
G1 X85.283 Y93.558 E.06211
G1 X85.276 Y86.45 E.2184
G1 X87.302 Y86.549 E.06232
G1 X87.309 Y86.411 E.00424
G1 X87.325 Y86.412 E.00051
G1 X87.583 Y86.427 E.00792
G1 X87.548 Y87.067 E.01971
G1 X86.932 Y87.033 E.01896
G1 X86.932 Y87.947 E.0281
G1 X86.932 Y88.347 E.01229
G1 X86.932 Y88.747 E.01229
G1 X86.932 Y89.147 E.01229
G1 F2619.929
G1 X86.989 Y89.156 E.00176
G1 F2229.3
G1 X87.279 Y89.203 E.00904
G1 F720
G1 X87.279 Y89.794 E.01816
M106 S201.45
M106 S255
G1 F1688.674
G1 X87.279 Y90.206 E.01265
G1 F720
G1 X87.279 Y90.797 E.01816
M106 S201.45
G1 F2227.182
G1 X86.989 Y90.844 E.00903
G1 F2618.204
G1 X86.932 Y90.853 E.00176
G1 F4365
G1 X86.932 Y91.253 E.01229
G1 X86.932 Y91.653 E.01229
G1 X86.932 Y92.053 E.01229
G1 X86.932 Y92.907 E.02626
M204 S10000
G1 X86.736 Y93.23 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.153953
G1 F4365
M204 S6000
G1 X87.366 Y93.195 E.00571
; WIPE_START
G1 F15000
G1 X86.736 Y93.23 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.103 Y92.921 Z7.5 F42000
G1 Z7.1
G1 E.8 F1800
; LINE_WIDTH: 0.510822
G1 F4365
M204 S6000
G1 X86.103 Y90.383 E.09675
M204 S10000
G1 X86.048 Y90 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.395543
G1 F4365
M204 S6000
G1 X86.504 Y90 E.0131
G1 X86.623 Y89.821 E.00618
G1 X86.623 Y89.762 E.00167
G1 X86.504 Y90 E.00763
G1 X86.622 Y90.178 E.00613
M204 S10000
G1 X86.103 Y89.617 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.510813
G1 F4365
M204 S6000
G1 X86.103 Y87.081 E.0967
M204 S10000
G1 X86.736 Y86.77 F42000
; LINE_WIDTH: 0.153918
G1 F4365
M204 S6000
G1 X87.366 Y86.805 E.00571
; WIPE_START
G1 F15000
G1 X86.736 Y86.77 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.451 Y93.659 Z7.5 F42000
G1 X82.878 Y94.859 Z7.5
G1 Z7.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4365
M204 S6000
G3 X78.048 Y90.059 I6.194 J-11.063 E.22872
G3 X78.121 Y89.795 I.297 J-.06 E.00943
G3 X82.877 Y85.137 I11.174 J6.652 E.22332
G1 X82.876 Y94.227 E.30153
G1 X82.878 Y94.799 E.019
; WIPE_START
G1 F15476.087
G1 X82.071 Y94.366 E-.34828
G1 X81.491 Y93.958 E-.26934
G1 X81.198 Y93.724 E-.14239
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.504 Y95.208 Z7.5 F42000
G1 Z7.1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4365
M204 S5000
G2 X84.778 Y95.473 I.639 J-.385 E.01185
G2 X86.063 Y95.991 I2.002 J-3.116 E.04282
G2 X87.712 Y96.295 I3.392 J-13.757 E.05154
G1 X87.712 Y96.54 E.00753
G1 X87.712 Y96.94 E.01229
G1 X87.266 Y96.94 E.0137
G1 X87.164 Y96.939 E.00314
G1 F3900
G1 X87.146 Y96.865 E.00232
G1 F4365
G1 X87.068 Y96.769 E.00382
G1 X86.98 Y96.719 E.0031
G1 X86.968 Y96.713 E.0004
G1 X86.409 Y96.603 E.01752
G3 X85.716 Y96.437 I3.294 J-15.271 E.0219
G3 X85.599 Y96.404 I.451 J-1.828 E.00372
G1 X85.312 Y96.32 E.00921
G3 X85.078 Y96.246 I.927 J-3.338 E.00753
G1 X85.053 Y96.238 E.00082
G3 X84.431 Y96.02 I3.131 J-9.931 E.02026
G1 X83.984 Y95.839 E.0148
G3 X83.003 Y95.374 I5.795 J-13.485 E.03338
G3 X82.472 Y95.079 I6.416 J-12.163 E.01865
G3 X81.854 Y94.692 I6.654 J-11.335 E.02241
G3 X80.907 Y94.002 I8.152 J-12.172 E.03603
G3 X80.315 Y93.499 I7.703 J-9.684 E.02387
G3 X79.786 Y92.996 I8.483 J-9.446 E.02244
G3 X79.287 Y92.465 I9.462 J-9.388 E.02239
G3 X78.67 Y91.717 I9.936 J-8.827 E.02979
G3 X78.119 Y90.927 I16.184 J-11.85 E.02961
G1 X77.948 Y90.666 E.0096
G1 X77.737 Y90.325 E.01229
G3 X77.69 Y90.226 I.602 J-.35 E.00341
G1 X77.668 Y90.157 E.0022
G3 X77.668 Y89.843 I.606 J-.157 E.00977
G3 X77.702 Y89.744 I.569 J.142 E.00323
G3 X77.785 Y89.594 I1.277 J.605 E.00525
G1 X78.038 Y89.186 E.01476
G3 X78.586 Y88.394 I12.578 J8.107 E.0296
G3 X79.195 Y87.639 I10.835 J8.127 E.02979
G3 X79.773 Y87.016 I9.958 J8.663 E.02613
G3 X80.302 Y86.512 I9.245 J9.165 E.02244
G3 X80.954 Y85.961 I8.659 J9.576 E.02625
G3 X81.602 Y85.479 I8.211 J10.376 E.02481
G3 X82.525 Y84.89 I8.171 J11.796 E.03365
G3 X83.205 Y84.522 I6.386 J10.971 E.02377
G3 X83.861 Y84.214 I5.943 J11.788 E.02226
G3 X84.53 Y83.943 I5.36 J12.291 E.02218
G3 X85.564 Y83.605 I8.203 J23.325 E.03344
G3 X86.24 Y83.435 I4.786 J17.649 E.02142
G1 X86.588 Y83.361 E.01091
G1 X86.979 Y83.281 E.01229
G1 X87.067 Y83.232 E.00309
G1 X87.138 Y83.144 E.00348
G1 F3693.615
G1 X87.169 Y83.063 E.00266
G1 F3000
G1 X87.169 Y83.062 E.00002
G1 F3797.996
G1 X87.267 Y83.061 E.00304
G1 F4365
G3 X87.71 Y83.06 I.268 J12.024 E.0136
G1 X87.711 Y83.46 E.01229
G1 X87.711 Y83.705 E.00754
G2 X85.279 Y84.257 I1.17 J10.788 E.0768
G2 X84.455 Y84.866 I.523 J1.571 E.03202
G2 X84.412 Y85.034 I.314 J.169 E.00538
G1 X84.411 Y94.968 E.30524
G2 X84.475 Y95.155 I.732 J-.145 E.00609
M204 S10000
G1 X84.079 Y95.654 F42000
; FEATURE: Top surface
G1 F4365
M204 S2000
G1 X84.363 Y95.37 E.01233
G1 X84.206 Y94.994
G1 X83.709 Y95.491 E.02156
G1 X83.349 Y95.318
G1 X84.203 Y94.463 E.03712
G1 X84.204 Y93.93
G1 X83.101 Y95.032 E.04789
G1 X83.1 Y94.501
G1 X84.204 Y93.397 E.04797
G1 X84.204 Y92.863
G1 X83.099 Y93.968 E.04802
G1 X83.099 Y93.435
G1 X84.204 Y92.33 E.04802
G1 X84.204 Y91.797
G1 X83.099 Y92.902 E.04802
G1 X83.099 Y92.368
G1 X84.204 Y91.263 E.04802
G1 X84.204 Y90.73
G1 X83.099 Y91.835 E.04802
G1 X83.099 Y91.302
G1 X84.204 Y90.197 E.04802
G1 X84.204 Y89.663
G1 X83.099 Y90.768 E.04802
G1 X83.099 Y90.235
G1 X84.204 Y89.13 E.04802
G1 X84.204 Y88.597
G1 X83.099 Y89.702 E.04802
G1 X83.099 Y89.169
G1 X84.204 Y88.063 E.04803
G1 X84.204 Y87.53
G1 X83.099 Y88.635 E.04803
G1 X83.099 Y88.102
G1 X84.205 Y86.997 E.04803
G1 X84.205 Y86.463
G1 X83.099 Y87.569 E.04803
G1 X83.099 Y87.035
G1 X84.205 Y85.93 E.04803
G1 X84.205 Y85.397
G1 X83.099 Y86.502 E.04803
G1 X83.099 Y85.969
G1 X84.252 Y84.816 E.05008
G1 X84.267 Y84.268
G1 X83.1 Y85.435 E.05073
; WIPE_START
G1 F12000
M204 S6000
G1 X84.267 Y84.268 E-.62738
G1 X84.257 Y84.617 E-.13262
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.751 Y84.491 Z7.5 F42000
G1 Z7.1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.110354
G1 F4365
M204 S6000
G1 X83.63 Y84.574 E.00081
; LINE_WIDTH: 0.152367
G1 X83.533 Y84.644 E.00107
; LINE_WIDTH: 0.192023
G1 X83.435 Y84.714 E.00146
; LINE_WIDTH: 0.231679
G1 X83.337 Y84.783 E.00184
; LINE_WIDTH: 0.27949
G2 X83.081 Y85.024 I.542 J.835 E.00682
; WIPE_START
G1 F15000
G1 X83.245 Y84.851 E-.51213
G1 X83.337 Y84.783 E-.24787
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.176 Y92.369 Z7.5 F42000
G1 X84.524 Y95.519 Z7.5
G1 Z7.1
G1 E.8 F1800
; LINE_WIDTH: 0.132824
G1 F4365
M204 S6000
G1 X84.317 Y95.77 E.00239
; WIPE_START
G1 F15000
G1 X84.524 Y95.519 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.229 Y95.16 Z7.5 F42000
G1 Z7.1
G1 E.8 F1800
; LINE_WIDTH: 0.113149
G1 F4365
M204 S6000
G1 X83.193 Y95.166 E.00021
; LINE_WIDTH: 0.144719
G1 X83.156 Y95.173 E.00031
G1 X83.188 Y95.212 E.00042
; LINE_WIDTH: 0.105133
G1 X83.294 Y95.289 E.00066
; WIPE_START
G1 F15000
G1 X83.188 Y95.212 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.745 Y96.175 Z7.5 F42000
G1 Z7.1
G1 E.8 F1800
; LINE_WIDTH: 0.170391
G1 F4365
M204 S6000
G1 X86.082 Y96.263 E.00363
G3 X87.163 Y96.502 I-3.55 J18.582 E.0115
; LINE_WIDTH: 0.224872
G1 X87.244 Y96.53 E.00127
; LINE_WIDTH: 0.251955
G1 X87.516 Y96.652 E.00507
; WIPE_START
G1 F15000
G1 X87.244 Y96.53 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.109 Y89.571 Z7.5 F42000
G1 X82.485 Y85.966 Z7.5
G1 Z7.1
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F4365
M204 S6000
G1 X82.485 Y85.836 E.00399
G2 X81.76 Y86.332 I4.823 J7.827 E.02701
G1 X80.826 Y87.096 E.03706
G2 X78.458 Y90 I8.886 J9.663 E.11554
G2 X81.096 Y93.142 I11.139 J-6.676 E.12659
G1 X82.006 Y93.846 E.03535
G1 X82.485 Y94.156 E.01752
G1 X82.485 Y86.026 E.24979
; WIPE_START
G1 F15000
G1 X82.485 Y88.026 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.731 Y87.33 Z7.5 F42000
G1 Z7.1
G1 E.8 F1800
G1 F4365
M204 S6000
G2 X79.344 Y89.999 I7.201 J8.843 E.11047
G2 X81.731 Y92.679 I9.758 J-6.287 E.11073
M73 P61 R7
G1 X81.731 Y87.39 E.16252
; WIPE_START
G1 F15000
G1 X81.731 Y89.39 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.91 Y90.726 Z7.5 F42000
G1 Z7.1
G1 E.8 F1800
; LINE_WIDTH: 0.5534
G1 F4365
M204 S6000
G1 X80.91 Y89.27 E.06057
G2 X80.343 Y89.999 I4.736 J4.27 E.03845
G1 X80.873 Y90.679 E.03586
; WIPE_START
G1 F12341.326
G1 X80.343 Y89.999 E-.32762
G1 X80.475 Y89.809 E-.08786
G1 X80.91 Y89.27 E-.26323
G1 X80.91 Y89.484 E-.08129
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.354 Y91.838 Z7.5 F42000
G1 Z7.1
G1 E.8 F1800
; LINE_WIDTH: 0.41999
G1 F4365
M204 S6000
G1 X81.354 Y88.155 E.11316
G2 X79.801 Y90.002 I8.219 J8.489 E.07426
G2 X81.31 Y91.798 I8.534 J-5.639 E.07223
; WIPE_START
G1 F15000
G1 X80.723 Y91.197 E-.31913
G1 X80.193 Y90.554 E-.31675
G1 X80.004 Y90.287 E-.12412
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.108 Y93.448 Z7.5 F42000
G1 Z7.1
G1 E.8 F1800
G1 F4365
M204 S6000
G1 X82.108 Y86.548 E.21202
G1 X81.076 Y87.379 E.0407
G2 X78.9 Y89.999 I8.65 J9.396 E.10495
G2 X82.061 Y93.411 I10.201 J-6.277 E.14383
; WIPE_START
G1 F15000
G1 X81.325 Y92.84 E-.35392
G1 X80.585 Y92.151 E-.38422
G1 X80.546 Y92.109 E-.02187
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.603 Y85.644 Z7.5 F42000
G1 X85.744 Y83.826 Z7.5
G1 Z7.1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.17097
G1 F4365
M204 S6000
G3 X87.155 Y83.502 I8.707 J34.691 E.0151
; LINE_WIDTH: 0.224558
G1 X87.244 Y83.472 E.00139
; LINE_WIDTH: 0.252777
G1 X87.515 Y83.349 E.00509
; CHANGE_LAYER
; Z_HEIGHT: 7.3
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X87.244 Y83.472 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 37/111
; update layer progress
M73 L37
M991 S0 P36 ;notify layer change

; OBJECT_ID: 427
M204 S10000
G17
G3 Z7.5 I-.683 J1.007 P1  F42000
G1 X92.983 Y87.364 Z7.5
G1 Z7.3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3191
M204 S5000
G1 X91.531 Y87.283 E.04469
G1 X91.567 Y86.643 E.01971
G1 X91.787 Y86.655 E.00679
G1 X91.838 Y86.658 E.00156
G1 X91.83 Y86.796 E.00425
G1 X93.469 Y86.889 E.05043
G1 X93.483 Y86.902 E.00062
G1 X93.486 Y93.088 E.19006
G1 X93.472 Y93.111 E.00081
G1 X91.83 Y93.204 E.05054
G1 X91.838 Y93.342 E.00425
G1 X91.567 Y93.357 E.00836
G1 X91.531 Y92.717 E.01971
G1 X92.983 Y92.636 E.04469
G1 X92.983 Y87.424 E.16016
; WIPE_START
G1 F12000
M204 S6000
G1 X91.531 Y87.283 E-.55438
G1 X91.561 Y86.743 E-.20562
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.7 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z7.7
G1 X0 Y90.0001 F18000 ; move to safe pos
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
            G0 Z7.7 F4000
            G39.3 S1
            G0 Z7.7 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X91.74 Y87.043 F42000
G1 Z7.3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.153899
G1 F3191
M204 S6000
G1 X93.182 Y87.124 E.01305
G1 X93.226 Y87.135 E.00041
G1 X93.234 Y87.178 E.0004
G1 X93.226 Y92.864 E.05142
G1 X91.74 Y92.957 E.01346
; WIPE_START
G1 F15000
G1 X93.226 Y92.864 E-.56559
G1 X93.227 Y92.353 E-.19442
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.497 Y93.108 Z7.7 F42000
G1 Z7.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3191
M204 S6000
G1 X85.65 Y93.155 E.02817
G1 X85.65 Y86.847 E.20924
G1 X86.524 Y86.894 E.02906
G1 X86.525 Y89.178 E.07575
G1 X86.871 Y89.217 E.01157
G1 X86.872 Y90.783 E.05198
G1 X86.525 Y90.822 E.01158
G1 X86.524 Y93.073 E.07468
M204 S10000
G1 X86.916 Y92.973 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3191
M204 S5000
G1 X87.533 Y92.939 E.01896
G1 X87.567 Y93.58 E.01971
G1 X87.293 Y93.595 E.00843
G1 X87.286 Y93.457 E.00425
G1 X85.267 Y93.564 E.0621
G1 X85.26 Y86.444 E.21878
G1 X87.286 Y86.543 E.06232
G1 X87.293 Y86.405 E.00424
G1 X87.327 Y86.407 E.00103
G1 X87.567 Y86.42 E.0074
G1 X87.533 Y87.061 E.01971
G1 X86.916 Y87.027 E.01896
G1 X86.916 Y87.627 E.01845
G1 X86.917 Y88.027 E.01229
G1 X86.917 Y88.427 E.01229
G1 X86.917 Y88.827 E.01229
G1 F2803.304
G1 X86.973 Y88.833 E.00175
G1 F2400
G1 X87.263 Y88.865 E.00896
G1 X87.263 Y89.159 E.00903
G1 F3191
G1 X87.263 Y89.559 E.01229
G1 X87.263 Y89.959 E.01229
G1 X87.264 Y90.359 E.01229
G1 X87.264 Y90.841 E.0148
G1 F2400
G1 X87.263 Y91.135 E.00903
G1 X86.973 Y91.167 E.00897
G1 F2803.304
G1 X86.917 Y91.173 E.00175
G1 F3191
G1 X86.917 Y91.573 E.01229
G1 X86.917 Y91.973 E.01229
G1 X86.916 Y92.373 E.01229
G1 X86.916 Y92.913 E.0166
M204 S10000
G1 X86.72 Y93.236 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.153964
G1 F3191
M204 S6000
G1 X87.35 Y93.201 E.00571
; WIPE_START
G1 F15000
G1 X86.72 Y93.236 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.087 Y92.927 Z7.7 F42000
G1 Z7.3
G1 E.8 F1800
; LINE_WIDTH: 0.510797
G1 F3191
M204 S6000
G1 X86.087 Y90.666 E.08621
; WIPE_START
G1 F13465.077
G1 X86.087 Y92.666 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.606 Y89.549 Z7.7 F42000
G1 Z7.3
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F3191
M204 S6000
G1 X86.607 Y89.513 E.00098
M204 S10000
G1 X86.606 Y89.549 F42000
; LINE_WIDTH: 0.393585
G1 F3191
M204 S6000
G1 X86.546 Y89.644 E.00324
; LINE_WIDTH: 0.441427
G1 X86.26 Y89.742 E.0098
G1 X86.057 Y89.742 E.00662
G1 X86.057 Y90.258 E.01677
G1 X86.26 Y90.258 E.00662
G1 X86.546 Y90.352 E.00977
; LINE_WIDTH: 0.411641
G1 X86.607 Y90.462 E.00377
G1 X86.464 Y90.055 E.01297
; LINE_WIDTH: 0.450365
G1 X86.464 Y89.945 E.00362
; LINE_WIDTH: 0.4335
G1 X86.525 Y89.775 E.00575
; LINE_WIDTH: 0.39978
G1 X86.586 Y89.605 E.00526
M204 S10000
G1 X86.087 Y89.334 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.5108
G1 F3191
M204 S6000
G1 X86.087 Y87.075 E.08616
M204 S10000
G1 X86.72 Y86.764 F42000
; LINE_WIDTH: 0.153936
G1 F3191
M204 S6000
G1 X87.35 Y86.799 E.00571
; WIPE_START
G1 F15000
G1 X86.72 Y86.764 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.883 Y93.362 Z7.7 F42000
G1 X82.209 Y94.52 Z7.7
G1 Z7.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3191
M204 S6000
G3 X77.963 Y90.081 I6.973 J-10.923 E.20573
G3 X78.028 Y89.796 I.301 J-.081 E.0101
G3 X82.21 Y85.475 I11.289 J6.741 E.20126
G1 X82.209 Y94.46 E.29804
; WIPE_START
G1 F15476.087
G1 X81.692 Y94.174 E-.22438
G1 X81.029 Y93.674 E-.31566
G1 X80.588 Y93.299 E-.21996
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.814 Y94.943 Z7.7 F42000
G1 Z7.3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3191
M204 S5000
G1 X83.834 Y94.971 E.00107
G2 X84.023 Y95.189 I.653 J-.378 E.0089
G2 X85.228 Y95.791 I2.274 J-3.041 E.04163
G2 X87.57 Y96.308 I3.926 J-12.219 E.07381
G1 X87.571 Y96.541 E.00715
G1 X87.571 Y96.941 E.01229
G1 X87.122 Y96.938 E.0138
G1 X87.025 Y96.936 E.00297
G1 X86.996 Y96.862 E.00243
G1 X86.927 Y96.776 E.00337
G1 X86.848 Y96.731 E.00282
G1 X86.827 Y96.72 E.00073
G1 X86.436 Y96.637 E.01229
G1 X85.942 Y96.53 E.01552
G3 X84.696 Y96.161 I3.412 J-13.786 E.03995
G1 X84.434 Y96.065 E.00856
G1 X84.415 Y96.058 E.00062
G3 X83.901 Y95.852 I2.971 J-8.174 E.01702
G3 X82.918 Y95.384 I5.908 J-13.688 E.03345
G3 X82.306 Y95.041 I6.109 J-11.588 E.02156
G3 X81.466 Y94.495 I7.805 J-12.925 E.0308
G3 X80.784 Y93.98 I7.743 J-10.983 E.02626
G3 X80.227 Y93.506 I8.717 J-10.799 E.02249
G3 X79.698 Y93.001 I8.716 J-9.673 E.02247
G3 X79.135 Y92.398 I9.106 J-9.054 E.02534
G3 X78.58 Y91.721 I9.719 J-8.53 E.02693
G3 X78.021 Y90.933 I10.503 J-8.048 E.02967
G1 X77.84 Y90.639 E.01064
G1 X77.63 Y90.298 E.01229
G3 X77.569 Y90.124 I.609 J-.311 E.00567
G3 X77.569 Y89.876 I.754 J-.124 E.00767
G3 X77.613 Y89.738 I.628 J.125 E.00444
G1 X77.819 Y89.395 E.01229
G1 X77.946 Y89.183 E.00759
G3 X78.496 Y88.39 I11.079 J7.103 E.02967
G3 X79.106 Y87.635 I10.523 J7.879 E.02984
G1 X79.348 Y87.363 E.01118
G3 X80.306 Y86.424 I10.395 J9.632 E.04122
G3 X80.941 Y85.895 I8.83 J9.965 E.02543
G3 X81.857 Y85.24 I9.188 J11.878 E.0346
G1 X82.166 Y85.044 E.01122
G3 X82.905 Y84.622 I7.2 J11.745 E.02618
G3 X83.642 Y84.261 I6.256 J11.857 E.02521
G3 X84.512 Y83.906 I6.227 J13.994 E.02889
G1 X84.519 Y83.903 E.00021
G1 X84.636 Y83.861 E.00383
G3 X85.587 Y83.565 I5.302 J15.353 E.0306
G1 X86.458 Y83.359 E.0275
G1 X86.848 Y83.268 E.01229
G1 X86.927 Y83.225 E.00277
G1 X86.996 Y83.138 E.00342
G1 X87.024 Y83.066 E.00237
G1 X87.125 Y83.063 E.0031
G1 X87.57 Y83.059 E.0137
G1 X87.57 Y83.459 E.01229
G1 X87.57 Y83.692 E.00715
G2 X84.672 Y84.416 I1.392 J11.723 E.09205
G2 X83.829 Y85.026 I.825 J2.031 E.03227
M73 P61 R6
G2 X83.745 Y85.262 I.434 J.287 E.00778
G1 X83.745 Y94.733 E.29102
G2 X83.764 Y94.81 I.742 J-.14 E.00244
G1 X83.793 Y94.886 E.00251
; WIPE_START
G1 F12000
M204 S6000
G1 X83.834 Y94.971 E-.03585
G1 X84.023 Y95.189 E-.10944
G1 X84.188 Y95.316 E-.07936
G1 X84.533 Y95.517 E-.15158
G1 X84.761 Y95.623 E-.09546
G1 X85.228 Y95.791 E-.1889
G1 X85.48 Y95.862 E-.09942
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.079 Y96.015 Z7.7 F42000
G1 Z7.3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.168284
G1 F3191
M204 S6000
G2 X87.016 Y96.508 I7.796 J-26.556 E.02042
; LINE_WIDTH: 0.222321
G1 X87.105 Y96.539 E.00138
; LINE_WIDTH: 0.250773
G1 X87.375 Y96.663 E.00502
; WIPE_START
G1 F15000
G1 X87.105 Y96.539 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.593 Y89.763 Z7.7 F42000
G1 X81.818 Y86.339 Z7.7
G1 Z7.3
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F3191
M204 S6000
G1 X81.818 Y86.221 E.00361
G2 X78.985 Y89.059 I7.401 J10.221 E.12372
G1 X78.368 Y90.002 E.03464
G2 X81.817 Y93.767 I10.49 J-6.15 E.15806
G1 X81.818 Y86.399 E.22639
M204 S10000
G1 X81.441 Y86.984 F42000
G1 F3191
M204 S6000
G2 X78.816 Y90 I7.727 J9.377 E.12343
G2 X81.44 Y93.014 I10.323 J-6.341 E.12337
G1 X81.441 Y87.044 E.18343
; WIPE_START
G1 F15000
G1 X81.441 Y89.044 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.276 Y89.948 Z7.7 F42000
G1 Z7.3
G1 E.8 F1800
; LINE_WIDTH: 0.55012
G1 F3191
M204 S6000
G2 X80.278 Y90.055 I-.026 J.054 E.01013
; WIPE_START
G1 F12421.136
G1 X80.213 Y90.057 E-.19396
G1 X80.181 Y90.003 E-.18868
G1 X80.213 Y89.948 E-.18868
G1 X80.276 Y89.948 E-.18867
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.686 Y91.252 Z7.7 F42000
G1 Z7.3
G1 E.8 F1800
; LINE_WIDTH: 0.41999
G1 F3191
M204 S6000
G1 X80.687 Y88.744 E.07704
G2 X79.711 Y89.997 I9.764 J8.616 E.04882
G1 X80.359 Y90.879 E.03363
G1 X80.647 Y91.207 E.01342
; WIPE_START
G1 F15000
G1 X80.359 Y90.879 E-.16592
G1 X79.711 Y89.997 E-.41589
G1 X79.987 Y89.618 E-.17819
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.063 Y92.172 Z7.7 F42000
G1 Z7.3
G1 E.8 F1800
G1 F3191
M204 S6000
G1 X81.064 Y87.819 E.13377
G2 X79.263 Y89.999 I7.593 J8.106 E.08711
G2 X81.021 Y92.13 I8.543 J-5.253 E.08516
; WIPE_START
G1 F15000
G1 X80.562 Y91.682 E-.2437
G1 X80.071 Y91.123 E-.2827
G1 X79.697 Y90.635 E-.2336
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.627 Y84.961 Z7.7 F42000
G1 Z7.3
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F3191
M204 S2000
G1 X83.314 Y84.648 E.0136
G1 X82.961 Y84.828
G1 X83.537 Y85.404 E.02504
G1 X83.537 Y85.937
G1 X82.619 Y85.018 E.03993
G1 X82.433 Y85.366
G1 X83.537 Y86.47 E.048
G1 X83.537 Y87.004
G1 X82.433 Y85.899 E.048
G1 X82.433 Y86.432
G1 X83.537 Y87.537 E.048
G1 X83.537 Y88.07
G1 X82.433 Y86.965 E.048
G1 X82.433 Y87.499
G1 X83.537 Y88.603 E.048
G1 X83.537 Y89.136
G1 X82.432 Y88.032 E.048
G1 X82.432 Y88.565
G1 X83.537 Y89.67 E.048
G1 X83.537 Y90.203
G1 X82.432 Y89.098 E.048
G1 X82.432 Y89.631
G1 X83.537 Y90.736 E.048
G1 X83.537 Y91.269
G1 X82.432 Y90.165 E.048
G1 X82.432 Y90.698
G1 X83.537 Y91.802 E.048
G1 X83.537 Y92.336
G1 X82.432 Y91.231 E.048
G1 X82.432 Y91.764
G1 X83.537 Y92.869 E.048
G1 X83.537 Y93.402
G1 X82.432 Y92.297 E.048
G1 X82.432 Y92.831
G1 X83.537 Y93.935 E.048
G1 X83.537 Y94.469
G1 X82.432 Y93.364 E.04802
G1 X82.432 Y93.897
G1 X83.804 Y95.269 E.05962
G1 X83.394 Y95.392
G1 X82.432 Y94.43 E.0418
M204 S10000
G1 X82.78 Y95.072 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0979369
G1 F3191
M204 S6000
G1 X82.707 Y95.018 E.00041
; LINE_WIDTH: 0.126036
G1 X82.56 Y94.905 E.00125
; LINE_WIDTH: 0.162719
G1 X82.413 Y94.792 E.00181
; WIPE_START
G1 F15000
G1 X82.56 Y94.905 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.274 Y87.467 Z7.7 F42000
G1 X85.077 Y83.986 Z7.7
G1 Z7.3
G1 E.8 F1800
; LINE_WIDTH: 0.1688
G1 F3191
M204 S6000
G3 X86.131 Y83.688 I4.292 J13.178 E.01124
G2 X87.014 Y83.493 I-6.339 J-30.732 E.00927
; LINE_WIDTH: 0.220255
G1 X87.102 Y83.462 E.00135
; LINE_WIDTH: 0.247237
G1 X87.374 Y83.336 E.005
; CHANGE_LAYER
; Z_HEIGHT: 7.5
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X87.102 Y83.462 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 38/111
; update layer progress
M73 L38
M991 S0 P37 ;notify layer change

; OBJECT_ID: 427
M204 S10000
G17
G3 Z7.7 I-.672 J1.015 P1  F42000
G1 X92.988 Y87.359 Z7.7
G1 Z7.5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3048
M204 S5000
G1 X91.536 Y87.278 E.04469
G1 X91.572 Y86.638 E.01971
G1 X91.777 Y86.649 E.0063
G1 X91.843 Y86.653 E.00206
G1 X91.836 Y86.791 E.00425
G1 X93.474 Y86.884 E.05042
G1 X93.489 Y86.897 E.00062
G1 X93.491 Y93.093 E.19037
G1 X93.478 Y93.115 E.0008
G1 X91.836 Y93.209 E.05055
G1 X91.843 Y93.347 E.00425
G1 X91.572 Y93.362 E.00836
G1 X91.536 Y92.722 E.01971
G1 X92.988 Y92.641 E.04469
G1 X92.988 Y87.419 E.16046
; WIPE_START
G1 F12000
M204 S6000
G1 X91.536 Y87.278 E-.55438
G1 X91.566 Y86.738 E-.20562
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.9 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z7.9
G1 X0 Y90.0001 F18000 ; move to safe pos
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
            G0 Z7.9 F4000
            G39.3 S1
            G0 Z7.9 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X91.746 Y87.038 F42000
G1 Z7.5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.153887
G1 F3048
M204 S6000
G1 X93.187 Y87.119 E.01305
G1 X93.231 Y87.13 E.00041
G1 X93.239 Y87.174 E.0004
G1 X93.231 Y92.869 E.0515
G1 X91.746 Y92.962 E.01346
; WIPE_START
G1 F15000
G1 X93.231 Y92.869 E-.56559
G1 X93.232 Y92.358 E-.19441
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.482 Y93.114 Z7.9 F42000
G1 Z7.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3048
M204 S6000
G1 X85.634 Y93.161 E.02817
G1 X85.634 Y86.841 E.20965
G1 X86.509 Y86.888 E.02906
M73 P62 R6
G1 X86.509 Y88.955 E.06854
G1 X86.856 Y88.983 E.01155
G1 X86.856 Y91.017 E.06745
G1 X86.509 Y91.045 E.01155
G1 X86.509 Y93.079 E.06747
M204 S10000
G1 X86.901 Y92.979 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3048
M204 S5000
G1 X87.517 Y92.945 E.01896
G1 X87.551 Y93.586 E.01971
G1 X87.277 Y93.601 E.00843
G1 X87.27 Y93.463 E.00425
G1 X85.249 Y93.568 E.06219
G1 X85.244 Y86.438 E.21908
G1 X87.27 Y86.537 E.06231
G1 X87.277 Y86.399 E.00424
G1 X87.328 Y86.402 E.00155
G1 X87.551 Y86.414 E.00687
G1 X87.517 Y87.055 E.01971
G1 X86.901 Y87.021 E.01896
G1 X86.901 Y87.394 E.01146
G1 X86.901 Y87.794 E.01229
G1 X86.901 Y88.194 E.01229
G1 X86.901 Y88.594 E.01229
G1 F2802.189
G1 X86.958 Y88.598 E.00175
G1 F2400
G1 X87.248 Y88.622 E.00894
G1 F3000
G1 X87.248 Y88.822 E.00615
G1 F3048
G1 X87.248 Y89.222 E.01229
G1 X87.248 Y89.622 E.01229
G1 X87.248 Y90.378 E.0232
G1 X87.248 Y90.778 E.01229
G1 X87.248 Y91.178 E.01229
G1 F3000
G1 X87.248 Y91.378 E.00615
G1 F2400
G1 X86.958 Y91.402 E.00894
G1 F2802.189
G1 X86.901 Y91.406 E.00175
G1 F3048
G1 X86.901 Y91.806 E.01229
G1 X86.901 Y92.206 E.01229
G1 X86.901 Y92.606 E.01229
G1 X86.901 Y92.919 E.00962
M204 S10000
G1 X86.705 Y93.242 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.153953
G1 F3048
M204 S6000
G1 X87.335 Y93.207 E.00571
; WIPE_START
G1 F15000
G1 X86.705 Y93.242 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.071 Y92.933 Z7.9 F42000
G1 Z7.5
G1 E.8 F1800
; LINE_WIDTH: 0.510773
G1 F3048
M204 S6000
G1 X86.071 Y90.878 E.07835
; WIPE_START
G1 F13465.777
G1 X86.071 Y92.878 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.591 Y89.337 Z7.9 F42000
G1 Z7.5
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.39358
G1 F3048
M204 S6000
G1 X86.53 Y89.432 E.00324
; LINE_WIDTH: 0.443337
G1 X86.245 Y89.53 E.00985
G1 X86.041 Y89.53 E.00665
G1 X86.041 Y90.47 E.03069
G1 X86.245 Y90.47 E.00665
G1 X86.53 Y90.565 E.00981
; LINE_WIDTH: 0.411624
G1 X86.591 Y90.674 E.00376
G1 X86.448 Y90.267 E.01297
; LINE_WIDTH: 0.45033
G1 X86.448 Y89.733 E.0177
; LINE_WIDTH: 0.433478
G1 X86.509 Y89.563 E.00575
; LINE_WIDTH: 0.399773
G1 X86.571 Y89.393 E.00526
M204 S10000
G1 X86.591 Y89.337 F42000
; LINE_WIDTH: 0.38292
G1 F3048
M204 S6000
G1 X86.591 Y89.287 E.00138
; WIPE_START
G1 F15000
G1 X86.591 Y89.337 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.591 Y90.773 Z7.9 F42000
G1 Z7.5
G1 E.8 F1800
G1 F3048
M204 S6000
G1 X86.591 Y90.734 E.00109
; WIPE_START
G1 F15000
G1 X86.591 Y90.773 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.071 Y89.122 Z7.9 F42000
G1 Z7.5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.510778
G1 F3048
M204 S6000
G1 X86.071 Y87.068 E.07831
M204 S10000
G1 X86.705 Y86.758 F42000
; LINE_WIDTH: 0.153926
G1 F3048
M204 S6000
G1 X87.335 Y86.793 E.00571
; WIPE_START
G1 F15000
G1 X86.705 Y86.758 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.327 Y93.01 Z7.9 F42000
G1 X81.542 Y94.131 Z7.9
G1 Z7.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3048
M204 S6000
G3 X77.872 Y90.065 I7.392 J-10.363 E.18313
G1 X77.869 Y90.054 E.00039
G3 X77.942 Y89.795 I.318 J-.051 E.00922
G3 X81.543 Y85.861 I11.354 J6.78 E.17812
G1 X81.542 Y94.071 E.27234
; WIPE_START
G1 F15476.087
G1 X81.04 Y93.754 E-.22574
G1 X80.495 Y93.299 E-.26983
G1 X79.989 Y92.821 E-.26442
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.103 Y94.571 Z7.9 F42000
G1 Z7.5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3048
M204 S5000
G1 X83.162 Y94.696 E.00423
G2 X83.419 Y94.985 I.733 J-.393 E.012
G2 X84.822 Y95.695 I2.744 J-3.681 E.04854
G2 X87.429 Y96.318 I4.396 J-12.629 E.08252
G1 X87.429 Y96.541 E.00686
G1 X87.429 Y96.941 E.01229
G1 X86.98 Y96.934 E.01381
G1 X86.877 Y96.931 E.00317
G1 X86.864 Y96.878 E.00167
G1 X86.788 Y96.78 E.00382
G1 X86.716 Y96.74 E.00254
G1 X86.686 Y96.723 E.00104
G1 X86.295 Y96.638 E.01229
G1 X85.863 Y96.544 E.0136
G3 X83.838 Y95.869 I3.361 J-13.458 E.06566
G3 X82.944 Y95.449 I8.87 J-20.049 E.03033
G3 X81.993 Y94.906 I6.837 J-13.086 E.03367
G3 X81.384 Y94.501 I7.155 J-11.406 E.02247
G1 X81.087 Y94.285 E.01129
G3 X79.874 Y93.261 I10.309 J-13.435 E.04879
G1 X79.613 Y93.005 E.01125
G3 X78.797 Y92.103 I10.414 J-10.243 E.03738
G3 X78.207 Y91.333 I10.46 J-8.621 E.02982
G3 X77.677 Y90.527 I10.938 J-7.764 E.02965
G1 X77.562 Y90.334 E.0069
G3 X77.494 Y90.172 I.667 J-.377 E.00539
G3 X77.501 Y89.804 I.677 J-.171 E.01146
G1 X77.527 Y89.735 E.00226
G3 X77.859 Y89.182 I4.908 J2.568 E.01982
G3 X78.41 Y88.388 I11.058 J7.091 E.02971
G3 X79.022 Y87.632 I10.456 J7.821 E.02989
G3 X79.516 Y87.094 I10.413 J9.075 E.02243
G3 X80.131 Y86.501 I9.161 J8.887 E.02628
G1 X80.406 Y86.259 E.01125
G3 X81.471 Y85.438 I10.012 J11.886 E.04133
G3 X82.398 Y84.85 I8.313 J12.077 E.03376
G1 X82.716 Y84.672 E.01118
G3 X83.59 Y84.24 I6.762 J12.611 E.02997
G1 X83.689 Y84.196 E.00333
G3 X83.875 Y84.116 I1.537 J3.293 E.00621
G3 X85.736 Y83.487 I5.752 J13.951 E.06043
G1 X86.327 Y83.35 E.01862
G1 X86.717 Y83.26 E.01229
G1 X86.786 Y83.221 E.00244
G1 X86.864 Y83.123 E.00386
G1 X86.877 Y83.069 E.00169
G1 X86.98 Y83.065 E.00317
G1 X87.429 Y83.059 E.01381
G1 X87.429 Y83.459 E.01229
G1 X87.429 Y83.682 E.00686
G2 X83.943 Y84.67 I1.488 J11.902 E.11176
G2 X83.118 Y85.379 I.741 J1.697 E.03394
G2 X83.078 Y85.545 I.316 J.164 E.00528
G1 X83.077 Y94.457 E.27385
G2 X83.09 Y94.513 I.817 J-.155 E.00176
M204 S10000
G1 X82.584 Y95.016 F42000
; FEATURE: Top surface
G1 F3048
M204 S2000
G1 X82.918 Y94.682 E.01454
G1 X82.87 Y94.197
G1 X82.248 Y94.819 E.02701
G1 X81.921 Y94.613
G1 X82.87 Y93.664 E.04124
G1 X82.87 Y93.131
G1 X81.766 Y94.235 E.04798
G1 X81.765 Y93.702
G1 X82.87 Y92.597 E.04802
G1 X82.87 Y92.064
G1 X81.765 Y93.169 E.04802
G1 X81.765 Y92.636
G1 X82.87 Y91.531 E.04802
G1 X82.87 Y90.997
G1 X81.765 Y92.103 E.04802
G1 X81.765 Y91.569
G1 X82.87 Y90.464 E.04802
G1 X82.87 Y89.931
G1 X81.765 Y91.036 E.04802
G1 X81.765 Y90.503
G1 X82.87 Y89.397 E.04802
G1 X82.87 Y88.864
G1 X81.765 Y89.969 E.04802
G1 X81.765 Y89.436
G1 X82.87 Y88.331 E.04802
G1 X82.87 Y87.798
G1 X81.765 Y88.903 E.04802
G1 X81.765 Y88.369
G1 X82.87 Y87.264 E.04802
G1 X82.87 Y86.731
G1 X81.765 Y87.836 E.04802
G1 X81.765 Y87.303
G1 X82.871 Y86.198 E.04802
G1 X82.871 Y85.664
G1 X81.765 Y86.769 E.04802
G1 X81.766 Y86.236
G1 X83.078 Y84.924 E.05701
M204 S10000
G1 X82.895 Y84.813 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0987376
G1 F3048
M204 S6000
G1 X82.821 Y84.867 E.00042
; LINE_WIDTH: 0.133921
G1 X82.678 Y84.975 E.00133
; LINE_WIDTH: 0.183155
G1 X82.534 Y85.084 E.00206
; LINE_WIDTH: 0.230141
G1 X82.392 Y85.195 E.00275
; LINE_WIDTH: 0.274873
G1 X82.249 Y85.306 E.00341
; LINE_WIDTH: 0.316861
G1 X82.109 Y85.418 E.004
; LINE_WIDTH: 0.369684
G1 X81.945 Y85.551 E.00563
G1 X81.747 Y85.794 E.00835
; WIPE_START
G1 F15000
G1 X81.945 Y85.551 E-.45377
G1 X82.109 Y85.418 E-.30623
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.887 Y85.4 Z7.9 F42000
G1 Z7.5
G1 E.8 F1800
; LINE_WIDTH: 0.167647
G1 F3048
M204 S6000
G1 X82.826 Y85.531 E.00147
G1 X82.885 Y85.679 E.00162
; WIPE_START
G1 F15000
G1 X82.826 Y85.531 E-.39895
G1 X82.887 Y85.4 E-.36105
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.418 Y84.644 Z7.9 F42000
G1 Z7.5
G1 E.8 F1800
; LINE_WIDTH: 0.20818
G1 F3048
M204 S6000
G3 X83.815 Y84.434 I2.88 J4.946 E.00604
; LINE_WIDTH: 0.16871
G3 X85.801 Y83.736 I4.878 J10.704 E.02161
G2 X86.876 Y83.487 I-70.344 J-305.995 E.01131
; LINE_WIDTH: 0.218714
G1 X86.963 Y83.456 E.00132
; LINE_WIDTH: 0.255942
G2 X87.029 Y83.421 I-.158 J-.379 E.0013
; LINE_WIDTH: 0.311198
G1 X87.072 Y83.396 E.00107
G1 X87.233 Y83.384 E.00354
; WIPE_START
G1 F15000
G1 X87.072 Y83.396 E-.58337
G1 X87.029 Y83.421 E-.17663
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.933 Y88.014 Z7.9 F42000
G1 X80.397 Y88.419 Z7.9
G1 Z7.5
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F3048
M204 S6000
G2 X79.176 Y89.998 I8.155 J7.564 E.06143
G1 X79.458 Y90.436 E.01601
G1 X80.272 Y91.46 E.04019
G1 X80.396 Y91.592 E.00557
G1 X80.397 Y88.479 E.09567
; WIPE_START
G1 F15000
G1 X80.396 Y90.479 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.023 Y90.547 Z7.9 F42000
G1 Z7.5
G1 E.8 F1800
; LINE_WIDTH: 0.41246
G1 F3048
M204 S6000
G1 X80.023 Y89.438 E.03339
G2 X79.619 Y89.997 I3.404 J2.887 E.02079
G1 X79.988 Y90.498 E.01875
; WIPE_START
G1 F15000
G1 X79.619 Y89.997 E-.23657
G1 X80.023 Y89.438 E-.26211
G1 X80.023 Y90.125 E-.26132
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.773 Y92.504 Z7.9 F42000
G1 Z7.5
G1 E.8 F1800
; LINE_WIDTH: 0.41999
G1 F3048
M204 S6000
G1 X80.774 Y87.494 E.15393
G1 X80.351 Y87.902 E.01806
G1 X79.612 Y88.736 E.03423
G2 X78.728 Y90 I7.706 J6.326 E.04744
G1 X79.152 Y90.656 E.024
G1 X79.987 Y91.707 E.04124
G2 X80.73 Y92.462 I6.585 J-5.731 E.03258
M204 S10000
G1 X81.15 Y93.327 F42000
G1 F3048
M204 S6000
G1 X81.151 Y86.665 E.20471
G2 X79.319 Y88.497 I8.403 J10.232 E.07974
G2 X78.28 Y90.002 I9.171 J7.443 E.05623
G1 X78.845 Y90.876 E.03199
G1 X79.701 Y91.954 E.04228
G2 X81.104 Y93.289 I9.44 J-8.508 E.05957
; WIPE_START
G1 F15000
G1 X80.755 Y93.004 E-.17121
G1 X80.169 Y92.452 E-.30608
G1 X79.701 Y91.954 E-.25961
G1 X79.663 Y91.906 E-.0231
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.422 Y95.358 Z7.9 F42000
G1 Z7.5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.215527
G1 F3048
M204 S6000
G2 X83.652 Y95.484 I4.712 J-8.306 E.00369
; LINE_WIDTH: 0.169432
G2 X86.787 Y96.481 I5.241 J-11.051 E.03401
; LINE_WIDTH: 0.194368
G1 X86.922 Y96.531 E.00178
; LINE_WIDTH: 0.2433
G3 X87.233 Y96.67 I-.575 J1.701 E.00557
; CHANGE_LAYER
; Z_HEIGHT: 7.7
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X86.922 Y96.531 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 39/111
; update layer progress
M73 L39
M991 S0 P38 ;notify layer change

; OBJECT_ID: 427
M204 S10000
G17
G3 Z7.9 I1.015 J.671 P1  F42000
G1 X92.993 Y87.354 Z7.9
G1 Z7.7
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2769
M204 S5000
G1 X91.541 Y87.273 E.04469
G1 X91.577 Y86.633 E.01971
G1 X91.766 Y86.643 E.00581
G1 X91.849 Y86.648 E.00255
G1 X91.841 Y86.786 E.00425
G1 X93.478 Y86.879 E.05039
G1 X93.494 Y86.893 E.00065
G1 X93.496 Y93.098 E.19068
G1 X93.483 Y93.12 E.00079
G1 X91.841 Y93.214 E.05055
G1 X91.849 Y93.352 E.00425
G1 X91.577 Y93.367 E.00836
G1 X91.541 Y92.727 E.01971
G1 X92.993 Y92.646 E.04469
G1 X92.993 Y87.414 E.16077
; WIPE_START
G1 F12000
M204 S6000
G1 X91.541 Y87.273 E-.55438
G1 X91.571 Y86.733 E-.20562
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.1 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z8.1
G1 X0 Y90.0001 F18000 ; move to safe pos
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
            G0 Z8.1 F4000
            G39.3 S1
            G0 Z8.1 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X91.751 Y87.033 F42000
G1 Z7.7
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.15388
G1 F2769
M204 S6000
G1 X93.192 Y87.114 E.01305
G1 X93.236 Y87.125 E.00041
G1 X93.245 Y87.169 E.0004
G1 X93.236 Y92.874 E.05159
G1 X91.751 Y92.967 E.01346
; WIPE_START
G1 F15000
G1 X93.236 Y92.874 E-.56559
G1 X93.237 Y92.363 E-.19441
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.466 Y93.12 Z8.1 F42000
G1 Z7.7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2769
M204 S6000
G1 X85.618 Y93.167 E.02817
G1 X85.618 Y86.835 E.21006
G1 X86.493 Y86.882 E.02906
G1 X86.493 Y88.779 E.06293
G1 X86.609 Y88.787 E.00385
G2 X86.608 Y91.213 I1112.013 J1.451 E.08048
G1 X86.493 Y91.221 E.00384
G1 X86.493 Y93.085 E.06186
M204 S10000
G1 X86.885 Y92.985 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2769
M204 S5000
G1 X87.501 Y92.951 E.01896
G1 X87.535 Y93.592 E.01971
G1 X87.262 Y93.607 E.00843
G1 X87.254 Y93.469 E.00425
G1 X85.233 Y93.574 E.06219
G1 X85.229 Y86.432 E.21945
G1 X87.254 Y86.531 E.06231
G1 X87.262 Y86.393 E.00424
G1 X87.329 Y86.397 E.00208
G1 X87.535 Y86.408 E.00635
G1 X87.501 Y87.049 E.01971
G1 X86.885 Y87.015 E.01896
G1 X86.885 Y87.612 E.01836
G1 X86.885 Y88.012 E.01229
G1 X86.885 Y88.412 E.01229
G1 X86.942 Y88.416 E.00175
G1 F2400
G1 X87.232 Y88.435 E.00894
G1 F2769
G1 X87.232 Y88.503 E.00212
G1 X87.232 Y88.58 E.00235
G1 X87.232 Y89.123 E.01668
G1 X87.001 Y89.08 E.00723
G2 X87.001 Y90.92 I842.22 J1.029 E.05651
G1 X87.232 Y90.877 E.00723
G1 X87.232 Y91.42 E.01668
G1 X87.232 Y91.565 E.00447
G1 F2400
G1 X86.942 Y91.584 E.00893
G1 F2769
G1 X86.885 Y91.588 E.00175
G1 X86.885 Y91.988 E.01229
G1 X86.885 Y92.388 E.01229
G1 X86.885 Y92.925 E.01651
M204 S10000
G1 X86.689 Y93.248 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.153943
G1 F2769
M204 S6000
G1 X87.319 Y93.213 E.00571
; WIPE_START
G1 F15000
G1 X86.689 Y93.248 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.055 Y92.939 Z8.1 F42000
G1 Z7.7
G1 E.8 F1800
; LINE_WIDTH: 0.511586
G1 F2769
M204 S6000
G1 X86.056 Y91.03 E.0729
G1 X86.075 Y90.952 E.00305
; LINE_WIDTH: 0.568614
G1 X86.094 Y90.875 E.00342
; LINE_WIDTH: 0.607091
G1 X86.113 Y90.797 E.00367
; LINE_WIDTH: 0.602295
G1 X86.155 Y90.825 E.00226
; LINE_WIDTH: 0.554219
G1 X86.197 Y90.852 E.00207
; LINE_WIDTH: 0.506143
G1 X86.238 Y90.879 E.00188
; LINE_WIDTH: 0.458067
G1 X86.28 Y90.906 E.00168
; LINE_WIDTH: 0.409992
G1 X86.322 Y90.933 E.00149
; LINE_WIDTH: 0.361916
G1 X86.363 Y90.96 E.00129
; LINE_WIDTH: 0.31384
G1 X86.405 Y90.987 E.0011
M204 S10000
G1 X86.113 Y90.797 F42000
; LINE_WIDTH: 0.625742
G1 F2769
M204 S6000
G1 X86.113 Y89.203 E.07573
G1 X86.155 Y89.176 E.00236
; LINE_WIDTH: 0.554551
G1 X86.197 Y89.149 E.00207
; LINE_WIDTH: 0.506528
G1 X86.238 Y89.122 E.00188
; LINE_WIDTH: 0.458504
G1 X86.28 Y89.094 E.00168
; LINE_WIDTH: 0.410481
G1 X86.322 Y89.067 E.00149
; LINE_WIDTH: 0.362458
G1 X86.364 Y89.04 E.00129
; LINE_WIDTH: 0.314435
G1 X86.405 Y89.013 E.0011
M204 S10000
G1 X86.113 Y89.203 F42000
; LINE_WIDTH: 0.607314
G1 F2769
M204 S6000
G1 X86.094 Y89.125 E.00368
; LINE_WIDTH: 0.56874
G1 X86.075 Y89.048 E.00342
; LINE_WIDTH: 0.511607
G1 X86.056 Y88.97 E.00305
G1 X86.055 Y87.062 E.07287
M204 S10000
G1 X86.689 Y86.752 F42000
; LINE_WIDTH: 0.153918
G1 F2769
M204 S6000
M73 P63 R6
G1 X87.319 Y86.787 E.00571
; WIPE_START
G1 F15000
G1 X86.689 Y86.752 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.79 Y92.605 Z8.1 F42000
G1 X80.875 Y93.698 Z8.1
G1 Z7.7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2769
M204 S6000
G3 X77.796 Y90.086 I8.444 J-10.316 E.15828
G3 X77.861 Y89.792 I.316 J-.084 E.01036
G3 X80.875 Y86.312 I11.196 J6.652 E.15353
G1 X80.875 Y93.638 E.24301
; WIPE_START
G1 F15476.087
G1 X80.064 Y92.979 E-.39692
G1 X79.561 Y92.471 E-.27184
G1 X79.4 Y92.293 E-.09123
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.411 Y94.076 Z8.1 F42000
G1 Z7.7
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2769
M204 S5000
G1 X82.411 Y94.135 E.00179
G2 X82.707 Y94.644 I.861 J-.161 E.01847
G2 X83.999 Y95.415 I2.962 J-3.495 E.04642
G2 X87.288 Y96.323 I5.019 J-11.772 E.10516
G1 X87.288 Y96.94 E.01898
G1 X86.834 Y96.929 E.01394
G1 X86.734 Y96.926 E.00307
G1 X86.722 Y96.877 E.00155
G1 X86.646 Y96.78 E.00381
G1 X86.583 Y96.744 E.00221
G1 X86.546 Y96.722 E.00132
G1 X86.156 Y96.635 E.01229
G1 X85.671 Y96.525 E.01526
G3 X83.115 Y95.58 I3.459 J-13.29 E.08388
G1 X83.027 Y95.536 E.00302
G1 X82.861 Y95.451 E.00573
G3 X82.122 Y95.039 I6.878 J-13.201 E.02603
G3 X81.205 Y94.434 I7.697 J-12.663 E.03376
G3 X80.717 Y94.066 I7.953 J-11.029 E.01877
G3 X80.149 Y93.59 I8.152 J-10.311 E.02278
G3 X79.274 Y92.739 I9.739 J-10.894 E.03752
G1 X78.952 Y92.383 E.01475
G3 X78.126 Y91.334 I11.869 J-10.203 E.04104
G3 X77.462 Y90.301 I12.365 J-8.666 E.03773
G1 X77.431 Y90.23 E.00238
G3 X77.42 Y89.802 I.629 J-.23 E.01339
G3 X77.467 Y89.69 I.657 J.21 E.00373
G1 X77.524 Y89.591 E.00352
G3 X78.046 Y88.78 I11.508 J6.823 E.02966
G3 X78.628 Y88.003 I11.357 J7.907 E.02981
G3 X79.268 Y87.268 I10.613 J8.589 E.02996
G3 X80.057 Y86.492 I10.693 J10.1 E.03402
G3 X80.705 Y85.944 I8.843 J9.789 E.02609
G1 X80.995 Y85.72 E.01126
G3 X82.005 Y85.032 I8.953 J12.055 E.03755
G3 X83.038 Y84.459 I10.605 J17.879 E.03631
G3 X85.66 Y83.477 I6.049 J12.17 E.08617
G1 X86.156 Y83.366 E.01563
G1 X86.546 Y83.278 E.01229
G1 X86.582 Y83.257 E.00128
G1 X86.645 Y83.221 E.00223
G1 X86.716 Y83.132 E.00348
G1 X86.736 Y83.075 E.00186
G1 X86.834 Y83.071 E.00303
G1 X87.288 Y83.06 E.01395
G1 X87.288 Y83.677 E.01896
G2 X83.254 Y84.949 I1.572 J12.022 E.13063
G2 X82.488 Y85.624 I1.049 J1.96 E.03166
G2 X82.411 Y85.868 I.47 J.283 E.00793
G1 X82.411 Y94.016 E.25038
; WIPE_START
G1 F12000
M204 S6000
G1 X82.411 Y94.135 E-.04498
G1 X82.447 Y94.296 E-.06269
G1 X82.488 Y94.375 E-.03375
G1 X82.707 Y94.644 E-.13199
G1 X82.922 Y94.829 E-.10781
G1 X83.135 Y94.978 E-.09842
G1 X83.621 Y95.246 E-.21124
G1 X83.787 Y95.32 E-.06913
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.674 Y95.016 Z8.1 F42000
G1 Z7.7
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.216539
G1 F2769
M204 S6000
G2 X82.983 Y95.206 I7.063 J-11.12 E.00514
; LINE_WIDTH: 0.167984
G2 X85.305 Y96.158 I5.64 J-10.448 E.02562
G1 X85.397 Y96.185 E.00098
G3 X86.736 Y96.514 I-44.744 J184.603 E.01405
; LINE_WIDTH: 0.215862
G1 X86.823 Y96.547 E.00131
; LINE_WIDTH: 0.246514
G1 X87.092 Y96.687 E.00503
; WIPE_START
G1 F15000
G1 X86.823 Y96.547 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.48 Y90.271 Z8.1 F42000
G1 X80.483 Y87.386 Z8.1
G1 Z7.7
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F2769
M204 S6000
G1 X80.483 Y87.176 E.00644
G2 X78.199 Y89.999 I8.232 J8.997 E.112
G2 X80.483 Y92.821 I10.301 J-6.005 E.11198
G1 X80.483 Y87.446 E.16515
; WIPE_START
G1 F15000
G1 X80.483 Y89.446 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.678 Y90.748 Z8.1 F42000
G1 Z7.7
G1 E.8 F1800
; LINE_WIDTH: 0.52175
G1 F2769
M204 S6000
G1 X79.678 Y89.251 E.05838
G2 X79.154 Y89.997 I4.62 J3.802 E.03559
G2 X79.641 Y90.7 I4.56 J-2.64 E.03341
; WIPE_START
G1 F13157.071
G1 X79.427 Y90.42 E-.13395
G1 X79.154 Y89.997 E-.19129
G1 X79.353 Y89.685 E-.14054
G1 X79.678 Y89.251 E-.20593
G1 X79.678 Y89.484 E-.08829
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.106 Y91.91 Z8.1 F42000
G1 Z7.7
G1 E.8 F1800
; LINE_WIDTH: 0.41999
G1 F2769
M204 S6000
G1 X80.106 Y88.073 E.11791
G2 X78.646 Y89.998 I9.48 J8.704 E.07434
G2 X80.066 Y91.866 I9.818 J-5.988 E.07221
; WIPE_START
G1 F15000
G1 X79.611 Y91.363 E-.25763
G1 X79.073 Y90.662 E-.33581
G1 X78.836 Y90.293 E-.16656
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.231 Y85.698 Z8.1 F42000
G1 Z7.7
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F2769
M204 S2000
G1 X81.887 Y85.353 E.01496
G1 X81.567 Y85.566
G1 X82.203 Y86.203 E.02767
G1 X82.203 Y86.736
G1 X81.255 Y85.788 E.04119
G1 X81.1 Y86.166
G1 X82.203 Y87.269 E.04796
G1 X82.203 Y87.803
G1 X81.098 Y86.697 E.04805
G1 X81.098 Y87.23
G1 X82.203 Y88.336 E.04805
G1 X82.203 Y88.869
G1 X81.098 Y87.763 E.04804
G1 X81.098 Y88.297
G1 X82.203 Y89.402 E.04804
G1 X82.203 Y89.935
G1 X81.098 Y88.83 E.04804
G1 X81.098 Y89.363
G1 X82.203 Y90.469 E.04804
G1 X82.203 Y91.002
G1 X81.098 Y89.896 E.04804
G1 X81.098 Y90.43
G1 X82.203 Y91.535 E.04803
G1 X82.203 Y92.068
G1 X81.098 Y90.963 E.04803
G1 X81.098 Y91.496
G1 X82.203 Y92.601 E.04803
G1 X82.203 Y93.135
G1 X81.098 Y92.029 E.04803
G1 X81.098 Y92.563
G1 X82.203 Y93.668 E.04802
G1 X82.211 Y94.21
G1 X81.098 Y93.096 E.04839
G1 X81.098 Y93.629
G1 X82.293 Y94.825 E.05194
M204 S10000
G1 X82.421 Y94.657 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.108932
G1 F2769
M204 S6000
G1 X82.285 Y94.489 E.00116
; LINE_WIDTH: 0.159023
G3 X82.141 Y94.28 I2.476 J-1.869 E.0024
M204 S10000
G1 X81.687 Y94.514 F42000
; LINE_WIDTH: 0.0936497
G1 F2769
M204 S6000
G1 X81.627 Y94.465 E.00032
; LINE_WIDTH: 0.114892
G1 X81.488 Y94.349 E.00106
; LINE_WIDTH: 0.146437
G1 X81.35 Y94.232 E.00153
; LINE_WIDTH: 0.180992
G1 X81.082 Y94.003 E.00397
; WIPE_START
G1 F15000
G1 X81.35 Y94.232 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.327 Y86.663 Z8.1 F42000
G1 X82.55 Y84.94 Z8.1
G1 Z7.7
G1 E.8 F1800
; LINE_WIDTH: 0.221492
G1 F2769
M204 S6000
G1 X82.783 Y84.916 E.00342
G1 X82.981 Y84.795 E.00337
; LINE_WIDTH: 0.168201
G3 X85.195 Y83.875 I5.302 J9.632 E.02452
G1 X85.385 Y83.819 E.00203
G2 X86.735 Y83.486 I-103.608 J-422.679 E.0142
; LINE_WIDTH: 0.215865
G1 X86.822 Y83.453 E.00131
; LINE_WIDTH: 0.246617
G1 X87.092 Y83.312 E.00505
; CHANGE_LAYER
; Z_HEIGHT: 7.9
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X86.822 Y83.453 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 40/111
; update layer progress
M73 L40
M991 S0 P39 ;notify layer change

; OBJECT_ID: 427
M204 S10000
G17
G3 Z8.1 I-.649 J1.029 P1  F42000
G1 X92.998 Y87.349 Z8.1
G1 Z7.9
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2610
M204 S5000
G1 X91.546 Y87.268 E.04469
G1 X91.582 Y86.628 E.01971
G1 X91.755 Y86.637 E.00532
G1 X91.854 Y86.643 E.00304
G1 X91.846 Y86.781 E.00425
G1 X93.483 Y86.874 E.05039
G1 X93.499 Y86.888 E.00065
G1 X93.501 Y93.103 E.19099
G1 X93.489 Y93.125 E.00078
G1 X91.846 Y93.219 E.05056
G1 X91.854 Y93.357 E.00425
G1 X91.582 Y93.372 E.00836
G1 X91.546 Y92.732 E.01971
G1 X92.998 Y92.651 E.04469
G1 X92.998 Y87.409 E.16107
; WIPE_START
G1 F12000
M204 S6000
G1 X91.546 Y87.268 E-.55438
G1 X91.577 Y86.728 E-.20562
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.3 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z8.3
G1 X0 Y90.0001 F18000 ; move to safe pos
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
            G0 Z8.3 F4000
            G39.3 S1
            G0 Z8.3 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X91.756 Y87.028 F42000
G1 Z7.9
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.153867
G1 F2610
M204 S6000
G1 X93.197 Y87.109 E.01305
G1 X93.242 Y87.12 E.00041
G1 X93.25 Y87.164 E.0004
G1 X93.242 Y92.879 E.05167
G1 X91.756 Y92.972 E.01346
; WIPE_START
G1 F15000
G1 X93.242 Y92.879 E-.5656
G1 X93.242 Y92.368 E-.1944
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.45 Y93.126 Z8.3 F42000
G1 Z7.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2610
M204 S6000
G1 X85.602 Y93.173 E.02817
G1 X85.602 Y86.829 E.21046
G1 X86.477 Y86.876 E.02907
G1 X86.477 Y88.639 E.05849
G1 X86.593 Y88.645 E.00385
G1 X86.593 Y91.355 E.08988
G1 X86.477 Y91.361 E.00384
G1 X86.477 Y93.091 E.05741
M204 S10000
G1 X86.869 Y92.992 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2610
M204 S5000
G1 X87.485 Y92.957 E.01896
G1 X87.52 Y93.598 E.01972
G1 X87.246 Y93.613 E.00843
G1 X87.238 Y93.475 E.00425
G1 X85.216 Y93.58 E.06221
G1 X85.213 Y86.426 E.21981
G1 X87.238 Y86.525 E.06231
G1 X87.246 Y86.387 E.00424
G1 X87.33 Y86.392 E.0026
G1 X87.52 Y86.402 E.00583
G1 X87.485 Y87.043 E.01971
G1 X86.869 Y87.008 E.01896
G1 X86.869 Y87.467 E.0141
G1 X86.869 Y87.867 E.01229
G1 X86.869 Y88.267 E.01229
G1 X86.926 Y88.27 E.00175
G1 X87.216 Y88.286 E.00893
G1 X87.216 Y88.392 E.00329
G1 X87.216 Y88.793 E.01231
G1 X86.985 Y88.769 E.00716
G1 X86.985 Y89.188 E.0129
G1 X86.985 Y90.831 E.05049
G1 X86.985 Y91.231 E.01229
G1 X87.216 Y91.207 E.00716
G1 X87.216 Y91.608 E.01231
G1 X87.216 Y91.715 E.00329
G1 X86.926 Y91.73 E.00893
G1 X86.869 Y91.733 E.00175
G1 X86.869 Y92.133 E.01229
G1 X86.869 Y92.533 E.01229
G1 X86.869 Y92.932 E.01225
M204 S10000
G1 X86.673 Y93.254 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.153936
G1 F2610
M204 S6000
G1 X87.303 Y93.219 E.00571
; WIPE_START
G1 F15000
G1 X86.673 Y93.254 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.04 Y92.945 Z8.3 F42000
G1 Z7.9
G1 E.8 F1800
; LINE_WIDTH: 0.511477
G1 F2610
M204 S6000
G1 X86.04 Y91.168 E.06786
G1 X86.059 Y91.09 E.00305
; LINE_WIDTH: 0.568423
G1 X86.078 Y91.013 E.00342
; LINE_WIDTH: 0.606984
G1 X86.097 Y90.935 E.00367
; LINE_WIDTH: 0.625669
G1 X86.097 Y89.065 E.0888
G1 X86.139 Y89.038 E.00236
; LINE_WIDTH: 0.553653
G1 X86.181 Y89.011 E.00207
; LINE_WIDTH: 0.50521
G1 X86.223 Y88.983 E.00187
; LINE_WIDTH: 0.456767
G1 X86.264 Y88.956 E.00168
; LINE_WIDTH: 0.408324
G1 X86.306 Y88.929 E.00148
; LINE_WIDTH: 0.359881
G1 X86.348 Y88.902 E.00129
; LINE_WIDTH: 0.311438
G1 X86.389 Y88.875 E.00109
M204 S10000
G1 X86.097 Y89.065 F42000
; LINE_WIDTH: 0.60701
G1 F2610
M204 S6000
G1 X86.078 Y88.987 E.00367
; LINE_WIDTH: 0.56843
G1 X86.059 Y88.91 E.00342
; LINE_WIDTH: 0.52985
G1 X86.04 Y88.832 E.00317
; LINE_WIDTH: 0.510665
G1 X86.04 Y87.056 E.0677
M204 S10000
G1 X86.673 Y86.746 F42000
; LINE_WIDTH: 0.153899
G1 F2610
M204 S6000
G1 X87.303 Y86.78 E.0057
; WIPE_START
G1 F15000
G1 X86.673 Y86.746 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.02 Y88.523 Z8.3 F42000
G1 Z7.9
G1 E.8 F1800
; LINE_WIDTH: 0.140137
G1 F2610
M204 S6000
G1 X86.789 Y88.505 E.00184
; WIPE_START
G1 F15000
G1 X87.02 Y88.523 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.097 Y90.935 Z8.3 F42000
G1 Z7.9
G1 E.8 F1800
; LINE_WIDTH: 0.602044
G1 F2610
M204 S6000
G1 X86.139 Y90.962 E.00227
; LINE_WIDTH: 0.553597
G1 X86.181 Y90.989 E.00207
; LINE_WIDTH: 0.50515
G1 X86.222 Y91.017 E.00187
; LINE_WIDTH: 0.456703
G1 X86.264 Y91.044 E.00168
; LINE_WIDTH: 0.408255
G1 X86.306 Y91.071 E.00148
; LINE_WIDTH: 0.359808
G1 X86.347 Y91.098 E.00128
; LINE_WIDTH: 0.311361
G1 X86.389 Y91.125 E.00109
M204 S10000
G1 X86.789 Y91.495 F42000
; LINE_WIDTH: 0.140204
G1 F2610
M204 S6000
G1 X87.02 Y91.477 E.00184
; WIPE_START
G1 F15000
G1 X86.789 Y91.495 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.21 Y93.188 Z8.3 F42000
G1 Z7.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2610
M204 S6000
G3 X77.711 Y90.06 I8.392 J-9.264 E.13336
G3 X77.796 Y89.771 I.348 J-.055 E.01032
G3 X80.209 Y86.816 I11.293 J6.758 E.12699
G1 X80.208 Y87.104 E.00955
G1 X80.21 Y93.128 E.19983
; WIPE_START
G1 F15476.087
G1 X79.819 Y92.815 E-.19022
G1 X79.313 Y92.285 E-.27859
G1 X78.82 Y91.698 E-.29119
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.743 Y93.553 Z8.3 F42000
G1 Z7.9
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2610
M204 S5000
G1 X81.743 Y93.65 E.003
G2 X81.986 Y94.238 I.799 J.014 E.02009
G2 X83.197 Y95.084 I2.896 J-2.856 E.04567
G2 X87.147 Y96.324 I5.884 J-11.824 E.12772
G1 X87.146 Y96.938 E.01886
G1 X86.692 Y96.924 E.01398
G1 X86.594 Y96.919 E.003
G1 X86.573 Y96.863 E.00184
G1 X86.504 Y96.775 E.00342
G1 X86.45 Y96.744 E.00193
G1 X86.405 Y96.718 E.00159
G1 X86.016 Y96.626 E.01229
G1 X85.366 Y96.471 E.02053
G3 X82.292 Y95.186 I3.641 J-13.022 E.10263
G1 X82.201 Y95.133 E.00324
G1 X82.037 Y95.034 E.00589
G3 X81.801 Y94.888 I2.497 J-4.286 E.00854
G1 X81.781 Y94.875 E.00071
G3 X80.834 Y94.217 I8.054 J-12.592 E.03545
G1 X80.546 Y93.991 E.01125
G3 X79.544 Y93.095 I9.76 J-11.932 E.04134
G1 X79.287 Y92.834 E.01125
G3 X78.718 Y92.199 I9.722 J-9.293 E.0262
G3 X77.843 Y91.036 I11.61 J-9.645 E.04472
G3 X77.405 Y90.338 I10.65 J-7.164 E.02532
G1 X77.385 Y90.301 E.00131
G3 X77.332 Y90.162 I.639 J-.321 E.00458
G3 X77.343 Y89.803 I.775 J-.158 E.01114
G3 X77.388 Y89.694 I.652 J.205 E.00363
G1 X77.46 Y89.569 E.00441
G3 X77.969 Y88.779 I11.644 J6.947 E.0289
G3 X78.552 Y88.003 I11.083 J7.707 E.02983
G3 X79.108 Y87.357 I10.726 J8.684 E.0262
G3 X79.995 Y86.48 I11.217 J10.449 E.03834
G3 X80.629 Y85.943 I8.839 J9.801 E.02553
G3 X81.317 Y85.432 I8.368 J10.535 E.02634
G3 X81.979 Y85 I9.016 J13.117 E.02428
G1 X82.066 Y84.948 E.00313
G1 X82.254 Y84.836 E.00672
G3 X85.354 Y83.532 I6.752 J11.716 E.1036
G1 X86.017 Y83.375 E.02094
G1 X86.406 Y83.282 E.01229
G1 X86.45 Y83.256 E.00157
G1 X86.504 Y83.224 E.00191
G1 X86.579 Y83.131 E.00367
G1 X86.593 Y83.082 E.00158
G1 X86.692 Y83.077 E.00304
G1 X87.147 Y83.062 E.014
G1 X87.147 Y83.675 E.01884
G2 X82.566 Y85.274 I1.694 J12.216 E.15006
G2 X81.816 Y85.999 I1.278 J2.072 E.03229
G2 X81.743 Y86.311 I.697 J.328 E.00995
G1 X81.743 Y93.493 E.22066
M204 S10000
G1 X81.558 Y93.909 F42000
; FEATURE: Top surface
G1 F2610
M204 S2000
G1 X81.222 Y94.245 E.01459
G1 X80.916 Y94.018
G1 X81.535 Y93.399 E.02691
G1 X81.535 Y92.865
M73 P64 R6
G1 X80.619 Y93.782 E.03982
G1 X80.432 Y93.435
G1 X81.535 Y92.332 E.04794
G1 X81.535 Y91.799
G1 X80.432 Y92.902 E.04795
G1 X80.432 Y92.369
G1 X81.535 Y91.266 E.04795
G1 X81.535 Y90.732
G1 X80.432 Y91.836 E.04796
G1 X80.432 Y91.303
G1 X81.535 Y90.199 E.04796
G1 X81.535 Y89.666
G1 X80.432 Y90.77 E.04796
G1 X80.432 Y90.236
G1 X81.535 Y89.132 E.04797
G1 X81.535 Y88.599
G1 X80.431 Y89.703 E.04797
G1 X80.431 Y89.17
G1 X81.535 Y88.066 E.04798
G1 X81.535 Y87.533
G1 X80.431 Y88.637 E.04798
G1 X80.431 Y88.104
G1 X81.535 Y86.999 E.04799
G1 X81.535 Y86.466
G1 X80.431 Y87.571 E.04799
G1 X80.431 Y87.037
G1 X81.734 Y85.734 E.05662
M204 S10000
G1 X81.587 Y85.537 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.181141
G1 F2610
M204 S6000
G1 X81.388 Y85.706 E.00294
; LINE_WIDTH: 0.219089
G1 X81.189 Y85.875 E.00375
; LINE_WIDTH: 0.254002
G1 X81.007 Y86.034 E.00414
; LINE_WIDTH: 0.28588
G1 X80.826 Y86.193 E.00477
; LINE_WIDTH: 0.319821
G1 X80.413 Y86.566 E.01256
; WIPE_START
G1 F15000
G1 X80.826 Y86.193 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.543 Y93.791 Z8.3 F42000
G1 X81.552 Y93.883 Z8.3
G1 Z7.9
G1 E.8 F1800
; LINE_WIDTH: 0.150018
G1 F2610
M204 S6000
G1 X81.501 Y93.776 E.00104
G1 X81.551 Y93.65 E.00118
; WIPE_START
G1 F15000
G1 X81.501 Y93.776 E-.40436
G1 X81.552 Y93.883 E-.35564
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.936 Y94.616 Z8.3 F42000
G1 Z7.9
G1 E.8 F1800
; LINE_WIDTH: 0.220522
G1 F2610
M204 S6000
G1 X82.286 Y94.865 E.00622
; LINE_WIDTH: 0.166925
G2 X85.197 Y96.156 I6.339 J-10.364 E.03228
G1 X85.434 Y96.224 E.00248
G3 X86.594 Y96.511 I-7.375 J32.313 E.01208
; LINE_WIDTH: 0.213825
G1 X86.681 Y96.543 E.00129
; LINE_WIDTH: 0.239524
G1 X86.716 Y96.56 E.00062
; LINE_WIDTH: 0.266688
G1 X86.757 Y96.585 E.00088
; LINE_WIDTH: 0.30159
G1 X86.951 Y96.616 E.00412
; WIPE_START
G1 F15000
G1 X86.757 Y96.585 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.98 Y91.598 Z8.3 F42000
G1 X79.066 Y89.946 Z8.3
G1 Z7.9
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.46754
G1 F2610
M204 S6000
G2 X79.059 Y90.037 I-.027 J.044 E.00727
; WIPE_START
G1 F14836.794
G1 X79.013 Y90.037 E-.1708
G1 X78.986 Y89.992 E-.1964
G1 X79.013 Y89.946 E-.19642
G1 X79.066 Y89.946 E-.19637
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.44 Y88.774 Z8.3 F42000
G1 Z7.9
G1 E.8 F1800
; LINE_WIDTH: 0.41999
G1 F2610
M204 S6000
G1 X78.71 Y89.763 E.03776
G1 X78.569 Y90.019 E.00898
G1 X79.329 Y91.108 E.0408
G1 X79.44 Y91.241 E.00531
G1 X79.44 Y88.834 E.07395
M204 S10000
G1 X79.817 Y87.94 F42000
G1 F2610
M204 S6000
G1 X79.817 Y87.758 E.00558
G1 X79.683 Y87.891 E.00581
G1 X78.881 Y88.856 E.03855
G2 X78.13 Y89.998 I6.908 J5.36 E.04201
G2 X79.817 Y92.246 I10.872 J-6.4 E.08655
G1 X79.817 Y88 E.13047
; WIPE_START
G1 F15000
G1 X79.817 Y90 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.935 Y85.383 Z8.3 F42000
G1 Z7.9
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.220804
G1 F2610
M204 S6000
G3 X82.161 Y85.219 I6.263 J8.403 E.00405
G1 X82.286 Y85.135 E.00218
; LINE_WIDTH: 0.166775
G3 X84.352 Y84.129 I5.857 J9.405 E.02324
G3 X86.58 Y83.494 I6.915 J20.019 E.0234
; LINE_WIDTH: 0.205076
G1 X86.651 Y83.467 E.001
; LINE_WIDTH: 0.238111
G2 X86.951 Y83.329 I-.639 J-1.785 E.00526
; CHANGE_LAYER
; Z_HEIGHT: 8.1
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X86.651 Y83.467 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 41/111
; update layer progress
M73 L41
M991 S0 P40 ;notify layer change

; OBJECT_ID: 427
M204 S10000
G17
G3 Z8.3 I-.634 J1.039 P1  F42000
G1 X93.004 Y87.344 Z8.3
G1 Z8.1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2433
M204 S5000
G1 X91.551 Y87.263 E.04469
G1 X91.587 Y86.623 E.01971
G1 X91.745 Y86.631 E.00483
G1 X91.859 Y86.638 E.00353
G1 X91.851 Y86.776 E.00425
G1 X93.488 Y86.869 E.05039
G1 X93.504 Y86.883 E.00065
G1 X93.507 Y93.108 E.19129
G1 X93.494 Y93.13 E.00078
G1 X91.851 Y93.224 E.05057
G1 X91.859 Y93.362 E.00425
G1 X91.587 Y93.377 E.00836
G1 X91.551 Y92.737 E.01971
G1 X93.004 Y92.656 E.04469
G1 X93.004 Y87.404 E.16138
; WIPE_START
G1 F12000
M204 S6000
G1 X91.551 Y87.263 E-.55439
G1 X91.582 Y86.723 E-.20561
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.5 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z8.5
G1 X0 Y90.0001 F18000 ; move to safe pos
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
            G0 Z8.5 F4000
            G39.3 S1
            G0 Z8.5 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X91.761 Y87.023 F42000
G1 Z8.1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.153874
G1 F2433
M204 S6000
G1 X93.203 Y87.104 E.01305
G1 X93.247 Y87.116 E.00041
G1 X93.255 Y87.159 E.0004
G1 X93.247 Y92.884 E.05177
G1 X91.761 Y92.977 E.01346
; WIPE_START
G1 F15000
G1 X93.247 Y92.884 E-.56561
G1 X93.248 Y92.373 E-.1944
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.435 Y93.132 Z8.5 F42000
G1 Z8.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2433
M204 S6000
G1 X85.587 Y93.179 E.02818
G1 X85.587 Y86.822 E.21087
G1 X86.462 Y86.87 E.02907
G1 X86.461 Y88.53 E.05506
G1 X86.577 Y88.534 E.00386
G1 X86.577 Y91.466 E.09723
G1 X86.461 Y91.47 E.00386
G1 X86.462 Y93.097 E.05397
M204 S10000
G1 X86.854 Y92.998 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2433
M204 S5000
G1 X87.47 Y92.963 E.01896
G1 X87.504 Y93.604 E.01972
G1 X87.23 Y93.619 E.00843
G1 X87.223 Y93.481 E.00425
G1 X85.201 Y93.586 E.06219
G1 X85.197 Y86.42 E.2202
G1 X87.223 Y86.519 E.06231
G1 X87.23 Y86.381 E.00424
G1 X87.332 Y86.386 E.00312
G1 X87.504 Y86.396 E.0053
G1 X87.47 Y87.037 E.01971
G1 X86.854 Y87.002 E.01896
G1 X86.853 Y87.753 E.02307
G1 X86.853 Y88.153 E.01229
G1 X86.91 Y88.156 E.00175
G1 X87.201 Y88.167 E.00893
G1 X87.201 Y88.244 E.00235
G1 X87.201 Y88.581 E.01037
G1 X86.969 Y88.565 E.00713
G1 X86.969 Y89.579 E.03115
G1 X86.969 Y91.435 E.05705
G1 X87.201 Y91.419 E.00713
G1 X87.201 Y91.756 E.01037
G1 X87.201 Y91.833 E.00235
G1 X86.91 Y91.844 E.00893
G1 X86.853 Y91.847 E.00175
G1 X86.853 Y92.247 E.01229
G1 X86.854 Y92.938 E.02123
M204 S10000
G1 X86.658 Y93.261 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.153945
G1 F2433
M204 S6000
G1 X87.287 Y93.225 E.0057
; WIPE_START
G1 F15000
G1 X86.658 Y93.261 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.024 Y92.951 Z8.5 F42000
G1 Z8.1
G1 E.8 F1800
; LINE_WIDTH: 0.51129
G1 F2433
M204 S6000
G1 X86.024 Y91.275 E.06397
G1 X86.043 Y91.197 E.00306
; LINE_WIDTH: 0.568231
G1 X86.062 Y91.12 E.00343
; LINE_WIDTH: 0.606971
G1 X86.082 Y91.042 E.00368
M204 S10000
G1 X86.373 Y91.233 F42000
; LINE_WIDTH: 0.309587
G1 F2433
M204 S6000
G1 X86.332 Y91.206 E.00108
; LINE_WIDTH: 0.358318
G1 X86.29 Y91.179 E.00128
; LINE_WIDTH: 0.407049
G1 X86.248 Y91.151 E.00148
; LINE_WIDTH: 0.45578
G1 X86.207 Y91.124 E.00168
; LINE_WIDTH: 0.504511
G1 X86.165 Y91.097 E.00188
; LINE_WIDTH: 0.553242
G1 X86.123 Y91.069 E.00207
; LINE_WIDTH: 0.625752
G1 X86.082 Y91.042 E.00237
G1 X86.082 Y88.958 E.09896
; LINE_WIDTH: 0.60695
G1 X86.062 Y88.88 E.00368
; LINE_WIDTH: 0.56821
G1 X86.043 Y88.803 E.00343
; LINE_WIDTH: 0.52947
G1 X86.024 Y88.725 E.00318
; LINE_WIDTH: 0.510433
G1 X86.024 Y87.05 E.06381
M204 S10000
G1 X86.658 Y86.74 F42000
; LINE_WIDTH: 0.153909
G1 F2433
M204 S6000
G1 X87.287 Y86.774 E.0057
; WIPE_START
G1 F15000
G1 X86.658 Y86.74 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.373 Y88.767 Z8.5 F42000
G1 Z8.1
G1 E.8 F1800
; LINE_WIDTH: 0.309493
G1 F2433
M204 S6000
G1 X86.332 Y88.794 E.00108
; LINE_WIDTH: 0.358236
G1 X86.29 Y88.821 E.00128
; LINE_WIDTH: 0.40698
G1 X86.248 Y88.849 E.00148
; LINE_WIDTH: 0.455723
G1 X86.207 Y88.876 E.00168
; LINE_WIDTH: 0.504467
G1 X86.165 Y88.903 E.00187
; LINE_WIDTH: 0.55321
G1 X86.123 Y88.931 E.00207
; LINE_WIDTH: 0.601954
G1 X86.082 Y88.958 E.00227
; WIPE_START
G1 F11269.452
G1 X86.123 Y88.931 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.542 Y92.609 Z8.5 F42000
G1 Z8.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2433
M204 S6000
G3 X77.641 Y90.067 I8.836 J-8.588 E.10557
G3 X77.73 Y89.759 I.347 J-.067 E.01105
G3 X79.541 Y87.391 I11.515 J6.931 E.09908
G1 X79.542 Y92.549 E.1711
; WIPE_START
G1 F15476.087
G1 X79.023 Y92.037 E-.27689
G1 X78.409 Y91.264 E-.3751
G1 X78.25 Y91.029 E-.10801
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.076 Y93.064 Z8.5 F42000
G1 Z8.1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2433
M204 S5000
G1 X81.076 Y93.33 E.00817
G2 X81.379 Y93.902 I1.035 J-.18 E.02022
G2 X82.814 Y94.926 I3.789 J-3.791 E.05444
G2 X87.005 Y96.322 I6.254 J-11.791 E.13636
G1 X87.005 Y96.935 E.01883
G1 X86.55 Y96.917 E.01401
G1 X86.453 Y96.912 E.00297
G1 X86.431 Y96.854 E.00189
G1 X86.364 Y96.769 E.00334
G1 X86.317 Y96.741 E.00168
G1 X86.266 Y96.711 E.00184
G1 X85.876 Y96.621 E.01229
G1 X85.639 Y96.566 E.00747
G3 X81.501 Y94.742 I3.406 J-13.331 E.13958
G3 X81.206 Y94.541 I3.582 J-5.573 E.01097
G1 X81.205 Y94.54 E.00004
G3 X80.474 Y93.99 I10.566 J-14.813 E.02811
G3 X79.825 Y93.431 I8.525 J-10.546 E.02634
G3 X79.215 Y92.833 I9.692 J-10.504 E.02623
G3 X78.414 Y91.915 I10.83 J-10.258 E.03745
G3 X77.952 Y91.3 I12.114 J-9.569 E.02364
G3 X77.335 Y90.344 I13.51 J-9.399 E.03499
G1 X77.297 Y90.271 E.00253
G3 X77.261 Y90.166 I.652 J-.283 E.0034
G3 X77.252 Y89.872 I.65 J-.167 E.0091
G3 X77.298 Y89.727 I.688 J.139 E.00469
G3 X77.395 Y89.555 I1.458 J.706 E.00606
G3 X77.897 Y88.779 I11.169 J6.671 E.0284
G3 X78.43 Y88.064 I10.978 J7.631 E.02742
G3 X78.955 Y87.447 I10.809 J8.652 E.02491
G3 X79.46 Y86.917 I9.664 J8.711 E.02248
G3 X80.462 Y86.019 I10.206 J10.38 E.04137
G3 X80.973 Y85.628 I6.327 J7.741 E.01976
G1 X81.023 Y85.591 E.00192
G3 X81.242 Y85.435 I2.625 J3.437 E.00827
G1 X81.387 Y85.335 E.0054
G1 X81.479 Y85.273 E.00342
G3 X85.627 Y83.435 I7.476 J11.277 E.14008
G1 X85.875 Y83.379 E.00781
G1 X86.265 Y83.29 E.01229
G1 X86.317 Y83.259 E.00186
G1 X86.363 Y83.232 E.00164
G1 X86.438 Y83.137 E.00371
G1 X86.451 Y83.089 E.00155
G1 X86.55 Y83.083 E.00303
G1 X87.005 Y83.066 E.01401
G1 X87.005 Y83.677 E.01878
G2 X81.919 Y85.619 I1.899 J12.61 E.16858
G2 X81.109 Y86.509 I1.348 J2.04 E.03736
G2 X81.077 Y86.672 I.398 J.163 E.00515
G1 X81.076 Y93.004 E.19455
; WIPE_START
G1 F12000
M204 S6000
G1 X81.076 Y93.33 E-.12384
G1 X81.085 Y93.408 E-.02991
G1 X81.144 Y93.572 E-.0664
G1 X81.379 Y93.902 E-.15376
G1 X81.653 Y94.17 E-.14572
G1 X81.993 Y94.435 E-.16361
G1 X82.163 Y94.544 E-.07675
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.187 Y94.147 Z8.5 F42000
G1 Z8.1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.224214
G1 F2433
M204 S6000
G1 X81.591 Y94.474 E.00767
; LINE_WIDTH: 0.165352
G2 X85.254 Y96.198 I7.086 J-10.3 E.04058
G2 X86.457 Y96.506 I19.861 J-75.162 E.01238
; LINE_WIDTH: 0.213054
G1 X86.543 Y96.539 E.00128
; LINE_WIDTH: 0.246808
G1 X86.809 Y96.692 E.0051
; WIPE_START
G1 F15000
G1 X86.543 Y96.539 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.216 Y92.271 Z8.5 F42000
G1 X79.15 Y91.552 Z8.5
G1 Z8.1
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F2433
M204 S6000
G1 X79.149 Y88.432 E.09587
G2 X78.056 Y90.017 I7.298 J6.2 E.05927
G1 X78.719 Y91.022 E.037
G1 X79.112 Y91.505 E.01912
; WIPE_START
G1 F15000
G1 X78.719 Y91.022 E-.23645
G1 X78.056 Y90.017 E-.4576
G1 X78.141 Y89.866 E-.06595
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.802 Y90.524 Z8.5 F42000
G1 Z8.1
G1 E.8 F1800
; LINE_WIDTH: 0.36062
G1 F2433
M204 S6000
G1 X78.802 Y89.474 E.02719
G1 X78.505 Y89.928 E.01405
G1 X78.466 Y90.027 E.00276
G1 X78.768 Y90.475 E.01397
; WIPE_START
G1 F15000
G1 X78.466 Y90.027 E-.20509
G1 X78.505 Y89.928 E-.04055
G1 X78.802 Y89.474 E-.2062
G1 X78.802 Y90.285 E-.30816
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.897 Y86.496 Z8.5 F42000
G1 Z8.1
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F2433
M204 S2000
G1 X80.586 Y86.186 E.01349
G1 X80.296 Y86.429
G1 X80.869 Y87.002 E.0249
G1 X80.869 Y87.535
G1 X80.013 Y86.679 E.03721
G1 X79.764 Y86.963
G1 X80.869 Y88.068 E.04805
G1 X80.869 Y88.602
G1 X79.764 Y87.496 E.04805
G1 X79.764 Y88.029
G1 X80.869 Y89.135 E.04804
G1 X80.869 Y89.668
G1 X79.764 Y88.563 E.04804
G1 X79.764 Y89.096
G1 X80.869 Y90.201 E.04803
G1 X80.869 Y90.734
G1 X79.764 Y89.629 E.04803
G1 X79.764 Y90.163
G1 X80.869 Y91.268 E.04802
G1 X80.869 Y91.801
G1 X79.764 Y90.696 E.04802
G1 X79.764 Y91.229
G1 X80.869 Y92.334 E.04802
G1 X80.869 Y92.867
G1 X79.764 Y91.763 E.04801
G1 X79.764 Y92.296
G1 X80.876 Y93.408 E.04833
G1 X80.901 Y93.966
G1 X79.764 Y92.829 E.04939
; WIPE_START
G1 F12000
M204 S6000
G1 X80.901 Y93.966 E-.61076
G1 X80.884 Y93.573 E-.14925
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.177 Y85.946 Z8.5 F42000
G1 X81.181 Y85.855 Z8.5
G1 Z8.1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.225803
G1 F2433
M204 S6000
G3 X81.463 Y85.623 I7.601 J8.946 E.00545
G1 X81.589 Y85.527 E.00236
; LINE_WIDTH: 0.165328
G3 X85.146 Y83.833 I7.137 J10.404 E.03945
G2 X86.466 Y83.49 I-16.831 J-67.42 E.0136
; LINE_WIDTH: 0.232754
G2 X86.809 Y83.333 I-.761 J-2.129 E.00585
; CHANGE_LAYER
; Z_HEIGHT: 8.3
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X86.466 Y83.49 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 42/111
; update layer progress
M73 L42
M991 S0 P41 ;notify layer change

; OBJECT_ID: 427
M204 S10000
G17
G3 Z8.5 I-.617 J1.049 P1  F42000
G1 X93.009 Y87.339 Z8.5
G1 Z8.3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2223
M204 S5000
G1 X91.557 Y87.258 E.04469
G1 X91.593 Y86.618 E.01971
G1 X91.734 Y86.626 E.00434
G1 X91.864 Y86.633 E.00402
G1 X91.856 Y86.771 E.00425
G1 X93.494 Y86.864 E.05038
G1 X93.51 Y86.878 E.00065
G1 X93.512 Y93.113 E.1916
G1 X93.5 Y93.135 E.00077
G1 X91.856 Y93.229 E.05057
G1 X91.864 Y93.367 E.00425
G1 X91.593 Y93.382 E.00836
G1 X91.557 Y92.742 E.01971
G1 X93.009 Y92.661 E.04469
G1 X93.009 Y87.399 E.16168
; WIPE_START
G1 F12000
M204 S6000
G1 X91.557 Y87.258 E-.55439
G1 X91.587 Y86.718 E-.20561
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.7 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z8.7
G1 X0 Y90.0001 F18000 ; move to safe pos
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
            G0 Z8.7 F4000
            G39.3 S1
            G0 Z8.7 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X91.767 Y87.018 F42000
G1 Z8.3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.153861
G1 F2223
M204 S6000
G1 X93.208 Y87.099 E.01305
G1 X93.252 Y87.111 E.00041
G1 X93.26 Y87.154 E.0004
G1 X93.252 Y92.889 E.05185
G1 X91.767 Y92.982 E.01346
; WIPE_START
G1 F15000
G1 X93.252 Y92.889 E-.56561
G1 X93.253 Y92.377 E-.1944
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.42 Y93.138 Z8.7 F42000
G1 Z8.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
M73 P65 R6
G1 F2223
M204 S6000
G1 X85.571 Y93.185 E.0282
G1 X85.571 Y86.816 E.21128
G1 X86.446 Y86.864 E.02908
G1 X86.444 Y88.442 E.05234
G1 X86.561 Y88.446 E.00388
G1 X86.561 Y91.554 E.10312
G1 X86.444 Y91.558 E.00388
G1 X86.446 Y93.103 E.05125
M204 S10000
G1 X86.838 Y93.004 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2223
M204 S5000
G1 X87.454 Y92.97 E.01895
G1 X87.488 Y93.61 E.01972
G1 X87.214 Y93.625 E.00843
G1 X87.207 Y93.487 E.00425
G1 X85.185 Y93.592 E.06221
G1 X85.181 Y86.414 E.22055
G1 X87.207 Y86.513 E.06231
G1 X87.214 Y86.375 E.00424
G1 X87.333 Y86.381 E.00365
G1 X87.488 Y86.39 E.00478
G1 X87.454 Y87.03 E.01971
G1 X86.838 Y86.996 E.01895
G1 X86.837 Y87.663 E.02048
G1 X86.837 Y88.063 E.01229
G1 X86.894 Y88.064 E.00176
G1 X87.185 Y88.074 E.00894
G1 X87.185 Y88.126 E.00158
G1 X87.185 Y88.43 E.00934
G1 X86.953 Y88.417 E.00712
G1 X86.953 Y90.371 E.06001
G1 X86.953 Y91.583 E.03724
G1 X87.185 Y91.57 E.00712
G1 X87.185 Y91.874 E.00934
G1 X87.185 Y91.926 E.00158
G1 X86.894 Y91.936 E.00894
G1 X86.837 Y91.938 E.00176
G1 X86.837 Y92.338 E.01229
G1 X86.838 Y92.944 E.01863
M204 S10000
G1 X86.642 Y93.267 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.153937
G1 F2223
M204 S6000
G1 X87.272 Y93.232 E.0057
; WIPE_START
G1 F15000
G1 X86.642 Y93.267 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.008 Y92.957 Z8.7 F42000
G1 Z8.3
G1 E.8 F1800
; LINE_WIDTH: 0.510934
G1 F2223
M204 S6000
G1 X86.008 Y91.362 E.06085
G1 X86.027 Y91.284 E.00307
; LINE_WIDTH: 0.567893
G1 X86.047 Y91.206 E.00344
; LINE_WIDTH: 0.606914
G1 X86.066 Y91.128 E.00369
M204 S10000
G1 X86.358 Y91.32 F42000
; LINE_WIDTH: 0.309436
G1 F2223
M204 S6000
G1 X86.316 Y91.293 E.00108
; LINE_WIDTH: 0.358203
G1 X86.274 Y91.265 E.00128
; LINE_WIDTH: 0.40697
G1 X86.233 Y91.238 E.00148
; LINE_WIDTH: 0.455737
G1 X86.191 Y91.21 E.00168
; LINE_WIDTH: 0.504504
G1 X86.149 Y91.183 E.00188
; LINE_WIDTH: 0.553271
G1 X86.108 Y91.155 E.00208
; LINE_WIDTH: 0.602039
G1 X86.066 Y91.128 E.00228
; LINE_WIDTH: 0.625902
G1 X86.066 Y88.872 E.10714
G1 X86.108 Y88.845 E.00237
; LINE_WIDTH: 0.553292
G1 X86.149 Y88.817 E.00208
; LINE_WIDTH: 0.504526
G1 X86.191 Y88.79 E.00188
; LINE_WIDTH: 0.45576
G1 X86.233 Y88.762 E.00168
; LINE_WIDTH: 0.406994
G1 X86.274 Y88.735 E.00148
; LINE_WIDTH: 0.358228
G1 X86.316 Y88.707 E.00128
; LINE_WIDTH: 0.309462
G1 X86.358 Y88.68 E.00108
M204 S10000
G1 X86.066 Y88.872 F42000
; LINE_WIDTH: 0.606907
G1 F2223
M204 S6000
G1 X86.047 Y88.794 E.00369
; LINE_WIDTH: 0.56788
G1 X86.027 Y88.717 E.00344
; LINE_WIDTH: 0.528854
G1 X86.008 Y88.639 E.00318
; LINE_WIDTH: 0.510046
G1 X86.008 Y87.044 E.0607
M204 S10000
G1 X86.642 Y86.734 F42000
; LINE_WIDTH: 0.15389
G1 F2223
M204 S6000
G1 X87.272 Y86.768 E.0057
; WIPE_START
G1 F15000
G1 X86.642 Y86.734 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.303 Y90.984 Z8.7 F42000
G1 X78.875 Y91.941 Z8.7
G1 Z8.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2223
M204 S6000
G3 X77.58 Y90.092 I9.598 J-8.099 E.07498
G3 X77.624 Y89.823 I.283 J-.092 E.0094
G3 X78.875 Y88.061 I11.646 J6.947 E.07175
G1 X78.875 Y91.881 E.12671
; WIPE_START
G1 F15476.087
G1 X78.296 Y91.202 E-.33897
G1 X77.899 Y90.622 E-.26711
G1 X77.69 Y90.275 E-.15392
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.41 Y92.68 Z8.7 F42000
G1 Z8.3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2223
M204 S5000
G1 X80.41 Y92.837 E.00482
G2 X80.78 Y93.525 I1.203 J-.204 E.02442
G2 X82.24 Y94.64 I4.461 J-4.328 E.05668
G2 X86.864 Y96.317 I6.765 J-11.443 E.152
G1 X86.864 Y96.93 E.01885
G1 X86.409 Y96.911 E.014
G1 X86.311 Y96.904 E.00302
G1 X86.299 Y96.855 E.00155
G1 X86.223 Y96.757 E.00381
G1 X86.184 Y96.734 E.00139
G1 X86.125 Y96.699 E.0021
G1 X85.737 Y96.603 E.01229
G1 X85.224 Y96.476 E.01623
G3 X80.394 Y93.977 I3.72 J-13.106 E.16823
G3 X80.031 Y93.674 I4.485 J-5.744 E.01452
G1 X79.758 Y93.43 E.01126
G1 X79.492 Y93.18 E.01123
G1 X79.148 Y92.832 E.01504
G3 X78.271 Y91.82 I11.283 J-10.651 E.04116
G3 X77.701 Y91.035 I10.711 J-8.378 E.02981
G3 X77.267 Y90.345 I13.023 J-8.677 E.02506
G3 X77.215 Y90.237 I.656 J-.381 E.00367
G3 X77.174 Y90.057 I.789 J-.274 E.00569
G3 X77.174 Y89.946 I.739 J-.058 E.00342
G3 X77.231 Y89.727 I.738 J.074 E.00699
G1 X77.283 Y89.628 E.00341
G3 X77.759 Y88.88 I11.384 J6.722 E.02728
G3 X78.336 Y88.099 I11.279 J7.719 E.02983
G3 X79.135 Y87.181 I11.542 J9.244 E.03741
G3 X79.745 Y86.581 I9.657 J9.218 E.02629
G3 X80.427 Y85.995 I12.381 J13.71 E.02763
G3 X85.442 Y83.465 I8.538 J10.687 E.17382
G1 X85.736 Y83.394 E.00929
G1 X86.125 Y83.301 E.01229
G1 X86.184 Y83.266 E.00212
G1 X86.222 Y83.243 E.00138
G1 X86.3 Y83.145 E.00383
G1 X86.311 Y83.096 E.00153
G1 X86.409 Y83.09 E.00301
G1 X86.864 Y83.071 E.014
G1 X86.864 Y83.683 E.01882
G2 X81.184 Y86.084 I1.904 J12.423 E.19145
G2 X80.439 Y87.001 I1.452 J1.94 E.03666
G2 X80.409 Y87.162 I.555 J.188 E.00504
G1 X80.41 Y92.62 E.16772
M204 S10000
G1 X79.982 Y93.352 F42000
; FEATURE: Top surface
G1 F2223
M204 S2000
G1 X80.251 Y93.084 E.01168
G1 X80.202 Y92.599
G1 X79.705 Y93.096 E.02159
G1 X79.438 Y92.83
G1 X80.202 Y92.066 E.03322
G1 X80.202 Y91.532
G1 X79.176 Y92.558 E.04458
G1 X79.097 Y92.104
G1 X80.202 Y90.999 E.04801
G1 X80.202 Y90.466
G1 X79.097 Y91.571 E.04801
G1 X79.097 Y91.038
G1 X80.202 Y89.933 E.04801
G1 X80.202 Y89.4
G1 X79.097 Y90.504 E.048
G1 X79.097 Y89.971
G1 X80.202 Y88.866 E.048
G1 X80.202 Y88.333
G1 X79.097 Y89.438 E.048
G1 X79.097 Y88.904
G1 X80.202 Y87.8 E.04799
G1 X80.202 Y87.267
G1 X79.097 Y88.371 E.04799
G1 X79.097 Y87.838
G1 X80.303 Y86.632 E.0524
M204 S10000
G1 X80.016 Y86.622 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.100752
G1 F2223
M204 S6000
G2 X79.078 Y87.555 I27.961 J29.008 E.00623
; WIPE_START
G1 F15000
G1 X80.016 Y86.622 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.368 Y93.291 Z8.7 F42000
G1 Z8.3
G1 E.8 F1800
; LINE_WIDTH: 0.103982
G1 F2223
M204 S6000
G1 X80.138 Y93.493 E.00152
M204 S10000
G1 X80.292 Y93.639 F42000
; LINE_WIDTH: 0.243752
G1 F2223
M204 S6000
G1 X80.528 Y93.697 E.00398
G1 X80.551 Y93.719 E.00052
; LINE_WIDTH: 0.221941
G1 X80.863 Y93.998 E.0061
; LINE_WIDTH: 0.164569
G2 X84.089 Y95.83 I7.67 J-9.748 E.03692
G1 X84.341 Y95.924 E.00266
G2 X86.316 Y96.495 I7.96 J-23.822 E.02038
; LINE_WIDTH: 0.211937
G1 X86.402 Y96.528 E.00127
; LINE_WIDTH: 0.237907
G1 X86.668 Y96.659 E.00472
; WIPE_START
G1 F15000
G1 X86.402 Y96.528 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.245 Y92.017 Z8.7 F42000
G1 X78.461 Y90.71 Z8.7
G1 Z8.3
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.46354
G1 F2223
M204 S6000
G1 X78.461 Y89.285 E.04883
G1 X78.073 Y89.887 E.02454
G1 X78.015 Y90.02 E.00499
G2 X78.426 Y90.661 I5.048 J-2.783 E.02611
; WIPE_START
G1 F14977.889
G1 X78.015 Y90.02 E-.28925
G1 X78.073 Y89.887 E-.05529
G1 X78.461 Y89.285 E-.27206
G1 X78.461 Y89.663 E-.1434
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.428 Y86.402 Z8.7 F42000
G1 Z8.3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.252941
G1 F2223
M204 S6000
G1 X80.581 Y86.253 E.00365
; LINE_WIDTH: 0.222656
G1 X80.825 Y86.035 E.00479
; LINE_WIDTH: 0.164704
G3 X84.089 Y84.17 I7.604 J9.523 E.03745
G1 X84.162 Y84.142 E.00079
G3 X86.316 Y83.505 I7.61 J21.763 E.02229
; LINE_WIDTH: 0.212271
G1 X86.402 Y83.472 E.00127
; LINE_WIDTH: 0.238129
G1 X86.668 Y83.341 E.00472
; CHANGE_LAYER
; Z_HEIGHT: 8.5
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X86.402 Y83.472 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 43/111
; update layer progress
M73 L43
M991 S0 P42 ;notify layer change

; OBJECT_ID: 427
M204 S10000
G17
G3 Z8.7 I-.614 J1.051 P1  F42000
G1 X93.014 Y87.334 Z8.7
G1 Z8.5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2085
M204 S5000
G1 X91.562 Y87.253 E.04469
G1 X91.598 Y86.613 E.01971
G1 X91.723 Y86.62 E.00385
G1 X91.87 Y86.628 E.00451
G1 X91.862 Y86.766 E.00425
G1 X93.499 Y86.859 E.05038
G1 X93.515 Y86.873 E.00065
G1 X93.517 Y93.118 E.19191
G1 X93.505 Y93.14 E.00076
G1 X91.862 Y93.234 E.05058
G1 X91.87 Y93.372 E.00425
G1 X91.598 Y93.387 E.00836
G1 X91.562 Y92.747 E.01971
G1 X93.014 Y92.666 E.04469
G1 X93.014 Y87.394 E.16199
; WIPE_START
G1 F12000
M204 S6000
G1 X91.562 Y87.253 E-.55439
G1 X91.592 Y86.713 E-.20561
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.9 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z8.9
G1 X0 Y90.0001 F18000 ; move to safe pos
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
            G0 Z8.9 F4000
            G39.3 S1
            G0 Z8.9 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X91.772 Y87.013 F42000
G1 Z8.5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.153856
G1 F2085
M204 S6000
G1 X93.213 Y87.094 E.01305
G1 X93.257 Y87.106 E.00041
G1 X93.266 Y87.149 E.0004
G1 X93.257 Y92.894 E.05194
G1 X91.772 Y92.987 E.01346
; WIPE_START
G1 F15000
G1 X93.257 Y92.894 E-.56561
G1 X93.258 Y92.382 E-.1944
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.402 Y93.144 Z8.9 F42000
G1 Z8.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2085
M204 S6000
G1 X85.555 Y93.192 E.02815
G1 X85.555 Y86.81 E.21168
G1 X86.43 Y86.858 E.02906
G1 X86.43 Y88.378 E.05042
G1 X86.546 Y88.38 E.00383
G2 X86.546 Y91.62 I724.132 J1.557 E.10745
G1 X86.431 Y91.622 E.00382
G1 X86.43 Y93.11 E.04936
M204 S10000
G1 X86.822 Y93.01 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2085
M204 S5000
G1 X87.438 Y92.976 E.01897
G1 X87.472 Y93.616 E.01972
G1 X87.199 Y93.632 E.00843
G1 X87.191 Y93.493 E.00425
G1 X85.17 Y93.599 E.06219
G1 X85.166 Y86.408 E.22094
G1 X87.191 Y86.507 E.06231
G1 X87.199 Y86.369 E.00425
G1 X87.334 Y86.376 E.00417
G1 X87.472 Y86.384 E.00426
G1 X87.438 Y87.024 E.01971
G1 X86.822 Y86.99 E.01896
G1 X86.822 Y87.995 E.03087
G1 X86.878 Y87.996 E.00171
G1 X87.169 Y88.003 E.00894
G1 X87.169 Y88.033 E.00091
G1 X87.169 Y88.32 E.00883
G1 X86.938 Y88.311 E.00711
G2 X86.938 Y91.689 I744.45 J1.592 E.10378
G1 X87.169 Y91.68 E.0071
G1 X87.169 Y91.967 E.00884
G1 X87.169 Y91.997 E.00091
G1 X86.878 Y92.004 E.00895
G1 X86.823 Y92.005 E.0017
G1 X86.822 Y92.95 E.02903
M204 S10000
G1 X86.626 Y93.273 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.153902
G1 F2085
M204 S6000
G1 X87.256 Y93.238 E.00571
; WIPE_START
G1 F15000
G1 X86.626 Y93.273 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.992 Y92.963 Z8.9 F42000
G1 Z8.5
G1 E.8 F1800
; LINE_WIDTH: 0.512365
G1 F2085
M204 S6000
G1 X85.993 Y91.423 E.05891
G1 X86.012 Y91.346 E.00304
; LINE_WIDTH: 0.569229
G1 X86.031 Y91.269 E.00341
; LINE_WIDTH: 0.607408
G1 X86.05 Y91.192 E.00366
; LINE_WIDTH: 0.601574
G1 X86.092 Y91.219 E.00227
; LINE_WIDTH: 0.551721
G1 X86.134 Y91.246 E.00207
; LINE_WIDTH: 0.501867
G1 X86.175 Y91.274 E.00186
; LINE_WIDTH: 0.452013
G1 X86.217 Y91.301 E.00166
; LINE_WIDTH: 0.402159
G1 X86.259 Y91.329 E.00146
; LINE_WIDTH: 0.352306
G1 X86.3 Y91.356 E.00126
; LINE_WIDTH: 0.302452
G1 X86.342 Y91.383 E.00105
M204 S10000
G1 X86.05 Y91.192 F42000
; LINE_WIDTH: 0.626062
G1 F2085
M204 S6000
G1 X86.05 Y88.809 E.11323
G1 X86.092 Y88.782 E.00237
; LINE_WIDTH: 0.55222
G1 X86.134 Y88.754 E.00207
; LINE_WIDTH: 0.502622
G1 X86.176 Y88.727 E.00187
; LINE_WIDTH: 0.453023
G1 X86.217 Y88.699 E.00167
; LINE_WIDTH: 0.403425
G1 X86.259 Y88.672 E.00147
; LINE_WIDTH: 0.353827
G1 X86.301 Y88.644 E.00126
; LINE_WIDTH: 0.304229
G1 X86.342 Y88.617 E.00106
M204 S10000
G1 X86.05 Y88.809 F42000
; LINE_WIDTH: 0.607374
G1 F2085
M204 S6000
G1 X86.031 Y88.731 E.00367
; LINE_WIDTH: 0.56888
G1 X86.012 Y88.654 E.00342
; LINE_WIDTH: 0.511944
G1 X85.993 Y88.576 E.00305
G1 X85.992 Y87.038 E.05881
M204 S10000
G1 X86.626 Y86.727 F42000
; LINE_WIDTH: 0.15385
G1 F2085
M204 S6000
G1 X87.256 Y86.762 E.0057
; WIPE_START
G1 F15000
G1 X86.626 Y86.727 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.779 Y90.099 Z8.9 F42000
G1 X78.21 Y90.872 Z8.9
G1 Z8.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2085
M204 S6000
G1 X78.039 Y90.925 E.00597
G3 X77.51 Y90.07 I4.278 J-3.235 E.03339
G3 X77.548 Y89.841 I.323 J-.064 E.00787
G3 X78.035 Y89.078 I12.338 J7.331 E.03003
G1 X78.208 Y89.131 E.00601
G1 X78.21 Y90.812 E.05577
; WIPE_START
G1 F15476.087
G1 X78.039 Y90.925 E-.0782
G1 X77.668 Y90.359 E-.25725
G1 X77.51 Y90.07 E-.1249
M73 P66 R6
G1 X77.505 Y89.953 E-.04484
G1 X77.548 Y89.841 E-.04534
G1 X77.844 Y89.377 E-.20948
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.742 Y92.092 Z8.9 F42000
G1 Z8.5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2085
M204 S5000
G1 X79.742 Y92.272 E.00552
G2 X80.157 Y93.064 I1.518 J-.289 E.02788
G2 X81.589 Y94.266 I5.234 J-4.78 E.05761
G2 X86.723 Y96.308 I7.237 J-10.723 E.17108
G1 X86.723 Y96.926 E.01899
G1 X86.268 Y96.9 E.014
G1 X86.174 Y96.894 E.0029
G1 X86.149 Y96.829 E.00212
G1 X86.082 Y96.743 E.00337
G1 X86.05 Y96.724 E.00113
G1 X85.984 Y96.684 E.00236
G1 X85.597 Y96.585 E.01229
G1 X85.042 Y96.443 E.01761
G3 X79.913 Y93.624 I3.857 J-13.093 E.18123
G1 X79.826 Y93.546 E.00358
G1 X79.681 Y93.414 E.00605
G3 X79.428 Y93.176 I4.976 J-5.543 E.01065
G1 X79.259 Y93.008 E.00734
G1 X78.975 Y92.726 E.01229
G1 X78.916 Y92.856 E.00436
G3 X78.619 Y92.534 I5.82 J-5.681 E.01345
G1 X78.5 Y92.396 E.00561
G1 X78.642 Y92.352 E.00459
G1 X78.391 Y92.041 E.01229
G1 X78.135 Y91.721 E.01257
G3 X77.8 Y91.27 I13.805 J-10.591 E.01728
G3 X77.204 Y90.348 I14.994 J-10.341 E.03373
G3 X77.153 Y90.242 I.64 J-.372 E.00361
G3 X77.108 Y90.016 I.725 J-.262 E.00711
G1 X77.108 Y89.984 E.00097
G1 X77.115 Y89.902 E.00252
G1 X77.121 Y89.871 E.00099
G3 X77.168 Y89.723 I.677 J.135 E.00479
G1 X77.206 Y89.65 E.00251
G3 X77.833 Y88.683 I16.091 J9.755 E.03544
G3 X78.124 Y88.291 I14.061 J10.126 E.01498
G1 X78.389 Y87.959 E.01306
G1 X78.64 Y87.648 E.01229
G1 X78.498 Y87.604 E.00456
G1 X78.511 Y87.589 E.00062
G3 X78.916 Y87.144 I7.004 J5.96 E.01848
G1 X78.974 Y87.274 E.00438
G1 X79.258 Y86.993 E.01229
G1 X79.416 Y86.836 E.00684
G3 X79.68 Y86.587 I5.893 J5.986 E.01116
G1 X79.778 Y86.497 E.00408
G3 X79.879 Y86.406 I2.019 J2.151 E.00418
G3 X85.029 Y83.561 I9.018 J10.237 E.18224
G1 X85.598 Y83.415 E.01803
G1 X85.985 Y83.315 E.01229
G1 X86.051 Y83.276 E.00235
G1 X86.082 Y83.257 E.00112
G1 X86.158 Y83.159 E.00381
G1 X86.171 Y83.105 E.00172
G1 X86.268 Y83.098 E.003
G1 X86.723 Y83.076 E.01398
G1 X86.723 Y83.692 E.01895
G2 X80.454 Y86.618 I1.968 J12.396 E.21534
G2 X79.762 Y87.601 I1.611 J1.869 E.03733
G2 X79.742 Y87.73 I.413 J.129 E.00402
G1 X79.742 Y92.032 E.13219
; WIPE_START
G1 F12000
M204 S6000
G1 X79.742 Y92.272 E-.09112
G1 X79.772 Y92.438 E-.06447
G1 X79.894 Y92.7 E-.10979
G1 X80.157 Y93.064 E-.17048
G1 X80.386 Y93.315 E-.12902
G1 X80.731 Y93.631 E-.17789
G1 X80.767 Y93.658 E-.01724
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.773 Y93.077 Z8.9 F42000
G1 Z8.5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.241252
G1 F2085
M204 S6000
G1 X79.932 Y93.248 E.00378
; LINE_WIDTH: 0.212482
G1 X80.192 Y93.505 E.00505
; LINE_WIDTH: 0.163445
G2 X85.28 Y96.248 I8.508 J-9.691 E.05725
G1 X85.337 Y96.263 E.00059
G3 X86.206 Y96.495 I-2.103 J9.636 E.00883
; LINE_WIDTH: 0.231014
G3 X86.527 Y96.647 I-.725 J1.947 E.00544
; WIPE_START
G1 F15000
G1 X86.206 Y96.495 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.56 Y90.44 Z8.9 F42000
G1 X79.535 Y87.801 Z8.9
G1 Z8.5
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F2085
M204 S2000
G1 X79.138 Y87.403 E.01726
G1 X78.881 Y87.68
G1 X79.535 Y88.334 E.02842
G1 X79.535 Y88.867
G1 X78.642 Y87.974 E.03881
G1 X78.43 Y88.295
G1 X79.535 Y89.4 E.04804
G1 X79.535 Y89.934
G1 X78.43 Y88.829 E.04801
G1 X78.431 Y89.363
G1 X79.535 Y90.467 E.04798
G1 X79.535 Y91
G1 X78.432 Y89.897 E.04795
G1 X78.432 Y90.431
G1 X79.535 Y91.533 E.04792
G1 X79.535 Y92.067
G1 X78.433 Y90.964 E.04789
G1 X78.433 Y91.498
G1 X79.664 Y92.728 E.05345
M204 S10000
G1 X79.558 Y92.356 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.10098
G1 F2085
M204 S6000
G1 X79.462 Y92.14 E.00112
M204 S10000
G1 X79.483 Y92.89 F42000
; LINE_WIDTH: 0.150975
G1 F2085
M204 S6000
G1 X79.02 Y92.429 E.00575
; LINE_WIDTH: 0.136134
G1 X78.794 Y92.179 E.00256
; LINE_WIDTH: 0.104161
G1 X78.567 Y91.929 E.00168
; WIPE_START
G1 F15000
G1 X78.794 Y92.179 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.77 Y86.926 Z8.9 F42000
G1 Z8.5
G1 E.8 F1800
; LINE_WIDTH: 0.241881
G1 F2085
M204 S6000
G1 X79.931 Y86.752 E.00384
; LINE_WIDTH: 0.211592
G3 X80.077 Y86.604 I5.028 J4.808 E.00287
G1 X80.223 Y86.465 E.00276
; LINE_WIDTH: 0.163308
G3 X85.1 Y83.803 I8.486 J9.747 E.05493
G2 X86.208 Y83.505 I-4.413 J-18.561 E.01126
; LINE_WIDTH: 0.230981
G2 X86.527 Y83.354 I-.709 J-1.909 E.00542
; CHANGE_LAYER
; Z_HEIGHT: 8.7
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X86.208 Y83.505 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 44/111
; update layer progress
M73 L44
M991 S0 P43 ;notify layer change

; OBJECT_ID: 427
M204 S10000
G17
G3 Z8.9 I-.596 J1.061 P1  F42000
G1 X93.019 Y87.329 Z8.9
G1 Z8.7
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1926
M204 S5000
G1 X91.567 Y87.248 E.04469
G1 X91.603 Y86.608 E.01971
G1 X91.712 Y86.614 E.00336
G1 X91.875 Y86.623 E.005
G1 X91.867 Y86.761 E.00425
G1 X93.504 Y86.854 E.05038
G1 X93.52 Y86.868 E.00065
G1 X93.522 Y93.124 E.19222
G1 X93.511 Y93.145 E.00075
G1 X91.867 Y93.239 E.05059
G1 X91.875 Y93.377 E.00425
G1 X91.603 Y93.392 E.00836
G1 X91.567 Y92.752 E.01971
G1 X93.019 Y92.671 E.04469
G1 X93.019 Y87.389 E.16229
; WIPE_START
G1 F12000
M204 S6000
G1 X91.567 Y87.248 E-.55439
G1 X91.598 Y86.708 E-.20561
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z9.1 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z9.1
G1 X0 Y90.0001 F18000 ; move to safe pos
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
            G0 Z9.1 F4000
            G39.3 S1
            G0 Z9.1 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X91.777 Y87.008 F42000
G1 Z8.7
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.153849
G1 F1926
M204 S6000
G1 X93.218 Y87.089 E.01305
G1 X93.263 Y87.101 E.00041
G1 X93.271 Y87.144 E.0004
G1 X93.263 Y92.899 E.05202
G1 X91.777 Y92.992 E.01345
; WIPE_START
G1 F15000
G1 X93.263 Y92.899 E-.56561
G1 X93.263 Y92.387 E-.19439
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.388 Y93.15 Z9.1 F42000
G1 Z8.7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1926
M204 S6000
G1 X85.539 Y93.198 E.02819
G1 X85.539 Y86.804 E.21209
G1 X86.414 Y86.852 E.02906
G1 X86.415 Y88.332 E.04912
G1 X86.53 Y88.334 E.00383
G2 X86.53 Y89.964 I900.897 J.737 E.05406
G2 X86.53 Y91.666 I1082.763 J.94 E.05646
G1 X86.414 Y91.668 E.00385
G1 X86.414 Y93.116 E.04804
M204 S10000
G1 X86.806 Y93.016 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1926
M204 S5000
G1 X87.422 Y92.982 E.01896
G1 X87.457 Y93.622 E.01972
G1 X87.183 Y93.638 E.00843
G1 X87.175 Y93.499 E.00425
G1 X85.155 Y93.605 E.06217
G1 X85.15 Y86.402 E.22133
G1 X85.163 Y86.391 E.00053
G1 X87.175 Y86.5 E.06193
G1 X87.183 Y86.362 E.00425
G1 X87.335 Y86.371 E.00469
G1 X87.457 Y86.378 E.00373
G1 X87.422 Y87.018 E.01971
G1 X86.806 Y86.984 E.01896
G1 X86.806 Y87.946 E.02957
G1 X86.863 Y87.947 E.00174
G1 X87.153 Y87.952 E.00891
G1 X87.153 Y87.961 E.0003
G1 X87.153 Y88.245 E.00871
G1 X86.922 Y88.239 E.00711
G1 X86.922 Y89.05 E.02491
G1 X86.922 Y89.45 E.01229
G1 X86.922 Y89.85 E.01229
G1 X86.979 Y89.856 E.00175
G1 X87.153 Y89.876 E.0054
G1 X87.153 Y90.124 E.0076
G1 X86.979 Y90.144 E.0054
G1 X86.922 Y90.15 E.00175
G1 X86.922 Y90.55 E.01229
G1 X86.922 Y90.95 E.01229
G1 X86.922 Y91.761 E.02491
G1 X87.153 Y91.755 E.00711
G1 X87.153 Y92.039 E.00871
G1 X87.153 Y92.048 E.0003
G1 X86.864 Y92.053 E.0089
G1 X86.806 Y92.054 E.00177
G1 X86.806 Y92.956 E.02773
M204 S10000
G1 X86.611 Y93.279 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.153936
G1 F1926
M204 S6000
G1 X87.24 Y93.244 E.0057
; WIPE_START
G1 F15000
G1 X86.611 Y93.279 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.977 Y92.969 Z9.1 F42000
G1 Z8.7
G1 E.8 F1800
; LINE_WIDTH: 0.511478
G1 F1926
M204 S6000
G1 X85.976 Y91.467 E.05736
G1 X85.996 Y91.39 E.00306
; LINE_WIDTH: 0.568367
G1 X86.015 Y91.312 E.00343
; LINE_WIDTH: 0.607105
G1 X86.035 Y91.234 E.00368
; LINE_WIDTH: 0.60166
G1 X86.076 Y91.262 E.00228
; LINE_WIDTH: 0.552021
G1 X86.118 Y91.289 E.00207
; LINE_WIDTH: 0.502383
G1 X86.16 Y91.317 E.00187
; LINE_WIDTH: 0.452744
G1 X86.201 Y91.344 E.00167
; LINE_WIDTH: 0.403105
G1 X86.243 Y91.372 E.00147
; LINE_WIDTH: 0.353467
G1 X86.285 Y91.4 E.00126
; LINE_WIDTH: 0.303828
G1 X86.326 Y91.427 E.00106
M204 S10000
G1 X86.035 Y91.234 F42000
; LINE_WIDTH: 0.626546
G1 F1926
M204 S6000
G1 X86.035 Y88.765 E.11742
M204 S10000
G1 X86.326 Y88.573 F42000
; LINE_WIDTH: 0.302139
G1 F1926
M204 S6000
G1 X86.285 Y88.6 E.00105
; LINE_WIDTH: 0.352035
G1 X86.243 Y88.628 E.00126
; LINE_WIDTH: 0.401931
G1 X86.201 Y88.655 E.00146
; LINE_WIDTH: 0.451827
G1 X86.16 Y88.683 E.00166
; LINE_WIDTH: 0.501723
G1 X86.118 Y88.71 E.00187
; LINE_WIDTH: 0.551619
G1 X86.076 Y88.738 E.00207
; LINE_WIDTH: 0.601515
G1 X86.035 Y88.765 E.00227
; LINE_WIDTH: 0.607257
G1 X86.015 Y88.688 E.00367
; LINE_WIDTH: 0.56881
G1 X85.996 Y88.61 E.00342
; LINE_WIDTH: 0.511974
G1 X85.977 Y88.533 E.00305
G1 X85.977 Y87.032 E.05738
M204 S10000
G1 X86.61 Y86.721 F42000
; LINE_WIDTH: 0.153873
G1 F1926
M204 S6000
G1 X87.24 Y86.756 E.0057
; WIPE_START
G1 F15000
G1 X86.61 Y86.721 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.232 Y90.913 Z9.1 F42000
G1 X79.077 Y91.672 Z9.1
G1 Z8.7
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1926
M204 S5000
G1 X79.077 Y91.755 E.00254
G2 X79.265 Y92.186 I.846 J-.113 E.01465
G2 X80.869 Y93.789 I5.799 J-4.201 E.06996
G2 X86.581 Y96.295 I7.911 J-10.269 E.19356
G1 X86.581 Y96.919 E.01919
G1 X86.129 Y96.892 E.01393
G1 X86.031 Y96.885 E.00301
G1 X86.017 Y96.823 E.00195
G1 X85.941 Y96.725 E.00383
G1 X85.917 Y96.711 E.00084
G1 X85.844 Y96.666 E.00264
G1 X85.457 Y96.562 E.01229
G1 X84.749 Y96.372 E.02253
G3 X80.187 Y93.904 I4.074 J-12.98 E.16036
G1 X79.93 Y93.675 E.01058
G1 X79.632 Y93.408 E.01229
G1 X79.334 Y93.141 E.01229
G1 X79.183 Y92.998 E.00641
G1 X79.107 Y93.112 E.00421
G1 X79.062 Y93.067 E.00197
G1 X78.829 Y92.825 E.01033
G1 X78.829 Y92.824 E.00002
G1 X78.829 Y92.822 E.00005
G2 X78.531 Y92.495 I-.331 J.002 E.01491
G1 X78.347 Y92.285 E.00858
G1 X78.262 Y92.182 E.00409
G1 X78.386 Y92.121 E.00422
G1 X78.141 Y91.805 E.01229
G1 X77.927 Y91.527 E.01076
G3 X77.379 Y90.731 I10.884 J-8.078 E.02972
G1 X77.145 Y90.35 E.01373
G3 X77.094 Y90.244 I.612 J-.36 E.00362
G3 X77.055 Y90.095 I.655 J-.251 E.00473
G3 X77.056 Y89.902 I.682 J-.096 E.00598
G3 X77.109 Y89.72 I.836 J.148 E.00581
G1 X77.147 Y89.648 E.00251
G3 X77.636 Y88.881 I11.448 J6.761 E.02795
G1 X77.906 Y88.52 E.01387
G1 X78.147 Y88.2 E.01229
G1 X78.387 Y87.88 E.01229
G1 X78.262 Y87.818 E.00428
G1 X78.347 Y87.715 E.00413
G1 X78.531 Y87.505 E.00857
G1 X78.58 Y87.502 E.00149
G1 X78.704 Y87.431 E.00441
G2 X78.824 Y87.18 I-.212 J-.256 E.0088
G1 X78.928 Y87.072 E.00463
G1 X79.045 Y86.949 E.00521
G1 X79.108 Y86.887 E.0027
G1 X79.183 Y87 E.00417
G1 X79.336 Y86.857 E.00646
G1 X79.633 Y86.588 E.01229
G1 X79.93 Y86.32 E.01229
G1 X80.082 Y86.185 E.00625
G3 X84.941 Y83.57 I8.78 J10.494 E.17073
G1 X85.457 Y83.435 E.01639
G1 X85.844 Y83.334 E.01229
G1 X85.916 Y83.29 E.00259
G1 X85.941 Y83.275 E.00089
G1 X86.008 Y83.188 E.00336
G1 X86.036 Y83.115 E.0024
G1 X86.128 Y83.108 E.00285
G1 X86.581 Y83.082 E.01395
G1 X86.581 Y83.706 E.01916
G2 X79.917 Y87.029 I2.172 J12.698 E.23213
G2 X79.131 Y88.036 I4.097 J4.009 E.03933
G2 X79.075 Y88.288 I.653 J.278 E.00798
G1 X79.077 Y91.612 E.10216
M204 S10000
G1 X78.873 Y91.795 F42000
; FEATURE: Top surface
G1 F1926
M204 S2000
G1 X78.604 Y92.064 E.01171
G1 X78.371 Y91.763
G1 X78.869 Y91.265 E.02164
G1 X78.869 Y90.732
G1 X78.139 Y91.462 E.03172
G1 X77.915 Y91.153
G1 X78.869 Y90.199 E.04145
G1 X78.868 Y89.667
G1 X77.763 Y90.772 E.04803
G1 X77.763 Y90.239
G1 X78.868 Y89.134 E.04803
G1 X78.868 Y88.601
G1 X77.763 Y89.706 E.04802
G1 X77.763 Y89.172
G1 X78.902 Y88.033 E.04951
M204 S10000
G1 X78.727 Y87.853 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.142426
G1 F1926
M204 S6000
G1 X78.499 Y88.11 E.00278
; LINE_WIDTH: 0.106255
G1 X78.272 Y88.367 E.00177
M204 S10000
G1 X77.679 Y89.171 F42000
; LINE_WIDTH: 0.508168
G1 F1926
M204 S6000
G2 X77.497 Y89.924 I6.683 J2.014 E.02942
G1 X77.495 Y90.06 E.00513
G2 X77.648 Y90.782 I6.525 J-1.007 E.02801
; WIPE_START
G1 F13541.19
G1 X77.495 Y90.06 E-.34027
G1 X77.497 Y89.924 E-.06236
G1 X77.679 Y89.171 E-.35738
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.97 Y93.293 Z9.1 F42000
G1 Z8.7
G1 E.8 F1800
; LINE_WIDTH: 0.160719
G1 F1926
M204 S6000
G1 X79.979 Y93.382 E.00085
G2 X84.055 Y95.863 I8.746 J-9.779 E.04606
G2 X86.029 Y96.463 I8.451 J-24.221 E.01981
; LINE_WIDTH: 0.206008
G1 X86.119 Y96.499 E.00129
; LINE_WIDTH: 0.232172
G1 X86.385 Y96.631 E.00459
; WIPE_START
G1 F15000
G1 X86.119 Y96.499 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.058 Y90.036 Z9.1 F42000
G1 X79.934 Y86.656 Z9.1
G1 Z8.7
G1 E.8 F1800
; LINE_WIDTH: 0.160816
G1 F1926
M204 S6000
G3 X83.951 Y84.177 I8.84 J9.834 E.04559
G1 X84.143 Y84.104 E.00198
G3 X86.036 Y83.534 I7.75 J22.325 E.01899
; LINE_WIDTH: 0.208155
G1 X86.121 Y83.501 E.00123
; LINE_WIDTH: 0.233048
G1 X86.385 Y83.367 E.00459
; CHANGE_LAYER
; Z_HEIGHT: 8.9
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X86.121 Y83.501 E-.76
; WIPE_END
M73 P67 R6
G1 E-.04 F1800
; layer num/total_layer_count: 45/111
; update layer progress
M73 L45
M991 S0 P44 ;notify layer change

; OBJECT_ID: 427
M204 S10000
G17
G3 Z9.1 I-1.217 J.03 P1  F42000
G1 X86.44 Y96.278 Z9.1
G1 Z8.9
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1823
M204 S5000
G1 X86.44 Y96.512 E.00719
G1 X86.44 Y96.912 E.01229
G1 X85.988 Y96.881 E.01391
G1 X85.916 Y96.876 E.00223
G1 X85.896 Y96.874 E.00062
G1 X85.896 Y96.872 E.00005
G1 X85.868 Y96.792 E.0026
G1 X85.8 Y96.705 E.00339
G1 X85.782 Y96.693 E.00067
G1 X85.705 Y96.645 E.00278
G1 X85.32 Y96.54 E.01229
G1 X84.689 Y96.366 E.0201
G3 X80.043 Y93.828 I4.161 J-13.144 E.16368
G1 X79.603 Y93.435 E.01814
G1 X79.304 Y93.169 E.01229
G1 X79.292 Y93.158 E.00051
G1 X79.212 Y93.264 E.00407
G1 X79.179 Y93.231 E.00144
G1 X79.258 Y93.126 E.00406
G2 X79.57 Y92.696 I-6.902 J-5.329 E.01631
G1 X79.575 Y92.701 E.00023
G1 X79.866 Y92.975 E.01229
G1 X80.1 Y93.195 E.00985
G2 X86.381 Y96.267 I8.643 J-9.712 E.21754
; WIPE_START
G1 F12000
M204 S6000
G1 X86.44 Y96.512 E-.09567
G1 X86.44 Y96.912 E-.152
G1 X85.988 Y96.881 E-.17198
G1 X85.916 Y96.876 E-.02755
G1 X85.896 Y96.874 E-.00763
G1 X85.896 Y96.872 E-.00062
G1 X85.868 Y96.792 E-.0322
G1 X85.8 Y96.705 E-.04197
G1 X85.782 Y96.693 E-.00825
G1 X85.705 Y96.645 E-.03442
G1 X85.32 Y96.54 E-.152
G1 X85.229 Y96.515 E-.03571
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z9.3 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z9.3
G1 X0 Y90.0001 F18000 ; move to safe pos
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
            G0 Z9.3 F4000
            G39.3 S1
            G0 Z9.3 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X85.89 Y96.444 F42000
G1 Z8.9
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.202742
G1 F1823
M204 S6000
G1 X85.965 Y96.475 E.00106
; LINE_WIDTH: 0.231694
G3 X86.244 Y96.613 I-.666 J1.693 E.00479
M204 S10000
G1 X85.89 Y96.444 F42000
; LINE_WIDTH: 0.15995
G1 F1823
M204 S6000
G3 X83.445 Y95.634 I4.836 J-18.704 E.02458
G1 X82.929 Y95.396 E.00542
G3 X79.606 Y93.092 I5.85 J-11.986 E.03871
; LINE_WIDTH: 0.154847
G1 X79.604 Y93.071 E.00019
; LINE_WIDTH: 0.115876
M73 P67 R5
G1 X79.597 Y92.997 E.00044
; WIPE_START
G1 F15000
G1 X79.604 Y93.071 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.016 Y90.753 Z9.3 F42000
G1 Z8.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1823
M204 S6000
G1 X77.841 Y90.805 E.00605
G3 X77.393 Y90.065 I4.884 J-3.47 E.02871
G3 X77.459 Y89.795 I.344 J-.059 E.00949
G3 X77.842 Y89.197 I9.616 J5.734 E.02359
G1 X78.016 Y89.249 E.00603
G2 X78.016 Y90.693 I273.661 J.755 E.04788
M204 S10000
G1 X78.485 Y91.158 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1823
M204 S5000
G1 X78.531 Y91.283 E.0041
G1 X78.73 Y91.688 E.01385
G1 X78.254 Y92.018 E.01779
G1 X78.142 Y92.099 E.00423
G1 X78.115 Y92.065 E.00133
G1 X78.23 Y91.997 E.00411
G1 X77.993 Y91.674 E.01229
G1 X77.756 Y91.352 E.01229
G1 X77.522 Y91.033 E.01217
G3 X77.071 Y90.316 I10.274 J-6.972 E.02602
G1 X77.039 Y90.246 E.00237
G3 X76.993 Y89.978 I.778 J-.271 E.0084
G1 X76.995 Y89.945 E.001
G3 X77.053 Y89.72 I.765 J.078 E.00718
G3 X77.789 Y88.587 I15.246 J9.091 E.04151
G1 X77.99 Y88.32 E.01027
G1 X78.232 Y88.001 E.01229
G1 X78.116 Y87.934 E.00412
G1 X78.142 Y87.902 E.00126
G1 X78.254 Y87.983 E.00425
G1 X78.493 Y88.154 E.00905
G1 X78.73 Y88.313 E.00875
G1 X78.482 Y88.836 E.01781
G2 X78.408 Y89.149 I2.022 J.638 E.00988
G2 X78.418 Y90.947 I73.189 J.529 E.05523
G1 X78.467 Y91.1 E.00497
M204 S10000
G1 X78.141 Y91.285 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.388868
G1 F1823
M204 S6000
G1 X78.077 Y91.162 E.0039
; LINE_WIDTH: 0.417542
G3 X77.99 Y90.965 I3.674 J-1.744 E.00659
M204 S10000
G1 X78.141 Y91.285 F42000
; LINE_WIDTH: 0.346461
G1 F1823
M204 S6000
G1 X78.215 Y91.417 E.00375
; LINE_WIDTH: 0.300827
G1 X78.383 Y91.685 E.00664
; WIPE_START
G1 F15000
G1 X78.215 Y91.417 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.988 Y89.036 Z9.3 F42000
G1 Z8.9
G1 E.8 F1800
; LINE_WIDTH: 0.418446
G1 F1823
M204 S6000
G1 X78.07 Y88.853 E.00612
; LINE_WIDTH: 0.391907
G1 X78.139 Y88.717 E.00434
; LINE_WIDTH: 0.345392
G1 X78.221 Y88.574 E.00405
; LINE_WIDTH: 0.292753
G1 X78.316 Y88.419 E.0037
G1 X78.289 Y88.251 E.00347
; WIPE_START
G1 F15000
G1 X78.316 Y88.419 E-.36758
G1 X78.221 Y88.574 E-.39242
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.57 Y87.304 Z9.3 F42000
G1 Z8.9
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1823
M204 S5000
G2 X79.259 Y86.873 I-12.066 J8.345 E.01634
G1 X79.18 Y86.768 E.00404
G1 X79.212 Y86.736 E.0014
G1 X79.291 Y86.843 E.00408
G1 X79.292 Y86.843 E.00002
G1 X79.588 Y86.575 E.01229
G1 X79.837 Y86.344 E.01041
G3 X84.554 Y83.675 I8.966 J10.345 E.16765
G1 X85.32 Y83.462 E.02443
G1 X85.706 Y83.354 E.01229
G1 X85.783 Y83.306 E.00281
G1 X85.801 Y83.295 E.00063
G1 X85.875 Y83.198 E.00376
G1 X85.892 Y83.127 E.00226
G1 X85.99 Y83.119 E.00303
G1 X86.44 Y83.089 E.01385
G1 X86.44 Y83.722 E.01944
G2 X79.612 Y87.262 I2.364 J12.913 E.23984
M204 S10000
G1 X79.56 Y86.951 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.159707
G1 F1823
M204 S6000
G3 X83.245 Y84.456 I9.188 J9.603 E.04254
G1 X83.425 Y84.375 E.00188
G3 X85.889 Y83.557 I7.206 J17.591 E.02473
; LINE_WIDTH: 0.202024
G1 X85.964 Y83.526 E.00105
; LINE_WIDTH: 0.23116
G2 X86.244 Y83.387 I-.633 J-1.629 E.0048
; WIPE_START
G1 F15000
G1 X85.964 Y83.526 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.286 Y91.152 Z9.3 F42000
G1 X86.371 Y93.157 Z9.3
G1 Z8.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1823
M204 S6000
G1 X85.524 Y93.204 E.02816
G1 X85.524 Y86.798 E.2125
G1 X86.399 Y86.845 E.02907
G2 X86.401 Y88.305 I182.476 J.456 E.04841
G1 X86.514 Y88.306 E.00376
G2 X86.514 Y91.694 I1942.558 J1.74 E.11241
G1 X86.399 Y91.695 E.00382
G1 X86.398 Y93.122 E.04734
M204 S10000
G1 X86.79 Y93.022 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1823
M204 S5000
G1 X87.407 Y92.988 E.01896
G1 X87.441 Y93.629 E.01972
G1 X87.167 Y93.644 E.00843
G1 X87.16 Y93.505 E.00426
G1 X85.142 Y93.613 E.06209
G1 X85.135 Y86.394 E.22182
G1 X87.16 Y86.494 E.0623
G1 X87.167 Y86.356 E.00425
G1 X87.337 Y86.366 E.00522
G1 X87.441 Y86.371 E.00321
G1 X87.407 Y87.012 E.01971
G1 X86.791 Y86.978 E.01896
G2 X86.792 Y87.916 I117.417 J.36 E.02883
G1 X87.138 Y87.919 E.01063
G1 X87.138 Y88.198 E.00857
G1 X86.906 Y88.195 E.00711
G1 X86.906 Y88.89 E.02134
G1 X86.906 Y89.29 E.01229
G1 X86.906 Y89.69 E.01229
G1 X86.963 Y89.692 E.00175
G1 X87.138 Y89.7 E.00537
G1 X87.138 Y89.833 E.00411
G1 X87.138 Y90.167 E.01024
G1 X87.138 Y90.3 E.0041
G1 X86.963 Y90.308 E.00537
G1 X86.906 Y90.31 E.00175
G1 X86.906 Y90.71 E.01229
G1 X86.906 Y91.11 E.01229
G1 X86.906 Y91.805 E.02134
G1 X87.138 Y91.802 E.00711
G1 X87.138 Y92.081 E.00857
G1 X86.791 Y92.084 E.01065
G1 X86.79 Y92.962 E.02699
M204 S10000
G1 X86.594 Y93.285 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.153911
G1 F1823
M204 S6000
G1 X87.224 Y93.25 E.00571
; WIPE_START
G1 F15000
G1 X86.594 Y93.285 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.961 Y92.976 Z9.3 F42000
G1 Z8.9
G1 E.8 F1800
; LINE_WIDTH: 0.512114
G1 F1823
M204 S6000
G1 X85.961 Y91.494 E.05666
G1 X85.98 Y91.416 E.00305
; LINE_WIDTH: 0.568918
G1 X86 Y91.339 E.00342
; LINE_WIDTH: 0.60725
G1 X86.019 Y91.262 E.00366
M204 S10000
G1 X86.311 Y91.454 F42000
; LINE_WIDTH: 0.29701
G1 F1823
M204 S6000
G1 X86.274 Y91.43 E.0009
; LINE_WIDTH: 0.34093
G1 X86.238 Y91.406 E.00106
; LINE_WIDTH: 0.384849
G1 X86.201 Y91.382 E.00122
; LINE_WIDTH: 0.428769
G1 X86.165 Y91.358 E.00137
; LINE_WIDTH: 0.472689
G1 X86.128 Y91.334 E.00153
; LINE_WIDTH: 0.516609
G1 X86.092 Y91.31 E.00169
; LINE_WIDTH: 0.560528
G1 X86.055 Y91.286 E.00184
; LINE_WIDTH: 0.626013
G1 X86.019 Y91.262 E.00208
G1 X86.019 Y88.737 E.11997
; LINE_WIDTH: 0.607594
G1 X86 Y88.66 E.00363
; LINE_WIDTH: 0.570101
G1 X85.981 Y88.583 E.00339
; LINE_WIDTH: 0.513612
G1 X85.963 Y88.507 E.00302
G1 X85.961 Y87.025 E.05682
M204 S10000
G1 X86.595 Y86.715 F42000
; LINE_WIDTH: 0.153869
G1 F1823
M204 S6000
G1 X87.224 Y86.75 E.0057
; WIPE_START
G1 F15000
G1 X86.595 Y86.715 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.311 Y88.546 Z9.3 F42000
G1 Z8.9
G1 E.8 F1800
; LINE_WIDTH: 0.292203
G1 F1823
M204 S6000
G1 X86.274 Y88.569 E.00089
; LINE_WIDTH: 0.336755
G1 X86.238 Y88.593 E.00104
; LINE_WIDTH: 0.381307
G1 X86.201 Y88.617 E.0012
; LINE_WIDTH: 0.425859
G1 X86.165 Y88.641 E.00136
; LINE_WIDTH: 0.470412
G1 X86.128 Y88.665 E.00152
; LINE_WIDTH: 0.514964
G1 X86.092 Y88.689 E.00168
; LINE_WIDTH: 0.559516
G1 X86.055 Y88.713 E.00183
; LINE_WIDTH: 0.604069
G1 X86.019 Y88.737 E.00199
; WIPE_START
G1 F11226.98
G1 X86.055 Y88.713 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.025 Y87.324 Z9.3 F42000
G1 Z8.9
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1823
M204 S5000
G1 X91.572 Y87.244 E.04469
G1 X91.608 Y86.603 E.01971
G1 X91.702 Y86.608 E.00287
G1 X91.88 Y86.618 E.00549
G1 X91.872 Y86.756 E.00425
G1 X93.509 Y86.849 E.05038
G1 X93.525 Y86.863 E.00065
G1 X93.528 Y93.129 E.19253
G1 X93.516 Y93.15 E.00074
G1 X91.872 Y93.244 E.05059
G1 X91.88 Y93.382 E.00425
G1 X91.608 Y93.397 E.00836
G1 X91.572 Y92.756 E.01971
G1 X93.025 Y92.676 E.04469
G1 X93.025 Y87.384 E.1626
; WIPE_START
G1 F12000
M204 S6000
G1 X91.572 Y87.244 E-.55439
G1 X91.603 Y86.703 E-.20561
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.782 Y87.003 Z9.3 F42000
G1 Z8.9
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.153825
G1 F1823
M204 S6000
G1 X93.224 Y87.084 E.01305
G1 X93.268 Y87.096 E.00041
G1 X93.276 Y87.139 E.0004
G1 X93.268 Y92.904 E.0521
G1 X91.782 Y92.997 E.01345
; CHANGE_LAYER
; Z_HEIGHT: 9.1
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15000
G1 X93.268 Y92.904 E-.56564
G1 X93.269 Y92.392 E-.19436
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 46/111
; update layer progress
M73 L46
M991 S0 P45 ;notify layer change

; OBJECT_ID: 427
M204 S10000
G17
G3 Z9.3 I-.59 J-1.064 P1  F42000
G1 X86.299 Y96.259 Z9.3
G1 Z9.1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1755
M204 S5000
G1 X86.299 Y96.503 E.0075
G1 X86.299 Y96.903 E.01229
G1 X85.849 Y96.861 E.01388
G1 X85.734 Y96.849 E.00354
G1 X85.717 Y96.778 E.00225
G1 X85.645 Y96.685 E.00362
G1 X85.614 Y96.664 E.00112
G1 X85.471 Y96.596 E.00487
G1 X85.207 Y96.528 E.00838
G3 X79.385 Y93.284 I3.543 J-13.208 E.20689
G2 X79.721 Y92.889 I-12.488 J-10.958 E.01593
G1 X79.872 Y93.033 E.00641
G2 X86.24 Y96.248 I8.918 J-9.752 E.22195
; WIPE_START
G1 F12000
M204 S6000
G1 X86.299 Y96.503 E-.09964
G1 X86.299 Y96.903 E-.152
G1 X85.849 Y96.861 E-.17159
G1 X85.734 Y96.849 E-.04382
G1 X85.717 Y96.778 E-.02777
G1 X85.645 Y96.685 E-.04474
G1 X85.614 Y96.664 E-.0139
G1 X85.471 Y96.596 E-.06018
G1 X85.207 Y96.528 E-.10362
G1 X85.1 Y96.496 E-.04274
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z9.5 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z9.5
G1 X0 Y90.0001 F18000 ; move to safe pos
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
            G0 Z9.5 F4000
            G39.3 S1
            G0 Z9.5 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X85.667 Y96.39 F42000
G1 Z9.1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.191231
G1 F1755
M204 S6000
G3 X85.791 Y96.443 I-.373 J1.047 E.00163
; LINE_WIDTH: 0.238455
G3 X86.103 Y96.601 I-.873 J2.107 E.00558
M204 S10000
G1 X85.667 Y96.39 F42000
; LINE_WIDTH: 0.15834
G1 F1755
M204 S6000
G1 X85.243 Y96.277 E.00413
G3 X79.697 Y93.222 I3.455 J-12.83 E.06012
; WIPE_START
G1 F15000
G1 X80.329 Y93.766 E-.31694
G1 X80.906 Y94.209 E-.27639
G1 X81.27 Y94.454 E-.16667
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.756 Y90.043 Z9.5 F42000
G1 Z9.1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1755
M204 S5000
G2 X77.853 Y90.409 I.869 J-.033 E.01171
G2 X78.503 Y91.548 I4.762 J-1.965 E.04043
G2 X78.095 Y91.885 I11.033 J13.777 E.01628
G1 X77.754 Y91.433 E.01739
G3 X77.02 Y90.319 I23.597 J-16.335 E.04101
G1 X76.988 Y90.248 E.00239
G3 X77.003 Y89.715 I.704 J-.246 E.01674
G1 X77.041 Y89.643 E.00252
G3 X77.536 Y88.875 I12.406 J7.45 E.02806
G1 X77.583 Y88.807 E.00254
G3 X77.696 Y88.648 I2.491 J1.642 E.006
G1 X78.018 Y88.217 E.01654
G1 X78.095 Y88.115 E.00393
G1 X78.281 Y88.271 E.0075
G1 X78.504 Y88.453 E.00882
G2 X77.771 Y89.847 I3.804 J2.89 E.04864
G2 X77.756 Y89.983 I.854 J.162 E.0042
M204 S10000
G1 X77.35 Y89.927 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.428272
G1 F1755
M204 S6000
G3 X77.404 Y89.768 I1.565 J.443 E.00527
; LINE_WIDTH: 0.378038
G1 X77.469 Y89.62 E.00442
; LINE_WIDTH: 0.338189
G1 X77.539 Y89.474 E.0039
; LINE_WIDTH: 0.298347
G1 X77.656 Y89.254 E.00518
; LINE_WIDTH: 0.257553
G3 X77.802 Y89.006 I10.256 J5.847 E.00503
; LINE_WIDTH: 0.212789
G1 X78.1 Y88.557 E.00747
; LINE_WIDTH: 0.1842
G2 X78.136 Y88.477 I-.098 J-.092 E.00103
; LINE_WIDTH: 0.134516
G1 X78.133 Y88.451 E.00019
; LINE_WIDTH: 0.116033
G1 X78.127 Y88.398 E.00032
; WIPE_START
G1 F15000
G1 X78.133 Y88.451 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.35 Y89.927 Z9.5 F42000
G1 Z9.1
G1 E.8 F1800
; LINE_WIDTH: 0.449973
G1 F1755
M204 S6000
G1 X77.346 Y89.96 E.00108
G2 X77.368 Y90.136 I.403 J.04 E.00593
; LINE_WIDTH: 0.414363
G1 X77.412 Y90.249 E.00367
; LINE_WIDTH: 0.374101
G1 X77.473 Y90.388 E.00409
; LINE_WIDTH: 0.336827
G1 X77.542 Y90.531 E.00381
; LINE_WIDTH: 0.30233
G1 X77.621 Y90.68 E.00358
; LINE_WIDTH: 0.261835
G1 X77.686 Y90.798 E.00239
G2 X77.801 Y90.992 I10.829 J-6.297 E.00403
; LINE_WIDTH: 0.2087
G1 X77.917 Y91.175 E.00292
G2 X78.183 Y91.557 I8.037 J-5.315 E.00629
; WIPE_START
G1 F15000
G1 X77.917 Y91.175 E-.51912
G1 X77.801 Y90.992 E-.24088
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.72 Y87.111 Z9.5 F42000
G1 Z9.1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1755
M204 S5000
G2 X79.385 Y86.715 I-14.305 J11.777 E.01594
G3 X84.734 Y83.601 I9.438 J10.062 E.19181
G1 X85.172 Y83.483 E.01394
G1 X85.557 Y83.374 E.01229
G1 X85.614 Y83.335 E.00214
G1 X85.645 Y83.315 E.00113
G1 X85.716 Y83.223 E.00356
G1 X85.736 Y83.144 E.0025
G1 X85.798 Y83.135 E.00192
G1 X85.849 Y83.13 E.00158
G1 X86.299 Y83.097 E.01386
G1 X86.299 Y83.497 E.01229
G1 X86.299 Y83.741 E.0075
G2 X79.764 Y87.07 I2.399 J12.788 E.22845
M204 S10000
G1 X79.697 Y86.779 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.15819
G1 F1755
M204 S6000
G3 X85.243 Y83.723 I9.024 J9.82 E.06005
G1 X85.666 Y83.61 E.00411
; LINE_WIDTH: 0.19119
G2 X85.791 Y83.557 I-.372 J-1.044 E.00163
; LINE_WIDTH: 0.23903
G2 X86.103 Y83.398 I-.867 J-2.091 E.0056
; WIPE_START
G1 F15000
G1 X85.791 Y83.557 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.239 Y91.176 Z9.5 F42000
G1 X86.356 Y93.163 Z9.5
G1 Z9.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
M73 P68 R5
G1 F1755
M204 S6000
G1 X85.508 Y93.21 E.02818
G1 X85.508 Y86.792 E.21291
G1 X86.383 Y86.839 E.02907
G1 X86.383 Y88.294 E.04826
G1 X86.499 Y88.295 E.00385
G1 X86.499 Y91.705 E.11314
G1 X86.383 Y91.706 E.00385
G1 X86.383 Y93.128 E.04718
M204 S10000
G1 X86.775 Y93.028 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1755
M204 S5000
G1 X87.391 Y92.994 E.01896
G1 X87.425 Y93.635 E.01972
G1 X87.151 Y93.65 E.00843
G1 X87.144 Y93.512 E.00426
G1 X85.128 Y93.62 E.06202
G1 X85.116 Y93.593 E.00092
G1 X85.119 Y86.388 E.22138
G1 X87.144 Y86.488 E.0623
G1 X87.151 Y86.35 E.00425
G1 X87.338 Y86.361 E.00574
G1 X87.425 Y86.365 E.00269
G1 X87.391 Y87.006 E.01971
G1 X86.775 Y86.972 E.01896
G1 X86.775 Y87.903 E.02863
G1 X87.122 Y87.905 E.01067
G1 X87.122 Y88.177 E.00837
G1 X86.891 Y88.176 E.0071
G1 X86.89 Y89.635 E.04483
G1 X86.947 Y89.636 E.00174
G1 X87.122 Y89.638 E.00537
G1 X87.122 Y89.658 E.00063
G1 X87.122 Y90.342 E.02102
G1 X87.122 Y90.362 E.00063
G1 X86.947 Y90.364 E.00537
G1 X86.89 Y90.365 E.00174
G1 X86.891 Y91.824 E.04483
G1 X87.122 Y91.823 E.0071
G1 X87.122 Y92.095 E.00837
G1 X86.775 Y92.097 E.01067
G1 X86.775 Y92.968 E.02679
M204 S10000
G1 X86.579 Y93.291 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.153906
G1 F1755
M204 S6000
G1 X87.209 Y93.256 E.0057
; WIPE_START
G1 F15000
G1 X86.579 Y93.291 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.945 Y92.982 Z9.5 F42000
G1 Z9.1
G1 E.8 F1800
; LINE_WIDTH: 0.511718
G1 F1755
M204 S6000
G1 X85.945 Y91.503 E.05649
G1 X85.965 Y91.425 E.00306
; LINE_WIDTH: 0.56862
G1 X85.984 Y91.348 E.00343
; LINE_WIDTH: 0.60726
G1 X86.003 Y91.27 E.00368
M204 S10000
G1 X86.295 Y91.464 F42000
; LINE_WIDTH: 0.297463
G1 F1755
M204 S6000
G1 X86.259 Y91.44 E.00091
; LINE_WIDTH: 0.341345
G1 X86.222 Y91.415 E.00106
; LINE_WIDTH: 0.385227
G1 X86.186 Y91.391 E.00122
; LINE_WIDTH: 0.42911
G1 X86.149 Y91.367 E.00138
; LINE_WIDTH: 0.472992
G1 X86.113 Y91.343 E.00153
; LINE_WIDTH: 0.516874
G1 X86.076 Y91.318 E.00169
; LINE_WIDTH: 0.560757
G1 X86.04 Y91.294 E.00185
; LINE_WIDTH: 0.626208
G1 X86.003 Y91.27 E.00208
G1 X86.003 Y88.73 E.12073
; LINE_WIDTH: 0.607257
G1 X85.984 Y88.652 E.00368
; LINE_WIDTH: 0.56861
G1 X85.965 Y88.575 E.00343
; LINE_WIDTH: 0.529964
G1 X85.945 Y88.497 E.00317
; LINE_WIDTH: 0.510749
G1 X85.945 Y87.019 E.05634
M204 S10000
G1 X86.579 Y86.709 F42000
; LINE_WIDTH: 0.153869
G1 F1755
M204 S6000
G1 X87.209 Y86.744 E.0057
; WIPE_START
G1 F15000
G1 X86.579 Y86.709 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.295 Y88.536 Z9.5 F42000
G1 Z9.1
G1 E.8 F1800
; LINE_WIDTH: 0.297443
G1 F1755
M204 S6000
G1 X86.259 Y88.561 E.00091
; LINE_WIDTH: 0.341328
G1 X86.222 Y88.585 E.00106
; LINE_WIDTH: 0.385213
G1 X86.186 Y88.609 E.00122
; LINE_WIDTH: 0.429098
G1 X86.149 Y88.633 E.00138
; LINE_WIDTH: 0.472983
G1 X86.113 Y88.657 E.00153
; LINE_WIDTH: 0.516867
G1 X86.076 Y88.682 E.00169
; LINE_WIDTH: 0.560752
G1 X86.04 Y88.706 E.00185
; LINE_WIDTH: 0.604637
G1 X86.003 Y88.73 E.002
; WIPE_START
G1 F11215.613
G1 X86.04 Y88.706 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.03 Y87.319 Z9.5 F42000
G1 Z9.1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1755
M204 S5000
G1 X91.578 Y87.239 E.04469
G1 X91.614 Y86.598 E.01971
G1 X91.691 Y86.602 E.00238
G1 X91.885 Y86.613 E.00598
G1 X91.877 Y86.751 E.00425
G1 X93.514 Y86.844 E.05038
G1 X93.531 Y86.858 E.00066
G1 X93.533 Y93.134 E.19283
G1 X93.514 Y93.157 E.00091
G1 X91.877 Y93.249 E.05038
G1 X91.885 Y93.387 E.00426
G1 X91.614 Y93.402 E.00836
G1 X91.578 Y92.761 E.01971
G1 X93.03 Y92.681 E.04469
G1 X93.03 Y87.379 E.1629
; WIPE_START
G1 F12000
M204 S6000
G1 X91.578 Y87.239 E-.5544
G1 X91.608 Y86.698 E-.2056
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.787 Y86.998 Z9.5 F42000
G1 Z9.1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.153977
G1 F1755
M204 S6000
G1 X93.229 Y87.079 E.01306
G1 X93.273 Y87.091 E.00041
G1 X93.281 Y87.134 E.0004
G1 X93.272 Y92.91 E.05228
G1 X91.787 Y93.002 E.01346
; CHANGE_LAYER
; Z_HEIGHT: 9.3
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X93.272 Y92.91 E-.56536
G1 X93.273 Y92.398 E-.19464
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 47/111
; update layer progress
M73 L47
M991 S0 P46 ;notify layer change

; OBJECT_ID: 427
M204 S10000
G17
G3 Z9.5 I-.578 J-1.071 P1  F42000
G1 X86.157 Y96.237 Z9.5
G1 Z9.3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1770
M204 S5000
G1 X86.157 Y96.488 E.00773
G1 X86.157 Y96.888 E.01229
G1 X85.689 Y96.835 E.0145
G1 X85.511 Y96.815 E.00551
G3 X85.343 Y96.766 I.107 J-.675 E.00537
G1 X85.321 Y96.755 E.00075
G1 X85.302 Y96.697 E.00189
G1 X85.252 Y96.631 E.00256
G1 X85.195 Y96.581 E.00231
G1 X85.145 Y96.553 E.00176
G1 X84.96 Y96.469 E.00622
G1 X84.603 Y96.36 E.01148
G1 X84.225 Y96.229 E.01229
G1 X83.79 Y96.073 E.01421
G3 X79.446 Y93.379 I5.039 J-12.975 E.15796
G1 X79.795 Y93 E.01583
G1 X79.989 Y93.18 E.00814
G2 X86.099 Y96.225 I8.772 J-9.949 E.21214
; WIPE_START
G1 F12000
M204 S6000
G1 X86.157 Y96.488 E-.10261
G1 X86.157 Y96.888 E-.152
G1 X85.689 Y96.835 E-.17927
G1 X85.511 Y96.815 E-.06815
G1 X85.343 Y96.766 E-.0662
G1 X85.321 Y96.755 E-.00928
G1 X85.302 Y96.697 E-.02338
G1 X85.252 Y96.631 E-.03167
G1 X85.195 Y96.581 E-.02858
G1 X85.145 Y96.553 E-.02176
G1 X84.96 Y96.469 E-.07697
G1 X84.96 Y96.469 E-.00012
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z9.7 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z9.7
G1 X0 Y90.0001 F18000 ; move to safe pos
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
            G0 Z9.7 F4000
            G39.3 S1
            G0 Z9.7 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X85.203 Y96.285 F42000
G1 Z9.3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.157381
G1 F1770
M204 S6000
G1 X84.75 Y96.142 E.00444
G3 X79.766 Y93.321 I3.947 J-12.786 E.05383
; WIPE_START
G1 F15000
G1 X80.177 Y93.675 E-.20606
G1 X80.856 Y94.201 E-.32652
G1 X81.35 Y94.539 E-.22742
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.272 Y96.4 Z9.7 F42000
G1 Z9.3
G1 E.8 F1800
; LINE_WIDTH: 0.342083
G1 F1770
M204 S6000
G2 X85.726 Y96.496 I1.104 J-4.112 E.01132
G1 X85.961 Y96.533 E.00582
M204 S10000
G1 X85.961 Y96.627 F42000
; LINE_WIDTH: 0.216218
G1 F1770
M204 S6000
G2 X85.203 Y96.285 I-3.844 J7.501 E.01175
M204 S10000
G1 X85.099 Y96.186 F42000
; LINE_WIDTH: 0.292451
G1 F1770
M204 S6000
G3 X85.503 Y96.426 I-2.174 J4.126 E.00956
G1 X85.856 Y96.657 E.00857
; WIPE_START
G1 F15000
G1 X85.503 Y96.426 E-.3594
G1 X85.099 Y96.186 E-.4006
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.137 Y91.42 Z9.7 F42000
G1 X77.515 Y90.124 Z9.7
G1 Z9.3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1770
M204 S5000
G1 X77.541 Y90.196 E.00236
G2 X78.389 Y91.471 I7.742 J-4.227 E.0471
G2 X77.999 Y91.819 I18.276 J20.831 E.01605
G3 X77.159 Y90.628 I12.878 J-9.973 E.04482
G1 X76.971 Y90.319 E.01109
G1 X76.957 Y90.289 E.00101
G1 X76.927 Y90.213 E.00252
G3 X76.916 Y89.825 I.689 J-.213 E.01208
G3 X76.997 Y89.638 I.699 J.192 E.00628
G1 X77.077 Y89.507 E.0047
G3 X77.17 Y89.355 I2.267 J1.294 E.00548
G3 X77.999 Y88.181 I13.876 J8.909 E.04418
G1 X78.153 Y88.32 E.00639
G1 X78.388 Y88.528 E.00965
G2 X77.527 Y89.833 I6.846 J5.455 E.0481
G2 X77.503 Y90.065 I.457 J.164 E.00723
M204 S10000
G1 X77.228 Y90.183 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.240675
G1 F1770
M204 S6000
G3 X77.262 Y89.74 I.498 J-.184 E.00737
; LINE_WIDTH: 0.179059
G3 X78.073 Y88.512 I8.436 J4.687 E.01635
; WIPE_START
G1 F15000
G1 X77.628 Y89.135 E-.39497
G1 X77.262 Y89.74 E-.36503
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.228 Y90.183 Z9.7 F42000
G1 Z9.3
G1 E.8 F1800
; LINE_WIDTH: 0.202411
G1 F1770
M204 S6000
G1 X77.286 Y90.304 E.00175
G2 X77.446 Y90.578 I34.106 J-19.77 E.00413
; LINE_WIDTH: 0.173082
G1 X77.574 Y90.781 E.00254
G2 X78.074 Y91.488 I9.408 J-6.127 E.00919
; WIPE_START
G1 F15000
G1 X77.574 Y90.781 E-.59514
G1 X77.446 Y90.578 E-.16486
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.795 Y87 Z9.7 F42000
G1 Z9.3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1770
M204 S5000
G1 X79.445 Y86.62 E.01588
G3 X84.228 Y83.764 I9.361 J10.248 E.17235
G1 X84.58 Y83.651 E.01135
G1 X84.961 Y83.531 E.01229
G1 X85.151 Y83.446 E.00638
G1 X85.247 Y83.376 E.00363
G1 X85.304 Y83.301 E.00292
G1 X85.32 Y83.246 E.00176
G1 X85.383 Y83.218 E.0021
G1 X85.445 Y83.2 E.00197
G1 X85.511 Y83.185 E.00209
G1 X85.69 Y83.159 E.00556
G1 X86.158 Y83.107 E.01446
G1 X86.158 Y83.507 E.01229
G1 X86.157 Y83.763 E.00788
G2 X79.839 Y86.959 I2.59 J12.964 E.22026
M204 S10000
G1 X79.766 Y86.679 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.157994
G1 F1770
M204 S6000
G3 X84.749 Y83.858 I8.911 J9.928 E.05412
G1 X85.286 Y83.683 E.00529
; LINE_WIDTH: 0.21315
G1 X85.373 Y83.643 E.00133
; LINE_WIDTH: 0.246814
G1 X85.449 Y83.607 E.0014
; LINE_WIDTH: 0.297366
G1 X85.875 Y83.33 E.01053
M204 S10000
G1 X85.962 Y83.46 F42000
; LINE_WIDTH: 0.345179
G1 F1770
M204 S6000
G1 X85.725 Y83.502 E.00591
G2 X85.269 Y83.602 I.938 J5.359 E.0115
; WIPE_START
G1 F15000
G1 X85.725 Y83.502 E-.50187
G1 X85.962 Y83.46 E-.25813
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.259 Y91.087 Z9.7 F42000
G1 X86.34 Y93.169 Z9.7
G1 Z9.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1770
M204 S6000
G1 X85.492 Y93.216 E.02818
G1 X85.492 Y86.785 E.21331
G1 X86.367 Y86.833 E.02907
G1 X86.367 Y88.302 E.04873
G1 X86.482 Y88.302 E.00383
G1 X86.483 Y90 E.05633
G1 X86.482 Y91.698 E.05633
G1 X86.367 Y91.698 E.00383
G1 X86.367 Y93.134 E.04765
M204 S10000
G1 X86.759 Y93.034 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1770
M204 S5000
G1 X87.375 Y93 E.01896
G1 X87.41 Y93.641 E.01972
G1 X87.136 Y93.656 E.00843
G1 X87.128 Y93.518 E.00426
G1 X85.132 Y93.629 E.06142
G1 X85.101 Y93.615 E.00104
G1 X85.1 Y86.405 E.22154
G3 X85.122 Y86.373 I.025 J-.007 E.00138
G1 X87.128 Y86.482 E.06173
G1 X87.136 Y86.344 E.00425
G1 X87.339 Y86.355 E.00626
G1 X87.41 Y86.359 E.00217
G1 X87.375 Y87 E.01971
G1 X86.759 Y86.966 E.01896
G1 X86.759 Y87.909 E.02898
G1 X87.106 Y87.907 E.01067
G1 X87.106 Y88.181 E.00841
G1 X86.875 Y88.182 E.00712
G1 X86.875 Y89.653 E.0452
G1 X87.106 Y89.649 E.00712
G1 X87.106 Y90.351 E.02155
G1 X86.875 Y90.347 E.00711
G1 X86.875 Y91.817 E.0452
G1 X87.106 Y91.819 E.00712
G1 X87.106 Y92.093 E.00841
G1 X86.759 Y92.091 E.01067
G1 X86.759 Y92.974 E.02713
M204 S10000
G1 X86.563 Y93.297 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.153924
G1 F1770
M204 S6000
G1 X87.193 Y93.262 E.00571
; WIPE_START
G1 F15000
G1 X86.563 Y93.297 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.93 Y92.988 Z9.7 F42000
G1 Z9.3
G1 E.8 F1800
; LINE_WIDTH: 0.511776
G1 F1770
M204 S6000
G1 X85.93 Y91.493 E.0571
G1 X85.949 Y91.416 E.00305
; LINE_WIDTH: 0.568542
G1 X85.968 Y91.338 E.00342
; LINE_WIDTH: 0.60705
G1 X85.987 Y91.261 E.00367
M204 S10000
G1 X86.279 Y91.455 F42000
; LINE_WIDTH: 0.29514
G1 F1770
M204 S6000
G1 X86.243 Y91.431 E.0009
; LINE_WIDTH: 0.339295
G1 X86.206 Y91.406 E.00106
; LINE_WIDTH: 0.38345
G1 X86.17 Y91.382 E.00121
; LINE_WIDTH: 0.427605
G1 X86.133 Y91.358 E.00137
; LINE_WIDTH: 0.47176
G1 X86.097 Y91.334 E.00153
; LINE_WIDTH: 0.515915
G1 X86.06 Y91.309 E.00169
; LINE_WIDTH: 0.56007
G1 X86.024 Y91.285 E.00185
; LINE_WIDTH: 0.626018
G1 X85.987 Y91.261 E.00208
G1 X85.987 Y88.739 E.11982
M204 S10000
G1 X86.279 Y88.545 F42000
; LINE_WIDTH: 0.295111
G1 F1770
M204 S6000
G1 X86.243 Y88.569 E.0009
; LINE_WIDTH: 0.339269
G1 X86.206 Y88.594 E.00106
; LINE_WIDTH: 0.383428
G1 X86.17 Y88.618 E.00121
; LINE_WIDTH: 0.427586
G1 X86.133 Y88.642 E.00137
; LINE_WIDTH: 0.471745
G1 X86.097 Y88.666 E.00153
; LINE_WIDTH: 0.515903
G1 X86.06 Y88.691 E.00169
; LINE_WIDTH: 0.560062
G1 X86.024 Y88.715 E.00185
; LINE_WIDTH: 0.60422
G1 X85.987 Y88.739 E.002
; LINE_WIDTH: 0.607064
G1 X85.968 Y88.662 E.00367
; LINE_WIDTH: 0.56855
G1 X85.949 Y88.584 E.00342
; LINE_WIDTH: 0.530037
G1 X85.93 Y88.507 E.00317
; LINE_WIDTH: 0.510814
G1 X85.93 Y87.013 E.05694
M204 S10000
G1 X86.563 Y86.703 F42000
; LINE_WIDTH: 0.153877
G1 F1770
M204 S6000
G1 X87.193 Y86.738 E.0057
; WIPE_START
G1 F15000
G1 X86.563 Y86.703 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.035 Y87.314 Z9.7 F42000
G1 Z9.3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1770
M204 S5000
G1 X91.583 Y87.234 E.04469
G1 X91.619 Y86.593 E.01971
G1 X91.68 Y86.596 E.00189
G1 X91.891 Y86.608 E.00647
G1 X91.883 Y86.746 E.00425
G1 X93.521 Y86.839 E.05042
G1 X93.536 Y86.854 E.00065
G1 X93.538 Y93.139 E.19311
G1 X93.52 Y93.162 E.00091
G1 X91.883 Y93.253 E.05038
G1 X91.891 Y93.392 E.00426
G1 X91.619 Y93.407 E.00836
G1 X91.583 Y92.766 E.01971
G1 X93.035 Y92.686 E.04469
G1 X93.035 Y87.374 E.16321
; WIPE_START
M73 P69 R5
G1 F12000
M204 S6000
G1 X91.583 Y87.234 E-.5544
G1 X91.613 Y86.693 E-.2056
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.793 Y86.993 Z9.7 F42000
G1 Z9.3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.15398
G1 F1770
M204 S6000
G1 X93.234 Y87.074 E.01306
G1 X93.278 Y87.086 E.00041
G1 X93.287 Y87.129 E.0004
G1 X93.278 Y92.915 E.05237
G1 X91.793 Y93.007 E.01346
; CHANGE_LAYER
; Z_HEIGHT: 9.5
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X93.278 Y92.915 E-.56536
G1 X93.278 Y92.403 E-.19464
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 48/111
; update layer progress
M73 L48
M991 S0 P47 ;notify layer change

; OBJECT_ID: 427
M204 S10000
G17
G3 Z9.7 I-.565 J-1.078 P1  F42000
G1 X86.016 Y96.211 Z9.7
G1 Z9.5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1748
M204 S5000
G1 X86.016 Y96.467 E.00786
G1 X86.016 Y96.867 E.01229
G1 X85.57 Y96.815 E.0138
G1 X85.276 Y96.749 E.00925
G1 X85.196 Y96.731 E.00252
G1 X84.866 Y96.65 E.01045
G3 X84.682 Y96.588 I.214 J-.935 E.00597
G1 X84.656 Y96.574 E.00088
G1 X84.64 Y96.512 E.00198
G1 X84.587 Y96.444 E.00265
G1 X84.536 Y96.396 E.00215
G1 X84.491 Y96.367 E.00164
G1 X84.305 Y96.272 E.00643
G1 X83.93 Y96.131 E.01229
G1 X83.408 Y95.934 E.01715
G3 X79.47 Y93.434 I5.319 J-12.734 E.14403
G1 X79.828 Y93.066 E.01577
G1 X80.027 Y93.247 E.00827
G2 X85.958 Y96.198 I8.718 J-10.081 E.20571
; WIPE_START
G1 F12000
M204 S6000
G1 X86.016 Y96.467 E-.1043
G1 X86.016 Y96.867 E-.152
G1 X85.57 Y96.815 E-.17072
G1 X85.276 Y96.749 E-.11444
G1 X85.196 Y96.731 E-.0312
G1 X84.866 Y96.65 E-.12925
G1 X84.721 Y96.601 E-.0581
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z9.9 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z9.9
G1 X0 Y90.0001 F18000 ; move to safe pos
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
            G0 Z9.9 F4000
            G39.3 S1
            G0 Z9.9 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X84.606 Y96.208 F42000
G1 Z9.5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.343016
G1 F1748
M204 S6000
G2 X85.82 Y96.509 I2.902 J-9.116 E.03061
M204 S10000
G1 X85.341 Y96.563 F42000
; LINE_WIDTH: 0.278108
G1 F1748
M204 S6000
G1 X84.429 Y95.986 E.02068
M204 S10000
G1 X84.718 Y96.175 F42000
; LINE_WIDTH: 0.196725
G1 F1748
M204 S6000
G1 X84.549 Y96.095 E.00235
; LINE_WIDTH: 0.156905
G1 X84.262 Y95.99 E.00284
G3 X79.796 Y93.38 I4.409 J-12.674 E.04835
; WIPE_START
G1 F15000
G1 X80.242 Y93.758 E-.22229
G1 X80.812 Y94.193 E-.27233
G1 X81.388 Y94.587 E-.26538
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.438 Y90.126 Z9.9 F42000
G1 Z9.5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1748
M204 S5000
G1 X77.52 Y90.298 E.00582
G2 X78.319 Y91.44 I12.15 J-7.646 E.04285
G1 X77.941 Y91.797 E.01597
G3 X76.908 Y90.276 I10.1 J-7.976 E.05656
G1 X76.895 Y90.249 E.00092
G3 X76.901 Y89.738 I.714 J-.247 E.01603
G3 X77.941 Y88.202 I10.836 J6.218 E.05702
G1 X78.319 Y88.56 E.01599
G2 X77.449 Y89.834 I10.048 J7.799 E.04743
G2 X77.428 Y90.067 I.49 J.162 E.00726
M204 S10000
G1 X77.172 Y90.197 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.215045
G1 F1748
M204 S6000
G3 X77.146 Y89.896 I.559 J-.201 E.00429
G1 X77.151 Y89.871 E.00035
; LINE_WIDTH: 0.170924
G1 X77.173 Y89.804 E.00074
G3 X78.01 Y88.538 I8.195 J4.512 E.01585
; WIPE_START
G1 F15000
G1 X77.553 Y89.176 E-.37529
G1 X77.262 Y89.626 E-.25579
G1 X77.173 Y89.804 E-.0951
G1 X77.151 Y89.871 E-.03382
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.172 Y90.197 Z9.9 F42000
G1 Z9.5
G1 E.8 F1800
; LINE_WIDTH: 0.168894
G1 F1748
M204 S6000
G1 X77.3 Y90.434 E.00277
G2 X78.011 Y91.462 I11.155 J-6.958 E.01283
; WIPE_START
G1 F15000
G1 X77.619 Y90.922 E-.33375
G1 X77.3 Y90.434 E-.2913
G1 X77.172 Y90.197 E-.13494
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.828 Y86.934 Z9.9 F42000
G1 Z9.5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1748
M204 S5000
G1 X79.47 Y86.566 E.01577
G3 X83.394 Y84.069 I9.324 J10.323 E.14358
G1 X83.621 Y83.986 E.00745
G1 X83.995 Y83.843 E.01229
G1 X84.369 Y83.701 E.01229
G1 X84.495 Y83.631 E.00443
G1 X84.584 Y83.562 E.00346
G1 X84.64 Y83.484 E.00295
G1 X84.655 Y83.427 E.00182
G1 X84.728 Y83.393 E.00249
G3 X84.956 Y83.327 I.624 J1.745 E.00729
G1 X85.237 Y83.259 E.00888
G1 X85.276 Y83.251 E.00124
G1 X85.568 Y83.186 E.00918
G1 X86.016 Y83.121 E.01391
G1 X86.016 Y83.521 E.01229
G1 X86.016 Y83.789 E.00824
G2 X79.872 Y86.894 I2.711 J12.996 E.21396
M204 S10000
G1 X79.796 Y86.62 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.156763
G1 F1748
M204 S6000
G3 X84.262 Y84.011 I8.838 J10.002 E.04829
G1 X84.629 Y83.869 E.00365
; LINE_WIDTH: 0.203111
G1 X84.689 Y83.838 E.0009
; LINE_WIDTH: 0.236551
G1 X84.793 Y83.784 E.00184
; LINE_WIDTH: 0.266693
G1 X85.377 Y83.429 E.01246
M204 S10000
G1 X85.82 Y83.488 F42000
; LINE_WIDTH: 0.341947
G1 F1748
M204 S6000
G2 X84.917 Y83.699 I1.86 J10.001 E.02261
G1 X84.827 Y83.567 E.00391
; WIPE_START
G1 F15000
G1 X84.917 Y83.699 E-.11212
G1 X85.82 Y83.488 E-.64788
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.216 Y91.111 Z9.9 F42000
G1 X86.324 Y93.175 Z9.9
G1 Z9.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1748
M204 S6000
G1 X85.476 Y93.222 E.02815
G1 X85.476 Y86.779 E.21372
G1 X86.351 Y86.827 E.02905
G1 X86.352 Y88.329 E.04982
G1 X86.467 Y88.327 E.00382
G3 X86.467 Y90.555 I-750.82 J1.09 E.07391
G1 X86.467 Y91.673 E.03706
G1 X86.352 Y91.671 E.00382
G1 X86.351 Y93.141 E.04875
M204 S10000
G1 X86.743 Y93.041 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1748
M204 S5000
G1 X87.359 Y93.006 E.01897
G1 X87.394 Y93.647 E.01972
G1 X87.12 Y93.662 E.00843
G1 X87.113 Y93.524 E.00426
G1 X85.092 Y93.63 E.06218
G1 X85.084 Y86.399 E.22217
G3 X85.106 Y86.367 I.025 J-.007 E.00138
G1 X87.112 Y86.476 E.06173
G1 X87.12 Y86.338 E.00425
G1 X87.34 Y86.35 E.00679
G1 X87.394 Y86.353 E.00164
G1 X87.359 Y86.994 E.01971
G1 X86.743 Y86.959 E.01897
G1 X86.743 Y87.932 E.02988
G1 X87.09 Y87.928 E.01065
G1 X87.09 Y88.211 E.00869
G1 X86.859 Y88.215 E.00711
G2 X86.86 Y89.752 I260.293 J.63 E.04723
G1 X87.09 Y89.74 E.0071
G1 X87.09 Y90.26 E.01598
G1 X86.86 Y90.248 E.0071
G2 X86.859 Y91.785 I261.871 J.912 E.04723
G1 X87.09 Y91.789 E.00711
G1 X87.09 Y92.072 E.00869
G1 X86.743 Y92.068 E.01065
G1 X86.743 Y92.981 E.02804
M204 S10000
G1 X86.547 Y93.303 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.1539
G1 F1748
M204 S6000
G1 X87.177 Y93.268 E.00571
; WIPE_START
G1 F15000
G1 X86.547 Y93.303 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.914 Y92.994 Z9.9 F42000
G1 Z9.5
G1 E.8 F1800
; LINE_WIDTH: 0.51189
G1 F1748
M204 S6000
G1 X85.914 Y91.465 E.05843
G1 X85.933 Y91.388 E.00305
; LINE_WIDTH: 0.568908
G1 X85.952 Y91.31 E.00342
; LINE_WIDTH: 0.607352
G1 X85.972 Y91.233 E.00367
M204 S10000
G1 X86.263 Y91.427 F42000
; LINE_WIDTH: 0.292809
G1 F1748
M204 S6000
G1 X86.227 Y91.403 E.00089
; LINE_WIDTH: 0.337312
G1 X86.19 Y91.379 E.00105
; LINE_WIDTH: 0.381815
G1 X86.154 Y91.354 E.00121
; LINE_WIDTH: 0.426317
G1 X86.117 Y91.33 E.00137
; LINE_WIDTH: 0.47082
G1 X86.081 Y91.306 E.00153
; LINE_WIDTH: 0.515323
G1 X86.045 Y91.281 E.00169
; LINE_WIDTH: 0.559826
G1 X86.008 Y91.257 E.00185
; LINE_WIDTH: 0.604329
G1 X85.972 Y91.233 E.002
; LINE_WIDTH: 0.626848
G2 X85.972 Y88.767 I-1160.013 J-1.237 E.11731
G1 X86.008 Y88.743 E.00208
; LINE_WIDTH: 0.559863
G1 X86.045 Y88.719 E.00185
; LINE_WIDTH: 0.515364
G1 X86.081 Y88.694 E.00169
; LINE_WIDTH: 0.470866
G1 X86.118 Y88.67 E.00153
; LINE_WIDTH: 0.426367
G1 X86.154 Y88.646 E.00137
; LINE_WIDTH: 0.381869
G1 X86.19 Y88.621 E.00121
; LINE_WIDTH: 0.33737
G1 X86.227 Y88.597 E.00105
; LINE_WIDTH: 0.292872
G1 X86.263 Y88.573 E.00089
M204 S10000
G1 X85.972 Y88.767 F42000
; LINE_WIDTH: 0.607374
G1 F1748
M204 S6000
G1 X85.952 Y88.69 E.00367
; LINE_WIDTH: 0.56892
G1 X85.933 Y88.612 E.00342
; LINE_WIDTH: 0.511898
G1 X85.914 Y88.535 E.00305
G1 X85.914 Y87.007 E.05839
M204 S10000
G1 X86.547 Y86.697 F42000
; LINE_WIDTH: 0.153876
G1 F1748
M204 S6000
G1 X87.177 Y86.732 E.00571
; WIPE_START
G1 F15000
G1 X86.547 Y86.697 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.894 Y90 Z9.9 F42000
G1 Z9.5
G1 E.8 F1800
; LINE_WIDTH: 0.138391
G1 F1748
M204 S6000
G1 X86.664 Y90 E.00179
; WIPE_START
G1 F15000
G1 X86.894 Y90 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.04 Y87.309 Z9.9 F42000
G1 Z9.5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1748
M204 S5000
G1 X91.588 Y87.229 E.04469
G1 X91.624 Y86.588 E.01971
G1 X91.67 Y86.591 E.0014
G1 X91.896 Y86.603 E.00695
G1 X91.888 Y86.741 E.00425
G1 X93.526 Y86.834 E.05042
G1 X93.542 Y86.849 E.00066
G1 X93.543 Y93.139 E.19326
G1 X93.525 Y93.167 E.00103
G1 X91.888 Y93.258 E.05038
G1 X91.896 Y93.397 E.00426
G1 X91.624 Y93.412 E.00836
G1 X91.588 Y92.771 E.01971
G1 X93.04 Y92.691 E.04469
G1 X93.04 Y87.369 E.16351
; WIPE_START
G1 F12000
M204 S6000
G1 X91.588 Y87.229 E-.5544
G1 X91.618 Y86.688 E-.2056
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.798 Y86.988 Z9.9 F42000
G1 Z9.5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.153967
G1 F1748
M204 S6000
G1 X93.239 Y87.069 E.01306
G1 X93.284 Y87.081 E.00041
G1 X93.292 Y87.124 E.0004
G1 X93.283 Y92.92 E.05245
G1 X91.798 Y93.012 E.01346
; CHANGE_LAYER
; Z_HEIGHT: 9.7
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X93.283 Y92.92 E-.56537
G1 X93.284 Y92.408 E-.19463
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 49/111
; update layer progress
M73 L49
M991 S0 P48 ;notify layer change

; OBJECT_ID: 427
M204 S10000
G17
G3 Z9.9 I-.552 J-1.085 P1  F42000
G1 X85.865 Y96.181 Z9.9
G1 Z9.7
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1758
M204 S5000
G1 X85.865 Y96.841 E.0203
G3 X85.631 Y96.806 I.975 J-7.238 E.00726
G1 X85.227 Y96.719 E.01269
G1 X84.838 Y96.627 E.01229
G1 X84.612 Y96.566 E.00721
G1 X84.589 Y96.56 E.0007
G1 X84.273 Y96.468 E.01012
G3 X84.072 Y96.4 I.335 J-1.326 E.00653
G1 X83.992 Y96.358 E.00279
G1 X83.991 Y96.356 E.00005
G1 X83.972 Y96.289 E.00215
G1 X83.921 Y96.217 E.00273
G1 X83.839 Y96.147 E.0033
G1 X83.649 Y96.04 E.0067
G1 X83.255 Y95.877 E.0131
G3 X79.461 Y93.455 I5.659 J-13.049 E.13888
G1 X79.827 Y93.097 E.01574
G1 X79.984 Y93.237 E.00646
G2 X85.806 Y96.168 I8.75 J-10.137 E.20231
; WIPE_START
G1 F12000
M204 S6000
G1 X85.865 Y96.841 E-.25697
G1 X85.631 Y96.806 E-.08973
G1 X85.227 Y96.719 E-.15696
G1 X84.838 Y96.627 E-.152
G1 X84.612 Y96.566 E-.08918
G1 X84.589 Y96.56 E-.0087
G1 X84.573 Y96.555 E-.00646
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z10.1 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z10.1
G1 X0 Y90.0001 F18000 ; move to safe pos
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
            G0 Z10.1 F4000
            G39.3 S1
            G0 Z10.1 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X84.735 Y96.396 F42000
G1 Z9.7
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.259965
G1 F1758
M204 S6000
G2 X84.095 Y95.98 I-3.7 J4.995 E.01352
; LINE_WIDTH: 0.214863
G1 X83.987 Y95.917 E.00175
; LINE_WIDTH: 0.156759
G1 X83.354 Y95.646 E.00638
G3 X79.836 Y93.443 I5.381 J-12.51 E.03866
; LINE_WIDTH: 0.132918
G1 X79.834 Y93.411 E.00024
; LINE_WIDTH: 0.107382
G1 X79.833 Y93.366 E.00024
; WIPE_START
G1 F15000
G1 X79.834 Y93.411 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.966 Y95.997 Z10.1 F42000
G1 Z9.7
G1 E.8 F1800
; LINE_WIDTH: 0.33593
G1 F1758
M204 S6000
G2 X85.407 Y96.42 I4.708 J-13.367 E.03588
G1 X85.669 Y96.48 E.00641
; WIPE_START
G1 F15000
G1 X85.407 Y96.42 E-.11521
G1 X84.682 Y96.228 E-.32163
G1 X83.966 Y95.997 E-.32316
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.29 Y90.894 Z10.1 F42000
G1 X77.383 Y90.078 Z10.1
G1 Z9.7
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1758
M204 S5000
G2 X77.444 Y90.246 I.482 J-.079 E.00554
G2 X78.282 Y91.443 I11.221 J-6.971 E.04491
G1 X77.914 Y91.809 E.01597
G3 X76.857 Y90.255 I9.59 J-7.658 E.05781
G3 X76.818 Y90.111 I.618 J-.245 E.00459
G1 X76.812 Y90.072 E.00122
G1 X76.811 Y90.063 E.00028
G3 X76.912 Y89.634 I.762 J-.047 E.01373
G3 X77.914 Y88.191 I15.972 J10.021 E.05399
G1 X78.281 Y88.557 E.01594
G2 X77.404 Y89.837 I9.758 J7.627 E.04772
G2 X77.377 Y90.018 I.461 J.162 E.00564
M204 S10000
G1 X77.102 Y89.893 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.168701
G1 F1758
M204 S6000
G1 X77.123 Y89.824 E.00074
G3 X77.977 Y88.531 I7.129 J3.779 E.01591
; WIPE_START
G1 F15000
G1 X77.38 Y89.374 E-.48325
G1 X77.197 Y89.666 E-.16145
G1 X77.123 Y89.824 E-.08149
G1 X77.102 Y89.893 E-.03381
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.102 Y89.893 Z9.7 F42000
G1 E.8 F1800
; LINE_WIDTH: 0.207309
G1 F1758
M204 S6000
G2 X77.16 Y90.265 I.577 J.1 E.00513
; LINE_WIDTH: 0.165248
G1 X77.221 Y90.375 E.00124
G2 X77.978 Y91.469 I11.059 J-6.841 E.01327
; WIPE_START
G1 F15000
G1 X77.573 Y90.914 E-.35867
G1 X77.221 Y90.375 E-.33616
G1 X77.16 Y90.265 E-.06517
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.828 Y86.904 Z10.1 F42000
G1 Z9.7
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1758
M204 S5000
G1 X79.462 Y86.545 E.01576
G3 X82.476 Y84.487 I9.778 J11.09 E.11244
G1 X83.04 Y84.23 E.01904
G1 X83.404 Y84.064 E.01229
G1 X83.769 Y83.899 E.01229
G1 X83.844 Y83.85 E.00275
G1 X83.921 Y83.783 E.00315
G1 X83.975 Y83.707 E.00285
G1 X83.99 Y83.643 E.00202
G1 X84.025 Y83.622 E.00125
G1 X84.118 Y83.582 E.00311
G1 X84.336 Y83.514 E.00701
G1 X84.611 Y83.435 E.00878
G1 X84.998 Y83.336 E.01229
G1 X85.286 Y83.262 E.00914
M73 P70 R5
G1 X85.865 Y83.151 E.0181
G1 X85.865 Y83.82 E.02053
G2 X79.873 Y86.864 I2.769 J12.87 E.20882
M204 S10000
G1 X79.793 Y86.595 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.156914
G1 F1758
M204 S6000
G3 X83.677 Y84.221 I8.857 J10.129 E.04249
G1 X84.005 Y84.073 E.00334
; LINE_WIDTH: 0.223451
G1 X84.119 Y84.005 E.00196
; LINE_WIDTH: 0.261399
G2 X84.732 Y83.604 I-3.386 J-5.846 E.01305
M204 S10000
G1 X83.975 Y83.996 F42000
; LINE_WIDTH: 0.335618
G1 F1758
M204 S6000
G3 X85.407 Y83.579 I5.074 J14.769 E.03558
G1 X85.669 Y83.52 E.0064
; WIPE_START
G1 F15000
G1 X85.407 Y83.579 E-.11585
G1 X84.766 Y83.748 E-.28618
G1 X83.975 Y83.996 E-.35797
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.575 Y86.889 Z10.1 F42000
G1 Z9.7
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1758
M204 S5000
G1 X85.575 Y93.111 E.19117
G1 X87.344 Y93.012 E.05443
G1 X87.378 Y93.653 E.01972
G1 X87.104 Y93.668 E.00843
G1 X87.096 Y93.53 E.00426
G1 X85.101 Y93.641 E.06141
G1 X85.07 Y93.627 E.00104
G1 X85.068 Y86.393 E.22228
G3 X85.091 Y86.36 I.025 J-.007 E.00138
G1 X87.097 Y86.47 E.06173
G1 X87.104 Y86.332 E.00425
G1 X87.342 Y86.345 E.00731
G1 X87.378 Y86.347 E.00112
G1 X87.344 Y86.988 E.01971
G1 X85.635 Y86.893 E.05259
; WIPE_START
G1 F12000
M204 S6000
G1 X85.616 Y88.893 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.161 Y86.725 Z10.1 F42000
G1 Z9.7
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.156248
G1 F1758
M204 S6000
G1 X85.382 Y86.627 E.01646
G1 X85.331 Y86.636 E.00048
G1 X85.322 Y86.682 E.00043
G1 X85.331 Y93.365 E.06171
G1 X87.161 Y93.274 E.01692
; WIPE_START
G1 F15000
G1 X85.331 Y93.365 E-.69627
G1 X85.331 Y93.197 E-.06373
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.095 Y90.029 Z10.1 F42000
G1 Z9.7
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.378512
G1 F1758
M204 S5000
G1 X86.919 Y90 E.00489
G1 X87.094 Y89.971 E.00486
; WIPE_START
G1 F12000
M204 S6000
G1 X86.919 Y90 E-.38
G1 X87.094 Y89.971 E-.38
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.095 Y92.055 Z10.1 F42000
G1 Z9.7
G1 E.8 F1800
G1 F1758
M204 S5000
G1 X86.78 Y92.049 E.00864
G1 X86.78 Y87.951 E.11205
G1 X87.095 Y87.945 E.00864
G1 X87.095 Y87.997 E.00141
G1 X87.095 Y88.27 E.00748
G1 X87.095 Y88.286 E.00044
G1 X86.919 Y88.291 E.00484
G1 X86.864 Y88.293 E.00149
G1 X86.864 Y90.009 E.04694
G2 X86.864 Y91.707 I421.977 J.767 E.04644
G1 X86.919 Y91.709 E.00148
G1 X87.095 Y91.714 E.00484
G1 X87.095 Y91.73 E.00044
G1 X87.095 Y91.995 E.00724
; WIPE_START
G1 F12000
M204 S6000
G1 X86.78 Y92.049 E-.12177
G1 X86.78 Y90.369 E-.63823
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.045 Y87.304 Z10.1 F42000
G1 Z9.7
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F1758
M204 S5000
G1 X91.593 Y87.224 E.04469
G1 X91.629 Y86.583 E.01971
G1 X91.659 Y86.585 E.00091
G1 X91.901 Y86.598 E.00745
G1 X91.893 Y86.736 E.00425
G1 X93.531 Y86.829 E.05042
G1 X93.547 Y86.844 E.00066
G1 X93.549 Y93.143 E.19355
G1 X93.53 Y93.172 E.00104
G1 X91.893 Y93.263 E.05039
G1 X91.901 Y93.402 E.00426
G1 X91.629 Y93.417 E.00836
G1 X91.593 Y92.776 E.01971
G1 X93.045 Y92.696 E.04469
G1 X93.045 Y87.364 E.16382
; WIPE_START
G1 F12000
M204 S6000
G1 X91.593 Y87.224 E-.5544
G1 X91.624 Y86.684 E-.2056
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.803 Y86.983 Z10.1 F42000
G1 Z9.7
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.154035
G1 F1758
M204 S6000
G1 X93.245 Y87.064 E.01307
G1 X93.289 Y87.076 E.00041
G1 X93.297 Y87.119 E.0004
G1 X93.288 Y92.925 E.05257
G1 X91.803 Y93.016 E.01347
; CHANGE_LAYER
; Z_HEIGHT: 9.9
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X93.288 Y92.925 E-.56542
G1 X93.289 Y92.413 E-.19458
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 50/111
; update layer progress
M73 L50
M991 S0 P49 ;notify layer change

; OBJECT_ID: 427
M204 S10000
G17
G3 Z10.1 I-.529 J-1.096 P1  F42000
G1 X85.595 Y96.127 Z10.1
G1 Z9.9
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1741
M204 S5000
G1 X85.595 Y96.792 E.02043
G3 X84.936 Y96.635 I3.418 J-15.85 E.02084
G1 X84.712 Y96.571 E.00714
G1 X84.329 Y96.458 E.01229
G1 X83.945 Y96.344 E.01229
G1 X83.609 Y96.232 E.01089
G1 X83.485 Y96.187 E.00407
G1 X83.412 Y96.155 E.00244
G1 X83.329 Y96.107 E.00295
G1 X83.327 Y96.106 E.00006
G1 X83.307 Y96.031 E.00237
G1 X83.258 Y95.958 E.00269
G1 X83.184 Y95.89 E.00309
G1 X82.995 Y95.77 E.0069
G1 X82.669 Y95.617 E.01106
G1 X82.316 Y95.43 E.01229
G1 X81.709 Y95.105 E.02112
G3 X79.422 Y93.445 I7.156 J-12.261 E.087
G1 X79.797 Y93.096 E.01574
G1 X79.945 Y93.228 E.0061
G2 X85.537 Y96.113 I8.839 J-10.27 E.19513
; WIPE_START
G1 F12000
M204 S6000
G1 X85.595 Y96.792 E-.25899
G1 X84.936 Y96.635 E-.2577
G1 X84.712 Y96.571 E-.08827
G1 X84.329 Y96.458 E-.152
G1 X84.321 Y96.455 E-.00304
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z10.3 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z10.3
G1 X0 Y90.0001 F18000 ; move to safe pos
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
            G0 Z10.3 F4000
            G39.3 S1
            G0 Z10.3 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X84.069 Y96.179 F42000
G1 Z9.9
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.254025
G1 F1741
M204 S6000
G2 X83.409 Y95.71 I-4.461 J5.578 E.01393
; LINE_WIDTH: 0.193293
G1 X83.246 Y95.613 E.00232
; LINE_WIDTH: 0.155372
G1 X83 Y95.495 E.0025
G3 X79.758 Y93.4 I5.665 J-12.325 E.03549
; WIPE_START
G1 F15000
G1 X80.415 Y93.937 E-.3226
G1 X81.328 Y94.578 E-.42387
G1 X81.358 Y94.597 E-.01353
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.502 Y95.98 Z10.3 F42000
G1 Z9.9
G1 E.8 F1800
; LINE_WIDTH: 0.187306
G1 F1741
M204 S6000
G1 X83.529 Y95.952 E.00046
; LINE_WIDTH: 0.22965
G1 X83.556 Y95.924 E.00059
; LINE_WIDTH: 0.271995
G1 X83.583 Y95.896 E.00073
; LINE_WIDTH: 0.314339
G1 X83.61 Y95.868 E.00086
; LINE_WIDTH: 0.326753
G2 X85.399 Y96.412 I6.391 J-17.805 E.04329
; WIPE_START
G1 F15000
G1 X84.483 Y96.16 E-.3861
G1 X83.61 Y95.868 E-.3739
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.007 Y90.684 Z10.3 F42000
G1 X77.347 Y90.073 Z10.3
G1 Z9.9
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1741
M204 S5000
G2 X77.405 Y90.248 I.521 J-.076 E.0057
G2 X78.276 Y91.479 I10.906 J-6.788 E.04636
G1 X77.917 Y91.854 E.01596
G3 X76.819 Y90.255 I9.544 J-7.727 E.05968
G3 X76.875 Y89.632 I.666 J-.254 E.0199
G3 X77.917 Y88.146 I15.638 J9.853 E.05577
G1 X78.275 Y88.521 E.01593
G2 X77.385 Y89.786 I10.338 J8.216 E.04755
G2 X77.342 Y90.013 I.483 J.211 E.00717
M204 S10000
G1 X77.065 Y89.893 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.166383
G1 F1741
M204 S6000
G1 X77.083 Y89.826 E.0007
G3 X77.974 Y88.49 I7.148 J3.804 E.01618
; WIPE_START
G1 F15000
G1 X77.34 Y89.378 E-.49419
G1 X77.157 Y89.666 E-.1544
G1 X77.083 Y89.826 E-.07989
G1 X77.065 Y89.893 E-.03152
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.065 Y89.893 Z9.9 F42000
G1 E.8 F1800
; LINE_WIDTH: 0.204823
G1 F1741
M204 S6000
G1 X77.054 Y89.988 E.00127
G2 X77.123 Y90.268 I.577 J.006 E.00384
; LINE_WIDTH: 0.162792
G1 X77.183 Y90.376 E.00121
G2 X77.975 Y91.51 I11.425 J-7.137 E.01351
; WIPE_START
G1 F15000
G1 X77.532 Y90.908 E-.37691
G1 X77.183 Y90.376 E-.32045
G1 X77.123 Y90.268 E-.06263
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.797 Y86.904 Z10.3 F42000
G1 Z9.9
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1741
M204 S5000
G1 X79.422 Y86.555 E.01575
G3 X82.117 Y84.664 I9.968 J11.333 E.10137
G1 X82.399 Y84.521 E.00973
G1 X82.757 Y84.342 E.01229
G1 X83.114 Y84.162 E.01229
G1 X83.183 Y84.11 E.00265
G1 X83.211 Y84.088 E.0011
G1 X83.265 Y84.034 E.00234
G1 X83.307 Y83.966 E.00246
G1 X83.327 Y83.895 E.00228
G1 X83.329 Y83.893 E.00007
G3 X83.515 Y83.802 I.461 J.703 E.0064
G1 X83.885 Y83.674 E.01202
G1 X83.946 Y83.654 E.00197
G1 X84.328 Y83.538 E.01229
G1 X84.617 Y83.45 E.00927
G1 X85.005 Y83.354 E.01229
G1 X85.595 Y83.207 E.01868
G1 X85.595 Y83.872 E.02044
G2 X79.842 Y86.865 I3.108 J13.004 E.20127
M204 S10000
G1 X79.758 Y86.6 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.155441
G1 F1741
M204 S6000
G3 X82.683 Y84.656 I8.873 J10.175 E.0323
G1 X83.254 Y84.383 E.0058
; LINE_WIDTH: 0.192867
G1 X83.402 Y84.297 E.00209
M204 S10000
G1 X83.295 Y84.271 F42000
; LINE_WIDTH: 0.330142
G1 F1741
M204 S6000
G3 X85.399 Y83.588 I5.35 J12.905 E.05184
; WIPE_START
G1 F15000
G1 X84.273 Y83.906 E-.44454
G1 X83.708 Y84.102 E-.22741
G1 X83.494 Y84.19 E-.08805
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.026 Y83.834 Z10.3 F42000
G1 Z9.9
G1 E.8 F1800
; LINE_WIDTH: 0.268205
G1 F1741
M204 S6000
G1 X83.136 Y84.506 E.02048
; WIPE_START
G1 F15000
G1 X84.026 Y83.834 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.558 Y86.883 Z10.3 F42000
G1 Z9.9
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1741
M204 S5000
G1 X85.558 Y93.117 E.19155
G1 X87.328 Y93.018 E.05445
G1 X87.362 Y93.659 E.01972
G1 X87.088 Y93.674 E.00843
G1 X87.081 Y93.536 E.00426
G1 X85.085 Y93.647 E.06141
G1 X85.054 Y93.633 E.00104
G1 X85.053 Y86.387 E.22265
G3 X85.075 Y86.354 I.025 J-.007 E.00138
G1 X87.081 Y86.464 E.06173
G1 X87.088 Y86.326 E.00425
G1 X87.343 Y86.34 E.00784
G1 X87.362 Y86.341 E.0006
G1 X87.328 Y86.982 E.01971
G1 X85.618 Y86.886 E.05261
; WIPE_START
G1 F12000
M204 S6000
G1 X85.599 Y88.886 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.146 Y86.719 Z10.3 F42000
G1 Z9.9
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.155724
G1 F1741
M204 S6000
G1 X85.365 Y86.621 E.01639
G1 X85.315 Y86.63 E.00047
G1 X85.306 Y86.676 E.00043
G1 X85.315 Y93.371 E.06154
G1 X87.146 Y93.281 E.01684
; WIPE_START
G1 F15000
G1 X85.315 Y93.371 E-.69637
G1 X85.315 Y93.204 E-.06363
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.08 Y91.997 Z10.3 F42000
G1 Z9.9
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.378512
G1 F1741
M204 S5000
G1 X86.764 Y91.989 E.00864
G1 X86.764 Y88.011 E.10878
G1 X87.08 Y88.003 E.00864
G1 X87.08 Y88.326 E.00883
G1 X87.08 Y88.372 E.00127
G1 X86.903 Y88.379 E.00483
G1 X86.848 Y88.381 E.00149
G1 X86.848 Y88.781 E.01094
G1 X86.848 Y90.381 E.04375
G1 X86.848 Y91.219 E.02293
G1 X86.848 Y91.619 E.01094
G1 X86.903 Y91.621 E.0015
G1 X87.08 Y91.628 E.00483
G1 X87.08 Y91.674 E.00127
G1 X87.08 Y91.937 E.00719
; WIPE_START
G1 F12000
M204 S6000
G1 X86.764 Y91.989 E-.12166
G1 X86.764 Y90.309 E-.63835
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.051 Y87.299 Z10.3 F42000
G1 Z9.9
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F1741
M204 S5000
G1 X91.599 Y87.219 E.04469
G1 X91.635 Y86.578 E.01971
G1 X91.648 Y86.579 E.00042
G1 X91.906 Y86.593 E.00793
G1 X91.898 Y86.731 E.00425
G1 X93.536 Y86.824 E.05042
G1 X93.552 Y86.838 E.00063
G1 X93.554 Y93.148 E.19389
G1 X93.54 Y93.175 E.00094
G1 X91.898 Y93.268 E.05051
G1 X91.906 Y93.407 E.00426
G1 X91.635 Y93.422 E.00836
G1 X91.599 Y92.781 E.01971
G1 X93.051 Y92.701 E.04469
G1 X93.051 Y87.359 E.16412
; WIPE_START
G1 F12000
M204 S6000
G1 X91.599 Y87.219 E-.5544
G1 X91.629 Y86.679 E-.2056
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.808 Y86.978 Z10.3 F42000
G1 Z9.9
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.154021
G1 F1741
M204 S6000
G1 X93.294 Y87.071 E.01348
G1 X93.302 Y92.886 E.05265
G1 X93.294 Y92.93 E.00041
G1 X93.25 Y92.941 E.00041
M73 P71 R5
G1 X91.808 Y93.021 E.01307
; CHANGE_LAYER
; Z_HEIGHT: 10.1
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15000
G1 X93.25 Y92.941 E-.54858
G1 X93.294 Y92.93 E-.0172
G1 X93.302 Y92.886 E-.017
G1 X93.302 Y92.42 E-.17721
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 51/111
; update layer progress
M73 L51
M991 S0 P50 ;notify layer change

; OBJECT_ID: 427
M204 S10000
G17
G3 Z10.3 I-.477 J-1.119 P1  F42000
G1 X84.973 Y95.972 Z10.3
G1 Z10.1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1662
M204 S5000
G1 X84.973 Y96.628 E.02016
G3 X84.325 Y96.442 I5.038 J-18.688 E.0207
G1 X84.036 Y96.348 E.00934
G1 X83.658 Y96.218 E.01229
G1 X83.28 Y96.087 E.01229
G1 X83.015 Y95.986 E.00871
G3 X82.668 Y95.818 I.518 J-1.511 E.01186
G1 X82.66 Y95.812 E.00032
G1 X82.643 Y95.736 E.00239
G1 X82.596 Y95.661 E.0027
G1 X82.527 Y95.592 E.003
G1 X82.339 Y95.46 E.00707
G1 X81.885 Y95.216 E.01583
G3 X79.381 Y93.427 I6.975 J-12.41 E.09476
G1 X79.349 Y93.399 E.00131
G1 X79.488 Y93.279 E.00565
G1 X79.734 Y93.06 E.01012
G1 X79.755 Y93.079 E.00085
G1 X79.91 Y93.218 E.00639
G2 X84.917 Y95.951 I8.954 J-10.446 E.17656
; WIPE_START
G1 F12000
M204 S6000
G1 X84.973 Y96.628 E-.25805
G1 X84.325 Y96.442 E-.25596
G1 X84.036 Y96.348 E-.11557
G1 X83.712 Y96.236 E-.13042
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z10.5 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z10.5
G1 X0 Y90.0001 F18000 ; move to safe pos
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
            G0 Z10.5 F4000
            G39.3 S1
            G0 Z10.5 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X83.633 Y95.859 F42000
G1 Z10.1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.332092
G1 F1662
M204 S6000
G1 X83.245 Y95.706 E.00982
G3 X82.931 Y95.561 I.181 J-.802 E.00823
G1 X82.533 Y95.212 E.01246
; WIPE_START
G1 F15000
G1 X82.931 Y95.561 E-.311
G1 X83.245 Y95.706 E-.20383
G1 X83.633 Y95.859 E-.24517
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.395 Y95.921 Z10.5 F42000
G1 Z10.1
G1 E.8 F1800
; LINE_WIDTH: 0.25237
G1 F1662
M204 S6000
G1 X82.823 Y95.466 E.01248
; LINE_WIDTH: 0.233434
G1 X82.758 Y95.42 E.00123
; LINE_WIDTH: 0.191769
G1 X82.597 Y95.316 E.00233
; LINE_WIDTH: 0.154741
G1 X82.321 Y95.165 E.00286
G3 X79.691 Y93.36 I6.357 J-12.079 E.02913
; WIPE_START
G1 F15000
G1 X80.322 Y93.881 E-.31073
G1 X80.945 Y94.335 E-.29294
G1 X81.291 Y94.557 E-.15633
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.311 Y90.073 Z10.5 F42000
G1 Z10.1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1662
M204 S5000
G2 X77.369 Y90.249 I.524 J-.075 E.00575
G2 X78.284 Y91.529 I11.235 J-7.067 E.04836
G1 X78.301 Y91.55 E.00083
G1 X78 Y91.883 E.0138
G1 X77.952 Y91.936 E.00218
G1 X77.927 Y91.903 E.00127
G3 X76.787 Y90.259 I10.294 J-8.36 E.06154
G3 X76.843 Y89.629 I.663 J-.259 E.02016
G3 X77.927 Y88.097 I15.064 J9.517 E.05768
G1 X77.954 Y88.063 E.00135
G1 X78.301 Y88.449 E.01596
G1 X78.284 Y88.47 E.00085
G2 X77.35 Y89.784 I10.245 J8.267 E.04955
G2 X77.306 Y90.013 I.485 J.213 E.00722
M204 S10000
G1 X77.031 Y89.889 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.164276
G1 F1662
M204 S6000
G1 X77.048 Y89.824 E.00067
G3 X77.767 Y88.72 I6.951 J3.74 E.01304
G1 X78.004 Y88.412 E.00385
; WIPE_START
G1 F15000
G1 X77.767 Y88.72 E-.16657
G1 X77.281 Y89.416 E-.36328
G1 X77.124 Y89.663 E-.12533
G1 X77.048 Y89.824 E-.0759
G1 X77.031 Y89.889 E-.02892
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.031 Y89.889 Z10.1 F42000
G1 E.8 F1800
; LINE_WIDTH: 0.203209
G1 F1662
M204 S6000
G1 X77.019 Y89.987 E.00128
G2 X77.086 Y90.266 I.603 J.003 E.0038
; LINE_WIDTH: 0.161438
G1 X77.15 Y90.382 E.00127
G2 X78.004 Y91.586 I11.266 J-7.079 E.01426
; WIPE_START
G1 F15000
G1 X77.563 Y90.999 E-.3469
G1 X77.15 Y90.382 E-.35076
G1 X77.086 Y90.266 E-.06234
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.755 Y86.921 Z10.5 F42000
G1 Z10.1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1662
M204 S5000
G1 X79.734 Y86.94 E.00085
G1 X79.511 Y86.742 E.00917
G1 X79.348 Y86.6 E.00663
G1 X79.38 Y86.573 E.00132
G3 X81.662 Y84.909 I10.16 J11.535 E.08688
G1 X82.104 Y84.663 E.01556
G1 X82.453 Y84.468 E.01229
G1 X82.529 Y84.405 E.00303
G1 X82.597 Y84.339 E.00291
G1 X82.643 Y84.265 E.00268
G1 X82.661 Y84.189 E.00238
G1 X82.668 Y84.182 E.00034
G3 X82.901 Y84.06 I.592 J.847 E.00809
G1 X83.28 Y83.911 E.0125
G1 X83.657 Y83.779 E.01229
G1 X84.13 Y83.62 E.01535
G3 X84.973 Y83.373 I5.857 J18.458 E.02697
G1 X84.972 Y84.028 E.02012
G2 X81.087 Y85.872 I4.345 J14.17 E.13262
G2 X79.8 Y86.881 I7.915 J11.417 E.05029
M204 S10000
G1 X79.691 Y86.64 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.154843
G1 F1662
M204 S6000
G3 X82.236 Y84.879 I8.946 J10.215 E.02829
G1 X82.6 Y84.683 E.00377
; LINE_WIDTH: 0.193379
G1 X82.758 Y84.58 E.00231
; LINE_WIDTH: 0.233547
G1 X82.822 Y84.535 E.00122
; LINE_WIDTH: 0.252178
G1 X83.399 Y84.075 E.01258
M204 S10000
G1 X83.633 Y84.141 F42000
; LINE_WIDTH: 0.332134
G1 F1662
M204 S6000
G2 X82.93 Y84.44 I1.643 J4.837 E.01802
G1 X82.541 Y84.784 E.01225
; WIPE_START
G1 F15000
G1 X82.93 Y84.44 E-.30747
G1 X83.034 Y84.381 E-.07059
G1 X83.633 Y84.141 E-.38194
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.543 Y86.877 Z10.5 F42000
G1 Z10.1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1662
M204 S5000
G1 X85.543 Y93.123 E.19192
G1 X87.312 Y93.025 E.05445
G1 X87.347 Y93.665 E.01972
G1 X87.073 Y93.681 E.00843
G1 X87.065 Y93.542 E.00426
G1 X85.069 Y93.653 E.06141
G1 X85.038 Y93.639 E.00104
G1 X85.037 Y86.381 E.22303
G3 X85.059 Y86.348 I.025 J-.007 E.00139
G1 X87.065 Y86.458 E.06173
G1 X87.073 Y86.32 E.00425
G1 X87.344 Y86.335 E.00836
G1 X87.312 Y86.975 E.01971
G1 X85.603 Y86.88 E.05261
; WIPE_START
G1 F12000
M204 S6000
G1 X85.583 Y88.88 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.13 Y86.713 Z10.5 F42000
G1 Z10.1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.155739
G1 F1662
M204 S6000
G1 X85.35 Y86.615 E.01639
G1 X85.299 Y86.624 E.00047
G1 X85.29 Y86.67 E.00043
G1 X85.3 Y93.377 E.06166
G1 X87.13 Y93.287 E.01685
; WIPE_START
G1 F15000
G1 X85.3 Y93.377 E-.69637
G1 X85.299 Y93.21 E-.06363
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.064 Y91.919 Z10.5 F42000
G1 Z10.1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.378512
G1 F1662
M204 S5000
G1 X86.748 Y91.908 E.00864
G1 X86.748 Y88.092 E.10435
G1 X87.064 Y88.081 E.00864
G1 X87.064 Y88.412 E.00904
G1 X87.064 Y88.493 E.00223
G1 X86.887 Y88.503 E.00483
G1 X86.832 Y88.505 E.0015
G1 X86.832 Y88.905 E.01094
G1 X86.832 Y89.305 E.01094
G1 X86.832 Y89.517 E.00577
G1 X86.832 Y90.695 E.03222
G1 X86.832 Y91.095 E.01094
G1 X86.832 Y91.495 E.01094
G1 X86.887 Y91.497 E.00151
G1 X87.064 Y91.507 E.00483
G1 X87.064 Y91.588 E.00223
G1 X87.064 Y91.859 E.0074
; WIPE_START
G1 F7545.884
M204 S6000
G1 X86.748 Y91.908 E-.12147
G1 X86.748 Y90.228 E-.63853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.056 Y87.294 Z10.5 F42000
G1 Z10.1
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F1662
M204 S5000
G1 X91.604 Y87.214 E.04469
G1 X91.64 Y86.573 E.01971
G1 X91.911 Y86.588 E.00836
G1 X91.904 Y86.727 E.00425
G1 X93.555 Y86.829 E.05085
G1 X93.558 Y88.393 E.04808
G1 X93.558 Y88.793 E.01229
G1 X93.559 Y89.193 E.01229
G1 X93.595 Y89.191 E.00111
G1 X93.698 Y89.184 E.00316
G1 X93.698 Y90.816 E.05012
G1 X93.595 Y90.809 E.00316
G1 X93.559 Y90.807 E.0011
G1 X93.559 Y91.207 E.01229
G1 X93.558 Y91.607 E.01229
G1 X93.556 Y93.171 E.04805
G1 X91.903 Y93.273 E.05088
G1 X91.911 Y93.412 E.00426
G1 X91.64 Y93.427 E.00836
G1 X91.604 Y92.786 E.01971
G1 X93.056 Y92.706 E.04469
G1 X93.056 Y87.354 E.16443
; WIPE_START
G1 F12000
M204 S6000
G1 X91.604 Y87.214 E-.5544
G1 X91.634 Y86.674 E-.2056
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.814 Y86.973 Z10.5 F42000
G1 Z10.1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.153857
G1 F1662
M204 S6000
G1 X93.299 Y87.066 E.01346
G1 X93.307 Y89.402 E.02111
; LINE_WIDTH: 0.174827
G1 X93.328 Y89.441 E.00048
; LINE_WIDTH: 0.21672
G1 X93.349 Y89.48 E.00063
; LINE_WIDTH: 0.258614
G1 X93.37 Y89.52 E.00078
; LINE_WIDTH: 0.292343
G1 X93.37 Y90.48 E.01952
; LINE_WIDTH: 0.258741
G1 X93.349 Y90.52 E.00078
; LINE_WIDTH: 0.216829
G1 X93.328 Y90.559 E.00063
; LINE_WIDTH: 0.154309
G1 X93.308 Y90.598 E.0004
G1 X93.299 Y92.935 E.02121
G1 X91.814 Y93.026 E.01351
; CHANGE_LAYER
; Z_HEIGHT: 10.3
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X93.299 Y92.935 E-.56546
G1 X93.301 Y92.423 E-.19454
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 52/111
; update layer progress
M73 L52
M991 S0 P51 ;notify layer change

; OBJECT_ID: 427
M204 S10000
G17
G3 Z10.5 I-.424 J-1.141 P1  F42000
G1 X84.305 Y95.763 Z10.5
G1 Z10.3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1657
M204 S5000
G1 X84.305 Y96.421 E.02023
G3 X83.334 Y96.085 I4.889 J-15.724 E.03158
G1 X82.984 Y95.943 E.01161
G1 X82.614 Y95.792 E.01229
G1 X82.467 Y95.728 E.00491
G1 X82.143 Y95.577 E.01099
G1 X82.049 Y95.519 E.00339
G1 X81.994 Y95.475 E.00216
G1 X81.994 Y95.467 E.00024
G1 X81.976 Y95.394 E.00233
G1 X81.935 Y95.322 E.00251
G1 X81.873 Y95.256 E.00281
G1 X81.741 Y95.145 E.00529
G1 X81.401 Y94.934 E.01229
G1 X81.03 Y94.702 E.01344
G3 X79.857 Y93.841 I8.567 J-12.92 E.04474
G1 X79.614 Y93.638 E.00972
G1 X79.31 Y93.378 E.01229
G1 X79.225 Y93.304 E.00348
G1 X79.262 Y93.275 E.00145
G1 X79.625 Y92.981 E.01437
G1 X79.693 Y93.042 E.0028
G1 X79.793 Y93.132 E.00412
G1 X80.1 Y93.388 E.01229
G1 X80.321 Y93.57 E.0088
G2 X84.251 Y95.738 I8.575 J-10.898 E.13851
; WIPE_START
G1 F12000
M204 S6000
G1 X84.305 Y96.421 E-.26052
G1 X83.334 Y96.085 E-.39047
G1 X83.068 Y95.978 E-.10901
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.216 Y93.31 Z10.7 F42000
G1 Z10.3
G1 E.8 F1800
G1 F1657
M204 S5000
G1 X79.131 Y93.399 E.00377
G1 X79.118 Y93.387 E.00055
G1 X79.169 Y93.347 E.00197
; WIPE_START
G1 F2760
M204 S6000
G1 X79.131 Y93.399 E-.3322
G1 X79.118 Y93.387 E-.09321
G1 X79.169 Y93.347 E-.33459
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z10.7 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z10.7
G1 X0 Y90.0001 F18000 ; move to safe pos
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
            G0 Z10.7 F4000
            G39.3 S1
            G0 Z10.7 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X79.574 Y93.275 F42000
G1 Z10.3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.155689
G1 F1657
M204 S6000
G2 X81.599 Y94.764 I9.148 J-10.318 E.02313
G1 X82.028 Y95.03 E.00463
; LINE_WIDTH: 0.201734
G1 X82.102 Y95.087 E.00121
; LINE_WIDTH: 0.229144
G1 X82.167 Y95.137 E.00125
; LINE_WIDTH: 0.252197
G1 X82.651 Y95.594 E.01135
M204 S10000
G1 X82.967 Y95.577 F42000
; LINE_WIDTH: 0.337174
G1 F1657
M204 S6000
G1 X82.731 Y95.472 E.00618
G3 X82.301 Y95.266 I4.546 J-10.047 E.01144
G1 X81.956 Y94.907 E.01194
; WIPE_START
G1 F15000
G1 X82.301 Y95.266 E-.30692
G1 X82.731 Y95.472 E-.29412
G1 X82.967 Y95.577 E-.15895
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.83 Y89.163 Z10.7 F42000
G1 X78.023 Y87.911 Z10.7
G1 Z10.3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1657
M204 S5000
G1 X77.943 Y87.838 E.00332
G1 X77.954 Y87.825 E.00051
G1 X77.985 Y87.864 E.00153
; WIPE_START
G1 F2760
M204 S6000
G1 X77.943 Y87.838 E-.32472
G1 X77.954 Y87.825 E-.10861
G1 X77.985 Y87.864 E-.32666
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.278 Y90.074 Z10.7 F42000
G1 Z10.3
G1 E.8 F1800
G1 F1657
M204 S5000
G2 X77.338 Y90.251 I.522 J-.077 E.00578
G2 X77.873 Y91.03 I12.658 J-8.122 E.02905
G1 X78.066 Y91.284 E.00979
G1 X78.312 Y91.599 E.01229
G1 X78.369 Y91.668 E.00275
G1 X78.1 Y91.992 E.01294
G1 X78.038 Y92.069 E.00304
G1 X77.968 Y91.981 E.00348
G1 X77.723 Y91.664 E.01229
G1 X77.369 Y91.215 E.01759
G3 X76.756 Y90.263 I9.318 J-6.669 E.03478
G3 X76.813 Y89.626 I.666 J-.262 E.02037
G3 X77.298 Y88.896 I12.778 J7.971 E.02693
G1 X77.482 Y88.653 E.00938
G1 X77.726 Y88.335 E.01229
G1 X77.969 Y88.018 E.01229
G1 X78.039 Y87.931 E.00343
G1 X78.186 Y88.114 E.0072
M73 P72 R5
G1 X78.369 Y88.332 E.00875
G1 X78.312 Y88.4 E.00271
G1 X78.067 Y88.716 E.01229
G1 X77.875 Y88.972 E.00984
G2 X77.317 Y89.784 I13.257 J9.699 E.03026
G2 X77.273 Y90.014 I.483 J.213 E.00728
; WIPE_START
G1 F12000
M204 S6000
G1 X77.338 Y90.251 E-.09334
G1 X77.873 Y91.03 E-.35924
G1 X78.066 Y91.284 E-.1211
G1 X78.312 Y91.599 E-.152
G1 X78.369 Y91.668 E-.03403
G1 X78.369 Y91.669 E-.00029
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.032 Y92.077 Z10.7 F42000
G1 Z10.3
G1 E.8 F1800
G1 F1657
M204 S5000
G1 X77.954 Y92.175 E.00385
G1 X77.942 Y92.161 E.00056
G1 X77.988 Y92.118 E.00194
M204 S10000
G1 X78.077 Y91.713 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.15949
G1 F1657
M204 S6000
G3 X77.118 Y90.381 I10.592 J-8.641 E.0156
G1 X77.055 Y90.27 E.00121
; LINE_WIDTH: 0.201535
G3 X76.987 Y89.992 I.554 J-.284 E.00373
G1 X76.999 Y89.889 E.00135
; LINE_WIDTH: 0.162391
G1 X77.024 Y89.802 E.00087
G3 X78.077 Y88.288 I8.992 J5.131 E.01798
; WIPE_START
G1 F15000
G1 X77.504 Y89.043 E-.3716
G1 X77.091 Y89.664 E-.29277
G1 X77.024 Y89.802 E-.06042
G1 X76.999 Y89.889 E-.03521
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.693 Y86.958 Z10.7 F42000
G1 Z10.3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1657
M204 S5000
G1 X79.626 Y87.019 E.0028
G1 X79.285 Y86.744 E.01346
G1 X79.224 Y86.696 E.00239
G1 X79.309 Y86.622 E.00349
G1 X79.614 Y86.363 E.01229
G1 X79.938 Y86.091 E.01296
G3 X81.015 Y85.303 I9.754 J12.195 E.04103
G1 X81.457 Y85.027 E.01602
G1 X81.795 Y84.814 E.01229
G1 X81.871 Y84.746 E.00312
G1 X81.933 Y84.68 E.00278
G1 X81.974 Y84.611 E.00249
G1 X81.995 Y84.532 E.0025
G3 X82.009 Y84.51 I.017 J-.005 E.00091
G1 X82.093 Y84.452 E.00315
G1 X82.198 Y84.395 E.00367
G1 X82.614 Y84.207 E.01403
G1 X82.985 Y84.057 E.01229
G1 X83.411 Y83.891 E.01405
G3 X84.305 Y83.581 I7.093 J19.02 E.02906
G1 X84.305 Y84.237 E.02017
G2 X82.287 Y85.134 I7.719 J20.099 E.0679
G2 X79.738 Y86.918 I6.687 J12.261 E.09579
M204 S10000
G1 X79.206 Y86.682 F42000
G1 F1657
M204 S5000
G1 X79.118 Y86.614 E.00343
G1 X79.13 Y86.602 E.00053
G1 X79.165 Y86.638 E.00154
M204 S10000
G1 X79.574 Y86.725 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.155705
G1 F1657
M204 S6000
G3 X81.6 Y85.236 I9.225 J10.425 E.02314
G1 X82.034 Y84.966 E.0047
; LINE_WIDTH: 0.211741
G1 X82.148 Y84.877 E.00198
; LINE_WIDTH: 0.244634
G2 X82.765 Y84.355 I-4.644 J-6.109 E.01329
M204 S10000
G1 X82.967 Y84.423 F42000
; LINE_WIDTH: 0.335497
G1 F1657
M204 S6000
G2 X82.301 Y84.734 I5.993 J13.689 E.01753
G1 X81.97 Y85.085 E.01151
; WIPE_START
G1 F15000
G1 X82.301 Y84.734 E-.30116
G1 X82.967 Y84.423 E-.45884
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.527 Y86.871 Z10.7 F42000
G1 Z10.3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1657
M204 S5000
G1 X85.527 Y93.129 E.1923
G1 X87.296 Y93.031 E.05445
G1 X87.331 Y93.671 E.01972
G1 X87.057 Y93.687 E.00843
G1 X87.049 Y93.548 E.00426
G1 X85.054 Y93.659 E.06141
G1 X85.023 Y93.645 E.00104
G1 X85.021 Y86.375 E.2234
G3 X85.043 Y86.342 I.025 J-.007 E.00139
G1 X87.049 Y86.452 E.06173
G1 X87.057 Y86.313 E.00425
G1 X87.331 Y86.329 E.00843
G1 X87.296 Y86.969 E.01971
G1 X85.587 Y86.874 E.05261
; WIPE_START
G1 F12000
M204 S6000
G1 X85.568 Y88.874 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.114 Y86.707 Z10.7 F42000
G1 Z10.3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.155734
G1 F1657
M204 S6000
G1 X85.334 Y86.609 E.01639
G1 X85.283 Y86.618 E.00047
G1 X85.274 Y86.664 E.00043
G1 X85.284 Y93.383 E.06177
G1 X87.114 Y93.293 E.01685
; WIPE_START
G1 F15000
G1 X85.284 Y93.383 E-.69637
G1 X85.284 Y93.216 E-.06363
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.048 Y91.819 Z10.7 F42000
G1 Z10.3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.378512
G1 F1657
M204 S5000
G1 X86.732 Y91.805 E.00864
G1 X86.732 Y88.195 E.0987
G1 X87.048 Y88.181 E.00864
G1 X87.048 Y88.533 E.00962
G1 X87.048 Y88.662 E.00352
G1 X86.871 Y88.676 E.00485
G1 X86.817 Y88.68 E.00149
G1 X86.817 Y89.08 E.01094
G1 X86.817 Y89.48 E.01094
G1 X86.817 Y90.52 E.02844
G1 X86.817 Y90.92 E.01094
G1 X86.817 Y91.32 E.01094
G1 X86.871 Y91.324 E.00149
G1 X87.048 Y91.338 E.00485
G1 X87.048 Y91.467 E.00352
G1 X87.048 Y91.759 E.00798
; WIPE_START
G1 F7039.643
M204 S6000
G1 X86.732 Y91.805 E-.1212
G1 X86.732 Y90.124 E-.63881
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.061 Y87.289 Z10.7 F42000
G1 Z10.3
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F1657
M204 S5000
G1 X91.609 Y87.209 E.04469
G1 X91.645 Y86.568 E.01972
G1 X91.917 Y86.583 E.00836
G1 X91.909 Y86.722 E.00425
G1 X93.56 Y86.822 E.05082
G1 X93.562 Y87.985 E.03575
G1 X93.563 Y88.385 E.01229
G1 X93.564 Y88.785 E.01229
G1 X93.6 Y88.784 E.00111
G1 X93.703 Y88.78 E.00315
G1 X93.703 Y89.143 E.01115
G1 X93.703 Y89.543 E.01229
G1 X93.703 Y89.943 E.01229
G1 X93.703 Y90.343 E.01229
G1 X93.703 Y90.857 E.01579
G1 X93.703 Y91.22 E.01115
G1 X93.6 Y91.216 E.00315
G1 X93.565 Y91.215 E.00109
G1 X93.563 Y91.615 E.01229
G1 X93.561 Y92.015 E.01229
G1 X93.557 Y93.181 E.03584
G1 X91.909 Y93.278 E.05072
G1 X91.917 Y93.417 E.00426
G1 X91.645 Y93.432 E.00836
G1 X91.609 Y92.791 E.01971
G1 X93.061 Y92.711 E.04469
G1 X93.061 Y87.349 E.16473
; WIPE_START
G1 F12000
M204 S6000
G1 X91.609 Y87.209 E-.55441
G1 X91.639 Y86.669 E-.20559
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.819 Y86.969 Z10.7 F42000
G1 Z10.3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.153785
G1 F1657
M204 S6000
G1 X93.304 Y87.061 E.01345
G1 X93.313 Y88.989 E.01742
; LINE_WIDTH: 0.173564
G1 X93.333 Y89.027 E.00046
; LINE_WIDTH: 0.21333
G1 X93.352 Y89.065 E.0006
; LINE_WIDTH: 0.253097
G1 X93.372 Y89.104 E.00074
; LINE_WIDTH: 0.292119
G1 X93.373 Y90.896 E.03639
; LINE_WIDTH: 0.254669
G1 X93.353 Y90.934 E.00075
; LINE_WIDTH: 0.21461
G1 X93.333 Y90.973 E.00061
; LINE_WIDTH: 0.154111
G1 X93.313 Y91.011 E.00039
G1 X93.303 Y92.941 E.01748
G1 X91.819 Y93.031 E.01347
; CHANGE_LAYER
; Z_HEIGHT: 10.5
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X93.303 Y92.941 E-.56499
G1 X93.306 Y92.427 E-.19502
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 53/111
; update layer progress
M73 L53
M991 S0 P52 ;notify layer change

; OBJECT_ID: 427
M204 S10000
G17
G3 Z10.7 I1.216 J-.057 P1  F42000
G1 X93.066 Y87.285 Z10.7
G1 Z10.5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1645
M204 S5000
G1 X91.614 Y87.204 E.04469
G1 X91.65 Y86.563 E.01971
G1 X91.922 Y86.578 E.00836
G1 X91.914 Y86.717 E.00425
G1 X93.565 Y86.817 E.05082
G1 X93.568 Y87.697 E.02703
G1 X93.569 Y88.097 E.01229
G1 X93.57 Y88.497 E.01229
G1 X93.605 Y88.496 E.00109
G1 X93.708 Y88.493 E.00317
G1 X93.708 Y88.739 E.00757
G1 X93.708 Y89.139 E.01229
G1 X93.708 Y89.539 E.01229
G1 X93.708 Y89.939 E.01229
G1 X93.708 Y90.461 E.01605
G1 X93.708 Y90.861 E.01229
G1 X93.708 Y91.261 E.01229
G1 X93.708 Y91.507 E.00757
G1 X93.605 Y91.504 E.00316
G1 X93.57 Y91.503 E.00109
G1 X93.567 Y91.903 E.01229
G1 X93.565 Y92.303 E.01229
G1 X93.559 Y93.188 E.0272
G1 X91.914 Y93.283 E.05063
G1 X91.922 Y93.422 E.00426
G1 X91.65 Y93.437 E.00836
G1 X91.614 Y92.796 E.01971
G1 X93.066 Y92.715 E.04469
G1 X93.066 Y87.345 E.16504
; WIPE_START
G1 F12000
M204 S6000
G1 X91.614 Y87.204 E-.55441
G1 X91.645 Y86.664 E-.20559
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z10.9 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z10.9
G1 X0 Y90.0001 F18000 ; move to safe pos
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
            G0 Z10.9 F4000
            G39.3 S1
            G0 Z10.9 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X91.824 Y86.964 F42000
G1 Z10.5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.153896
G1 F1645
M204 S6000
G1 X93.31 Y87.056 E.01346
G1 X93.318 Y88.496 E.01302
; WIPE_START
G1 F15000
G1 X93.31 Y87.056 E-.5471
G1 X92.751 Y87.021 E-.2129
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.318 Y91.505 Z10.9 F42000
M106 S255
G1 Z10.5
G1 E.8 F1800
; LINE_WIDTH: 0.153872
G1 F1645
M204 S6000
G1 X93.308 Y92.945 E.01303
G1 X91.824 Y93.036 E.01344
; WIPE_START
G1 F15000
G1 X93.308 Y92.945 E-.565
G1 X93.312 Y92.432 E-.195
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.099 Y87.998 Z10.9 F42000
G1 X85.511 Y86.865 Z10.9
G1 Z10.5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1645
M204 S5000
G1 X85.511 Y93.135 E.19267
G1 X87.281 Y93.037 E.05445
G1 X87.315 Y93.678 E.01972
G1 X87.041 Y93.693 E.00843
G1 X87.033 Y93.554 E.00426
G1 X85.038 Y93.665 E.06141
G1 X85.007 Y93.652 E.00104
G1 X85.006 Y86.369 E.22377
G3 X85.027 Y86.336 I.025 J-.007 E.00139
G1 X87.034 Y86.445 E.06174
G1 X87.041 Y86.307 E.00425
G1 X87.315 Y86.323 E.00843
G1 X87.281 Y86.963 E.01971
G1 X85.571 Y86.868 E.05261
; WIPE_START
G1 F12000
M204 S6000
M73 P72 R4
G1 X85.552 Y88.868 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.098 Y86.701 Z10.9 F42000
G1 Z10.5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.155741
G1 F1645
M204 S6000
G1 X85.318 Y86.603 E.01639
G1 X85.268 Y86.612 E.00047
G1 X85.258 Y86.658 E.00043
G1 X85.268 Y93.39 E.06189
G1 X87.098 Y93.299 E.01685
; WIPE_START
G1 F15000
G1 X85.268 Y93.39 E-.69638
G1 X85.268 Y93.222 E-.06363
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.032 Y91.691 Z10.9 F42000
G1 Z10.5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.378512
G1 F1645
M204 S5000
G1 X86.717 Y91.673 E.00864
G1 X86.717 Y88.727 E.08056
G1 X86.717 Y88.327 E.01094
G1 X87.032 Y88.309 E.00864
G1 X87.032 Y88.702 E.01075
G1 X87.032 Y88.902 E.00548
G1 X86.856 Y88.923 E.00486
G1 X86.801 Y88.929 E.00152
G1 X86.801 Y89.329 E.01094
G1 X86.801 Y89.729 E.01094
G1 X86.801 Y90.271 E.01481
G1 X86.801 Y90.671 E.01094
G1 X86.801 Y91.071 E.01094
G1 X86.856 Y91.077 E.00152
G1 X87.032 Y91.098 E.00486
G1 X87.032 Y91.298 E.00548
G1 X87.032 Y91.631 E.0091
; WIPE_START
G1 F5887.86
M204 S6000
G1 X86.717 Y91.673 E-.121
G1 X86.717 Y89.991 E-.639
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.697 Y86.995 Z10.9 F42000
G1 X79.658 Y86.979 Z10.9
G1 Z10.5
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F1645
M204 S5000
G1 X79.586 Y87.04 E.0029
G1 X79.439 Y87.177 E.00618
G1 X79.374 Y87.133 E.00241
M106 S201.45
M106 S255
G1 F1440
G1 X79.175 Y87.007 E.00726
M106 S201.45
M106 S255
G1 F960
G1 X78.975 Y86.89 E.00709
M106 S201.45
M106 S255
G1 F720
G1 X78.866 Y86.834 E.00379
M106 S201.45
M106 S255
G1 F600
G1 X78.88 Y86.82 E.00061
M106 S201.45
M106 S255
G1 F1338.021
G1 X79.007 Y86.701 E.00536
G1 F1645
G1 X79.101 Y86.797 E.00411
G1 X79.187 Y86.72 E.00356
G1 X79.489 Y86.457 E.01229
G1 X79.724 Y86.253 E.00956
G1 X80.107 Y85.954 E.01494
G1 X80.435 Y85.717 E.01243
G1 X80.76 Y85.484 E.01229
G1 X81.084 Y85.25 E.01229
G1 X81.215 Y85.13 E.00543
G1 X81.27 Y85.065 E.00263
G1 X81.31 Y84.994 E.00252
G1 X81.328 Y84.917 E.00243
G1 X81.328 Y84.904 E.00039
G1 X81.351 Y84.882 E.00098
G1 X81.386 Y84.854 E.00138
G1 X81.485 Y84.786 E.00369
G1 X81.782 Y84.628 E.01034
G1 X81.949 Y84.545 E.00574
G1 X82.312 Y84.377 E.01229
G1 X82.822 Y84.148 E.01717
G3 X83.638 Y83.825 I7.214 J17.031 E.02699
G1 X83.639 Y84.484 E.02025
G2 X82.098 Y85.236 I16.301 J35.355 E.05267
G2 X80.294 Y86.44 I6.616 J11.868 E.06674
G1 X79.704 Y86.94 E.02376
M204 S10000
G1 X79.368 Y86.897 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.155829
G1 F1645
M204 S6000
G3 X80.907 Y85.677 I9.472 J10.363 E.01809
G1 X81.377 Y85.351 E.00526
; LINE_WIDTH: 0.201169
G1 X81.457 Y85.283 E.00135
; LINE_WIDTH: 0.240101
G2 X82.091 Y84.695 I-5.822 J-6.921 E.0139
M204 S10000
G1 X82.3 Y84.747 F42000
; LINE_WIDTH: 0.329796
G1 F1645
M204 S6000
G1 X81.931 Y84.937 E.00971
G2 X81.642 Y85.098 I1.133 J2.371 E.00774
G1 X81.294 Y85.488 E.01222
; WIPE_START
G1 F15000
G1 X81.642 Y85.098 E-.3132
G1 X81.931 Y84.937 E-.1981
G1 X82.3 Y84.747 E-.24871
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.248 Y90.07 Z10.9 F42000
G1 Z10.5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1645
M204 S5000
G2 X77.312 Y90.258 I.537 J-.077 E.00614
G1 X77.68 Y90.789 E.01985
G1 X77.908 Y91.117 E.01229
G1 X78.135 Y91.401 E.01117
G1 X78.385 Y91.714 E.01229
G1 X78.405 Y91.739 E.00099
G1 X78.516 Y91.866 E.00518
G1 X78.46 Y91.946 E.00299
M106 S201.45
M106 S255
G1 F1320
G1 X78.262 Y92.256 E.01131
M106 S201.45
M106 S255
G1 F840
G1 X78.203 Y92.358 E.00362
M106 S201.45
M106 S255
G1 F720
G1 X78.161 Y92.437 E.00274
M106 S201.45
M106 S255
G1 F1200
G1 X78.099 Y92.368 E.00285
M106 S201.45
M106 S255
G1 F1645
G1 X78.033 Y92.293 E.00307
G1 X78.129 Y92.199 E.00413
G1 X78.057 Y92.111 E.00349
G1 X77.809 Y91.797 E.01229
M73 P73 R4
G1 X77.562 Y91.483 E.01229
G1 X77.347 Y91.206 E.01077
G3 X76.728 Y90.262 I10.853 J-7.788 E.03471
G3 X76.856 Y89.511 I.714 J-.264 E.02452
G3 X77.412 Y88.714 I15.508 J10.216 E.02984
G1 X77.559 Y88.515 E.00764
G1 X77.808 Y88.201 E.01229
G1 X78.057 Y87.888 E.01229
G1 X78.127 Y87.803 E.00339
G1 X78.033 Y87.709 E.00407
G1 F1629.325
G1 X78.162 Y87.563 E.006
M106 S201.45
M106 S255
G1 F720
G1 X78.248 Y87.721 E.00554
M106 S201.45
M106 S255
G1 F1200
G1 X78.428 Y88.006 E.01036
M106 S201.45
M106 S255
G1 F1560
G1 X78.516 Y88.134 E.00477
M106 S201.45
M106 S255
G1 F1645
G1 X78.405 Y88.261 E.00518
G1 X78.384 Y88.287 E.00102
G1 X78.137 Y88.601 E.01229
G1 X77.777 Y89.07 E.01816
G2 X77.268 Y89.828 I11.163 J8.031 E.02806
G2 X77.243 Y90.01 I.517 J.164 E.00565
M204 S10000
G1 X76.972 Y89.877 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.160058
G1 F1645
M204 S6000
G1 X77 Y89.791 E.00086
G3 X77.991 Y88.366 I8.471 J4.834 E.01659
G1 X78.236 Y88.069 E.00368
; WIPE_START
G1 F15000
G1 X77.991 Y88.366 E-.14651
G1 X77.336 Y89.245 E-.4163
G1 X77.087 Y89.623 E-.17231
G1 X77.057 Y89.682 E-.02489
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X76.972 Y89.877 Z10.9 F42000
G1 Z10.5
G1 E.8 F1800
; LINE_WIDTH: 0.196013
G1 F1645
M204 S6000
G2 X77.057 Y90.326 I.57 J.125 E.00586
; LINE_WIDTH: 0.157898
G1 X77.097 Y90.392 E.00072
G2 X78.237 Y91.932 I12.227 J-7.863 E.01796
; WIPE_START
G1 F15000
G1 X77.55 Y91.059 E-.42326
G1 X77.097 Y90.392 E-.30728
G1 X77.057 Y90.326 E-.02946
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z10.9 I-.753 J.956 P1  F42000
G1 X83.639 Y95.516 Z10.9
G1 Z10.5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1645
M204 S5000
G1 X83.638 Y96.176 E.02029
G3 X82.626 Y95.77 I5.695 J-15.67 E.03352
G1 X82.311 Y95.625 E.01065
G1 X81.949 Y95.455 E.01229
G1 X81.846 Y95.404 E.00353
G1 X81.484 Y95.214 E.01257
G1 X81.39 Y95.149 E.0035
G1 X81.327 Y95.094 E.00258
G1 X81.326 Y95.08 E.00041
G1 X81.312 Y95.009 E.00224
G1 X81.271 Y94.935 E.00258
G1 X81.217 Y94.872 E.00257
G1 X81.085 Y94.75 E.00551
G1 X80.759 Y94.518 E.01229
G1 X80.433 Y94.286 E.01229
G1 X80.115 Y94.059 E.01201
G1 X79.956 Y93.931 E.00627
G1 X79.644 Y93.681 E.01229
G1 X79.488 Y93.544 E.00637
G1 X79.187 Y93.281 E.01229
G1 X79.099 Y93.205 E.00356
G1 X79.007 Y93.299 E.00405
G1 F1440.622
G1 X78.884 Y93.185 E.00516
G1 F692.399
G1 X78.866 Y93.166 E.00081
M106 S201.45
M106 S255
G1 F600
G1 X78.964 Y93.117 E.00337
M106 S201.45
M106 S255
G1 F1080
G1 X79.214 Y92.969 E.00894
M106 S201.45
M106 S255
G1 F1440
G1 X79.411 Y92.842 E.00719
M106 S201.45
M106 S255
G1 F1645
G1 X79.439 Y92.823 E.00104
M106 S201.45
G1 X79.586 Y92.96 E.00616
G1 X79.595 Y92.969 E.00039
G1 X79.898 Y93.23 E.01229
G1 X80.115 Y93.417 E.00879
G1 X80.568 Y93.767 E.01759
G2 X83.587 Y95.486 I8.364 J-11.182 E.10704
; WIPE_START
G1 F12000
M204 S6000
G1 X83.638 Y96.176 E-.26296
G1 X82.626 Y95.77 E-.41446
G1 X82.428 Y95.679 E-.08258
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.3 Y95.253 Z10.9 F42000
G1 Z10.5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.333929
G1 F1645
M204 S6000
G3 X81.643 Y94.903 I5.845 J-11.74 E.01765
G1 X81.51 Y94.994 E.00383
M204 S10000
G1 X81.283 Y94.505 F42000
; LINE_WIDTH: 0.32943
G1 F1645
M204 S6000
G1 X81.629 Y94.886 E.012
G1 X81.889 Y95.205 E.00962
M204 S10000
G1 X82.089 Y95.305 F42000
; LINE_WIDTH: 0.240003
G1 F1645
M204 S6000
G2 X81.445 Y94.707 I-6.03 J5.852 E.01412
; LINE_WIDTH: 0.198734
G1 X81.376 Y94.648 E.00115
; LINE_WIDTH: 0.155328
G1 X80.675 Y94.162 E.00782
G3 X79.368 Y93.103 I8.003 J-11.222 E.01542
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 10.7
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X79.988 Y93.639 E-.31147
G1 X80.675 Y94.162 E-.32799
G1 X80.936 Y94.343 E-.12055
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 54/111
; update layer progress
M73 L54
M991 S0 P53 ;notify layer change

; OBJECT_ID: 427
M204 S10000
G17
G3 Z10.9 I.921 J-.795 P1  F42000
G1 X77.213 Y90.031 Z10.9
G1 Z10.7
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1631
M204 S5000
G2 X77.263 Y90.219 I.498 J-.031 E.00604
G2 X77.813 Y91.02 I11.496 J-7.326 E.02986
G1 X78.031 Y91.289 E.01064
G1 X78.283 Y91.6 E.01229
G1 X78.535 Y91.91 E.01229
G1 X78.758 Y92.157 E.01023
G1 F600
G1 X78.79 Y92.19 E.00143
M106 S201.45
M106 S255
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45

G2 X79.129 Y92.537 I7.079 J-6.58 E.01605
M106 S201.45
M106 S255
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 X79.237 Y92.646 E.00473
M106 S201.45
M106 S255
G1 F1604.608
G1 X79.4 Y92.8 E.0069
G1 F1631
G1 X79.404 Y92.804 E.00016
G1 X79.704 Y93.069 E.01229
G1 X80.003 Y93.333 E.01227
G1 X80.364 Y93.615 E.01407
G2 X82.899 Y95.176 I8.664 J-11.229 E.09164
G1 X82.972 Y95.226 E.00272
G1 X82.971 Y95.892 E.02047
G3 X82.273 Y95.578 I7.349 J-17.271 E.02354
G1 X81.993 Y95.439 E.00959
G1 X81.638 Y95.256 E.01229
G1 X81.283 Y95.072 E.01229
G1 X81.23 Y95.043 E.00185
G1 X80.875 Y94.836 E.01263
G1 X80.773 Y94.766 E.00381
G1 X80.731 Y94.733 E.00163
G1 X80.659 Y94.663 E.00308
G1 X80.659 Y94.644 E.00058
G1 X80.646 Y94.574 E.00219
G1 X80.608 Y94.5 E.00257
G1 X80.556 Y94.435 E.00256
G1 X80.373 Y94.26 E.00775
G1 X79.999 Y93.975 E.01446
G1 X79.654 Y93.689 E.01377
G1 X79.347 Y93.433 E.01229
G1 X78.953 Y93.075 E.01634
G1 X78.917 Y93.042 E.0015
G1 X78.819 Y93.134 E.0041
G1 F1588.969
G1 X78.746 Y93.064 E.0031
G1 F1080
G1 X78.548 Y92.865 E.00863
M106 S201.45
M106 S255
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
G1 F600
G1 X78.453 Y92.768 E.00449
M106 S201.45
M106 S255
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F720
G1 X78.294 Y92.601 E.00708
M106 S201.45
M106 S255
G1 F1401.94
G1 X78.191 Y92.488 E.00471
G1 F1631
G1 X78.283 Y92.389 E.00414
G1 X78.253 Y92.354 E.0014
G1 X77.993 Y92.05 E.01229
G1 X77.761 Y91.777 E.01101
G1 X77.515 Y91.461 E.01229
G1 X77.391 Y91.301 E.00622
G3 X76.703 Y90.264 I10.521 J-7.728 E.03827
G3 X76.762 Y89.621 I.668 J-.263 E.02059
G3 X77.532 Y88.526 I14.331 J9.268 E.04114
G1 X77.742 Y88.26 E.01041
G1 X77.998 Y87.952 E.01229
G1 X78.253 Y87.645 E.01229
G1 X78.285 Y87.609 E.00146
G1 X78.192 Y87.511 E.00414
G1 F1397.515
G1 X78.295 Y87.399 E.00468
G1 F720
G1 X78.454 Y87.232 E.00708
M106 S201.45
M106 S255
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
G1 F600
G1 X78.549 Y87.134 E.00453
M106 S201.45
M106 S255
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1080
G1 X78.746 Y86.936 E.00859
M106 S201.45
M106 S255
G1 F1578.089
G1 X78.818 Y86.868 E.00304
G1 F1631
G1 X78.913 Y86.961 E.0041
G1 X78.953 Y86.925 E.00166
G1 X79.253 Y86.66 E.01229
G1 X79.553 Y86.395 E.01229
G1 X79.705 Y86.264 E.00616
G1 X80.169 Y85.895 E.01821
G1 X80.482 Y85.646 E.01229
G1 X80.565 Y85.557 E.00375
G1 X80.571 Y85.551 E.00025
G1 X80.61 Y85.496 E.00209
G1 X80.643 Y85.434 E.00217
G1 X80.661 Y85.361 E.00231
G1 X80.66 Y85.335 E.00077
G1 X80.688 Y85.306 E.00125
G1 X80.775 Y85.232 E.00349
G1 X80.884 Y85.159 E.00403
G1 X81.163 Y84.995 E.00993
G1 X81.283 Y84.929 E.00424
G1 X81.638 Y84.744 E.01229
G1 X81.993 Y84.56 E.01229
G1 X82.246 Y84.431 E.00873
G3 X82.971 Y84.107 I6.931 J14.572 E.02439
G1 X82.971 Y84.774 E.02047
G1 X82.967 Y84.778 E.00018
G2 X81.583 Y85.537 I62.222 J115.098 E.0485
G2 X80.361 Y86.382 I7.19 J11.693 E.04568
G1 X80.003 Y86.667 E.01405
G1 X79.7 Y86.935 E.01244
G1 X79.401 Y87.201 E.01229
G1 X79.311 Y87.284 E.00377
G1 F1080
G1 X79.128 Y87.463 E.00785
M106 S201.45
M106 S255
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
G1 F600
G2 X78.791 Y87.809 I9.279 J9.367 E.01605
M106 S201.45
M106 S255
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 X78.758 Y87.843 E.00143
M106 S201.45
M106 S255
G1 F1631
G1 X78.535 Y88.089 E.01021
G1 X78.282 Y88.399 E.01229
G1 X78.029 Y88.708 E.01229
G1 X77.882 Y88.89 E.00716
G2 X77.263 Y89.781 I11.132 J8.408 E.03336
G2 X77.213 Y89.971 I.448 J.219 E.00607
; WIPE_START
G1 F12000
M204 S6000
G1 X77.263 Y90.219 E-.09642
G1 X77.813 Y91.02 E-.36914
G1 X78.031 Y91.289 E-.13153
G1 X78.283 Y91.6 E-.152
G1 X78.301 Y91.622 E-.01091
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z11.1 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z11.1
G1 X0 Y90.0001 F18000 ; move to safe pos
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
            G0 Z11.1 F4000
            G39.3 S1
            G0 Z11.1 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X78.591 Y92.353 F42000
G1 Z10.7
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.18096
G1 F1631
M204 S6000
G1 X78.603 Y92.391 E.00046
; LINE_WIDTH: 0.215889
G1 X78.616 Y92.43 E.00057
; LINE_WIDTH: 0.250817
G1 X78.628 Y92.468 E.00069
; LINE_WIDTH: 0.29265
G1 X78.687 Y92.548 E.00202
G2 X78.833 Y92.688 I.821 J-.709 E.00411
; LINE_WIDTH: 0.264301
G1 X78.874 Y92.702 E.00079
; LINE_WIDTH: 0.225474
G1 X78.915 Y92.716 E.00065
; LINE_WIDTH: 0.16902
G3 X79.06 Y92.828 I-.264 J.488 E.00189
; LINE_WIDTH: 0.156334
G1 X79.491 Y93.224 E.00541
G2 X80.736 Y94.228 I26.819 J-31.977 E.01479
; LINE_WIDTH: 0.211681
G1 X80.848 Y94.333 E.0021
; LINE_WIDTH: 0.237383
G1 X81.417 Y94.922 E.01298
M204 S10000
G1 X81.638 Y94.886 F42000
; LINE_WIDTH: 0.333983
G1 F1631
M204 S6000
G3 X80.978 Y94.484 I3.401 J-6.316 E.01832
G1 X80.952 Y94.449 E.00104
; LINE_WIDTH: 0.28759
G3 X80.569 Y94.02 I33.564 J-30.339 E.01146
; WIPE_START
G1 F15000
G1 X80.952 Y94.449 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z11.1 I.808 J-.91 P1  F42000
G1 X78.591 Y92.353 Z11.1
G1 Z10.7
G1 E.8 F1800
; LINE_WIDTH: 0.157799
G1 F1631
M204 S6000
G3 X77.033 Y90.33 I10.498 J-9.698 E.02394
G1 X76.973 Y90.21 E.00125
; LINE_WIDTH: 0.202691
G3 X76.962 Y89.817 I.513 J-.21 E.00522
; LINE_WIDTH: 0.158181
G1 X76.969 Y89.799 E.00019
G3 X78.339 Y87.931 I9.806 J5.752 E.02179
G1 X78.571 Y87.67 E.00328
G2 X78.608 Y87.603 I-.088 J-.093 E.00073
; LINE_WIDTH: 0.219458
G1 X78.621 Y87.563 E.0006
; LINE_WIDTH: 0.256353
G1 X78.634 Y87.523 E.00073
; LINE_WIDTH: 0.291857
G3 X78.819 Y87.318 I1.026 J.739 E.00562
G1 X78.848 Y87.315 E.00059
; LINE_WIDTH: 0.238955
G1 X78.872 Y87.313 E.00039
; LINE_WIDTH: 0.207283
G1 X78.913 Y87.294 E.0006
; LINE_WIDTH: 0.17961
G1 X78.95 Y87.276 E.00046
; LINE_WIDTH: 0.157343
G3 X80.206 Y86.183 I11.387 J11.811 E.01553
G1 X80.757 Y85.751 E.00654
; LINE_WIDTH: 0.239113
G2 X81.401 Y85.088 I-6.391 J-6.846 E.01478
M204 S10000
G1 X81.637 Y85.116 F42000
; LINE_WIDTH: 0.325114
G1 F1631
M204 S6000
G1 X81.404 Y85.249 E.00617
G2 X80.961 Y85.537 I.977 J1.984 E.01217
G1 X80.669 Y85.907 E.01083
; WIPE_START
G1 F15000
G1 X80.961 Y85.537 E-.28226
G1 X81.069 Y85.453 E-.08177
G1 X81.404 Y85.249 E-.23518
G1 X81.637 Y85.116 E-.16079
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.542 Y90.964 Z11.1 F42000
G1 X87.017 Y91.531 Z11.1
G1 Z10.7
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.378512
G1 F1631
M204 S5000
G1 X86.701 Y91.508 E.00866
G1 X86.701 Y88.892 E.07155
G1 X86.701 Y88.492 E.01094
G1 X87.017 Y88.469 E.00866
G1 X87.017 Y88.943 E.01296
G1 X87.017 Y89.309 E.00999
M106 S201.45
M106 S255
G1 X86.84 Y89.35 E.00497
G1 X86.785 Y89.363 E.00153
G1 X86.785 Y89.929 E.01547
G1 X86.785 Y90.329 E.01094
G1 X86.785 Y90.637 E.00844
G1 X86.84 Y90.65 E.00153
G1 X87.017 Y90.691 E.00497
G1 X87.017 Y91.057 E.00999
M106 S201.45
G1 X87.017 Y91.471 E.01132
; WIPE_START
G1 F5056.317
M204 S6000
G1 X86.701 Y91.508 E-.12082
G1 X86.701 Y89.826 E-.63918
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.496 Y86.859 Z11.1 F42000
G1 Z10.7
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F1631
M204 S5000
G1 X85.496 Y93.141 E.19305
G1 X87.265 Y93.043 E.05445
G1 X87.299 Y93.684 E.01972
G1 X87.025 Y93.699 E.00843
G1 X87.018 Y93.56 E.00426
G1 X85.022 Y93.672 E.06141
G1 X84.991 Y93.658 E.00104
G1 X84.99 Y86.363 E.22415
G3 X85.012 Y86.33 I.025 J-.007 E.00139
G1 X87.018 Y86.439 E.06174
G1 X87.025 Y86.301 E.00425
G1 X87.299 Y86.316 E.00843
G1 X87.265 Y86.957 E.01971
G1 X85.555 Y86.862 E.05261
; WIPE_START
G1 F12000
M204 S6000
G1 X85.536 Y88.862 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.083 Y86.695 Z11.1 F42000
G1 Z10.7
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.15575
G1 F1631
M204 S6000
G1 X85.303 Y86.597 E.01639
G1 X85.252 Y86.605 E.00047
G1 X85.243 Y86.651 E.00043
G1 X85.252 Y93.396 E.06201
G1 X87.083 Y93.305 E.01685
; WIPE_START
G1 F15000
G1 X85.252 Y93.396 E-.69637
G1 X85.252 Y93.228 E-.06363
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.327 Y88.607 Z11.1 F42000
G1 X93.072 Y87.28 Z11.1
G1 Z10.7
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1631
M204 S5000
G1 X91.619 Y87.199 E.04469
G1 X91.656 Y86.558 E.01971
G1 X91.927 Y86.573 E.00836
G1 X91.919 Y86.712 E.00426
G1 X93.566 Y86.808 E.0507
G1 X93.57 Y87.47 E.02035
G1 X93.572 Y87.87 E.01229
G1 X93.575 Y88.27 E.01229
G1 X93.611 Y88.269 E.00111
G1 X93.713 Y88.267 E.00315
G1 X93.713 Y88.451 E.00568
G1 X93.713 Y88.851 E.01229
G1 X93.713 Y89.137 E.00878
G1 X93.314 Y89.17 E.01229
G1 X93.072 Y89.19 E.00748
G1 X93.072 Y87.34 E.05687
; WIPE_START
G1 F12000
M204 S6000
G1 X91.619 Y87.199 E-.5544
G1 X91.65 Y86.659 E-.2056
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.343 Y88.51 Z11.1 F42000
G1 Z10.7
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.154348
G1 F1631
M204 S6000
G1 X93.323 Y88.472 E.00039
G1 X93.315 Y87.05 E.01291
G1 X91.829 Y86.959 E.01351
; WIPE_START
G1 F15000
G1 X93.315 Y87.05 E-.56546
G1 X93.318 Y87.562 E-.19454
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.343 Y88.51 Z11.1 F42000
G1 Z10.7
G1 E.8 F1800
; LINE_WIDTH: 0.212277
G1 F1631
M204 S6000
G1 X93.362 Y88.548 E.00059
; LINE_WIDTH: 0.251275
G1 X93.382 Y88.586 E.00072
; LINE_WIDTH: 0.291832
G1 X93.392 Y88.967 E.00774
; WIPE_START
G1 F15000
G1 X93.382 Y88.586 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.072 Y92.72 Z11.1 F42000
G1 Z10.7
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1631
M204 S5000
G1 X93.072 Y90.811 E.05868
G1 X93.314 Y90.831 E.00748
G1 X93.713 Y90.863 E.01229
G1 X93.713 Y91.149 E.00877
G1 X93.713 Y91.549 E.01229
G1 X93.713 Y91.733 E.00567
G1 X93.611 Y91.731 E.00315
G1 X93.575 Y91.73 E.00111
G1 X93.572 Y92.13 E.01229
G1 X93.57 Y92.53 E.01229
G1 X93.566 Y93.193 E.02038
G1 X91.919 Y93.288 E.05068
G1 X91.927 Y93.427 E.00425
G1 X91.656 Y93.442 E.00836
G1 X91.619 Y92.801 E.01972
G1 X93.012 Y92.724 E.04285
; WIPE_START
G1 F12000
M204 S6000
G1 X93.072 Y90.811 E-.72733
G1 X93.157 Y90.818 E-.03267
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.829 Y93.041 Z11.1 F42000
G1 Z10.7
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.154087
G1 F1631
M204 S6000
G1 X93.315 Y92.949 E.01348
G1 X93.323 Y91.528 E.01287
G1 X93.343 Y91.49 E.00039
; LINE_WIDTH: 0.212307
G1 X93.362 Y91.452 E.00059
; LINE_WIDTH: 0.251318
G1 X93.382 Y91.414 E.00072
; LINE_WIDTH: 0.29183
G1 X93.392 Y91.034 E.00772
; CHANGE_LAYER
; Z_HEIGHT: 10.9
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X93.382 Y91.414 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 55/111
; update layer progress
M73 L55
M991 S0 P54 ;notify layer change

; OBJECT_ID: 427
M204 S10000
G17
G3 Z11.1 I.1 J-1.213 P1  F42000
G1 X77.203 Y90.074 Z11.1
G1 Z10.9
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1464
M204 S5000
G2 X77.332 Y90.365 I.572 J-.079 E.00991
G2 X82.222 Y94.831 I11.405 J-7.577 E.20553
G3 X82.304 Y94.895 I-.179 J.314 E.0032
G1 X82.304 Y95.569 E.02071
G3 X81.396 Y95.1 I7.259 J-15.154 E.03139
G1 X80.96 Y94.843 E.01556
G1 X80.616 Y94.638 E.01229
G1 X80.524 Y94.581 E.00335
G1 X80.206 Y94.371 E.01172
G1 X80.115 Y94.302 E.0035
G3 X80.034 Y94.227 I.587 J-.717 E.0034
G1 X79.993 Y94.177 E.00199
G1 X79.993 Y94.153 E.00074
G1 X79.98 Y94.083 E.00218
G1 X79.947 Y94.015 E.00232
G1 X79.91 Y93.958 E.0021
G1 X79.904 Y93.952 E.00024
G1 X79.718 Y93.756 E.00829
G1 X79.416 Y93.494 E.01229
G1 X79.148 Y93.261 E.0109
G3 X76.68 Y90.265 I9.152 J-10.054 E.1197
G3 X76.74 Y89.618 I.67 J-.264 E.02071
G3 X78.869 Y86.997 I12.4 J7.895 E.104
G1 X79.23 Y86.676 E.01482
G1 X79.527 Y86.409 E.01229
G1 X79.825 Y86.142 E.01229
G1 X79.906 Y86.046 E.00385
G1 X79.91 Y86.042 E.00017
G1 X79.948 Y85.984 E.00215
G1 X79.978 Y85.92 E.00218
G1 X79.993 Y85.852 E.00212
G1 X79.993 Y85.82 E.00097
G1 X79.999 Y85.812 E.00031
G1 X80.069 Y85.738 E.00315
G1 X80.17 Y85.655 E.004
G1 X80.223 Y85.616 E.00203
G1 X80.549 Y85.403 E.01194
G1 X80.619 Y85.36 E.00253
G1 X80.962 Y85.156 E.01229
G1 X81.389 Y84.904 E.01522
M106 S255
G3 X82.304 Y84.432 I8.122 J14.603 E.03164
G1 X82.304 Y85.105 E.02069
G3 X81.082 Y85.859 I-38.71 J-61.352 E.04412
G2 X77.24 Y89.779 I7.537 J11.229 E.16983
G2 X77.198 Y90.014 I.536 J.216 E.0074
; WIPE_START
G1 F12000
M204 S6000
G1 X77.219 Y90.174 E-.06128
G1 X77.332 Y90.365 E-.08437
G1 X77.856 Y91.105 E-.34441
G1 X78.303 Y91.657 E-.26994
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z11.3 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z11.3
G1 X0 Y90.0001 F18000 ; move to safe pos
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
            G0 Z11.3 F4000
            G39.3 S1
            G0 Z11.3 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X76.98 Y90.273 F42000
G1 Z10.9
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.156471
G1 F1464
M204 S6000
G1 X77.043 Y90.384 E.00119
G2 X80.016 Y93.681 I11.782 J-7.635 E.04125
G1 X80.127 Y93.788 E.00142
; LINE_WIDTH: 0.219432
G1 X80.207 Y93.875 E.0017
M204 S10000
G1 X80.024 Y93.605 F42000
; LINE_WIDTH: 0.323655
G1 F1464
M204 S6000
G1 X80.304 Y93.997 E.01103
G2 X80.966 Y94.464 I2.599 J-2.975 E.01856
; WIPE_START
G1 F15000
G1 X80.407 Y94.089 E-.39548
G1 X80.304 Y93.997 E-.08112
G1 X80.024 Y93.605 E-.2834
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z11.3 I.898 J-.821 P1  F42000
G1 X76.98 Y90.273 Z11.3
G1 Z10.9
M73 P74 R4
G1 E.8 F1800
; LINE_WIDTH: 0.19852
G1 F1464
M204 S6000
G3 X76.94 Y89.813 I.504 J-.275 E.00603
; LINE_WIDTH: 0.157328
G1 X76.967 Y89.754 E.0006
G3 X79.555 Y86.712 I11.335 J7.025 E.03738
G1 X80.127 Y86.212 E.00708
; LINE_WIDTH: 0.236445
G2 X80.741 Y85.515 I-14.73 J-13.604 E.01464
M204 S10000
G1 X80.965 Y85.536 F42000
; LINE_WIDTH: 0.322523
G1 F1464
M204 S6000
G2 X80.297 Y86.012 I1.744 J3.157 E.01872
G1 X80.014 Y86.403 E.01102
; WIPE_START
G1 F15000
G1 X80.297 Y86.012 E-.28171
G1 X80.419 Y85.902 E-.09527
G1 X80.965 Y85.536 E-.38302
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.473 Y90.82 Z11.3 F42000
G1 X87.001 Y91.327 Z11.3
G1 Z10.9
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.378512
G1 F1464
M204 S5000
G1 X86.685 Y91.298 E.00866
G1 X86.685 Y88.702 E.07101
G1 X87.001 Y88.673 E.00866
G1 X87.001 Y88.952 E.00765
G1 X87.001 Y89.352 E.01094
G1 X87.001 Y90.648 E.03542
M106 S201.45
G1 X87.001 Y91.048 E.01094
G1 X87.001 Y91.267 E.00601
; WIPE_START
G1 F7287.003
M204 S6000
G1 X86.685 Y91.298 E-.12046
G1 X86.685 Y89.615 E-.63954
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.48 Y86.853 Z11.3 F42000
G1 Z10.9
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F1464
M204 S5000
G1 X85.48 Y93.147 E.19343
G1 X87.249 Y93.049 E.05445
G1 X87.284 Y93.69 E.01972
G1 X87.01 Y93.705 E.00843
G1 X87.002 Y93.567 E.00426
G1 X84.991 Y93.677 E.06188
G1 X84.974 Y93.648 E.00102
G1 X84.974 Y93.271 E.0116
G1 X84.974 Y92.871 E.01229
G1 X84.949 Y92.872 E.00079
G1 X84.835 Y92.876 E.00349
G1 X84.835 Y87.124 E.17673
G1 X84.949 Y87.128 E.00349
G1 X84.974 Y87.129 E.00079
G1 X84.974 Y86.729 E.01229
G1 X84.974 Y86.357 E.01144
G3 X84.996 Y86.324 I.025 J-.008 E.00139
G1 X87.002 Y86.433 E.06174
G1 X87.01 Y86.295 E.00425
G1 X87.284 Y86.31 E.00843
G1 X87.249 Y86.951 E.01971
G1 X85.54 Y86.856 E.05261
M204 S10000
G1 X85.227 Y87.332 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.154493
G1 F1464
M204 S6000
G1 X85.236 Y86.599 E.00667
G1 X87.067 Y86.689 E.01666
; WIPE_START
G1 F15000
G1 X85.236 Y86.599 E-.69649
G1 X85.234 Y86.766 E-.06351
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.227 Y87.332 Z11.3 F42000
G1 Z10.9
G1 E.8 F1800
; LINE_WIDTH: 0.176449
G1 F1464
M204 S6000
G1 X85.207 Y87.372 E.00048
; LINE_WIDTH: 0.217027
G1 X85.187 Y87.411 E.00063
; LINE_WIDTH: 0.257605
G1 X85.166 Y87.45 E.00077
; LINE_WIDTH: 0.295428
G1 X85.166 Y92.55 E.10494
; LINE_WIDTH: 0.25761
G1 X85.187 Y92.589 E.00077
; LINE_WIDTH: 0.21703
G1 X85.207 Y92.628 E.00063
; LINE_WIDTH: 0.155353
G1 X85.227 Y92.668 E.0004
G1 X85.237 Y93.402 E.00673
G1 X87.067 Y93.311 E.01679
; WIPE_START
G1 F15000
G1 X85.237 Y93.402 E-.69634
G1 X85.235 Y93.234 E-.06366
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.311 Y88.616 Z11.3 F42000
G1 X93.077 Y87.275 Z11.3
G1 Z10.9
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1464
M204 S5000
G1 X91.625 Y87.194 E.04469
G1 X91.661 Y86.553 E.01972
G1 X91.932 Y86.568 E.00836
G1 X91.924 Y86.707 E.00426
G1 X93.574 Y86.804 E.05076
G1 X93.578 Y87.685 E.02707
G1 X93.58 Y88.085 E.01229
G1 X93.616 Y88.085 E.00109
G1 X93.719 Y88.082 E.00316
G1 X93.719 Y88.225 E.00439
G1 X93.719 Y88.706 E.01477
G1 X93.077 Y88.734 E.01973
G1 X93.077 Y87.335 E.04301
; WIPE_START
G1 F12000
M204 S6000
G1 X91.625 Y87.194 E-.5544
G1 X91.655 Y86.654 E-.2056
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.348 Y88.324 Z11.3 F42000
G1 Z10.9
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.154348
G1 F1464
M204 S6000
G1 X93.329 Y88.286 E.00039
G1 X93.319 Y87.045 E.01127
G1 X91.835 Y86.954 E.01351
; WIPE_START
G1 F15000
G1 X93.319 Y87.045 E-.56524
G1 X93.323 Y87.558 E-.19476
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.348 Y88.324 Z11.3 F42000
G1 Z10.9
G1 E.8 F1800
; LINE_WIDTH: 0.2127
G1 F1464
M204 S6000
G1 X93.368 Y88.362 E.00059
; LINE_WIDTH: 0.251527
G1 X93.387 Y88.4 E.00072
; LINE_WIDTH: 0.28094
G1 X93.523 Y88.401 E.00263
; WIPE_START
G1 F15000
G1 X93.387 Y88.4 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.077 Y92.725 Z11.3 F42000
G1 Z10.9
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1464
M204 S5000
G1 X93.077 Y91.266 E.04484
G1 X93.498 Y91.285 E.01296
G1 X93.719 Y91.294 E.00677
G1 X93.719 Y91.774 E.01475
G1 X93.719 Y91.918 E.0044
G1 X93.616 Y91.915 E.00316
G1 X93.58 Y91.915 E.00109
G1 X93.577 Y92.315 E.01229
G1 X93.571 Y93.197 E.02711
G1 X91.924 Y93.293 E.05069
G1 X91.932 Y93.431 E.00426
G1 X91.661 Y93.447 E.00836
G1 X91.625 Y92.806 E.01971
G1 X93.017 Y92.729 E.04285
; WIPE_START
G1 F12000
M204 S6000
G1 X93.077 Y91.266 E-.55631
G1 X93.498 Y91.285 E-.1603
G1 X93.612 Y91.29 E-.04339
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.348 Y91.677 Z11.3 F42000
G1 Z10.9
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.212263
G1 F1464
M204 S6000
G1 X93.367 Y91.639 E.00059
; LINE_WIDTH: 0.250962
G1 X93.387 Y91.601 E.00072
; LINE_WIDTH: 0.280388
G1 X93.523 Y91.6 E.00263
M204 S10000
G1 X93.348 Y91.677 F42000
; LINE_WIDTH: 0.154426
G1 F1464
M204 S6000
G1 X93.329 Y91.714 E.00039
G1 X93.32 Y92.955 E.01127
G1 X91.835 Y93.046 E.01352
; CHANGE_LAYER
; Z_HEIGHT: 11.1
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15000
G1 X93.32 Y92.955 E-.56541
G1 X93.323 Y92.443 E-.1946
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 56/111
; update layer progress
M73 L56
M991 S0 P55 ;notify layer change

; OBJECT_ID: 427
M204 S10000
G17
G3 Z11.3 I.177 J-1.204 P1  F42000
G1 X77.178 Y90.07 Z11.3
G1 Z11.1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1315
M204 S5000
G2 X77.243 Y90.262 I.527 J-.073 E.00627
G2 X81.549 Y94.441 I11.473 J-7.511 E.18587
G3 X81.637 Y94.518 I-.223 J.346 E.00363
G1 X81.637 Y95.2 E.02096
G3 X80.698 Y94.65 I8.336 J-15.304 E.03346
G1 X80.284 Y94.376 E.01526
G1 X79.951 Y94.154 E.01229
G1 X79.907 Y94.123 E.00164
G1 X79.564 Y93.872 E.01306
G1 X79.512 Y93.83 E.00206
G3 X79.369 Y93.692 I.831 J-1.003 E.00611
G1 X79.34 Y93.656 E.00143
G1 X79.326 Y93.635 E.00076
G1 X79.326 Y93.597 E.00117
G1 X79.313 Y93.531 E.00206
G1 X79.284 Y93.463 E.00227
G1 X79.243 Y93.4 E.00231
G1 X79.064 Y93.191 E.00848
G1 X78.781 Y92.921 E.01202
G3 X76.661 Y90.268 I9.403 J-9.688 E.10462
G3 X76.697 Y89.656 I.711 J-.265 E.01938
G3 X78.346 Y87.523 I12.928 J8.287 E.08297
G1 X78.6 Y87.267 E.01106
G1 X78.882 Y86.984 E.01229
G1 X79.165 Y86.701 E.01229
G1 X79.24 Y86.602 E.00383
G1 X79.283 Y86.538 E.00237
G1 X79.313 Y86.469 E.00232
G1 X79.326 Y86.402 E.00208
G1 X79.326 Y86.366 E.00113
G1 X79.356 Y86.324 E.00158
G1 X79.411 Y86.263 E.00252
G3 X79.567 Y86.127 I.971 J.956 E.00636
G1 X79.952 Y85.846 E.01465
G1 X80.285 Y85.624 E.01229
G1 X80.773 Y85.302 E.01797
G3 X81.637 Y84.799 I8.865 J14.269 E.03073
G1 X81.637 Y85.482 E.02097
G3 X81.116 Y85.84 I-1.729 J-1.959 E.01947
G2 X77.219 Y89.778 I7.496 J11.314 E.17143
G2 X77.173 Y90.01 I.485 J.218 E.00733
; WIPE_START
G1 F12000
M204 S6000
G1 X77.243 Y90.262 E-.09938
G1 X77.565 Y90.733 E-.21696
G1 X78.118 Y91.455 E-.34541
G1 X78.288 Y91.649 E-.09824
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z11.5 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z11.5
G1 X0 Y90.0001 F18000 ; move to safe pos
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
            G0 Z11.5 F4000
            G39.3 S1
            G0 Z11.5 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X79.366 Y93.048 F42000
G1 Z11.1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.292437
G1 F1315
M204 S6000
G1 X79.911 Y93.883 E.02029
M204 S10000
G1 X80.299 Y93.991 F42000
; LINE_WIDTH: 0.331318
G1 F1315
M204 S6000
G3 X79.655 Y93.496 I5.263 J-7.505 E.01909
; LINE_WIDTH: 0.323184
G1 X79.589 Y93.533 E.00173
; LINE_WIDTH: 0.297473
G1 X79.523 Y93.57 E.00157
M204 S10000
G1 X79.545 Y93.333 F42000
; LINE_WIDTH: 0.212756
G1 F1315
M204 S6000
G1 X79.457 Y93.231 E.00187
; LINE_WIDTH: 0.156497
G1 X79.452 Y93.226 E.00007
G3 X77.031 Y90.396 I10.875 J-11.755 E.03455
G1 X76.931 Y90.215 E.00191
; LINE_WIDTH: 0.202093
G3 X76.913 Y89.835 I.528 J-.215 E.00502
; LINE_WIDTH: 0.156715
G1 X76.93 Y89.786 E.00048
G3 X79.193 Y87.033 I11.007 J6.742 E.03315
G1 X79.424 Y86.804 E.00302
; LINE_WIDTH: 0.206137
G2 X79.542 Y86.67 I-1.448 J-1.389 E.00238
M204 S10000
G1 X79.656 Y86.503 F42000
; LINE_WIDTH: 0.329246
G1 F1315
M204 S6000
G3 X79.931 Y86.281 I1.879 J2.054 E.00826
G1 X80.158 Y86.111 E.00662
G1 X80.291 Y85.85 E.00683
M204 S10000
G1 X79.912 Y86.117 F42000
; LINE_WIDTH: 0.291593
G1 F1315
M204 S6000
G1 X79.364 Y86.953 E.02026
; WIPE_START
G1 F15000
G1 X79.912 Y86.117 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.168 Y90.489 Z11.5 F42000
G1 X86.985 Y91.06 Z11.5
G1 Z11.1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.378512
G1 F1315
M204 S5000
G1 X86.669 Y91.021 E.0087
G1 X86.669 Y88.979 E.05583
G1 X86.985 Y88.94 E.0087
G1 X86.985 Y91 E.05635
; WIPE_START
G1 F12000
M204 S6000
G1 X86.669 Y91.021 E-.1202
G1 X86.669 Y89.337 E-.6398
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.464 Y86.846 Z11.5 F42000
G1 Z11.1
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F1315
M204 S5000
G1 X85.464 Y93.154 E.1938
G1 X87.233 Y93.055 E.05445
G1 X87.268 Y93.696 E.01972
G1 X86.994 Y93.711 E.00843
G1 X86.986 Y93.573 E.00426
G1 X84.991 Y93.684 E.06141
G1 X84.959 Y93.664 E.00114
G1 X84.959 Y92.904 E.02335
G1 X84.82 Y92.904 E.00427
G1 X84.82 Y87.096 E.17847
G1 X84.959 Y87.096 E.00427
G1 X84.958 Y86.351 E.02289
G3 X84.975 Y86.317 I.036 J-.003 E.00121
G1 X86.986 Y86.427 E.0619
G1 X86.994 Y86.289 E.00425
G1 X87.268 Y86.304 E.00843
G1 X87.233 Y86.945 E.01971
G1 X85.524 Y86.85 E.05261
M204 S10000
G1 X85.211 Y87.292 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.175054
G1 F1315
M204 S6000
G1 X85.193 Y87.33 E.00045
; LINE_WIDTH: 0.2128
G1 X85.174 Y87.367 E.00058
; LINE_WIDTH: 0.250547
G1 X85.155 Y87.405 E.00071
; LINE_WIDTH: 0.29511
G1 X85.142 Y87.418 E.00037
G1 X85.142 Y92.582 E.10612
G1 X85.155 Y92.595 E.00037
; LINE_WIDTH: 0.250544
G1 X85.174 Y92.633 E.00071
; LINE_WIDTH: 0.21279
G1 X85.193 Y92.67 E.00058
; LINE_WIDTH: 0.155298
G1 X85.211 Y92.708 E.00039
G1 X85.221 Y93.408 E.00641
G1 X87.051 Y93.317 E.01678
; WIPE_START
G1 F15000
G1 X85.221 Y93.408 E-.69634
G1 X85.219 Y93.24 E-.06366
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.211 Y87.292 Z11.5 F42000
G1 Z11.1
G1 E.8 F1800
; LINE_WIDTH: 0.154402
G1 F1315
M204 S6000
G1 X85.22 Y86.593 E.00635
G1 X87.051 Y86.683 E.01665
; WIPE_START
G1 F15000
G1 X85.22 Y86.593 E-.69651
G1 X85.218 Y86.76 E-.06349
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.835 Y87.254 Z11.5 F42000
G1 X93.082 Y87.27 Z11.5
G1 Z11.1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1315
M204 S5000
G1 X91.63 Y87.189 E.04469
G1 X91.666 Y86.548 E.01972
G1 X91.938 Y86.564 E.00836
G1 X91.93 Y86.702 E.00426
G1 X93.579 Y86.799 E.05076
G1 X93.583 Y87.533 E.02255
G1 X93.585 Y87.933 E.01229
G1 X93.621 Y87.933 E.00111
G1 X93.724 Y87.931 E.00315
G1 X93.724 Y88.041 E.0034
G1 X93.724 Y88.432 E.01202
G1 X93.082 Y88.452 E.01972
G1 X93.082 Y87.33 E.0345
M204 S10000
G1 X93.528 Y88.186 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.154459
G1 F1315
M204 S6000
G3 X93.344 Y88.182 I-.08 J-.459 E.00168
G1 X93.325 Y87.04 E.01038
G1 X91.84 Y86.949 E.01352
; WIPE_START
G1 F15000
G1 X93.325 Y87.04 E-.56524
G1 X93.333 Y87.553 E-.19476
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.082 Y92.73 Z11.5 F42000
G1 Z11.1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1315
M204 S5000
G1 X93.082 Y91.548 E.03634
G1 X93.724 Y91.568 E.01971
G1 X93.724 Y91.959 E.01202
G1 X93.724 Y92.069 E.00339
G1 X93.621 Y92.067 E.00315
G1 X93.585 Y92.066 E.00111
G1 X93.582 Y92.466 E.01229
G1 X93.577 Y93.202 E.02262
G1 X91.93 Y93.298 E.0507
G1 X91.938 Y93.436 E.00425
G1 X91.666 Y93.452 E.00836
G1 X91.63 Y92.811 E.01972
G1 X93.022 Y92.734 E.04285
; WIPE_START
M73 P75 R4
G1 F12000
M204 S6000
G1 X93.082 Y91.548 E-.45125
G1 X93.724 Y91.568 E-.24379
G1 X93.724 Y91.738 E-.06496
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.528 Y91.813 Z11.5 F42000
G1 Z11.1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.154206
G1 F1315
M204 S6000
G2 X93.344 Y91.818 I-.08 J.461 E.00167
G1 X93.325 Y92.959 E.01035
G1 X91.84 Y93.051 E.0135
; CHANGE_LAYER
; Z_HEIGHT: 11.3
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X93.325 Y92.959 E-.5656
G1 X93.334 Y92.447 E-.1944
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 57/111
; update layer progress
M73 L57
M991 S0 P56 ;notify layer change

M106 S204
; OBJECT_ID: 427
M204 S10000
G17
G3 Z11.5 I.178 J-1.204 P1  F42000
G1 X77.158 Y90.061 Z11.5
G1 Z11.3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G2 X77.223 Y90.259 I.539 J-.068 E.00645
G2 X80.876 Y93.999 I11.515 J-7.592 E.16161
G3 X80.97 Y94.091 I-.286 J.389 E.00406
G1 X80.97 Y94.784 E.0213
G3 X80.025 Y94.162 I8.952 J-14.627 E.03478
G1 X79.605 Y93.848 E.01611
G1 X79.285 Y93.608 E.01229
G1 X78.906 Y93.298 E.01504
G3 X78.71 Y93.097 I1.186 J-1.356 E.00863
G1 X78.659 Y93.022 E.00278
G1 X78.652 Y92.914 E.00333
G1 X78.59 Y92.789 E.00428
G1 X78.587 Y92.785 E.00016
G1 X78.409 Y92.554 E.00895
G1 X78.14 Y92.258 E.01229
G1 X77.952 Y92.051 E.00861
G3 X76.642 Y90.267 I9.865 J-8.615 E.06809
G3 X76.704 Y89.613 I.67 J-.266 E.02096
G3 X77.618 Y88.347 I13.227 J8.584 E.04799
G1 X77.983 Y87.929 E.01706
G1 X78.246 Y87.627 E.01229
G1 X78.509 Y87.326 E.01229
G1 X78.587 Y87.215 E.00416
G1 X78.59 Y87.211 E.00018
G1 X78.648 Y87.094 E.004
G1 X78.659 Y87.022 E.00224
G1 X78.659 Y86.978 E.00133
G1 X78.709 Y86.904 E.00276
G3 X78.918 Y86.693 I1.188 J.964 E.00913
G1 X79.093 Y86.547 E.00701
G1 X79.285 Y86.392 E.00759
G1 X79.606 Y86.153 E.01229
G1 X79.927 Y85.914 E.01229
G1 X80.125 Y85.773 E.00746
G3 X80.971 Y85.215 I11.382 J16.331 E.03114
G1 X80.971 Y85.909 E.0213
G3 X80.493 Y86.281 I-2.211 J-2.348 E.01863
G2 X77.181 Y89.823 I8.118 J10.909 E.14981
G2 X77.154 Y90.001 I.516 J.17 E.00558
; WIPE_START
G1 F12000
M204 S6000
G1 X77.223 Y90.259 E-.10148
G1 X77.887 Y91.182 E-.43197
G1 X78.27 Y91.639 E-.22655
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z11.7 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z11.7
G1 X0 Y90.0001 F18000 ; move to safe pos
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
            G0 Z11.7 F4000
            G39.3 S1
            G0 Z11.7 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X78.687 Y92.585 F42000
G1 Z11.3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.332508
G1 F1200
M204 S6000
G2 X79.203 Y93.1 I4.403 J-3.897 E.01722
G1 X79.493 Y93.346 E.00898
; LINE_WIDTH: 0.300661
G1 X79.624 Y93.624 E.00645
M204 S10000
G1 X79.17 Y93.261 F42000
; LINE_WIDTH: 0.288243
G1 F1200
M204 S6000
G1 X78.945 Y92.812 E.01004
; LINE_WIDTH: 0.250449
G1 X78.888 Y92.733 E.00165
; LINE_WIDTH: 0.217912
G1 X78.83 Y92.654 E.00139
; LINE_WIDTH: 0.15721
G3 X77.008 Y90.391 I13.977 J-13.117 E.02709
G1 X76.947 Y90.285 E.00114
; LINE_WIDTH: 0.197695
G3 X76.887 Y89.86 I.488 J-.285 E.00555
; LINE_WIDTH: 0.157609
G3 X76.929 Y89.749 I1.102 J.352 E.00111
G3 X78.543 Y87.672 I10.862 J6.774 E.02463
G1 X78.772 Y87.415 E.00322
; LINE_WIDTH: 0.203975
G1 X78.883 Y87.273 E.00236
; LINE_WIDTH: 0.246277
G1 X78.935 Y87.201 E.00147
; LINE_WIDTH: 0.289735
G1 X79.187 Y86.723 E.01087
M204 S10000
G1 X79.631 Y86.538 F42000
; LINE_WIDTH: 0.331967
G1 F1200
M204 S6000
G2 X78.695 Y87.403 I4.781 J6.115 E.03008
; WIPE_START
G1 F15000
G1 X79.145 Y86.951 E-.38008
G1 X79.631 Y86.538 E-.37992
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.281 Y90.285 Z11.7 F42000
G1 X86.969 Y90.673 Z11.7
G1 Z11.3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.378512
G1 F1200
M204 S5000
G3 X86.654 Y90.609 I1.021 J-5.897 E.0088
G3 X86.654 Y89.391 I1292.336 J-.652 E.03331
G3 X86.969 Y89.327 I1.451 J6.345 E.00881
G1 X86.969 Y90.613 E.03516
; WIPE_START
G1 F12000
M204 S6000
G1 X86.654 Y90.609 E-.11994
G1 X86.654 Y89.391 E-.4629
G1 X86.969 Y89.327 E-.12238
G1 X86.969 Y89.471 E-.05477
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.448 Y86.84 Z11.7 F42000
G1 Z11.3
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X85.448 Y93.16 E.19418
G1 X87.218 Y93.061 E.05445
G1 X87.252 Y93.702 E.01972
G1 X86.978 Y93.717 E.00843
G1 X86.97 Y93.579 E.00426
G1 X84.975 Y93.69 E.06141
G1 X84.943 Y93.67 E.00114
G1 X84.943 Y92.904 E.02354
G1 X84.804 Y92.904 E.00427
G1 X84.804 Y87.096 E.17847
G1 X84.943 Y87.096 E.00427
G1 X84.943 Y86.345 E.02308
G3 X84.959 Y86.311 I.036 J-.003 E.00121
G1 X86.971 Y86.421 E.0619
G1 X86.978 Y86.283 E.00425
G1 X87.252 Y86.298 E.00843
G1 X87.218 Y86.939 E.01972
G1 X85.508 Y86.844 E.05261
M204 S10000
G1 X85.196 Y86.79 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.153942
G1 F1200
M204 S6000
G3 X85.205 Y86.587 I.506 J-.078 E.00184
G1 X87.035 Y86.677 E.01658
; WIPE_START
G1 F15000
G1 X85.205 Y86.587 E-.69651
G1 X85.197 Y86.754 E-.06349
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.126 Y88.317 Z11.7 F42000
G1 Z11.3
G1 E.8 F1800
; LINE_WIDTH: 0.29521
G1 F1200
M204 S6000
G1 X85.126 Y91.683 E.06918
; WIPE_START
G1 F15000
G1 X85.126 Y89.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.196 Y93.21 Z11.7 F42000
G1 Z11.3
G1 E.8 F1800
; LINE_WIDTH: 0.154656
G1 F1200
M204 S6000
G2 X85.205 Y93.414 I.496 J.078 E.00187
G1 X87.035 Y93.323 E.01668
; WIPE_START
G1 F15000
G1 X85.205 Y93.414 E-.69634
G1 X85.197 Y93.247 E-.06366
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.279 Y88.635 Z11.7 F42000
G1 X93.087 Y87.265 Z11.7
G1 Z11.3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X91.635 Y87.184 E.04469
G1 X91.671 Y86.544 E.01972
G1 X91.943 Y86.559 E.00836
G1 X91.935 Y86.697 E.00426
G1 X93.556 Y86.787 E.04988
G3 X93.59 Y86.811 I.008 J.025 E.00147
G1 X93.59 Y87.407 E.01832
G1 X93.591 Y87.807 E.01229
G1 X93.626 Y87.807 E.00109
G1 X93.729 Y87.805 E.00316
G1 X93.729 Y87.89 E.00261
G1 X93.729 Y88.231 E.01048
G1 X93.088 Y88.245 E.01972
G1 X93.087 Y87.325 E.02829
M204 S10000
G1 X93.339 Y88.044 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.154084
G1 F1200
M204 S6000
G1 X93.33 Y87.035 E.00914
G1 X91.845 Y86.944 E.01347
; WIPE_START
G1 F15000
G1 X93.33 Y87.035 E-.56523
G1 X93.335 Y87.548 E-.19478
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.087 Y92.735 Z11.7 F42000
G1 Z11.3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X93.088 Y91.755 E.03013
G1 X93.729 Y91.769 E.01972
G1 X93.729 Y92.11 E.01047
G1 X93.729 Y92.195 E.00261
G1 X93.626 Y92.194 E.00316
G1 X93.59 Y92.193 E.00109
G1 X93.586 Y92.593 E.01229
G1 X93.579 Y93.209 E.01893
G1 X91.935 Y93.303 E.05059
G1 X91.943 Y93.441 E.00426
G1 X91.671 Y93.456 E.00836
G1 X91.635 Y92.816 E.01972
G1 X93.027 Y92.739 E.04285
M204 S10000
G1 X93.339 Y91.956 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.154054
G1 F1200
M204 S6000
G1 X93.33 Y92.965 E.00913
G1 X91.845 Y93.056 E.01347
; CHANGE_LAYER
; Z_HEIGHT: 11.5
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X93.33 Y92.965 E-.5654
G1 X93.335 Y92.453 E-.1946
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 58/111
; update layer progress
M73 L58
M991 S0 P57 ;notify layer change

; OBJECT_ID: 427
M204 S10000
G17
G3 Z11.7 I.18 J-1.204 P1  F42000
G1 X77.134 Y90.031 Z11.7
G1 Z11.5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G2 X77.186 Y90.225 I.498 J-.031 E.00619
G2 X80.204 Y93.501 I11.559 J-7.619 E.13747
G3 X80.303 Y93.609 I-.356 J.426 E.00452
G1 X80.303 Y94.313 E.02163
G3 X79.554 Y93.771 I9.11 J-13.369 E.0284
G1 X79.231 Y93.504 E.0129
G1 X78.923 Y93.248 E.01229
G1 X78.616 Y92.992 E.01229
G1 X78.56 Y92.942 E.0023
G1 X78.321 Y92.722 E.00998
G3 X78.048 Y92.423 I1.345 J-1.502 E.01245
G1 X77.994 Y92.334 E.0032
G1 X77.992 Y92.329 E.00018
G1 X77.992 Y92.276 E.00161
G1 X77.982 Y92.205 E.00221
G1 X77.93 Y92.088 E.00394
G1 X77.929 Y92.087 E.00005
G1 X77.757 Y91.835 E.00937
G1 X77.51 Y91.52 E.01229
G1 X77.174 Y91.092 E.01672
G3 X76.613 Y90.234 I5.689 J-4.332 E.03155
G3 X76.688 Y89.613 I.687 J-.232 E.01986
G3 X77.237 Y88.827 I16.068 J10.646 E.02946
G1 X77.359 Y88.667 E.00619
G1 X77.605 Y88.352 E.01229
G1 X77.852 Y88.037 E.01229
G1 X77.929 Y87.913 E.00448
G1 X77.982 Y87.794 E.00401
G1 X77.992 Y87.725 E.00214
G1 X77.992 Y87.67 E.00168
G1 X77.994 Y87.665 E.00017
G1 X78.048 Y87.578 E.00315
G3 X78.251 Y87.345 I1.377 J.999 E.0095
G1 X78.381 Y87.223 E.00546
G1 X78.618 Y87.009 E.00982
G1 X78.92 Y86.747 E.01229
G1 X79.158 Y86.553 E.00943
G3 X80.303 Y85.685 I12.813 J15.717 E.04417
G1 X80.303 Y86.391 E.0217
G3 X80.206 Y86.497 I-.459 J-.324 E.00442
G2 X77.184 Y89.781 I8.507 J10.861 E.13772
G2 X77.134 Y89.971 I.448 J.22 E.0061
; WIPE_START
G1 F12000
M204 S6000
G1 X77.186 Y90.225 E-.09829
G1 X77.528 Y90.722 E-.22944
G1 X77.94 Y91.263 E-.25856
G1 X78.24 Y91.609 E-.17371
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z11.9 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z11.9
G1 X0 Y90.0001 F18000 ; move to safe pos
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
            G0 Z11.9 F4000
            G39.3 S1
            G0 Z11.9 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X78.176 Y91.968 F42000
G1 Z11.5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.158213
G1 F1200
M204 S6000
G3 X76.959 Y90.336 I17.744 J-14.509 E.01913
G1 X76.897 Y90.217 E.00126
; LINE_WIDTH: 0.201551
G3 X76.884 Y89.818 I.517 J-.217 E.00528
; LINE_WIDTH: 0.158295
G3 X77.668 Y88.676 I5.92 J3.224 E.01304
G1 X78.167 Y88.046 E.00755
; LINE_WIDTH: 0.211426
G1 X78.227 Y87.954 E.00151
; LINE_WIDTH: 0.258066
G2 X78.602 Y87.288 I-4.526 J-2.984 E.01341
M204 S10000
G1 X78.964 Y87.138 F42000
; LINE_WIDTH: 0.327533
G1 F1200
M204 S6000
G1 X78.603 Y87.48 E.01152
G2 X78.325 Y87.773 I2.229 J2.389 E.00936
; WIPE_START
G1 F15000
G1 X78.603 Y87.48 E-.34057
G1 X78.964 Y87.138 E-.41943
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.604 Y92.715 Z11.9 F42000
G1 Z11.5
G1 E.8 F1800
; LINE_WIDTH: 0.257485
G1 F1200
M204 S6000
G2 X78.222 Y92.038 I-4.843 J2.281 E.01361
; LINE_WIDTH: 0.212367
G1 X78.176 Y91.968 E.00115
M204 S10000
G1 X78.326 Y92.227 F42000
; LINE_WIDTH: 0.326789
G1 F1200
M204 S6000
G2 X78.965 Y92.862 I4.858 J-4.253 E.02085
; WIPE_START
G1 F15000
G1 X78.556 Y92.474 E-.47505
G1 X78.326 Y92.227 E-.28495
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.433 Y93.166 Z11.9 F42000
G1 Z11.5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X87.202 Y93.067 E.05445
G1 X87.236 Y93.708 E.01972
G1 X86.962 Y93.723 E.00843
G1 X86.955 Y93.585 E.00426
G1 X84.938 Y93.693 E.06207
G1 X84.926 Y92.904 E.02424
G1 X84.788 Y92.904 E.00425
G1 X84.788 Y92.539 E.01123
G1 X85.432 Y92.539 E.0198
G1 X85.433 Y93.106 E.01743
M204 S10000
G1 X85.179 Y92.735 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.154995
G1 F1200
M204 S6000
G1 X85.19 Y93.42 E.00626
G1 X87.02 Y93.329 E.01673
; WIPE_START
G1 F15000
G1 X85.19 Y93.42 E-.69606
G1 X85.188 Y93.252 E-.06394
; WIPE_END
G1 E-.04 F1800
M204 S10000
M73 P76 R4
G1 X85.433 Y86.834 Z11.9 F42000
G1 Z11.5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X85.432 Y87.461 E.01927
G1 X84.788 Y87.461 E.0198
G1 X84.788 Y87.096 E.01123
G1 X84.926 Y87.096 E.00425
G1 X84.938 Y86.307 E.02425
G1 X86.955 Y86.415 E.06205
G1 X86.962 Y86.277 E.00426
G1 X87.236 Y86.292 E.00843
G1 X87.202 Y86.933 E.01972
G1 X85.493 Y86.838 E.05261
M204 S10000
G1 X85.179 Y87.265 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.154996
G1 F1200
M204 S6000
G1 X85.19 Y86.58 E.00626
G1 X87.02 Y86.671 E.01673
; WIPE_START
G1 F15000
G1 X85.19 Y86.58 E-.69607
G1 X85.188 Y86.748 E-.06393
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.804 Y87.241 Z11.9 F42000
G1 X93.093 Y87.26 Z11.9
G1 Z11.5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X91.64 Y87.179 E.04469
G1 X91.677 Y86.539 E.01972
G1 X91.948 Y86.554 E.00836
G1 X91.94 Y86.692 E.00426
G1 X93.587 Y86.788 E.05069
G1 X93.592 Y87.303 E.01585
G1 X93.596 Y87.703 E.01229
G1 X93.632 Y87.703 E.0011
G1 X93.734 Y87.702 E.00315
G1 X93.734 Y87.764 E.00191
G1 X93.734 Y88.076 E.00958
G1 X93.093 Y88.087 E.01972
G1 X93.093 Y87.32 E.02358
M204 S10000
G1 X93.344 Y87.886 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.153956
G1 F1200
M204 S6000
G1 X93.335 Y87.03 E.00775
G1 X91.85 Y86.939 E.01345
; WIPE_START
G1 F15000
G1 X93.335 Y87.03 E-.56506
G1 X93.34 Y87.543 E-.19494
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.093 Y92.74 Z11.9 F42000
G1 Z11.5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X93.093 Y91.913 E.02542
G1 X93.734 Y91.924 E.01972
G1 X93.734 Y92.236 E.00958
G1 X93.734 Y92.298 E.00191
G1 X93.631 Y92.297 E.00315
G1 X93.595 Y92.297 E.00111
G1 X93.595 Y92.697 E.01229
G1 X93.596 Y93.195 E.01531
G1 X93.583 Y93.215 E.00072
G1 X91.94 Y93.308 E.05056
G1 X91.948 Y93.446 E.00426
G1 X91.677 Y93.461 E.00836
G1 X91.64 Y92.821 E.01971
G1 X93.033 Y92.744 E.04285
M204 S10000
G1 X93.344 Y92.114 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.153945
G1 F1200
M204 S6000
G1 X93.335 Y92.97 E.00775
G1 X91.85 Y93.061 E.01346
; CHANGE_LAYER
; Z_HEIGHT: 11.7
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X93.335 Y92.97 E-.56537
G1 X93.34 Y92.458 E-.19463
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 59/111
; update layer progress
M73 L59
M991 S0 P58 ;notify layer change

; OBJECT_ID: 427
M204 S10000
G17
G3 Z11.9 I.177 J-1.204 P1  F42000
G1 X77.126 Y90.078 Z11.9
G1 Z11.7
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G2 X77.176 Y90.23 I.503 J-.079 E.00494
G2 X79.605 Y93.021 I13.125 J-8.973 E.11396
G1 X79.637 Y93.066 E.00167
G1 X79.637 Y93.789 E.02223
G3 X78.456 Y92.788 I10.044 J-13.039 E.0476
G1 X78.237 Y92.577 E.00934
G1 X77.951 Y92.297 E.01229
G1 X77.76 Y92.102 E.00837
G1 X77.533 Y91.855 E.01031
G3 X77.421 Y91.709 I1.291 J-1.104 E.00565
G1 X77.353 Y91.6 E.00397
G1 X77.332 Y91.559 E.00141
G1 X77.327 Y91.546 E.00044
G1 X77.325 Y91.465 E.00249
G1 X77.308 Y91.385 E.0025
G1 X77.267 Y91.284 E.00333
G1 X77.264 Y91.279 E.00018
G1 X77.045 Y90.944 E.01229
G1 X76.826 Y90.61 E.01229
G1 X76.632 Y90.313 E.0109
G3 X76.738 Y89.515 I.699 J-.313 E.02604
G1 X76.875 Y89.317 E.0074
G1 X77.103 Y88.988 E.01229
G1 X77.266 Y88.718 E.00968
G1 X77.266 Y88.717 E.00004
G1 X77.298 Y88.643 E.00246
G1 X77.323 Y88.556 E.00278
G1 X77.324 Y88.462 E.00288
G1 X77.325 Y88.46 E.00006
G1 X77.332 Y88.44 E.00067
G1 X77.354 Y88.398 E.00144
G1 X77.399 Y88.324 E.00267
G3 X77.683 Y87.979 I1.914 J1.288 E.01376
G1 X77.912 Y87.74 E.01016
G1 X77.951 Y87.701 E.0017
G1 X78.238 Y87.422 E.01229
G1 X78.526 Y87.146 E.01227
G3 X79.636 Y86.214 I11.146 J12.138 E.04454
G1 X79.636 Y86.935 E.02216
G3 X79.535 Y87.057 I-.561 J-.358 E.00487
G2 X77.172 Y89.775 I9.492 J10.639 E.11095
G2 X77.121 Y90.018 I.457 J.224 E.00773
; WIPE_START
G1 F12000
M204 S6000
G1 X77.176 Y90.23 E-.08323
G1 X77.716 Y90.989 E-.35407
G1 X78.258 Y91.643 E-.3227
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z12.1 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z12.1
G1 X0 Y90.0001 F18000 ; move to safe pos
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
            G0 Z12.1 F4000
            G39.3 S1
            G0 Z12.1 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X78.166 Y92.045 F42000
G1 Z11.7
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.31328
G1 F1200
M204 S6000
G1 X78.119 Y91.995 E.00151
G3 X77.646 Y91.423 I1.877 J-2.034 E.0164
G1 X77.423 Y90.924 E.01204
M204 S10000
G1 X77.592 Y91.307 F42000
; LINE_WIDTH: 0.215745
G1 F1200
M204 S6000
G2 X77.514 Y91.171 I-1.531 J.789 E.00221
; LINE_WIDTH: 0.160652
G1 X76.906 Y90.266 E.01046
; LINE_WIDTH: 0.199531
G3 X76.867 Y89.826 I.516 J-.267 E.00578
; LINE_WIDTH: 0.159988
G3 X77.079 Y89.461 I1.492 J.619 E.00404
G1 X77.438 Y88.945 E.006
; LINE_WIDTH: 0.193947
G1 X77.565 Y88.744 E.00293
; LINE_WIDTH: 0.235386
G1 X77.601 Y88.675 E.00122
; LINE_WIDTH: 0.263307
G1 X77.63 Y88.616 E.00118
; LINE_WIDTH: 0.284132
G1 X77.643 Y88.587 E.00062
; LINE_WIDTH: 0.325758
G3 X78.149 Y87.972 I2.538 J1.573 E.01842
G1 X78.166 Y87.954 E.00057
; WIPE_START
G1 F15000
G1 X78.149 Y87.972 E-.02291
G1 X77.794 Y88.366 E-.48984
G1 X77.643 Y88.587 E-.24724
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.217 Y92.464 Z12.1 F42000
G1 X85.417 Y93.172 Z12.1
G1 Z11.7
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X87.186 Y93.074 E.05445
G1 X87.221 Y93.714 E.01972
G1 X86.947 Y93.73 E.00843
G1 X86.939 Y93.591 E.00426
G1 X84.922 Y93.699 E.06207
G1 X84.911 Y92.904 E.02443
G1 X84.772 Y92.904 E.00425
G1 X84.772 Y92.633 E.00835
G1 X85.417 Y92.634 E.0198
G1 X85.417 Y93.112 E.0147
M204 S10000
G1 X85.164 Y92.829 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.154891
G1 F1200
M204 S6000
G1 X85.174 Y93.427 E.00545
G1 X87.004 Y93.336 E.01671
; WIPE_START
G1 F15000
G1 X85.174 Y93.427 E-.69607
G1 X85.171 Y93.258 E-.06393
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.417 Y86.828 Z12.1 F42000
G1 Z11.7
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X85.417 Y87.368 E.01659
G1 X84.772 Y87.368 E.0198
G1 X84.772 Y87.096 E.00836
G1 X84.911 Y87.096 E.00425
G1 X84.92 Y86.303 E.02437
G1 X86.939 Y86.409 E.06212
G1 X86.947 Y86.271 E.00426
G1 X87.221 Y86.286 E.00843
G1 X87.186 Y86.926 E.01972
G1 X85.477 Y86.831 E.05261
M204 S10000
G1 X85.164 Y87.172 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.154914
G1 F1200
M204 S6000
G1 X85.174 Y86.573 E.00546
G1 X87.004 Y86.664 E.01672
; WIPE_START
G1 F15000
G1 X85.174 Y86.573 E-.69607
G1 X85.171 Y86.742 E-.06393
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.788 Y87.235 Z12.1 F42000
G1 X93.098 Y87.255 Z12.1
G1 Z11.7
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X91.646 Y87.174 E.04469
G1 X91.682 Y86.534 E.01972
G1 X91.953 Y86.549 E.00836
G1 X91.945 Y86.687 E.00426
G1 X93.593 Y86.783 E.0507
G1 X93.597 Y87.219 E.01341
G1 X93.602 Y87.619 E.01229
G1 X93.637 Y87.619 E.00107
G1 X93.74 Y87.618 E.00316
G1 X93.739 Y87.661 E.00132
G1 X93.739 Y87.955 E.00903
G1 X93.098 Y87.964 E.01972
G1 X93.098 Y87.315 E.01994
M204 S10000
G1 X93.35 Y87.764 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.154167
G1 F1200
M204 S6000
G1 X93.34 Y87.025 E.0067
G1 X91.856 Y86.934 E.01348
; WIPE_START
G1 F15000
G1 X93.34 Y87.025 E-.56514
G1 X93.347 Y87.538 E-.19486
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.098 Y92.745 Z12.1 F42000
G1 Z11.7
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X93.098 Y92.036 E.02179
G1 X93.195 Y92.038 E.00299
G1 X93.739 Y92.045 E.01672
G1 X93.739 Y92.339 E.00903
G1 X93.74 Y92.382 E.00132
G1 X93.636 Y92.381 E.00317
G1 X93.602 Y92.381 E.00106
G1 X93.596 Y92.781 E.01229
G1 X93.589 Y93.219 E.01348
G1 X91.945 Y93.313 E.05059
G1 X91.953 Y93.451 E.00426
G1 X91.682 Y93.466 E.00836
G1 X91.646 Y92.826 E.01972
G1 X93.038 Y92.749 E.04285
M204 S10000
G1 X93.35 Y92.236 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.154102
G1 F1200
M204 S6000
G1 X93.34 Y92.975 E.0067
G1 X91.856 Y93.066 E.01347
; CHANGE_LAYER
; Z_HEIGHT: 11.9
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X93.34 Y92.975 E-.56517
G1 X93.347 Y92.462 E-.19483
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 60/111
; update layer progress
M73 L60
M991 S0 P59 ;notify layer change

; OBJECT_ID: 427
M204 S10000
G17
G3 Z12.1 I.177 J-1.204 P1  F42000
G1 X77.118 Y90.073 Z12.1
G1 Z11.9
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G2 X77.186 Y90.266 I.54 J-.081 E.00633
G2 X78.934 Y92.397 I13.913 J-9.632 E.08481
G1 X78.969 Y92.452 E.00198
G1 X78.968 Y93.195 E.02284
G3 X78.246 Y92.528 I11.348 J-13.015 E.0302
G1 X77.874 Y92.149 E.01634
G1 X77.596 Y91.862 E.01229
G1 X77.285 Y91.509 E.01444
G1 X77.233 Y91.45 E.00241
G1 X76.933 Y91.087 E.01446
G3 X76.724 Y90.778 I2.328 J-1.799 E.01148
G1 X76.668 Y90.661 E.004
G1 X76.659 Y90.636 E.00081
G1 X76.658 Y90.63 E.00019
G1 X76.659 Y90.549 E.00247
G1 X76.648 Y90.48 E.00217
G1 X76.608 Y90.354 E.00405
G1 X76.557 Y90.164 E.00603
G1 X76.547 Y89.994 E.00522
G3 X76.61 Y89.641 I1.046 J.005 E.01108
G1 X76.648 Y89.52 E.00391
G1 X76.658 Y89.45 E.00215
G1 X76.658 Y89.37 E.00246
G1 X76.659 Y89.365 E.00015
G1 X76.668 Y89.339 E.00084
G1 X76.724 Y89.222 E.00399
G1 X76.769 Y89.145 E.00277
G3 X76.947 Y88.895 I2.204 J1.381 E.00943
G1 X77.227 Y88.556 E.01351
G1 X77.283 Y88.493 E.00258
G1 X77.589 Y88.146 E.01423
G1 X77.867 Y87.858 E.01229
G1 X78.215 Y87.499 E.01536
G3 X78.969 Y86.803 I11.549 J11.758 E.03155
G1 X78.969 Y87.547 E.02287
G3 X78.865 Y87.69 I-.664 J-.373 E.00546
G2 X77.136 Y89.83 I9.501 J9.443 E.08467
G2 X77.112 Y90.013 I.521 J.162 E.0057
; WIPE_START
G1 F12000
M204 S6000
G1 X77.186 Y90.266 E-.10007
G1 X77.704 Y90.983 E-.33625
G1 X77.987 Y91.337 E-.17228
G1 X78.253 Y91.634 E-.1514
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z12.3 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z12.3
G1 X0 Y90.0001 F18000 ; move to safe pos
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
            G0 Z12.3 F4000
            G39.3 S1
            G0 Z12.3 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X77.65 Y91.434 F42000
G1 Z11.9
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.308141
G1 F1200
M204 S6000
G3 X76.981 Y90.535 I3.332 J-3.18 E.02428
G1 X76.748 Y89.883 E.01497
M204 S10000
G1 X76.748 Y90.116 F42000
; LINE_WIDTH: 0.308619
G1 F1200
M204 S6000
G1 X76.981 Y89.464 E.01499
G3 X77.514 Y88.727 I3.837 J2.213 E.01973
G1 X77.648 Y88.569 E.00448
; WIPE_START
G1 F15000
G1 X77.514 Y88.727 E-.08689
G1 X77.129 Y89.221 E-.26302
G1 X76.981 Y89.464 E-.11945
G1 X76.748 Y90.116 E-.29064
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X76.936 Y89.579 Z12.3 F42000
G1 Z11.9
G1 E.8 F1800
; LINE_WIDTH: 0.226612
G1 F1200
M204 S6000
G1 X76.93 Y89.592 E.00022
G2 X76.935 Y90.42 I.758 J.409 E.01292
G1 X77.197 Y91.098 E.01089
; WIPE_START
G1 F15000
G1 X76.935 Y90.42 E-.34512
G1 X76.851 Y90.191 E-.11531
G1 X76.825 Y89.996 E-.09362
G1 X76.854 Y89.8 E-.09386
G1 X76.93 Y89.592 E-.10512
G1 X76.936 Y89.579 E-.00697
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.96 Y92.565 Z12.3 F42000
G1 X85.401 Y93.178 Z12.3
G1 Z11.9
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X87.17 Y93.08 E.05445
G1 X87.205 Y93.72 E.01972
G1 X86.931 Y93.736 E.00843
G1 X86.923 Y93.597 E.00426
G1 X84.906 Y93.705 E.06206
G1 X84.895 Y92.904 E.02462
G1 X84.757 Y92.904 E.00425
G1 X84.757 Y92.632 E.00836
G1 X85.401 Y92.632 E.0198
G1 X85.401 Y93.118 E.01493
M204 S10000
M73 P77 R4
G1 X85.148 Y92.828 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.15491
G1 F1200
M204 S6000
G1 X85.159 Y93.433 E.00552
G1 X86.988 Y93.342 E.01672
; WIPE_START
G1 F15000
G1 X85.159 Y93.433 E-.69607
G1 X85.156 Y93.264 E-.06394
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.401 Y86.822 Z12.3 F42000
G1 Z11.9
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X85.401 Y87.368 E.01678
G1 X84.757 Y87.368 E.0198
G1 X84.757 Y87.096 E.00836
G1 X84.896 Y87.096 E.00427
G1 X84.905 Y86.297 E.02456
G1 X86.923 Y86.403 E.06212
G1 X86.931 Y86.264 E.00426
G1 X87.205 Y86.28 E.00843
G1 X87.171 Y86.92 E.01972
G1 X85.461 Y86.825 E.05261
M204 S10000
G1 X85.148 Y87.172 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.154942
G1 F1200
M204 S6000
G1 X85.158 Y86.568 E.00552
G1 X86.988 Y86.658 E.01673
; WIPE_START
G1 F15000
G1 X85.158 Y86.568 E-.69633
G1 X85.155 Y86.735 E-.06367
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.772 Y87.228 Z12.3 F42000
G1 X93.103 Y87.25 Z12.3
G1 Z11.9
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X91.651 Y87.169 E.04469
G1 X91.687 Y86.529 E.01972
G1 X91.959 Y86.544 E.00836
G1 X91.951 Y86.682 E.00426
G1 X93.599 Y86.78 E.05075
G1 X93.606 Y87.553 E.02374
G1 X93.643 Y87.552 E.00112
G1 X93.745 Y87.552 E.00314
G1 X93.745 Y87.577 E.00077
G1 X93.745 Y87.862 E.00878
G1 X93.103 Y87.869 E.01971
G1 X93.103 Y87.31 E.01719
M204 S10000
G1 X93.355 Y87.671 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.153997
G1 F1200
M204 S6000
G1 X93.345 Y87.02 E.00589
G1 X91.861 Y86.929 E.01346
; WIPE_START
G1 F15000
G1 X93.345 Y87.02 E-.56507
G1 X93.353 Y87.533 E-.19493
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.103 Y92.75 Z12.3 F42000
G1 Z11.9
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X93.103 Y92.131 E.01903
G1 X93.561 Y92.136 E.01406
G1 X93.745 Y92.138 E.00565
G1 X93.745 Y92.423 E.00878
G1 X93.745 Y92.448 E.00078
G1 X93.643 Y92.448 E.00314
G1 X93.606 Y92.447 E.00112
G1 X93.604 Y93.211 E.02348
G1 X93.588 Y93.226 E.00068
G1 X91.951 Y93.318 E.05039
G1 X91.959 Y93.456 E.00426
G1 X91.687 Y93.471 E.00836
G1 X91.651 Y92.831 E.01972
G1 X93.043 Y92.754 E.04285
M204 S10000
G1 X93.355 Y92.329 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.154009
G1 F1200
M204 S6000
G1 X93.345 Y92.98 E.00589
G1 X91.861 Y93.071 E.01346
; CHANGE_LAYER
; Z_HEIGHT: 12.1
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15000
G1 X93.345 Y92.98 E-.56507
G1 X93.353 Y92.467 E-.19493
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 61/111
; update layer progress
M73 L61
M991 S0 P60 ;notify layer change

; OBJECT_ID: 427
M204 S10000
G17
G3 Z12.3 I.175 J-1.204 P1  F42000
G1 X77.117 Y90.102 Z12.3
G1 Z12.1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G2 X77.289 Y90.43 I.595 J-.104 E.01156
G2 X78.264 Y91.689 I21.08 J-15.304 E.04893
G1 X78.302 Y91.757 E.0024
G1 X78.302 Y92.527 E.02365
G3 X77.439 Y91.612 I12.103 J-12.272 E.03866
G1 X77.196 Y91.328 E.01149
G1 X76.939 Y91.02 E.01229
G1 X76.617 Y90.599 E.01629
G1 X76.547 Y90.504 E.00364
G1 X76.502 Y90.438 E.00245
G1 X76.473 Y90.386 E.00184
G1 X76.428 Y90.283 E.00343
G3 X76.383 Y90.084 I.774 J-.282 E.00631
G3 X76.387 Y89.878 I.809 J-.084 E.00635
G3 X76.442 Y89.683 I.813 J.122 E.00622
G1 X76.491 Y89.583 E.00343
G1 X76.532 Y89.517 E.00238
G1 X76.617 Y89.401 E.00443
G1 X76.861 Y89.084 E.01229
G1 X77.01 Y88.893 E.00743
G3 X78.302 Y87.471 I12.583 J10.134 E.05907
G1 X78.302 Y88.242 E.02368
G3 X78.194 Y88.409 I-.838 J-.423 E.00615
G2 X77.153 Y89.77 I13.429 J11.352 E.05266
G2 X77.11 Y90.043 I.559 J.228 E.00857
; WIPE_START
G1 F12000
M204 S6000
G1 X77.156 Y90.234 E-.07465
G1 X77.289 Y90.43 E-.09017
G1 X77.693 Y90.976 E-.25801
G1 X78.247 Y91.669 E-.33716
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z12.5 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z12.5
G1 X0 Y90.0001 F18000 ; move to safe pos
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
            G0 Z12.5 F4000
            G39.3 S1
            G0 Z12.5 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X77.082 Y90.685 F42000
G1 Z12.1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.300463
G1 F1200
M204 S6000
G3 X76.866 Y90.385 I3.278 J-2.584 E.00776
G1 X76.822 Y90.312 E.00179
; LINE_WIDTH: 0.354733
G3 X76.775 Y89.791 I.53 J-.31 E.01373
G1 X76.786 Y89.761 E.00081
; LINE_WIDTH: 0.305059
G3 X77.081 Y89.316 I1.93 J.959 E.01144
; WIPE_START
G1 F15000
G1 X76.872 Y89.603 E-.50518
G1 X76.786 Y89.761 E-.25482
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.878 Y92.584 Z12.5 F42000
G1 X85.385 Y93.184 Z12.5
G1 Z12.1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X87.155 Y93.086 E.05445
G1 X87.189 Y93.727 E.01972
G1 X86.915 Y93.742 E.00843
G1 X86.908 Y93.603 E.00426
G1 X84.892 Y93.712 E.06203
G1 X84.879 Y92.904 E.02483
G1 X84.741 Y92.904 E.00425
G1 X84.741 Y92.632 E.00836
G1 X85.385 Y92.632 E.0198
G1 X85.385 Y93.124 E.01512
M204 S10000
G1 X85.132 Y92.828 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.154906
G1 F1200
M204 S6000
G1 X85.143 Y93.439 E.00557
G1 X86.973 Y93.348 E.01672
; WIPE_START
G1 F15000
G1 X85.143 Y93.439 E-.69607
G1 X85.14 Y93.271 E-.06393
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.385 Y86.816 Z12.5 F42000
G1 Z12.1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X85.385 Y87.368 E.01696
G1 X84.741 Y87.368 E.0198
G1 X84.741 Y87.096 E.00836
G1 X84.879 Y87.096 E.00425
G1 X84.889 Y86.29 E.02475
G1 X86.908 Y86.397 E.06211
G1 X86.915 Y86.258 E.00426
G1 X87.189 Y86.274 E.00843
G1 X87.155 Y86.914 E.01972
G1 X85.445 Y86.819 E.05261
M204 S10000
G1 X85.132 Y87.172 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.154925
G1 F1200
M204 S6000
G1 X85.143 Y86.561 E.00557
G1 X86.973 Y86.652 E.01672
; WIPE_START
G1 F15000
G1 X85.143 Y86.561 E-.69608
G1 X85.14 Y86.729 E-.06393
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.757 Y87.222 Z12.5 F42000
G1 X93.108 Y87.245 Z12.5
G1 Z12.1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X91.656 Y87.164 E.04469
G1 X91.692 Y86.524 E.01972
G1 X91.964 Y86.539 E.00836
G1 X91.956 Y86.677 E.00426
G1 X93.605 Y86.775 E.05075
G1 X93.612 Y87.502 E.02235
G1 X93.647 Y87.502 E.00106
G1 X93.75 Y87.502 E.00316
G1 X93.75 Y87.511 E.00027
G1 X93.75 Y87.794 E.00871
G1 X93.108 Y87.799 E.01971
G1 X93.108 Y87.305 E.01519
M204 S10000
G1 X93.361 Y87.601 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.154209
G1 F1200
M204 S6000
G1 X93.351 Y87.015 E.00531
G1 X91.866 Y86.924 E.01349
; WIPE_START
G1 F15000
G1 X93.351 Y87.015 E-.56519
G1 X93.359 Y87.528 E-.19481
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.108 Y92.755 Z12.5 F42000
G1 Z12.1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X93.108 Y92.201 E.01703
G1 X93.222 Y92.202 E.00348
G1 X93.75 Y92.206 E.01623
G1 X93.75 Y92.489 E.00871
G1 X93.75 Y92.498 E.00028
G1 X93.647 Y92.498 E.00316
G1 X93.611 Y92.498 E.00111
G1 X93.6 Y93.229 E.02248
G1 X91.956 Y93.323 E.05059
G1 X91.964 Y93.461 E.00426
G1 X91.692 Y93.476 E.00836
G1 X91.656 Y92.836 E.01972
G1 X93.048 Y92.759 E.04285
M204 S10000
G1 X93.36 Y92.399 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.153825
G1 F1200
M204 S6000
G1 X93.35 Y92.985 E.0053
G1 X91.866 Y93.076 E.01344
; CHANGE_LAYER
; Z_HEIGHT: 12.3
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X93.35 Y92.985 E-.56508
G1 X93.359 Y92.472 E-.19492
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 62/111
; update layer progress
M73 L62
M991 S0 P61 ;notify layer change

; OBJECT_ID: 427
M204 S10000
G17
G3 Z12.5 I.174 J-1.205 P1  F42000
G1 X77.111 Y90.131 Z12.5
G1 Z12.3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G2 X77.276 Y90.422 I.597 J-.146 E.01039
G3 X77.635 Y90.97 I-1.991 J1.695 E.02017
G1 X77.635 Y91.771 E.02461
G3 X76.529 Y90.378 I9.14 J-8.39 E.05467
G3 X76.606 Y89.496 I.764 J-.378 E.02861
G3 X77.635 Y88.228 I13.277 J9.719 E.05019
G1 X77.636 Y88.867 E.01962
G3 X77.525 Y89.23 I-.461 J.058 E.01202
G2 X77.105 Y89.868 I2.467 J2.08 E.02353
G2 X77.1 Y90.072 I.604 J.117 E.0063
; WIPE_START
G1 F12000
M204 S6000
G1 X77.145 Y90.231 E-.06273
G1 X77.276 Y90.422 E-.08793
G1 X77.525 Y90.771 E-.16292
G1 X77.635 Y90.97 E-.08627
G1 X77.635 Y91.771 E-.30434
G1 X77.54 Y91.659 E-.05581
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.03 Y93.124 Z12.7 F42000
G1 X85.37 Y93.19 Z12.7
G1 Z12.3
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X87.139 Y93.092 E.05445
G1 X87.173 Y93.733 E.01972
G1 X86.899 Y93.748 E.00843
G1 X86.892 Y93.609 E.00426
G1 X84.876 Y93.718 E.06203
G1 X84.864 Y92.904 E.02502
G1 X84.725 Y92.904 E.00425
G1 X84.725 Y92.632 E.00836
G1 X85.37 Y92.632 E.0198
G1 X85.37 Y93.13 E.01531
; WIPE_START
G1 F12000
M204 S6000
G1 X87.139 Y93.092 E-.67251
G1 X87.151 Y93.322 E-.08749
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z12.7 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z12.7
G1 X0 Y90.0001 F18000 ; move to safe pos
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
            G0 Z12.7 F4000
            G39.3 S1
            G0 Z12.7 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X86.957 Y93.354 F42000
G1 Z12.3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.154913
G1 F1200
M204 S6000
G1 X85.127 Y93.445 E.01672
G1 X85.116 Y92.828 E.00563
; WIPE_START
G1 F15000
G1 X85.127 Y93.445 E-.23439
G1 X86.509 Y93.376 E-.52561
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.37 Y86.81 Z12.7 F42000
G1 Z12.3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X85.37 Y87.368 E.01715
G1 X84.725 Y87.368 E.0198
G1 X84.725 Y87.096 E.00836
G1 X84.864 Y87.096 E.00425
G1 X84.873 Y86.284 E.02494
G1 X86.892 Y86.391 E.06212
G1 X86.899 Y86.252 E.00426
G1 X87.173 Y86.267 E.00843
G1 X87.139 Y86.908 E.01972
G1 X85.43 Y86.813 E.05261
M204 S10000
G1 X85.116 Y87.172 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.154907
G1 F1200
M204 S6000
G1 X85.127 Y86.555 E.00563
G1 X86.957 Y86.646 E.01672
; WIPE_START
G1 F15000
G1 X85.127 Y86.555 E-.69607
G1 X85.124 Y86.723 E-.06393
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.741 Y87.216 Z12.7 F42000
G1 X93.114 Y87.24 Z12.7
G1 Z12.3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X91.661 Y87.159 E.04469
G1 X91.697 Y86.519 E.01972
G1 X91.969 Y86.534 E.00836
G1 X91.961 Y86.672 E.00426
G1 X93.606 Y86.767 E.05063
G1 X93.618 Y87.468 E.02152
G1 X93.755 Y87.467 E.00423
G1 X93.755 Y87.748 E.00862
G1 X93.114 Y87.751 E.01972
G1 X93.114 Y87.3 E.01385
M204 S10000
G1 X93.366 Y87.553 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.154193
G1 F1200
M204 S6000
G1 X93.356 Y87.01 E.00493
G1 X91.871 Y86.919 E.01349
; WIPE_START
G1 F15000
G1 X93.356 Y87.01 E-.56522
G1 X93.365 Y87.523 E-.19478
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.114 Y92.76 Z12.7 F42000
G1 Z12.3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X93.114 Y92.25 E.01569
G1 X93.755 Y92.253 E.01972
G1 X93.755 Y92.533 E.00861
G1 X93.617 Y92.532 E.00423
G1 X93.607 Y93.233 E.02154
G1 X91.961 Y93.328 E.05065
G1 X91.969 Y93.466 E.00426
G1 X91.697 Y93.481 E.00836
G1 X91.661 Y92.841 E.01972
G1 X93.054 Y92.763 E.04285
M204 S10000
G1 X93.366 Y92.447 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.154171
G1 F1200
M204 S6000
G1 X93.356 Y92.99 E.00493
G1 X91.871 Y93.081 E.01348
; CHANGE_LAYER
; Z_HEIGHT: 12.5
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X93.356 Y92.99 E-.56518
G1 X93.365 Y92.477 E-.19482
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 63/111
; update layer progress
M73 L63
M991 S0 P62 ;notify layer change

; OBJECT_ID: 427
M204 S10000
G17
G3 Z12.7 I.246 J-1.192 P1  F42000
G1 X76.968 Y89.098 Z12.7
G1 Z12.5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X76.968 Y89.948 E.0261
G2 X76.967 Y90.903 I11.376 J.487 E.02937
G3 X76.546 Y90.277 I1.747 J-1.632 E.02328
G3 X76.635 Y89.542 I.804 J-.276 E.02357
G3 X76.931 Y89.145 I6.831 J4.787 E.0152
; WIPE_START
G1 F12000
M204 S6000
G1 X76.968 Y89.948 E-.30524
G1 X76.967 Y90.903 E-.36306
G1 X76.822 Y90.71 E-.0917
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.15 Y92.846 Z12.9 F42000
G1 X85.354 Y93.196 Z12.9
G1 Z12.5
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X87.123 Y93.098 E.05445
G1 X87.158 Y93.739 E.01972
M73 P78 R4
G1 X86.884 Y93.754 E.00843
G1 X86.876 Y93.617 E.00422
G1 X84.86 Y93.725 E.06203
G1 X84.848 Y92.904 E.02521
G1 X84.709 Y92.904 E.00425
G1 X84.709 Y92.632 E.00836
G1 X85.354 Y92.632 E.0198
G1 X85.354 Y93.136 E.0155
; WIPE_START
G1 F12000
M204 S6000
G1 X87.123 Y93.098 E-.6725
G1 X87.136 Y93.328 E-.0875
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z12.9 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z12.9
G1 X0 Y90.0001 F18000 ; move to safe pos
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
            G0 Z12.9 F4000
            G39.3 S1
            G0 Z12.9 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X86.941 Y93.361 F42000
G1 Z12.5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.155473
G1 F1200
M204 S6000
G1 X85.112 Y93.451 E.0168
G1 X85.101 Y92.828 E.00571
; WIPE_START
G1 F15000
G1 X85.112 Y93.451 E-.23675
G1 X86.487 Y93.383 E-.52325
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.354 Y86.804 Z12.9 F42000
G1 Z12.5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X85.354 Y87.368 E.01734
G1 X84.709 Y87.368 E.0198
M73 P78 R3
G1 X84.709 Y87.096 E.00836
G1 X84.848 Y87.096 E.00425
G1 X84.857 Y86.278 E.02513
G1 X86.876 Y86.385 E.06212
G1 X86.884 Y86.246 E.00426
G1 X87.158 Y86.261 E.00843
G1 X87.123 Y86.902 E.01972
G1 X85.414 Y86.807 E.05261
M204 S10000
G1 X85.101 Y87.172 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.154906
G1 F1200
M204 S6000
G1 X85.112 Y86.549 E.00568
G1 X86.941 Y86.64 E.01672
; WIPE_START
G1 F15000
G1 X85.112 Y86.549 E-.69607
G1 X85.109 Y86.717 E-.06394
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.725 Y87.209 Z12.9 F42000
G1 X93.119 Y87.235 Z12.9
G1 Z12.5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X91.667 Y87.154 E.04469
G1 X91.703 Y86.514 E.01972
G1 X91.974 Y86.529 E.00836
G1 X91.966 Y86.667 E.00426
G1 X93.611 Y86.762 E.05063
G1 X93.623 Y87.448 E.02106
G1 X93.76 Y87.447 E.00423
G1 X93.76 Y87.721 E.00842
G1 X93.119 Y87.723 E.01971
G1 X93.119 Y87.295 E.01315
M204 S10000
G1 X93.371 Y87.526 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.154194
G1 F1200
M204 S6000
G1 X93.361 Y87.005 E.00473
G1 X91.876 Y86.914 E.01349
; WIPE_START
G1 F15000
G1 X93.361 Y87.005 E-.56522
G1 X93.371 Y87.518 E-.19479
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.119 Y92.765 Z12.9 F42000
G1 Z12.5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X93.119 Y92.277 E.01499
G1 X93.481 Y92.278 E.01113
G1 X93.76 Y92.279 E.00859
G1 X93.76 Y92.553 E.00842
G1 X93.623 Y92.552 E.00423
G1 X93.617 Y93.233 E.02092
G1 X91.966 Y93.333 E.05081
G1 X91.974 Y93.471 E.00426
G1 X91.703 Y93.486 E.00836
G1 X91.667 Y92.846 E.01972
G1 X93.059 Y92.768 E.04285
M204 S10000
G1 X93.371 Y92.474 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.154167
G1 F1200
M204 S6000
G1 X93.361 Y92.995 E.00473
G1 X91.876 Y93.086 E.01348
; CHANGE_LAYER
; Z_HEIGHT: 12.7
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X93.361 Y92.995 E-.5652
G1 X93.371 Y92.482 E-.19481
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 64/111
; update layer progress
M73 L64
M991 S0 P63 ;notify layer change

; OBJECT_ID: 427
M204 S10000
G17
G3 Z12.9 I-.109 J-1.212 P1  F42000
G1 X85.338 Y93.203 Z12.9
G1 Z12.7
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X87.11 Y93.104 E.05452
G1 X87.145 Y93.745 E.01971
G1 X86.873 Y93.76 E.00836
G1 X86.865 Y93.621 E.00426
G1 X84.845 Y93.731 E.06218
G1 X84.832 Y92.904 E.0254
G1 X84.694 Y92.904 E.00425
G1 X84.694 Y92.632 E.00836
G1 X85.338 Y92.632 E.0198
G1 X85.338 Y93.143 E.01568
; WIPE_START
G1 F12000
M204 S6000
G1 X87.11 Y93.104 E-.67338
G1 X87.122 Y93.332 E-.08662
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z13.1 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z13.1
G1 X0 Y90.0001 F18000 ; move to safe pos
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
            G0 Z13.1 F4000
            G39.3 S1
            G0 Z13.1 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X86.928 Y93.366 F42000
G1 Z12.7
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.154866
G1 F1200
M204 S6000
G1 X85.096 Y93.457 E.01673
G1 X85.085 Y92.828 E.00574
; WIPE_START
G1 F15000
G1 X85.096 Y93.457 E-.23903
G1 X86.465 Y93.389 E-.52097
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.338 Y86.797 Z13.1 F42000
G1 Z12.7
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X85.338 Y87.368 E.01753
G1 X84.694 Y87.368 E.0198
G1 X84.694 Y87.096 E.00836
G1 X84.832 Y87.096 E.00425
G1 X84.841 Y86.273 E.02529
G1 X86.865 Y86.378 E.06229
G1 X86.873 Y86.24 E.00424
G1 X87.097 Y86.253 E.00688
G1 X87.145 Y86.256 E.00148
G1 X87.11 Y86.896 E.01971
G1 X85.398 Y86.801 E.05268
M204 S10000
G1 X85.085 Y87.172 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.155071
G1 F1200
M204 S6000
G1 X85.096 Y86.543 E.00575
G1 X86.928 Y86.634 E.01676
; WIPE_START
G1 F15000
G1 X85.096 Y86.543 E-.69703
G1 X85.093 Y86.709 E-.06298
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.709 Y87.203 Z13.1 F42000
G1 X93.124 Y87.23 Z13.1
G1 Z12.7
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X91.672 Y87.15 E.04469
G1 X91.708 Y86.509 E.01972
G1 X91.979 Y86.524 E.00834
G1 X91.972 Y86.662 E.00426
G1 X93.617 Y86.757 E.05063
G1 X93.628 Y87.442 E.02105
G1 X93.766 Y87.442 E.00422
G1 X93.766 Y87.714 E.00836
G1 X93.124 Y87.714 E.01971
G1 X93.124 Y87.29 E.01304
M204 S10000
G1 X93.376 Y87.518 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.154199
G1 F1200
M204 S6000
G1 X93.366 Y87 E.0047
G1 X91.882 Y86.909 E.01348
; WIPE_START
G1 F15000
G1 X93.366 Y87 E-.56511
G1 X93.376 Y87.513 E-.1949
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.124 Y92.77 Z13.1 F42000
G1 Z12.7
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X93.124 Y92.286 E.01488
G1 X93.443 Y92.286 E.00981
G1 X93.766 Y92.286 E.0099
G1 X93.766 Y92.558 E.00836
G1 X93.628 Y92.558 E.00423
G1 X93.617 Y93.243 E.02106
G1 X91.972 Y93.338 E.05065
G1 X91.979 Y93.476 E.00426
G1 X91.708 Y93.491 E.00835
G1 X91.672 Y92.851 E.01972
G1 X93.064 Y92.773 E.04285
M204 S10000
G1 X93.376 Y92.482 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.154169
G1 F1200
M204 S6000
G1 X93.366 Y93 E.0047
G1 X91.882 Y93.091 E.01348
; CHANGE_LAYER
; Z_HEIGHT: 12.9
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X93.366 Y93 E-.5652
G1 X93.376 Y92.487 E-.1948
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 65/111
; update layer progress
M73 L65
M991 S0 P64 ;notify layer change

; OBJECT_ID: 427
M204 S10000
G17
G3 Z13.1 I-.109 J-1.212 P1  F42000
G1 X85.322 Y93.209 Z13.1
G1 Z12.9
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X87.112 Y93.109 E.05508
G1 X87.149 Y93.75 E.01971
G1 X86.876 Y93.765 E.00839
G1 X86.868 Y93.626 E.00426
G1 X84.829 Y93.737 E.06276
G1 X84.816 Y92.904 E.02559
G1 X84.678 Y92.904 E.00425
G1 X84.678 Y92.632 E.00836
G1 X85.322 Y92.632 E.0198
G1 X85.322 Y93.149 E.01587
; WIPE_START
G1 F12000
M204 S6000
G1 X87.112 Y93.109 E-.68031
G1 X87.124 Y93.319 E-.07969
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z13.3 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z13.3
G1 X0 Y90.0001 F18000 ; move to safe pos
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
            G0 Z13.3 F4000
            G39.3 S1
            G0 Z13.3 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X86.931 Y93.371 F42000
G1 Z12.9
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.154842
G1 F1200
M204 S6000
G1 X85.08 Y93.463 E.0169
G1 X85.069 Y92.828 E.00579
; WIPE_START
G1 F15000
G1 X85.08 Y93.463 E-.24136
G1 X86.443 Y93.395 E-.51865
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.322 Y86.791 Z13.3 F42000
G1 Z12.9
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X85.322 Y87.368 E.01771
G1 X84.678 Y87.368 E.0198
G1 X84.678 Y87.096 E.00836
G1 X84.816 Y87.096 E.00425
G1 X84.825 Y86.267 E.02547
G1 X86.868 Y86.374 E.06287
G1 X86.876 Y86.235 E.00426
G1 X86.978 Y86.241 E.00313
G1 X87.149 Y86.25 E.00526
G1 X87.112 Y86.891 E.01971
G1 X85.382 Y86.795 E.05324
M204 S10000
G1 X85.069 Y87.172 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.154774
G1 F1200
M204 S6000
G1 X85.08 Y86.537 E.00579
G1 X86.931 Y86.629 E.01689
; WIPE_START
G1 F15000
G1 X85.08 Y86.537 E-.70419
G1 X85.078 Y86.684 E-.05581
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.693 Y87.196 Z13.3 F42000
G1 X93.129 Y87.225 Z13.3
G1 Z12.9
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X91.67 Y87.144 E.04492
G1 X91.704 Y86.503 E.01971
G1 X91.977 Y86.519 E.00841
G1 X91.97 Y86.657 E.00426
G1 X93.624 Y86.753 E.05089
G1 X93.633 Y87.452 E.02147
G1 X93.771 Y87.452 E.00422
G1 X93.771 Y87.727 E.00846
G1 X93.129 Y87.725 E.01971
G1 X93.129 Y87.285 E.01353
M204 S10000
G1 X93.382 Y87.53 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.154239
G1 F1200
M204 S6000
G1 X93.372 Y86.995 E.00485
G1 X91.879 Y86.904 E.01356
; WIPE_START
G1 F15000
G1 X93.372 Y86.995 E-.56824
G1 X93.381 Y87.5 E-.19176
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.129 Y92.775 Z13.3 F42000
G1 Z12.9
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X93.129 Y92.275 E.01537
G1 X93.771 Y92.283 E.01971
M73 P79 R3
G1 X93.771 Y92.548 E.00814
G1 X93.631 Y92.548 E.00429
G1 X93.632 Y93.222 E.02069
G1 X93.62 Y93.249 E.00092
G1 X91.97 Y93.343 E.05077
G1 X91.977 Y93.481 E.00426
G1 X91.704 Y93.497 E.00841
G1 X91.67 Y92.856 E.01971
G1 X93.069 Y92.778 E.04307
M204 S10000
G1 X93.38 Y92.47 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.153966
G1 F1200
M204 S6000
G1 X93.372 Y93.005 E.00484
G1 X91.879 Y93.096 E.01353
; CHANGE_LAYER
; Z_HEIGHT: 13.1
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15000
G1 X93.372 Y93.005 E-.56836
G1 X93.38 Y92.5 E-.19165
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 66/111
; update layer progress
M73 L66
M991 S0 P65 ;notify layer change

; OBJECT_ID: 427
M204 S10000
G17
G3 Z13.3 I-.107 J-1.212 P1  F42000
G1 X85.307 Y93.215 Z13.3
G1 Z13.1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X87.134 Y93.113 E.05624
G1 X87.172 Y93.754 E.01971
G1 X86.894 Y93.769 E.00856
G1 X86.886 Y93.631 E.00426
G1 X84.813 Y93.743 E.06378
G1 X84.801 Y92.904 E.02578
G1 X84.662 Y92.904 E.00425
G1 X84.662 Y92.632 E.00836
G1 X85.307 Y92.632 E.0198
G1 X85.307 Y93.155 E.01606
; WIPE_START
G1 F12000
M204 S6000
G1 X87.134 Y93.113 E-.69459
G1 X87.144 Y93.285 E-.06541
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z13.5 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z13.5
G1 X0 Y90.0001 F18000 ; move to safe pos
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
            G0 Z13.5 F4000
            G39.3 S1
            G0 Z13.5 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X86.953 Y93.375 F42000
G1 Z13.1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.154831
G1 F1200
M204 S6000
G1 X85.064 Y93.469 E.01725
G1 X85.054 Y92.828 E.00585
; WIPE_START
G1 F15000
G1 X85.064 Y93.469 E-.24368
G1 X86.421 Y93.402 E-.51632
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.307 Y86.785 Z13.5 F42000
G1 Z13.1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X85.307 Y87.368 E.0179
G1 X84.662 Y87.368 E.0198
G1 X84.662 Y87.096 E.00836
G1 X84.801 Y87.096 E.00425
G1 X84.81 Y86.261 E.02567
G1 X86.886 Y86.369 E.06388
G1 X86.894 Y86.231 E.00426
G1 X87.172 Y86.246 E.00856
G1 X87.134 Y86.887 E.01971
G1 X85.367 Y86.789 E.05439
M204 S10000
G1 X85.054 Y87.172 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.154933
G1 F1200
M204 S6000
G1 X85.064 Y86.531 E.00585
G1 X86.953 Y86.625 E.01726
; WIPE_START
G1 F15000
G1 X85.064 Y86.531 E-.7187
G1 X85.062 Y86.639 E-.0413
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.675 Y87.187 Z13.5 F42000
G1 X93.134 Y87.22 Z13.5
G1 Z13.1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X91.648 Y87.137 E.04573
G1 X91.681 Y86.497 E.0197
G1 X91.706 Y86.498 E.00076
G1 X91.96 Y86.512 E.00781
G1 X91.953 Y86.65 E.00425
G1 X93.629 Y86.748 E.05161
G1 X93.637 Y87.475 E.02235
G1 X93.776 Y87.476 E.00427
G1 X93.776 Y87.76 E.00871
G1 X93.135 Y87.756 E.01971
G1 X93.134 Y87.28 E.01463
M204 S10000
G1 X93.386 Y87.561 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.154081
G1 F1200
M204 S6000
G1 X93.376 Y86.99 E.00518
G1 X91.857 Y86.897 E.01379
; WIPE_START
G1 F15000
G1 X93.376 Y86.99 E-.57845
G1 X93.384 Y87.468 E-.18155
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.135 Y92.78 Z13.5 F42000
G1 Z13.1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X93.134 Y92.244 E.01646
G1 X93.776 Y92.241 E.01972
G1 X93.776 Y92.524 E.00871
G1 X93.637 Y92.525 E.00427
G1 X93.627 Y93.252 E.02237
G1 X91.953 Y93.35 E.05154
G1 X91.96 Y93.488 E.00425
G1 X91.681 Y93.503 E.00858
G1 X91.648 Y92.863 E.01971
G1 X93.075 Y92.783 E.04389
M204 S10000
G1 X93.386 Y92.439 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.154068
G1 F1200
M204 S6000
G1 X93.376 Y93.01 E.00517
G1 X91.857 Y93.103 E.01379
; CHANGE_LAYER
; Z_HEIGHT: 13.3
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X93.376 Y93.01 E-.57847
G1 X93.384 Y92.532 E-.18153
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 67/111
; update layer progress
M73 L67
M991 S0 P66 ;notify layer change

; OBJECT_ID: 427
M204 S10000
G17
G3 Z13.5 I-.103 J-1.213 P1  F42000
G1 X85.291 Y93.221 Z13.5
G1 Z13.3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X87.175 Y93.116 E.05799
G1 X87.213 Y93.757 E.01972
G1 X86.926 Y93.773 E.00885
G1 X86.917 Y93.634 E.00426
G1 X84.797 Y93.749 E.06525
G1 X84.785 Y92.904 E.02596
G1 X84.646 Y92.904 E.00425
G1 X84.647 Y92.632 E.00836
G1 X85.291 Y92.632 E.0198
G1 X85.291 Y93.161 E.01625
; WIPE_START
G1 F12000
M204 S6000
G1 X87.175 Y93.116 E-.71627
G1 X87.182 Y93.231 E-.04373
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z13.7 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z13.7
G1 X0 Y90.0001 F18000 ; move to safe pos
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
            G0 Z13.7 F4000
            G39.3 S1
            G0 Z13.7 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X86.996 Y93.378 F42000
G1 Z13.3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.154929
G1 F1200
M204 S6000
G1 X85.049 Y93.475 E.01779
G1 X85.038 Y92.828 E.00591
; WIPE_START
G1 F15000
G1 X85.049 Y93.475 E-.24602
G1 X86.399 Y93.408 E-.51398
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.291 Y86.779 Z13.7 F42000
G1 Z13.3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X85.291 Y87.368 E.01809
G1 X84.647 Y87.368 E.0198
G1 X84.646 Y87.096 E.00836
G1 X84.785 Y87.096 E.00425
G1 X84.787 Y86.266 E.0255
G1 X84.805 Y86.249 E.00076
G1 X86.917 Y86.366 E.06499
G1 X86.926 Y86.227 E.00426
G1 X87.213 Y86.243 E.00885
G1 X87.216 Y86.243 E.00007
G1 X87.175 Y86.884 E.01972
G1 X85.351 Y86.782 E.05615
M204 S10000
G1 X85.038 Y87.172 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.15492
G1 F1200
M204 S6000
G1 X85.049 Y86.525 E.00591
G1 X86.996 Y86.622 E.01779
; WIPE_START
G1 F15000
G1 X85.049 Y86.525 E-.7408
G1 X85.048 Y86.575 E-.0192
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.656 Y87.177 Z13.7 F42000
G1 X93.14 Y87.215 Z13.7
G1 Z13.3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X91.608 Y87.13 E.04715
G1 X91.641 Y86.49 E.01971
G1 X91.751 Y86.496 E.0034
G1 X91.929 Y86.505 E.00547
G1 X91.922 Y86.644 E.00425
G1 X93.635 Y86.743 E.0527
G1 X93.643 Y87.514 E.02369
G1 X93.781 Y87.515 E.00425
G1 X93.781 Y87.801 E.00878
G1 X93.781 Y87.812 E.00035
G1 X93.14 Y87.807 E.01971
G1 X93.14 Y87.797 E.00031
G1 X93.14 Y87.275 E.01604
M204 S10000
G1 X93.392 Y87.613 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.154139
G1 F1200
M204 S6000
G1 X93.382 Y86.985 E.00569
G1 X91.815 Y86.89 E.01422
; WIPE_START
G1 F15000
G1 X93.382 Y86.985 E-.59639
G1 X93.388 Y87.416 E-.16361
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.14 Y92.785 Z13.7 F42000
G1 Z13.3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X93.14 Y92.203 E.01788
G1 X93.14 Y92.193 E.00031
G1 X93.781 Y92.188 E.01971
G1 X93.781 Y92.199 E.00036
G1 X93.781 Y92.243 E.00134
G1 X93.781 Y92.485 E.00744
G1 X93.642 Y92.486 E.00427
G1 X93.643 Y93.232 E.02291
G1 X93.63 Y93.259 E.00093
G1 X91.922 Y93.356 E.05257
G1 X91.929 Y93.494 E.00425
G1 X91.641 Y93.51 E.00887
G1 X91.608 Y92.87 E.01971
G1 X93.08 Y92.788 E.04531
M204 S10000
G1 X93.391 Y92.387 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.154186
G1 F1200
M204 S6000
G1 X93.383 Y93.014 E.00569
G1 X91.815 Y93.11 E.01424
; CHANGE_LAYER
; Z_HEIGHT: 13.5
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X93.383 Y93.014 E-.59668
G1 X93.388 Y92.585 E-.16332
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 68/111
; update layer progress
M73 L68
M991 S0 P67 ;notify layer change

; OBJECT_ID: 427
M204 S10000
G17
G3 Z13.7 I-.096 J-1.213 P1  F42000
G1 X85.275 Y93.227 Z13.7
G1 Z13.5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X87.217 Y93.119 E.05975
G1 X87.239 Y93.118 E.00067
G1 X87.281 Y93.758 E.01972
G1 X87.257 Y93.759 E.00073
G1 X86.974 Y93.775 E.00872
G1 X86.965 Y93.637 E.00425
G1 X84.781 Y93.755 E.0672
G1 X84.769 Y92.904 E.02614
G1 X84.631 Y92.904 E.00425
G1 X84.631 Y92.632 E.00836
G1 X85.275 Y92.632 E.0198
G1 X85.275 Y92.658 E.0008
G1 X85.275 Y93.167 E.01564
; WIPE_START
G1 F12000
M204 S6000
G1 X87.217 Y93.119 E-.73805
G1 X87.239 Y93.118 E-.00832
G1 X87.241 Y93.154 E-.01363
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z13.9 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z13.9
G1 X0 Y90.0001 F18000 ; move to safe pos
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
            G0 Z13.9 F4000
            G39.3 S1
            G0 Z13.9 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X87.059 Y93.38 F42000
G1 Z13.5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.154972
G1 F1200
M204 S6000
G1 X85.033 Y93.482 E.01853
G1 X85.022 Y92.828 E.00597
; WIPE_START
G1 F15000
G1 X85.033 Y93.482 E-.24835
G1 X86.378 Y93.414 E-.51165
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.275 Y86.773 Z13.9 F42000
G1 Z13.5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X85.275 Y87.368 E.01828
G1 X84.631 Y87.368 E.0198
G1 X84.631 Y87.096 E.00836
G1 X84.769 Y87.096 E.00425
G1 X84.771 Y86.26 E.02569
G1 X84.789 Y86.244 E.00075
G1 X86.965 Y86.363 E.06696
G1 X86.974 Y86.225 E.00425
G1 X87.257 Y86.241 E.00872
G1 X87.281 Y86.242 E.00073
G1 X87.239 Y86.882 E.01972
G1 X87.217 Y86.881 E.00067
G1 X85.335 Y86.776 E.05791
M204 S10000
G1 X85.022 Y87.172 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.154967
G1 F1200
M204 S6000
G1 X85.033 Y86.518 E.00597
G1 X87.059 Y86.62 E.01853
; WIPE_START
G1 F15000
G1 X85.062 Y86.52 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.667 Y87.169 Z13.9 F42000
G1 X93.145 Y87.21 Z13.9
G1 Z13.5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X91.567 Y87.122 E.04858
G1 X91.545 Y87.121 E.00066
G1 X91.574 Y86.481 E.01971
G1 X91.598 Y86.482 E.00073
G1 X91.881 Y86.498 E.00872
G1 X91.874 Y86.636 E.00426
M73 P80 R3
G1 X93.637 Y86.736 E.05425
G1 X93.648 Y87.569 E.02557
G1 X93.787 Y87.57 E.00425
G1 X93.787 Y87.853 E.00871
G1 X93.787 Y87.888 E.00106
G1 X93.145 Y87.88 E.01971
G1 X93.145 Y87.848 E.00099
G1 X93.145 Y87.27 E.01776
M204 S10000
G1 X93.397 Y87.687 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.153902
G1 F1200
M204 S6000
G1 X93.387 Y86.98 E.00639
G1 X91.752 Y86.881 E.01481
; WIPE_START
G1 F15000
G1 X93.387 Y86.98 E-.62239
G1 X93.392 Y87.342 E-.13761
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.145 Y92.79 Z13.9 F42000
G1 Z13.5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X93.145 Y92.152 E.0196
G1 X93.145 Y92.12 E.00099
G1 X93.786 Y92.112 E.01971
G1 X93.786 Y92.147 E.00106
G1 X93.787 Y92.43 E.00871
G1 X93.648 Y92.431 E.00425
G1 X93.638 Y93.262 E.02553
G1 X91.874 Y93.364 E.05427
G1 X91.881 Y93.503 E.00426
G1 X91.598 Y93.518 E.00872
G1 X91.574 Y93.52 E.00073
G1 X91.545 Y92.879 E.01971
G1 X91.567 Y92.878 E.00066
G1 X93.085 Y92.793 E.04673
M204 S10000
G1 X93.397 Y92.313 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.153903
G1 F1200
M204 S6000
G1 X93.387 Y93.02 E.00639
G1 X91.752 Y93.119 E.01481
; CHANGE_LAYER
; Z_HEIGHT: 13.7
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X93.387 Y93.02 E-.62239
G1 X93.392 Y92.658 E-.13761
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 69/111
; update layer progress
M73 L69
M991 S0 P68 ;notify layer change

; OBJECT_ID: 427
M204 S10000
G17
G3 Z13.9 I-.086 J-1.214 P1  F42000
G1 X85.26 Y93.233 Z13.9
G1 Z13.7
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X86.881 Y93.143 E.04989
G1 X87.28 Y93.121 E.01229
G1 X87.325 Y93.118 E.00139
G1 X87.369 Y93.758 E.01971
G1 X87.322 Y93.761 E.00145
G1 X87.037 Y93.777 E.00876
G1 X87.028 Y93.639 E.00425
G1 X84.765 Y93.761 E.06964
G1 X84.753 Y92.904 E.02633
G1 X84.615 Y92.904 E.00425
G1 X84.615 Y92.632 E.00836
G1 X85.259 Y92.632 E.0198
G1 X85.259 Y92.684 E.00159
G1 X85.26 Y93.173 E.01503
; WIPE_START
G1 F12000
M204 S6000
G1 X86.881 Y93.143 E-.61615
G1 X87.259 Y93.122 E-.14386
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z14.1 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z14.1
G1 X0 Y90.0001 F18000 ; move to safe pos
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
            G0 Z14.1 F4000
            G39.3 S1
            G0 Z14.1 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X87.147 Y93.38 F42000
G1 Z13.7
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.154839
G1 F1200
M204 S6000
G1 X85.017 Y93.488 E.01945
G1 X85.006 Y92.828 E.00602
; WIPE_START
G1 F15000
G1 X85.017 Y93.488 E-.25066
G1 X86.356 Y93.42 E-.50934
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.26 Y86.767 Z14.1 F42000
G1 Z13.7
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X85.259 Y87.368 E.01847
G1 X84.615 Y87.368 E.0198
G1 X84.615 Y87.096 E.00836
G1 X84.753 Y87.096 E.00425
G1 X84.755 Y86.254 E.02587
G1 X84.774 Y86.237 E.00075
G1 X87.028 Y86.361 E.06938
G1 X87.037 Y86.223 E.00425
G1 X87.322 Y86.239 E.00876
G1 X87.369 Y86.242 E.00145
G1 X87.325 Y86.882 E.01971
G1 X87.28 Y86.879 E.00139
G1 X86.881 Y86.857 E.01229
G1 X85.319 Y86.77 E.04805
M204 S10000
G1 X85.006 Y87.172 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.154838
G1 F1200
M204 S6000
G1 X85.017 Y86.512 E.00602
G1 X87.147 Y86.62 E.01945
; WIPE_START
G1 F15000
G1 X85.149 Y86.519 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.754 Y87.171 Z14.1 F42000
G1 X93.15 Y87.205 Z14.1
G1 Z13.7
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X91.904 Y87.136 E.03837
G1 X91.504 Y87.114 E.01229
G1 X91.459 Y87.111 E.0014
G1 X91.486 Y86.47 E.01972
G1 X91.534 Y86.473 E.00146
G1 X91.818 Y86.489 E.00874
G1 X91.811 Y86.627 E.00425
G1 X93.645 Y86.733 E.05645
G1 X93.654 Y87.64 E.02786
G1 X93.792 Y87.641 E.00423
G1 X93.792 Y87.929 E.00883
G1 X93.792 Y87.988 E.00182
G1 X93.15 Y87.979 E.01972
G1 X93.15 Y87.921 E.00176
G1 X93.15 Y87.521 E.01229
G1 X93.15 Y87.265 E.00787
M204 S10000
G1 X93.402 Y87.786 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.154228
G1 F1200
M204 S6000
G1 X93.392 Y86.975 E.00736
G1 X91.665 Y86.871 E.01569
; WIPE_START
G1 F15000
G1 X93.392 Y86.975 E-.65752
G1 X93.396 Y87.245 E-.10249
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.15 Y92.795 Z14.1 F42000
G1 Z13.7
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X93.15 Y92.479 E.00972
G1 X93.15 Y92.079 E.01229
G1 X93.15 Y92.021 E.00176
G1 X93.792 Y92.012 E.01971
G1 X93.792 Y92.071 E.00182
G1 X93.792 Y92.359 E.00883
G1 X93.654 Y92.36 E.00423
G1 X93.643 Y93.267 E.02787
G1 X91.811 Y93.373 E.05638
G1 X91.818 Y93.511 E.00425
G1 X91.534 Y93.527 E.00874
G1 X91.486 Y93.53 E.00146
G1 X91.459 Y92.889 E.01972
G1 X91.504 Y92.886 E.0014
G1 X91.904 Y92.864 E.01229
G1 X93.09 Y92.798 E.03652
M204 S10000
G1 X93.402 Y92.214 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.154225
G1 F1200
M204 S6000
G1 X93.392 Y93.025 E.00736
G1 X91.665 Y93.129 E.01569
; CHANGE_LAYER
; Z_HEIGHT: 13.9
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X93.392 Y93.025 E-.65751
G1 X93.396 Y92.755 E-.10249
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 70/111
; update layer progress
M73 L70
M991 S0 P69 ;notify layer change

; OBJECT_ID: 427
M204 S10000
G17
G3 Z14.1 I-.072 J-1.215 P1  F42000
G1 X85.244 Y93.239 Z14.1
G1 Z13.9
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X86.967 Y93.143 E.05304
G1 X87.367 Y93.121 E.01229
G1 X87.439 Y93.117 E.00222
G1 X87.485 Y93.757 E.01972
G1 X87.41 Y93.761 E.00231
G1 X87.118 Y93.777 E.00899
G1 X87.109 Y93.639 E.00425
G1 X84.749 Y93.767 E.0726
G1 X84.738 Y92.904 E.02652
G1 X84.599 Y92.904 E.00425
G1 X84.599 Y92.632 E.00836
G1 X85.244 Y92.632 E.0198
G1 X85.244 Y92.71 E.00239
G1 X85.244 Y93.179 E.01442
; WIPE_START
G1 F12000
M204 S6000
G1 X86.967 Y93.143 E-.65504
G1 X87.243 Y93.128 E-.10496
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z14.3 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z14.3
G1 X0 Y90.0001 F18000 ; move to safe pos
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
            G0 Z14.3 F4000
            G39.3 S1
            G0 Z14.3 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X87.261 Y93.379 F42000
G1 Z13.9
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.154867
G1 F1200
M204 S6000
G1 X85.001 Y93.494 E.02064
G1 X84.991 Y92.828 E.00607
; WIPE_START
G1 F15000
G1 X85.001 Y93.494 E-.253
G1 X86.334 Y93.426 E-.50701
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.244 Y86.761 Z14.3 F42000
G1 Z13.9
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X85.244 Y87.368 E.01866
G1 X84.599 Y87.368 E.0198
G1 X84.599 Y87.096 E.00836
G1 X84.738 Y87.096 E.00425
G1 X84.752 Y86.232 E.02655
G1 X87.109 Y86.361 E.07253
G1 X87.118 Y86.223 E.00425
G1 X87.41 Y86.239 E.00899
G1 X87.485 Y86.243 E.00231
G1 X87.439 Y86.883 E.01972
G1 X87.367 Y86.879 E.00222
G1 X86.967 Y86.857 E.01229
G1 X85.304 Y86.764 E.05119
M204 S10000
G1 X84.991 Y87.172 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.154867
G1 F1200
M204 S6000
G1 X85.001 Y86.506 E.00607
G1 X87.261 Y86.621 E.02064
; WIPE_START
G1 F15000
G1 X85.264 Y86.519 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.868 Y87.175 Z14.3 F42000
G1 X93.155 Y87.2 Z14.3
G1 Z13.9
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X91.817 Y87.126 E.04118
G1 X91.418 Y87.104 E.01229
G1 X91.346 Y87.1 E.00221
G1 X91.371 Y86.459 E.01972
G1 X91.445 Y86.463 E.00229
G1 X91.737 Y86.479 E.00898
G1 X91.731 Y86.617 E.00426
G1 X93.65 Y86.728 E.05907
G1 X93.655 Y87.329 E.01847
G1 X93.659 Y87.729 E.01229
G1 X93.797 Y87.731 E.00425
G1 X93.797 Y88.029 E.00916
G1 X93.797 Y88.119 E.00275
G1 X93.156 Y88.106 E.01971
G1 X93.156 Y88.02 E.00266
G1 X93.156 Y87.62 E.01229
G1 X93.155 Y87.26 E.01105
M204 S10000
G1 X93.407 Y87.915 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.154084
G1 F1200
M204 S6000
G1 X93.398 Y86.971 E.00856
G1 X91.552 Y86.859 E.01676
; WIPE_START
G1 F15000
G1 X93.398 Y86.971 E-.70289
G1 X93.399 Y87.121 E-.05711
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.155 Y92.8 Z14.3 F42000
G1 Z13.9
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X93.156 Y92.38 E.01289
G1 X93.156 Y91.98 E.01229
G1 X93.156 Y91.894 E.00266
G1 X93.797 Y91.881 E.01971
G1 X93.797 Y91.971 E.00275
G1 X93.797 Y92.269 E.00916
G1 X93.659 Y92.271 E.00424
G1 X93.655 Y92.671 E.01229
G1 X93.648 Y93.273 E.01852
G1 X91.731 Y93.383 E.059
G1 X91.737 Y93.521 E.00426
G1 X91.445 Y93.537 E.00898
G1 X91.371 Y93.541 E.00229
G1 X91.346 Y92.9 E.01972
G1 X91.418 Y92.896 E.00221
G1 X91.817 Y92.874 E.01229
G1 X93.096 Y92.803 E.03933
M204 S10000
G1 X93.408 Y92.085 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.154038
G1 F1200
M204 S6000
G1 X93.397 Y93.03 E.00855
G1 X91.552 Y93.141 E.01674
; CHANGE_LAYER
; Z_HEIGHT: 14.1
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15000
G1 X93.397 Y93.03 E-.70267
G1 X93.399 Y92.879 E-.05733
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 71/111
; update layer progress
M73 L71
M991 S0 P70 ;notify layer change

; OBJECT_ID: 427
M204 S10000
G17
G3 Z14.3 I-.055 J-1.216 P1  F42000
G1 X85.228 Y93.245 Z14.3
G1 Z14.1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X86.681 Y93.165 E.04472
G1 X87.081 Y93.142 E.01229
G1 X87.48 Y93.12 E.01229
G1 X87.585 Y93.114 E.00322
G1 X87.634 Y93.754 E.01972
G1 X87.527 Y93.76 E.00332
G1 X87.219 Y93.777 E.00946
G1 X87.21 Y93.639 E.00426
G1 X86.811 Y93.661 E.01229
G1 X84.734 Y93.773 E.06391
G1 X84.722 Y92.904 E.0267
G1 X84.584 Y92.904 E.00425
G1 X84.584 Y92.632 E.00836
G1 X85.228 Y92.632 E.0198
G1 X85.228 Y92.736 E.00319
G1 X85.228 Y93.185 E.01381
; WIPE_START
G1 F12000
M204 S6000
G1 X86.681 Y93.165 E-.55229
G1 X87.081 Y93.142 E-.152
G1 X87.227 Y93.134 E-.05571
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z14.5 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z14.5
G1 X0 Y90.0001 F18000 ; move to safe pos
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
            G0 Z14.5 F4000
            G39.3 S1
            G0 Z14.5 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X87.408 Y93.376 F42000
G1 Z14.1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.154713
G1 F1200
M204 S6000
G1 X84.986 Y93.5 E.0221
G1 X84.975 Y92.828 E.00612
; WIPE_START
G1 F15000
G1 X84.986 Y93.5 E-.25531
G1 X86.312 Y93.432 E-.50469
; WIPE_END
M73 P81 R3
G1 E-.04 F1800
M204 S10000
G1 X85.228 Y86.755 Z14.5 F42000
G1 Z14.1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X85.228 Y87.368 E.01884
G1 X84.584 Y87.368 E.0198
G1 X84.584 Y87.096 E.00836
G1 X84.722 Y87.096 E.00425
G1 X84.734 Y86.227 E.02671
G1 X86.811 Y86.339 E.06389
G1 X87.21 Y86.361 E.01229
G1 X87.219 Y86.223 E.00426
G1 X87.527 Y86.24 E.00946
G1 X87.634 Y86.246 E.00332
G1 X87.585 Y86.886 E.01972
G1 X87.48 Y86.88 E.00322
G1 X87.081 Y86.858 E.01229
G1 X86.681 Y86.835 E.01229
G1 X85.288 Y86.758 E.04288
M204 S10000
G1 X84.975 Y87.172 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.15471
G1 F1200
M204 S6000
G1 X84.986 Y86.5 E.00612
G1 X87.409 Y86.624 E.0221
; WIPE_START
G1 F15000
G1 X85.411 Y86.522 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.015 Y87.183 Z14.5 F42000
G1 X93.161 Y87.195 Z14.5
G1 Z14.1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X92.104 Y87.137 E.03251
G1 X91.705 Y87.114 E.01229
G1 X91.306 Y87.092 E.01229
G1 X91.201 Y87.086 E.00323
G1 X91.222 Y86.445 E.01971
G1 X91.33 Y86.451 E.00332
G1 X91.637 Y86.468 E.00946
G1 X91.632 Y86.607 E.00425
G1 X92.031 Y86.63 E.01229
G1 X93.655 Y86.723 E.04999
G1 X93.661 Y87.439 E.02198
G1 X93.664 Y87.838 E.01229
G1 X93.802 Y87.841 E.00425
G1 X93.802 Y88.16 E.0098
G1 X93.802 Y88.286 E.00388
G1 X93.161 Y88.27 E.01972
G1 X93.161 Y88.147 E.00377
G1 X93.161 Y87.747 E.01229
G1 X93.161 Y87.255 E.01512
M204 S10000
G1 X93.412 Y88.08 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.154079
G1 F1200
M204 S6000
G1 X93.403 Y86.966 E.0101
G1 X91.405 Y86.846 E.01813
; WIPE_START
G1 F15000
G1 X93.401 Y86.965 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.161 Y92.805 Z14.5 F42000
G1 Z14.1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X93.161 Y92.253 E.01697
G1 X93.161 Y91.853 E.01229
G1 X93.161 Y91.73 E.00377
G1 X93.802 Y91.714 E.01971
G1 X93.802 Y91.84 E.00388
G1 X93.802 Y92.159 E.0098
G1 X93.664 Y92.162 E.00425
G1 X93.66 Y92.562 E.01229
G1 X93.653 Y93.278 E.02203
G1 X92.031 Y93.371 E.04992
G1 X91.632 Y93.393 E.01229
G1 X91.637 Y93.532 E.00425
G1 X91.33 Y93.549 E.00946
G1 X91.222 Y93.555 E.00332
G1 X91.201 Y92.914 E.01971
G1 X91.306 Y92.908 E.00323
G1 X91.705 Y92.886 E.01229
G1 X92.104 Y92.863 E.01229
G1 X93.101 Y92.808 E.03067
M204 S10000
G1 X93.412 Y91.92 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.154099
G1 F1200
M204 S6000
G1 X93.403 Y93.034 E.0101
G1 X91.405 Y93.154 E.01814
; CHANGE_LAYER
; Z_HEIGHT: 14.3
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X93.401 Y93.034 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 72/111
; update layer progress
M73 L72
M991 S0 P71 ;notify layer change

; OBJECT_ID: 427
M204 S10000
G17
G3 Z14.5 I-.032 J-1.217 P1  F42000
G1 X85.212 Y93.251 Z14.5
G1 Z14.3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X86.827 Y93.162 E.0497
G1 X87.227 Y93.14 E.01229
G1 X87.626 Y93.117 E.01229
G1 X87.774 Y93.109 E.00454
G1 X87.828 Y93.749 E.01972
G1 X87.676 Y93.757 E.00467
G1 X87.341 Y93.776 E.0103
G1 X87.331 Y93.638 E.00425
G1 X86.932 Y93.66 E.01229
G1 X84.719 Y93.78 E.0681
G1 X84.706 Y92.904 E.02691
G1 X84.568 Y92.904 E.00425
G1 X84.568 Y92.632 E.00836
G1 X85.212 Y92.632 E.0198
G1 X85.212 Y92.762 E.00399
G1 X85.212 Y93.191 E.0132
; WIPE_START
G1 F12000
M204 S6000
G1 X86.827 Y93.162 E-.61385
G1 X87.211 Y93.14 E-.14615
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z14.7 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z14.7
G1 X0 Y90.0001 F18000 ; move to safe pos
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
            G0 Z14.7 F4000
            G39.3 S1
            G0 Z14.7 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X87.569 Y93.567 F42000
G1 Z14.3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.153952
G1 F1200
M204 S6000
G2 X87.54 Y93.378 I-.348 J-.043 E.00175
G1 X84.97 Y93.506 E.02328
G1 X84.959 Y92.828 E.00613
; WIPE_START
G1 F15000
G1 X84.97 Y93.506 E-.25765
G1 X86.29 Y93.44 E-.50236
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.212 Y86.749 Z14.7 F42000
G1 Z14.3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X85.212 Y87.368 E.01903
G1 X84.568 Y87.368 E.0198
G1 X84.568 Y87.096 E.00836
G1 X84.706 Y87.096 E.00425
G1 X84.717 Y86.222 E.02684
G1 X86.932 Y86.341 E.06816
G1 X87.331 Y86.362 E.01229
G1 X87.341 Y86.224 E.00425
G1 X87.676 Y86.243 E.0103
G1 X87.828 Y86.251 E.00467
G1 X87.774 Y86.891 E.01972
G1 X87.626 Y86.883 E.00454
G1 X87.227 Y86.86 E.01229
G1 X86.827 Y86.838 E.01229
G1 X85.272 Y86.752 E.04786
M204 S10000
G1 X84.959 Y87.172 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.153927
G1 F1200
M204 S6000
G1 X84.97 Y86.494 E.00613
G1 X87.54 Y86.622 E.02328
G2 X87.569 Y86.433 I-.317 J-.146 E.00175
; WIPE_START
G1 F15000
G1 X87.54 Y86.622 E-.0725
G1 X85.733 Y86.532 E-.6875
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.166 Y87.19 Z14.7 F42000
G1 Z14.3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X91.959 Y87.123 E.03716
G1 X91.559 Y87.101 E.01229
G1 X91.16 Y87.079 E.01229
G1 X91.013 Y87.071 E.00452
G1 X91.029 Y86.429 E.01972
G1 X91.181 Y86.438 E.00468
G1 X91.517 Y86.456 E.01032
G1 X91.512 Y86.595 E.00426
G1 X91.911 Y86.618 E.01229
G1 X93.663 Y86.721 E.05392
G1 X93.667 Y87.571 E.02613
G1 X93.669 Y87.971 E.01229
G1 X93.807 Y87.974 E.00425
G1 X93.807 Y88.327 E.01086
G1 X93.807 Y88.506 E.00548
G1 X93.166 Y88.485 E.01972
G1 X93.166 Y88.311 E.00533
G1 X93.166 Y87.911 E.01229
G1 X93.166 Y87.511 E.01229
G1 X93.166 Y87.25 E.00803
M204 S10000
G1 X93.418 Y88.164 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.176845
G1 F1200
M204 S6000
G1 X93.434 Y88.225 E.00069
G2 X93.611 Y88.235 I.123 J-.623 E.00194
M204 S10000
G1 X93.418 Y88.164 F42000
; LINE_WIDTH: 0.153233
G1 F1200
M204 S6000
G1 X93.408 Y86.961 E.01082
G1 X91.275 Y86.829 E.01921
G3 X91.267 Y86.639 I.344 J-.11 E.00173
; WIPE_START
G1 F15000
G1 X91.275 Y86.829 E-.07242
G1 X93.081 Y86.94 E-.68758
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.166 Y92.81 Z14.7 F42000
G1 Z14.3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X93.166 Y92.489 E.00987
G1 X93.166 Y92.089 E.01229
G1 X93.166 Y91.689 E.01229
G1 X93.166 Y91.515 E.00533
G1 X93.807 Y91.494 E.01972
G1 X93.807 Y91.673 E.00548
G1 X93.807 Y92.026 E.01086
G1 X93.669 Y92.029 E.00425
G1 X93.666 Y92.429 E.01229
G1 X93.658 Y93.283 E.02626
G1 X91.911 Y93.382 E.05378
G1 X91.512 Y93.405 E.01229
G1 X91.517 Y93.544 E.00426
G1 X91.181 Y93.562 E.01032
G1 X91.029 Y93.571 E.00468
G1 X91.013 Y92.929 E.01972
G1 X91.16 Y92.921 E.00452
G1 X91.559 Y92.899 E.01229
G1 X91.959 Y92.877 E.01229
G1 X93.106 Y92.813 E.03531
; WIPE_START
G1 F12000
M204 S6000
G1 X93.166 Y92.489 E-.12538
G1 X93.166 Y92.089 E-.152
G1 X93.166 Y91.689 E-.152
G1 X93.166 Y91.515 E-.06589
G1 X93.807 Y91.494 E-.2439
G1 X93.807 Y91.549 E-.02082
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.611 Y91.765 Z14.7 F42000
G1 Z14.3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.155581
G1 F1200
M204 S6000
G2 X93.434 Y91.775 I-.054 J.636 E.00163
G1 X93.418 Y91.836 E.00058
G1 X93.409 Y93.039 E.01105
G1 X91.275 Y93.171 E.01963
; LINE_WIDTH: 0.139241
G2 X91.267 Y93.361 I.343 J.11 E.00151
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 14.5
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X91.275 Y93.171 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 73/111
; update layer progress
M73 L73
M991 S0 P72 ;notify layer change

; OBJECT_ID: 427
M204 S10000
G17
G3 Z14.7 I-.017 J-1.217 P1  F42000
G1 X85.197 Y93.258 Z14.7
G1 Z14.5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X86.617 Y93.179 E.04371
G1 X87.016 Y93.156 E.01229
G1 X87.416 Y93.134 E.01229
G1 X87.815 Y93.112 E.01229
G1 X88.026 Y93.1 E.00648
G1 X88.087 Y93.739 E.01973
M106 S204
M106 S255
G1 X87.869 Y93.752 E.00671
G1 X87.488 Y93.773 E.01173
G1 X87.477 Y93.635 E.00425
G1 X87.078 Y93.656 E.01229
G1 X84.703 Y93.786 E.07307
G1 X84.69 Y92.904 E.0271
G1 X84.552 Y92.904 E.00425
G1 X84.552 Y92.632 E.00836
G1 X85.196 Y92.632 E.0198
G1 X85.196 Y92.788 E.00479
G1 X85.197 Y93.198 E.01259
; WIPE_START
G1 F12000
M204 S6000
G1 X86.617 Y93.179 E-.53977
G1 X87.016 Y93.156 E-.152
G1 X87.196 Y93.146 E-.06823
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z14.9 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z14.9
G1 X0 Y90.0001 F18000 ; move to safe pos
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
            G0 Z14.9 F4000
            G39.3 S1
            G0 Z14.9 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X87.706 Y93.393 F42000
G1 Z14.5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.222039
G1 F1200
M204 S6000
G1 X87.757 Y93.413 E.0008
; LINE_WIDTH: 0.244848
G1 X87.77 Y93.561 E.00245
M204 S10000
G1 X87.706 Y93.393 F42000
; LINE_WIDTH: 0.155131
G1 F1200
M204 S6000
G1 X87.655 Y93.373 E.0005
G1 X84.954 Y93.512 E.02472
G1 X84.943 Y92.828 E.00626
; WIPE_START
G1 F15000
G1 X84.954 Y93.512 E-.25997
G1 X86.268 Y93.444 E-.50003
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.197 Y86.742 Z14.9 F42000
G1 Z14.5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X85.196 Y87.368 E.01922
G1 X84.552 Y87.368 E.0198
G1 X84.552 Y87.096 E.00836
G1 X84.691 Y87.096 E.00427
G1 X84.691 Y86.245 E.02613
G1 X84.704 Y86.214 E.00105
G1 X87.078 Y86.343 E.07305
M73 P82 R3
G1 X87.477 Y86.365 E.01229
G1 X87.488 Y86.227 E.00425
G1 X87.869 Y86.248 E.01172
G1 X88.087 Y86.261 E.00671
G1 X88.026 Y86.9 E.01973
M106 S204
M106 S255
G1 X87.815 Y86.888 E.00648
G1 X87.416 Y86.866 E.01229
G1 X87.016 Y86.844 E.01229
G1 X86.617 Y86.821 E.01229
G1 X85.256 Y86.746 E.04187
M204 S10000
G1 X84.944 Y87.172 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.155038
G1 F1200
M204 S6000
G1 X84.953 Y86.488 E.00624
G1 X87.655 Y86.627 E.02472
G1 X87.706 Y86.607 E.0005
; LINE_WIDTH: 0.221712
G1 X87.757 Y86.588 E.0008
; LINE_WIDTH: 0.244384
G1 X87.77 Y86.439 E.00244
; WIPE_START
G1 F15000
G1 X87.757 Y86.588 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z14.9 I-.134 J1.21 P1  F42000
G1 X93.171 Y87.185 Z14.9
G1 Z14.5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X92.17 Y87.13 E.03081
G1 X91.771 Y87.108 E.01229
G1 X91.371 Y87.085 E.01229
G1 X90.972 Y87.063 E.01229
G1 X90.76 Y87.052 E.00651
G1 X90.771 Y86.41 E.01973
M106 S204
M106 S255
G1 X90.989 Y86.422 E.0067
G1 X91.369 Y86.443 E.01172
G1 X91.365 Y86.581 E.00426
G1 X91.764 Y86.605 E.01229
G1 X93.668 Y86.716 E.0586
G1 X93.673 Y87.731 E.03118
G1 X93.674 Y88.131 E.01229
G1 X93.813 Y88.134 E.00425
G1 X93.813 Y88.547 E.01267
G1 X93.813 Y88.812 E.00815
G1 F840
G1 X93.171 Y88.781 E.01973
M106 S204
M106 S255
G1 F1200
G1 X93.171 Y88.526 E.00783
G1 X93.171 Y88.126 E.01229
G1 X93.171 Y87.726 E.01229
G1 X93.171 Y87.245 E.01477
; WIPE_START
G1 F12000
M204 S6000
G1 X92.17 Y87.13 E-.38295
G1 X91.771 Y87.108 E-.152
G1 X91.371 Y87.085 E-.152
G1 X91.179 Y87.075 E-.07305
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.423 Y88.322 Z14.9 F42000
G1 Z14.5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.171617
G1 F1200
M204 S6000
G1 X93.44 Y88.358 E.00042
; LINE_WIDTH: 0.206892
G1 X93.458 Y88.395 E.00054
; LINE_WIDTH: 0.242166
G1 X93.476 Y88.431 E.00065
; LINE_WIDTH: 0.290169
G1 X93.492 Y88.447 E.00047
G1 X93.492 Y88.6 E.00308
M204 S10000
G1 X93.423 Y88.322 F42000
; LINE_WIDTH: 0.154335
G1 F1200
M204 S6000
G1 X93.414 Y86.956 E.01241
G1 X91.159 Y86.822 E.0205
G1 X91.111 Y86.796 E.0005
; LINE_WIDTH: 0.221816
G1 X91.062 Y86.771 E.0008
; LINE_WIDTH: 0.244612
G1 X91.065 Y86.622 E.00244
; WIPE_START
G1 F15000
G1 X91.062 Y86.771 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.171 Y92.815 Z14.9 F42000
G1 Z14.5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X93.171 Y92.274 E.01661
G1 X93.171 Y91.874 E.01229
G1 X93.171 Y91.474 E.01229
G1 X93.171 Y91.219 E.00784
G1 F840
G1 X93.813 Y91.188 E.01974
M106 S204
M106 S255
G1 F1200
G1 X93.813 Y91.453 E.00815
G1 X93.813 Y91.866 E.01267
G1 X93.674 Y91.869 E.00426
G1 X93.672 Y92.269 E.01229
G1 X93.665 Y93.287 E.03129
G1 X91.764 Y93.396 E.05852
G1 X91.364 Y93.419 E.01229
G1 X91.369 Y93.557 E.00425
G1 X90.989 Y93.578 E.01171
G1 X90.771 Y93.59 E.0067
G1 X90.76 Y92.948 E.01973
M106 S204
G1 X90.972 Y92.937 E.00651
G1 X91.371 Y92.915 E.01229
G1 X91.771 Y92.892 E.01229
G1 X92.17 Y92.87 E.01229
G1 X93.111 Y92.818 E.02897
; WIPE_START
G1 F12000
M204 S6000
G1 X93.171 Y92.274 E-.20798
G1 X93.171 Y91.874 E-.152
G1 X93.171 Y91.474 E-.152
G1 X93.171 Y91.219 E-.09692
G1 X93.568 Y91.2 E-.1511
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.44 Y91.641 Z14.9 F42000
G1 Z14.5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.207108
G1 F1200
M204 S6000
G1 X93.458 Y91.605 E.00054
; LINE_WIDTH: 0.242463
G1 X93.476 Y91.569 E.00065
; LINE_WIDTH: 0.290396
G1 X93.492 Y91.552 E.00047
G1 X93.492 Y91.4 E.00308
M204 S10000
G1 X93.44 Y91.641 F42000
; LINE_WIDTH: 0.154238
G1 F1200
M204 S6000
G1 X93.423 Y91.677 E.00037
G1 X93.414 Y93.044 E.0124
G1 X91.159 Y93.178 E.02049
; LINE_WIDTH: 0.176416
G1 X91.11 Y93.203 E.0006
; LINE_WIDTH: 0.237941
G1 X91.061 Y93.229 E.00087
G1 X91.065 Y93.378 E.00237
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 14.7
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X91.061 Y93.229 E-.55577
G1 X91.11 Y93.203 E-.20423
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 74/111
; update layer progress
M73 L74
M991 S0 P73 ;notify layer change

; OBJECT_ID: 427
M204 S10000
G17
G3 Z14.9 I-.012 J-1.217 P1  F42000
G1 X85.181 Y93.264 Z14.9
G1 Z14.7
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X86.869 Y93.17 E.05195
G1 X87.268 Y93.148 E.01229
G1 X87.668 Y93.126 E.01229
G1 X88.067 Y93.103 E.01229
G1 X88.401 Y93.085 E.01026
G1 F600
G1 X88.479 Y93.723 E.01975
M106 S204
M106 S255
G1 F1200
G1 X88.128 Y93.742 E.0108
G1 X87.667 Y93.768 E.01419
G1 X87.656 Y93.63 E.00426
G1 X87.257 Y93.652 E.01229
G1 X84.687 Y93.792 E.07907
G1 X84.675 Y92.904 E.02728
G1 X84.536 Y92.904 E.00425
G1 X84.536 Y92.632 E.00836
G1 X85.181 Y92.632 E.0198
G1 X85.181 Y92.814 E.00559
G1 X85.181 Y93.204 E.01198
; WIPE_START
G1 F12000
M204 S6000
G1 X86.869 Y93.17 E-.64164
G1 X87.18 Y93.153 E-.11836
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z15.1 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z15.1
G1 X0 Y90.0001 F18000 ; move to safe pos
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
            G0 Z15.1 F4000
            G39.3 S1
            G0 Z15.1 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X87.871 Y93.384 F42000
G1 Z14.7
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.15481
G1 F1200
M204 S6000
G1 X87.834 Y93.368 E.00037
G1 X84.938 Y93.518 E.02643
G1 X84.928 Y92.828 E.00629
; WIPE_START
G1 F15000
G1 X84.938 Y93.518 E-.26229
G1 X86.246 Y93.45 E-.49771
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.871 Y93.384 Z15.1 F42000
G1 Z14.7
G1 E.8 F1800
; LINE_WIDTH: 0.206714
G1 F1200
M204 S6000
G1 X87.908 Y93.399 E.00054
; LINE_WIDTH: 0.242024
G1 X87.945 Y93.415 E.00065
; LINE_WIDTH: 0.290938
G1 X87.962 Y93.43 E.00047
G1 X88.244 Y93.415 E.0057
; WIPE_START
G1 F15000
G1 X87.962 Y93.43 E-.7021
G1 X87.945 Y93.415 E-.0579
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z15.1 I1.124 J-.465 P1  F42000
G1 X85.181 Y86.736 Z15.1
G1 Z14.7
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X85.181 Y87.368 E.01941
G1 X84.536 Y87.368 E.0198
G1 X84.536 Y87.096 E.00836
G1 X84.675 Y87.096 E.00427
G1 X84.675 Y86.239 E.02632
G1 X84.688 Y86.208 E.00106
G1 X87.257 Y86.348 E.07904
G1 X87.656 Y86.37 E.01229
G1 X87.667 Y86.232 E.00425
G1 X88.128 Y86.258 E.01419
G1 X88.479 Y86.277 E.0108
G1 F600
G1 X88.401 Y86.915 E.01975
M106 S204
M106 S255
G1 F1200
G1 X88.067 Y86.897 E.01026
G1 X87.668 Y86.874 E.01229
G1 X87.268 Y86.852 E.01229
G1 X86.869 Y86.83 E.01229
G1 X85.241 Y86.74 E.05011
M204 S10000
G1 X84.928 Y87.172 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.154735
G1 F1200
M204 S6000
G1 X84.938 Y86.482 E.00628
G1 X87.834 Y86.632 E.02642
G1 X87.871 Y86.616 E.00037
; LINE_WIDTH: 0.206815
G1 X87.908 Y86.601 E.00054
; LINE_WIDTH: 0.242151
G1 X87.945 Y86.585 E.00065
; LINE_WIDTH: 0.290947
G1 X87.962 Y86.57 E.00047
G1 X88.244 Y86.585 E.0057
; WIPE_START
G1 F15000
G1 X87.962 Y86.57 E-.70233
G1 X87.945 Y86.585 E-.05767
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z15.1 I-.138 J1.209 P1  F42000
G1 X93.176 Y87.18 Z15.1
G1 Z14.7
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X91.918 Y87.11 E.03874
G1 X91.518 Y87.088 E.01229
G1 X91.119 Y87.066 E.01229
G1 X90.719 Y87.044 E.01229
G1 X90.386 Y87.026 E.01026
G1 F600
G1 X90.379 Y86.383 E.01975
M106 S204
M106 S255
G1 F1200
G1 X90.73 Y86.402 E.01079
G1 X91.192 Y86.428 E.01422
G1 X91.188 Y86.566 E.00425
G1 X91.587 Y86.589 E.01229
G1 X93.673 Y86.711 E.0642
G1 X93.678 Y87.925 E.03731
G1 X93.679 Y88.325 E.01229
G1 X93.818 Y88.329 E.00426
G1 X93.818 Y88.853 E.0161
G1 X93.818 Y89.223 E.01135
M106 S204
M106 S255
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
G1 F600
G1 X93.818 Y89.358 E.00449
G1 X93.177 Y89.287 E.02141
G1 X93.177 Y89.192 E.00317
M106 S204
M106 S255
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X93.177 Y88.822 E.01135
M106 S204
M106 S255
G1 X93.177 Y88.422 E.01229
G1 X93.177 Y88.022 E.01229
G1 X93.176 Y87.622 E.01229
G1 X93.176 Y87.24 E.01174
; WIPE_START
G1 F12000
M204 S6000
G1 X91.918 Y87.11 E-.48091
G1 X91.518 Y87.088 E-.152
G1 X91.184 Y87.07 E-.1271
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.445 Y88.552 Z15.1 F42000
G1 Z14.7
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.154108
G1 F1200
M204 S6000
G1 X93.428 Y88.516 E.00036
G1 X93.419 Y86.951 E.01418
G1 X90.983 Y86.807 E.02211
; LINE_WIDTH: 0.171485
G1 X90.948 Y86.787 E.00042
; LINE_WIDTH: 0.206676
G1 X90.913 Y86.768 E.00054
; LINE_WIDTH: 0.241866
G1 X90.878 Y86.748 E.00065
; LINE_WIDTH: 0.290991
G1 X90.862 Y86.731 E.00047
G1 X90.579 Y86.715 E.00573
; WIPE_START
G1 F15000
G1 X90.862 Y86.731 E-.70192
G1 X90.878 Y86.748 E-.05808
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z15.1 I-.7 J.996 P1  F42000
G1 X93.445 Y88.552 Z15.1
G1 Z14.7
G1 E.8 F1800
; LINE_WIDTH: 0.206182
G1 F1200
M204 S6000
G1 X93.463 Y88.588 E.00053
; LINE_WIDTH: 0.241103
G1 X93.48 Y88.624 E.00065
; LINE_WIDTH: 0.291442
G1 X93.497 Y88.641 E.00049
G1 X93.497 Y89.125 E.00981
; WIPE_START
G1 F15000
G1 X93.497 Y88.641 E-.72391
G1 X93.48 Y88.624 E-.03609
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z15.1 I-1.214 J-.088 P1  F42000
G1 X93.176 Y92.82 Z15.1
G1 Z14.7
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X93.176 Y92.378 E.01358
G1 X93.177 Y91.978 E.01229
G1 X93.177 Y91.578 E.01229
G1 X93.177 Y91.178 E.01229
G1 X93.177 Y90.808 E.01135
M106 S204
M106 S255
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
G1 F600
G1 X93.177 Y90.713 E.00316
G1 X93.818 Y90.642 E.02141
G1 X93.818 Y90.777 E.00449
M106 S204
M106 S255
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X93.818 Y91.147 E.01135
M106 S204
M106 S255
G1 X93.818 Y91.671 E.01611
G1 X93.679 Y91.675 E.00426
G1 X93.677 Y92.075 E.01229
G1 X93.67 Y93.292 E.03741
G1 X91.587 Y93.411 E.06411
G1 X91.188 Y93.434 E.01229
G1 X91.192 Y93.572 E.00425
G1 X90.73 Y93.598 E.01422
G1 X90.379 Y93.617 E.01079
G1 F600
G1 X90.386 Y92.974 E.01975
M106 S204
G1 F1200
G1 X90.719 Y92.956 E.01026
G1 X91.119 Y92.934 E.01229
G1 X91.518 Y92.912 E.01229
G1 X91.918 Y92.89 E.01229
G1 X93.117 Y92.823 E.0369
; WIPE_START
G1 F12000
M204 S6000
G1 X93.176 Y92.378 E-.17077
G1 X93.177 Y91.978 E-.152
G1 X93.177 Y91.578 E-.152
G1 X93.177 Y91.178 E-.152
G1 X93.177 Y90.827 E-.13325
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.445 Y91.448 Z15.1 F42000
G1 Z14.7
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.154137
G1 F1200
M204 S6000
G1 X93.428 Y91.484 E.00036
G1 X93.419 Y93.049 E.01418
G1 X90.983 Y93.193 E.02212
; LINE_WIDTH: 0.17151
G1 X90.948 Y93.213 E.00042
; LINE_WIDTH: 0.206706
G1 X90.913 Y93.232 E.00054
; LINE_WIDTH: 0.241902
G1 X90.878 Y93.252 E.00065
; LINE_WIDTH: 0.291024
G1 X90.862 Y93.269 E.00047
G1 X90.579 Y93.285 E.00573
; WIPE_START
G1 F15000
G1 X90.862 Y93.269 E-.70192
G1 X90.878 Y93.252 E-.05808
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z15.1 I.7 J.996 P1  F42000
G1 X93.445 Y91.448 Z15.1
G1 Z14.7
G1 E.8 F1800
; LINE_WIDTH: 0.206094
G1 F1200
M204 S6000
G1 X93.463 Y91.412 E.00053
; LINE_WIDTH: 0.240996
G1 X93.48 Y91.376 E.00064
; LINE_WIDTH: 0.291434
G1 X93.497 Y91.359 E.00049
G1 X93.497 Y90.875 E.00981
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 14.9
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X93.497 Y91.359 E-.72379
G1 X93.48 Y91.376 E-.03621
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 75/111
; update layer progress
M73 L75
M991 S0 P74 ;notify layer change

; OBJECT_ID: 427
M204 S10000
G17
G3 Z15.1 I1.214 J-.086 P1  F42000
G1 X93.182 Y87.175 Z15.1
G1 Z14.9
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X91.543 Y87.084 E.05042
G1 X91.144 Y87.062 E.01229
G1 X90.744 Y87.04 E.01229
G1 X90.345 Y87.018 E.01229
G1 X89.976 Y86.997 E.01136
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
G1 F3000
G1 X88.812 Y86.933 E.03868
M106 S204
M106 S255
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X88.442 Y86.912 E.01136
M106 S204
M106 S255
G1 X88.043 Y86.89 E.01229
G1 X87.644 Y86.868 E.01229
G1 X87.244 Y86.846 E.01229
G1 X85.165 Y86.73 E.06398
G1 X85.165 Y87.368 E.0196
G1 X84.521 Y87.368 E.0198
G1 X84.521 Y87.096 E.00836
G1 X84.659 Y87.096 E.00427
G1 X84.659 Y86.233 E.02651
G1 X84.673 Y86.202 E.00106
G1 X87.474 Y86.355 E.0862
G1 X87.873 Y86.377 E.01229
G1 X87.885 Y86.239 E.00425
G1 X88.121 Y86.252 E.00727
G1 X88.521 Y86.274 E.01229
G1 X88.89 Y86.295 E.01136
M106 S204
M106 S255
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
G1 F3000
G1 X89.969 Y86.355 E.03585
M106 S204
M106 S255
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P83 R3
G1 F1200
G1 X90.338 Y86.375 E.01136
M106 S204
M106 S255
G1 X90.738 Y86.397 E.01229
G1 X90.974 Y86.41 E.00727
G1 X90.97 Y86.549 E.00427
G1 X91.37 Y86.572 E.01229
G1 X93.678 Y86.706 E.07106
G1 X93.683 Y88.166 E.04486
G1 X93.685 Y88.566 E.01229
G1 X93.823 Y88.571 E.00426
G1 X93.823 Y89 E.01317
G1 X93.823 Y89.4 E.01229
G1 X93.823 Y89.772 E.01144
M106 S204
M106 S255
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
G1 F3000
G1 X93.823 Y90.228 E.0151
M106 S204
M106 S255
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X93.823 Y90.6 E.01144
M106 S204
M106 S255
G1 X93.823 Y91 E.01229
G1 X93.823 Y91.429 E.01317
G1 X93.685 Y91.434 E.00426
G1 X93.683 Y91.834 E.01229
G1 X93.677 Y93.295 E.04491
G1 X91.37 Y93.428 E.07103
G1 X90.97 Y93.451 E.01229
G1 X90.974 Y93.59 E.00427
G1 X90.738 Y93.603 E.00727
G1 X90.338 Y93.625 E.01229
G1 X89.969 Y93.645 E.01136
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
G1 F3000
G1 X88.89 Y93.705 E.03585
M106 S204
M106 S255
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X88.521 Y93.726 E.01136
M106 S204
M106 S255
G1 X88.121 Y93.748 E.01229
G1 X87.885 Y93.761 E.00727
G1 X87.873 Y93.623 E.00425
G1 X87.474 Y93.645 E.01229
G1 X84.674 Y93.799 E.08617
G1 X84.661 Y93.785 E.00057
G1 X84.659 Y92.904 E.02707
G1 X84.521 Y92.904 E.00425
G1 X84.521 Y92.632 E.00836
G1 X85.165 Y92.632 E.0198
G1 X85.165 Y93.27 E.01959
G1 X87.244 Y93.154 E.06398
G1 X87.644 Y93.132 E.01229
G1 X88.043 Y93.11 E.01229
G1 X88.442 Y93.088 E.01229
G1 X88.812 Y93.067 E.01136
M106 S204
M106 S255
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
G1 F3000
G1 X89.976 Y93.003 E.03868
M106 S204
M106 S255
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X90.345 Y92.982 E.01136
G1 X90.744 Y92.96 E.01229
G1 X91.144 Y92.938 E.01229
G1 X91.543 Y92.916 E.01229
G1 X93.182 Y92.825 E.05043
G1 X93.182 Y91.871 E.0293
G1 X93.182 Y91.471 E.01229
G1 X93.182 Y91.071 E.01229
G1 X93.182 Y90.671 E.01229
G1 X93.182 Y90.3 E.01141
M106 S204
M106 S255
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
G1 F3000
G1 X93.182 Y89.7 E.01989
M106 S204
M106 S255
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X93.182 Y89.329 E.01141
M106 S204
G1 X93.182 Y88.929 E.01229
G1 X93.182 Y88.529 E.01229
G1 X93.182 Y88.129 E.01229
G1 X93.182 Y87.235 E.02746
; WIPE_START
G1 F12000
M204 S6000
G1 X91.543 Y87.084 E-.62527
G1 X91.189 Y87.065 E-.13473
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z15.3 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z15.3
G1 X0 Y90.0001 F18000 ; move to safe pos
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
            G0 Z15.3 F4000
            G39.3 S1
            G0 Z15.3 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X90.767 Y86.79 F42000
G1 Z14.9
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.170871
G1 F1200
M204 S6000
G1 X90.732 Y86.77 E.00041
; LINE_WIDTH: 0.205558
G1 X90.697 Y86.751 E.00053
; LINE_WIDTH: 0.240244
G1 X90.662 Y86.732 E.00064
; LINE_WIDTH: 0.29188
G1 X90.645 Y86.713 E.00051
G1 X88.177 Y86.576 E.05015
G1 X88.159 Y86.592 E.0005
; LINE_WIDTH: 0.24064
G1 X88.122 Y86.608 E.00064
; LINE_WIDTH: 0.205956
G1 X88.085 Y86.623 E.00053
; LINE_WIDTH: 0.154753
G1 X88.049 Y86.638 E.00036
G1 X84.922 Y86.476 E.02853
G1 X84.912 Y87.172 E.00634
; WIPE_START
G1 F15000
G1 X84.922 Y86.476 E-.26441
G1 X86.224 Y86.544 E-.4956
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.912 Y92.828 Z15.3 F42000
G1 Z14.9
G1 E.8 F1800
; LINE_WIDTH: 0.154661
G1 F1200
M204 S6000
G1 X84.923 Y93.524 E.00634
G1 X88.049 Y93.362 E.0285
; LINE_WIDTH: 0.171232
G1 X88.085 Y93.377 E.00042
; LINE_WIDTH: 0.20591
G1 X88.122 Y93.392 E.00053
; LINE_WIDTH: 0.240588
G1 X88.159 Y93.408 E.00064
; LINE_WIDTH: 0.291886
G1 X88.178 Y93.424 E.0005
G1 X90.645 Y93.287 E.05014
G1 X90.662 Y93.268 E.0005
; LINE_WIDTH: 0.240272
G1 X90.697 Y93.249 E.00064
; LINE_WIDTH: 0.205575
G1 X90.732 Y93.23 E.00053
; LINE_WIDTH: 0.154047
G1 X90.767 Y93.21 E.00036
G1 X93.425 Y93.054 E.02411
G1 X93.433 Y91.245 E.01638
; LINE_WIDTH: 0.17089
G1 X93.45 Y91.209 E.00041
; LINE_WIDTH: 0.205155
G1 X93.467 Y91.174 E.00052
; LINE_WIDTH: 0.239419
G1 X93.485 Y91.138 E.00063
; LINE_WIDTH: 0.29192
G1 X93.502 Y91.12 E.00052
G1 X93.502 Y88.88 E.04544
G1 X93.485 Y88.862 E.00052
; LINE_WIDTH: 0.239688
G1 X93.468 Y88.826 E.00063
; LINE_WIDTH: 0.205381
G1 X93.45 Y88.791 E.00052
; LINE_WIDTH: 0.153969
G1 X93.433 Y88.755 E.00036
G1 X93.424 Y86.946 E.01637
G1 X90.767 Y86.79 E.02409
; CHANGE_LAYER
; Z_HEIGHT: 15.1
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15000
G1 X92.763 Y86.907 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 76/111
; update layer progress
M73 L76
M991 S0 P75 ;notify layer change

; OBJECT_ID: 427
M204 S10000
G17
G3 Z15.3 I-.643 J1.033 P1  F42000
G1 X93.187 Y87.17 Z15.3
G1 Z15.1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X85.149 Y86.724 E.24735
G1 X85.149 Y87.368 E.01978
G1 X84.505 Y87.368 E.0198
G1 X84.505 Y87.096 E.00836
G1 X84.644 Y87.096 E.00427
G1 X84.643 Y86.227 E.02669
G1 X84.657 Y86.195 E.00106
G1 X88.148 Y86.387 E.10743
G1 X88.161 Y86.249 E.00425
G1 X90.698 Y86.39 E.07805
G1 X90.696 Y86.528 E.00426
G1 X93.684 Y86.701 E.09196
G1 X93.69 Y88.882 E.06701
G1 X93.828 Y88.888 E.00426
G1 X93.828 Y91.112 E.06835
G1 X93.69 Y91.118 E.00426
G1 X93.683 Y93.3 E.06705
G1 X90.696 Y93.472 E.09193
G1 X90.698 Y93.61 E.00426
G1 X88.161 Y93.751 E.07806
G1 X88.148 Y93.613 E.00425
G1 X84.648 Y93.798 E.10767
G1 X84.643 Y92.904 E.02746
G1 X84.505 Y92.904 E.00425
G1 X84.505 Y92.632 E.00836
G1 X85.149 Y92.632 E.0198
G1 X85.149 Y93.276 E.01978
G1 X93.187 Y92.83 E.24735
G1 X93.187 Y87.23 E.17205
; WIPE_START
G1 F12000
M204 S6000
G1 X91.191 Y87.105 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z15.5 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z15.5
G1 X0 Y90.0001 F18000 ; move to safe pos
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
            G0 Z15.5 F4000
            G39.3 S1
            G0 Z15.5 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X90.494 Y86.769 F42000
G1 Z15.1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.154002
G1 F1200
M204 S6000
G1 X93.429 Y86.941 E.02662
G1 X93.438 Y89.07 E.01927
G1 X93.455 Y89.105 E.00036
; LINE_WIDTH: 0.20491
G1 X93.472 Y89.141 E.00052
; LINE_WIDTH: 0.238917
G1 X93.489 Y89.176 E.00063
; LINE_WIDTH: 0.291663
G1 X93.508 Y89.195 E.00053
G1 X93.508 Y90.805 E.03262
G1 X93.489 Y90.824 E.00054
; LINE_WIDTH: 0.238704
G1 X93.472 Y90.859 E.00063
; LINE_WIDTH: 0.204734
G1 X93.455 Y90.895 E.00052
; LINE_WIDTH: 0.170765
G1 X93.438 Y90.93 E.00041
; LINE_WIDTH: 0.154076
G1 X93.43 Y93.059 E.01928
G1 X90.494 Y93.231 E.02664
G1 X90.46 Y93.25 E.00036
; LINE_WIDTH: 0.20474
G1 X90.425 Y93.269 E.00052
; LINE_WIDTH: 0.238732
G1 X90.391 Y93.288 E.00063
; LINE_WIDTH: 0.29166
G1 X90.373 Y93.307 E.00053
G1 X88.45 Y93.414 E.03903
G1 X88.43 Y93.397 E.00054
; LINE_WIDTH: 0.238611
G1 X88.394 Y93.382 E.00063
; LINE_WIDTH: 0.204674
G1 X88.358 Y93.367 E.00052
; LINE_WIDTH: 0.170736
G1 X88.321 Y93.352 E.00041
; LINE_WIDTH: 0.154565
G1 X84.956 Y93.539 E.03066
G1 X84.907 Y93.531 E.00046
G1 X84.897 Y93.483 E.00044
G1 X84.896 Y92.828 E.00596
; WIPE_START
G1 F15000
G1 X84.897 Y93.483 E-.2489
G1 X84.907 Y93.531 E-.01841
G1 X84.956 Y93.539 E-.01905
G1 X86.201 Y93.469 E-.47364
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.896 Y87.172 Z15.5 F42000
G1 Z15.1
G1 E.8 F1800
; LINE_WIDTH: 0.154627
G1 F1200
M204 S6000
G1 X84.896 Y86.517 E.00596
G1 X84.906 Y86.47 E.00044
G1 X84.956 Y86.462 E.00046
G1 X88.322 Y86.648 E.03068
G1 X88.358 Y86.633 E.00036
; LINE_WIDTH: 0.204785
G1 X88.394 Y86.618 E.00052
; LINE_WIDTH: 0.238768
G1 X88.431 Y86.603 E.00063
; LINE_WIDTH: 0.291657
G1 X88.451 Y86.586 E.00053
G1 X90.373 Y86.693 E.03902
G1 X90.391 Y86.712 E.00053
; LINE_WIDTH: 0.238725
G1 X90.425 Y86.731 E.00063
; LINE_WIDTH: 0.204734
G1 X90.46 Y86.75 E.00052
; LINE_WIDTH: 0.170742
G1 X90.494 Y86.769 E.00041
; CHANGE_LAYER
; Z_HEIGHT: 15.3
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X90.46 Y86.75 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 77/111
; update layer progress
M73 L77
M991 S0 P76 ;notify layer change

; OBJECT_ID: 427
M204 S10000
G17
G3 Z15.5 I-.183 J1.203 P1  F42000
G1 X93.192 Y87.165 Z15.5
G1 Z15.3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X85.134 Y86.718 E.248
G1 X85.134 Y87.368 E.01997
G1 X84.489 Y87.368 E.0198
G1 X84.489 Y87.096 E.00836
G1 X84.628 Y87.096 E.00427
G1 X84.628 Y86.221 E.02689
G1 X84.641 Y86.189 E.00105
G1 X88.524 Y86.402 E.11949
G1 X88.539 Y86.265 E.00425
G1 X90.32 Y86.364 E.05481
G1 X90.321 Y86.502 E.00426
G1 X93.692 Y86.7 E.10376
G1 X93.695 Y89.34 E.0811
G1 X93.834 Y89.351 E.00427
G1 X93.834 Y90.649 E.0399
G1 X93.695 Y90.66 E.00427
G1 X93.688 Y93.305 E.08127
G1 X90.321 Y93.498 E.10362
G1 X90.32 Y93.636 E.00426
G1 X88.539 Y93.735 E.05481
G1 X88.524 Y93.598 E.00425
M73 P83 R2
G1 X84.633 Y93.804 E.11973
G1 X84.627 Y92.904 E.02765
G1 X84.489 Y92.904 E.00425
G1 X84.489 Y92.632 E.00836
G1 X85.134 Y92.632 E.0198
G1 X85.134 Y93.282 E.01997
G1 X93.192 Y92.835 E.248
G1 X93.192 Y87.225 E.17235
; WIPE_START
G1 F12000
M204 S6000
G1 X91.196 Y87.1 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z15.7 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z15.7
G1 X0 Y90.0001 F18000 ; move to safe pos
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
            G0 Z15.7 F4000
            G39.3 S1
            G0 Z15.7 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X90.123 Y86.743 F42000
G1 Z15.3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.154126
G1 F1200
M204 S6000
G1 X93.435 Y86.936 E.03006
G1 X93.444 Y89.521 E.02343
G1 X93.467 Y89.572 E.00051
; LINE_WIDTH: 0.224725
G1 X93.491 Y89.624 E.00084
; LINE_WIDTH: 0.290375
G1 X93.513 Y89.647 E.00065
G1 X93.513 Y90.353 E.01422
G1 X93.491 Y90.376 E.00065
; LINE_WIDTH: 0.224739
G1 X93.467 Y90.428 E.00084
; LINE_WIDTH: 0.177393
G1 X93.444 Y90.479 E.00062
; LINE_WIDTH: 0.154137
G1 X93.435 Y93.064 E.02343
G1 X90.123 Y93.257 E.03007
G1 X90.072 Y93.284 E.00052
; LINE_WIDTH: 0.227225
G1 X90.022 Y93.312 E.00086
; LINE_WIDTH: 0.291247
G1 X90.001 Y93.333 E.0006
G1 X88.823 Y93.398 E.02387
G1 X88.801 Y93.38 E.00058
; LINE_WIDTH: 0.228031
G1 X88.748 Y93.358 E.00087
; LINE_WIDTH: 0.178672
G1 X88.694 Y93.336 E.00064
; LINE_WIDTH: 0.154606
G1 X84.941 Y93.545 E.03421
G1 X84.891 Y93.537 E.00046
G1 X84.881 Y93.489 E.00044
G1 X84.88 Y92.828 E.00602
; WIPE_START
G1 F15000
G1 X84.881 Y93.489 E-.25123
G1 X84.891 Y93.537 E-.01841
G1 X84.941 Y93.545 E-.01905
G1 X86.179 Y93.476 E-.47132
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.881 Y87.172 Z15.7 F42000
G1 Z15.3
G1 E.8 F1800
; LINE_WIDTH: 0.15483
G1 F1200
M204 S6000
G1 X84.881 Y86.511 E.00603
G1 X84.89 Y86.464 E.00044
G1 X84.941 Y86.455 E.00047
G1 X88.694 Y86.664 E.03428
G1 X88.748 Y86.642 E.00053
; LINE_WIDTH: 0.228172
G1 X88.802 Y86.62 E.00087
; LINE_WIDTH: 0.291232
G1 X88.824 Y86.602 E.00058
G1 X90.001 Y86.667 E.02387
G1 X90.022 Y86.688 E.0006
; LINE_WIDTH: 0.227214
G1 X90.072 Y86.716 E.00086
; LINE_WIDTH: 0.178196
G1 X90.123 Y86.743 E.00063
; CHANGE_LAYER
; Z_HEIGHT: 15.5
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X90.072 Y86.716 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 78/111
; update layer progress
M73 L78
M991 S0 P77 ;notify layer change

; OBJECT_ID: 427
M204 S10000
G17
G3 Z15.7 I-.171 J1.205 P1  F42000
G1 X93.197 Y87.16 Z15.7
G1 Z15.5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X85.118 Y86.712 E.24864
G1 X85.118 Y87.368 E.02016
G1 X84.473 Y87.368 E.0198
G1 X84.473 Y87.096 E.00836
G1 X84.612 Y87.096 E.00427
G1 X84.612 Y86.215 E.02707
G1 X84.63 Y86.182 E.00115
G1 X89.21 Y86.436 E.14095
G1 X89.245 Y86.298 E.00434
G1 X89.616 Y86.319 E.01143
G1 X89.637 Y86.459 E.00435
G1 X93.697 Y86.696 E.12498
G1 X93.696 Y93.307 E.20315
G1 X89.637 Y93.541 E.12495
G1 X89.616 Y93.681 E.00435
G1 X89.245 Y93.702 E.01143
M73 P84 R2
G1 X89.21 Y93.564 E.00434
G1 X84.623 Y93.815 E.14116
G1 X84.612 Y92.904 E.028
G1 X84.473 Y92.904 E.00425
G1 X84.473 Y92.632 E.00836
G1 X85.118 Y92.632 E.0198
G1 X85.118 Y93.288 E.02016
G1 X93.197 Y92.84 E.24864
G1 X93.197 Y87.22 E.17267
; WIPE_START
G1 F12000
M204 S6000
G1 X91.201 Y87.095 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z15.9 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z15.9
G1 X0 Y90.0001 F18000 ; move to safe pos
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
            G0 Z15.9 F4000
            G39.3 S1
            G0 Z15.9 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X89.411 Y86.686 F42000
G1 Z15.5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.154381
G1 F1200
M204 S6000
G1 X89.358 Y86.695 E.00049
G1 X84.925 Y86.449 E.04033
G1 X84.875 Y86.458 E.00046
G1 X84.865 Y86.505 E.00043
G1 X84.865 Y87.172 E.00606
; WIPE_START
G1 F15000
G1 X84.865 Y86.505 E-.25355
G1 X84.875 Y86.458 E-.0182
G1 X84.925 Y86.449 E-.0194
G1 X86.157 Y86.518 E-.46885
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X89.42 Y86.505 Z15.9 F42000
G1 Z15.5
G1 E.8 F1800
; LINE_WIDTH: 0.126757
G1 F1200
M204 S6000
G1 X89.413 Y86.653 E.00102
; LINE_WIDTH: 0.15399
G1 X89.411 Y86.686 E.0003
G1 X89.463 Y86.701 E.00049
G1 X93.44 Y86.931 E.03606
G1 X93.449 Y93.025 E.05516
G1 X93.44 Y93.069 E.0004
G1 X93.397 Y93.08 E.00041
G1 X89.463 Y93.299 E.03566
G1 X89.411 Y93.314 E.00049
G1 X89.413 Y93.346 E.00029
; LINE_WIDTH: 0.126875
G1 X89.42 Y93.495 E.00102
M204 S10000
G1 X89.411 Y93.314 F42000
; LINE_WIDTH: 0.154432
G1 F1200
M204 S6000
G1 X89.358 Y93.305 E.00049
G1 X84.925 Y93.551 E.04034
G1 X84.875 Y93.543 E.00046
G1 X84.865 Y93.495 E.00044
G1 X84.865 Y92.828 E.00606
; CHANGE_LAYER
; Z_HEIGHT: 15.7
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X84.865 Y93.495 E-.25354
G1 X84.875 Y93.543 E-.01841
G1 X84.925 Y93.551 E-.01905
G1 X86.157 Y93.482 E-.469
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 79/111
; update layer progress
M73 L79
M991 S0 P78 ;notify layer change

; OBJECT_ID: 427
M204 S10000
G17
G3 Z15.9 I.813 J.905 P1  F42000
G1 X93.203 Y87.156 Z15.9
G1 Z15.7
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X85.102 Y86.706 E.24929
G1 X85.102 Y87.388 E.02096
G1 X84.457 Y87.388 E.01981
G1 X84.458 Y87.096 E.00897
G1 X84.596 Y87.096 E.00427
G1 X84.605 Y86.18 E.02814
G1 X93.679 Y86.678 E.27926
G1 X93.706 Y86.713 E.00134
G1 X93.699 Y93.315 E.20286
G1 X84.601 Y93.816 E.27997
G1 X84.596 Y92.904 E.02802
G1 X84.458 Y92.904 E.00425
G1 X84.457 Y92.612 E.00897
G1 X85.102 Y92.612 E.01981
G1 X85.102 Y93.294 E.02096
G1 X93.203 Y92.844 E.24929
G1 X93.203 Y87.216 E.17296
; WIPE_START
G1 F12000
M204 S6000
G1 X91.207 Y87.09 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z16.1 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z16.1
G1 X0 Y90.0001 F18000 ; move to safe pos
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
            G0 Z16.1 F4000
            G39.3 S1
            G0 Z16.1 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X84.849 Y87.192 F42000
G1 Z15.7
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.154162
G1 F1200
M204 S6000
G1 X84.849 Y86.498 E.00628
G1 X84.859 Y86.452 E.00043
G1 X84.909 Y86.443 E.00046
G1 X93.446 Y86.926 E.0775
G1 X93.454 Y93.03 E.05533
G1 X93.446 Y93.074 E.00041
G1 X93.402 Y93.085 E.00041
G1 X84.909 Y93.557 E.0771
G1 X84.86 Y93.549 E.00045
G1 X84.85 Y93.502 E.00044
G1 X84.849 Y92.808 E.00628
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 15.9
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X84.85 Y93.502 E-.26343
G1 X84.86 Y93.549 E-.01841
G1 X84.909 Y93.557 E-.01905
G1 X86.116 Y93.49 E-.45912
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 80/111
; update layer progress
M73 L80
M991 S0 P79 ;notify layer change

; OBJECT_ID: 427
M204 S10000
G17
G3 Z16.1 I.811 J.907 P1  F42000
G1 X93.208 Y87.151 Z16.1
G1 Z15.9
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X93.208 Y92.849 E.17511
G1 X85.486 Y93.278 E.23765
G1 X85.086 Y93.3 E.01229
G1 X85.086 Y92.971 E.01011
G1 X85.086 Y92.571 E.01229
G1 X85.086 Y92.202 E.01134
M106 S204
M106 S255
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
G1 F3000
G1 X85.086 Y87.798 E.14611
M106 S204
M106 S255
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X85.086 Y87.429 E.01134
M106 S204
M106 S255
G1 X85.086 Y87.03 E.01225
G1 X85.086 Y86.7 E.01016
G1 X85.486 Y86.722 E.01229
G1 X93.148 Y87.147 E.2358
; WIPE_START
G1 F12000
M204 S6000
G1 X93.169 Y89.147 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.707 Y87.543 Z16.3 F42000
G1 X84.442 Y87.271 Z16.3
G1 Z15.9
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X84.442 Y87.096 E.00537
G1 X84.581 Y87.096 E.00427
G1 X84.58 Y86.199 E.02756
G1 X84.597 Y86.17 E.00103
G1 X93.684 Y86.673 E.27967
G1 X93.711 Y86.708 E.00134
G1 X93.711 Y93.295 E.20241
G1 X93.699 Y93.323 E.00094
G1 X84.599 Y93.83 E.28006
G1 X84.582 Y93.816 E.00067
G1 X84.581 Y93.304 E.01572
G1 X84.58 Y92.904 E.01229
G1 X84.442 Y92.904 E.00425
G1 X84.442 Y92.571 E.01023
G1 X84.442 Y92.202 E.01134
M106 S204
M106 S255
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
G1 F3000
G1 X84.442 Y87.798 E.14611
M106 S204
M106 S255
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X84.442 Y87.429 E.01134
M106 S204
G1 X84.442 Y87.331 E.00301
; WIPE_START
G1 F2423.038
M204 S6000
G1 X84.442 Y87.096 E-.08922
G1 X84.581 Y87.096 E-.05277
G1 X84.58 Y86.199 E-.34079
G1 X84.597 Y86.17 E-.0127
G1 X85.292 Y86.208 E-.26452
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z16.3 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z16.3
G1 X0 Y90.0001 F18000 ; move to safe pos
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
            G0 Z16.3 F4000
            G39.3 S1
            G0 Z16.3 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X85.278 Y86.459 F42000
G1 Z15.9
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.154204
G1 F1200
M204 S6000
G1 X93.451 Y86.921 E.07423
G1 X93.46 Y93.035 E.05544
G1 X93.451 Y93.079 E.00041
G1 X93.407 Y93.09 E.00041
G1 X84.893 Y93.563 E.07732
G1 X84.844 Y93.555 E.00045
G1 X84.834 Y93.508 E.00044
G1 X84.833 Y92.708 E.00725
G1 X84.814 Y92.67 E.00039
; LINE_WIDTH: 0.214889
G1 X84.795 Y92.632 E.0006
; LINE_WIDTH: 0.253108
G1 X84.776 Y92.593 E.00073
; LINE_WIDTH: 0.295361
M73 P85 R2
G1 X84.764 Y87.418 E.10646
G1 X84.777 Y87.405 E.00037
; LINE_WIDTH: 0.251131
G1 X84.796 Y87.368 E.00072
; LINE_WIDTH: 0.213271
G1 X84.815 Y87.33 E.00059
; LINE_WIDTH: 0.175411
G1 X84.834 Y87.292 E.00046
; LINE_WIDTH: 0.15656
G1 X84.833 Y86.923 E.00342
; LINE_WIDTH: 0.154204
G1 X84.833 Y86.492 E.0039
G1 X84.843 Y86.445 E.00043
G1 X84.893 Y86.437 E.00046
G1 X85.218 Y86.455 E.00295
; CHANGE_LAYER
; Z_HEIGHT: 16.1
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15000
G1 X87.215 Y86.568 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 81/111
; update layer progress
M73 L81
M991 S0 P80 ;notify layer change

; OBJECT_ID: 427
M204 S10000
G17
G3 Z16.3 I-.117 J1.211 P1  F42000
G1 X93.213 Y87.146 Z16.3
G1 Z16.1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X93.213 Y92.854 E.17541
G1 X85.071 Y93.307 E.25058
G1 X85.071 Y87.004 E.19366
G1 X85.071 Y86.693 E.00954
G1 X93.153 Y87.142 E.24874
; WIPE_START
G1 F12000
M204 S6000
G1 X93.174 Y89.142 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.75 Y87.374 Z16.5 F42000
G1 X84.565 Y87.091 Z16.5
G1 Z16.1
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X84.569 Y86.173 E.02823
G1 X92.98 Y86.629 E.25885
G1 X93.713 Y86.664 E.02252
G1 X93.739 Y86.705 E.00149
G1 X93.739 Y93.297 E.20257
G1 X93.723 Y93.332 E.00118
G1 X84.569 Y93.827 E.2817
G1 X84.564 Y92.904 E.02834
G1 X84.426 Y92.904 E.00425
G1 X84.426 Y87.096 E.17847
G1 X84.509 Y87.096 E.00256
; WIPE_START
G1 F12000
M204 S6000
G1 X84.569 Y86.173 E-.35149
G1 X85.642 Y86.231 E-.40851
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z16.5 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z16.5
G1 X0 Y90.0001 F18000 ; move to safe pos
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
            G0 Z16.5 F4000
            G39.3 S1
            G0 Z16.5 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X85.629 Y86.472 F42000
G1 Z16.1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.159914
G1 F1200
M204 S6000
G1 X93.412 Y86.903 E.07432
G1 X93.47 Y86.921 E.00058
G1 X93.476 Y93.04 E.05833
G1 X93.47 Y93.08 E.00038
G1 X93.412 Y93.097 E.00058
G1 X84.878 Y93.569 E.08149
G1 X84.828 Y93.561 E.00048
G1 X84.818 Y93.514 E.00046
G1 X84.817 Y92.708 E.00768
G1 X84.798 Y92.67 E.00041
; LINE_WIDTH: 0.214791
G1 X84.779 Y92.632 E.0006
; LINE_WIDTH: 0.252984
G1 X84.76 Y92.594 E.00073
; LINE_WIDTH: 0.295339
G1 X84.748 Y87.418 E.10645
G1 X84.761 Y87.405 E.00037
; LINE_WIDTH: 0.25104
G1 X84.78 Y87.368 E.00072
; LINE_WIDTH: 0.2132
G1 X84.799 Y87.33 E.00059
; LINE_WIDTH: 0.17536
G1 X84.818 Y87.292 E.00046
; LINE_WIDTH: 0.15649
G1 X84.818 Y87.004 E.00266
; LINE_WIDTH: 0.159914
G1 X84.818 Y86.486 E.00494
G1 X84.827 Y86.439 E.00046
G1 X84.878 Y86.431 E.00049
G1 X85.569 Y86.469 E.0066
; CHANGE_LAYER
; Z_HEIGHT: 16.3
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F15000
G1 X87.566 Y86.58 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 82/111
; update layer progress
M73 L82
M991 S0 P81 ;notify layer change

; OBJECT_ID: 427
M204 S10000
G17
G3 Z16.5 I-.12 J1.211 P1  F42000
G1 X93.218 Y87.141 Z16.5
G1 Z16.3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X93.218 Y92.859 E.17571
G1 X85.055 Y93.313 E.25123
G1 X85.055 Y86.978 E.19464
G1 X85.055 Y86.687 E.00893
G1 X93.159 Y87.137 E.24939
; WIPE_START
G1 F12000
M204 S6000
G1 X93.179 Y89.137 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.8 Y87.189 Z16.7 F42000
G1 X84.55 Y86.86 Z16.7
G1 Z16.3
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X84.553 Y86.167 E.02129
G1 X90.903 Y86.508 E.19541
G2 X92.465 Y86.559 I1.978 J-36.63 E.04802
G1 X92.891 Y86.561 E.0131
G1 X93.426 Y86.549 E.01644
G1 X93.78 Y86.531 E.01089
G1 X93.818 Y86.536 E.00118
G1 X93.838 Y86.541 E.00062
G1 X93.861 Y86.552 E.00078
G1 X93.892 Y86.573 E.00117
G1 X93.92 Y86.599 E.00117
G1 X93.938 Y86.627 E.00101
G3 X93.956 Y86.707 I-.181 J.084 E.00255
G1 X93.953 Y93.328 E.20344
G3 X93.931 Y93.387 I-.176 J-.033 E.00197
G1 X93.923 Y93.398 E.00041
G1 X93.892 Y93.427 E.0013
G1 X93.86 Y93.448 E.00119
G1 X93.829 Y93.461 E.00102
G1 X93.776 Y93.47 E.00165
G1 X93.418 Y93.451 E.01101
G1 X92.89 Y93.439 E.01623
G1 X92.467 Y93.441 E.01301
G2 X90.903 Y93.492 I.394 J36.019 E.04807
G1 X84.567 Y93.842 E.19498
G1 X84.551 Y93.828 E.00067
G1 X84.549 Y92.904 E.02837
G1 X84.41 Y92.904 E.00425
G1 X84.41 Y87.096 E.17848
G1 X84.549 Y87.096 E.00427
G1 X84.55 Y86.92 E.00541
; WIPE_START
G1 F12000
M204 S6000
G1 X84.553 Y86.167 E-.28615
G1 X85.798 Y86.234 E-.47386
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z16.7 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z16.7
G1 X0 Y90.0001 F18000 ; move to safe pos
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
            G0 Z16.7 F4000
            G39.3 S1
            G0 Z16.7 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X85.785 Y86.474 F42000
G1 Z16.3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.155874
G1 F1200
M204 S6000
G1 X92.273 Y86.823 E.0598
; LINE_WIDTH: 0.196025
G1 X92.893 Y86.842 E.00774
; LINE_WIDTH: 0.232674
M73 P86 R2
G1 X93.42 Y86.85 E.00815
; LINE_WIDTH: 0.273032
G1 X93.488 Y86.872 E.00133
; LINE_WIDTH: 0.325333
G1 X93.536 Y86.892 E.00121
; LINE_WIDTH: 0.371127
G1 X93.585 Y86.913 E.00141
; LINE_WIDTH: 0.388638
G1 X93.587 Y93.045 E.17275
G1 X93.585 Y93.088 E.00121
G1 X93.533 Y93.108 E.00156
; LINE_WIDTH: 0.324401
G1 X93.482 Y93.129 E.00127
; LINE_WIDTH: 0.277948
G1 X93.431 Y93.149 E.00106
; LINE_WIDTH: 0.233055
G1 X92.894 Y93.158 E.00832
; LINE_WIDTH: 0.195996
G1 X92.273 Y93.177 E.00775
; LINE_WIDTH: 0.156037
G1 X84.862 Y93.575 E.06841
G1 X84.812 Y93.567 E.00046
G1 X84.802 Y93.52 E.00045
G1 X84.802 Y92.709 E.00748
G1 X84.782 Y92.67 E.00039
; LINE_WIDTH: 0.214681
G1 X84.763 Y92.632 E.0006
; LINE_WIDTH: 0.252787
G1 X84.744 Y92.594 E.00073
; LINE_WIDTH: 0.295368
G1 X84.733 Y87.418 E.10649
G1 X84.745 Y87.405 E.00037
; LINE_WIDTH: 0.25088
G1 X84.764 Y87.367 E.00072
; LINE_WIDTH: 0.21312
G1 X84.783 Y87.329 E.00059
; LINE_WIDTH: 0.17536
G1 X84.802 Y87.291 E.00046
; LINE_WIDTH: 0.15653
G1 X84.802 Y86.978 E.0029
; LINE_WIDTH: 0.155874
G1 X84.802 Y86.48 E.00458
G1 X84.812 Y86.433 E.00044
G1 X84.862 Y86.425 E.00047
G1 X85.725 Y86.471 E.00796
; CHANGE_LAYER
; Z_HEIGHT: 16.5
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15000
G1 X87.722 Y86.579 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 83/111
; update layer progress
M73 L83
M991 S0 P82 ;notify layer change

; OBJECT_ID: 427
M204 S10000
G17
G3 Z16.7 I-.123 J1.211 P1  F42000
G1 X93.224 Y87.136 Z16.7
G1 Z16.5
M106 S255
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X93.224 Y88.84 E.05236
G2 X93.224 Y88.888 I.055 J.025 E.00154
G1 X93.224 Y92.864 E.12216
G1 X85.039 Y93.319 E.25187
G1 X85.039 Y87.133 E.19007
G1 X85.039 Y86.681 E.01388
G1 X93.164 Y87.132 E.25003
; WIPE_START
G1 F12000
M204 S6000
G1 X93.224 Y88.84 E-.64918
G1 X93.224 Y88.888 E-.0185
G1 X93.224 Y89.131 E-.09232
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.893 Y87.008 Z16.9 F42000
G1 X84.536 Y86.615 Z16.9
G1 Z16.5
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X84.537 Y86.16 E.01396
G1 X88.826 Y86.388 E.13196
G2 X90.401 Y86.439 I1.977 J-36.191 E.04843
G1 X90.538 Y86.441 E.0042
G1 X91.11 Y86.436 E.01759
G1 X91.457 Y86.423 E.01067
G1 X91.819 Y86.399 E.01114
G1 X92.082 Y86.367 E.00816
G1 X92.232 Y86.338 E.00469
G1 X92.365 Y86.299 E.00424
M106 S204
M106 S255
G1 F1080
G1 X92.463 Y86.252 E.00335
M106 S204
M106 S255
G1 F720
G1 X92.509 Y86.241 E.00147
M106 S204
M106 S255
G1 F600
G1 X92.606 Y86.227 E.003
M106 S204
M106 S255
G1 X92.737 Y86.216 E.00404
M106 S204
M106 S255
G3 X93.513 Y86.202 I.548 J9.311 E.02385
M106 S204
M106 S255
G1 X93.748 Y86.208 E.00725
M106 S204
M106 S255
G3 X93.887 Y86.225 I.006 J.527 E.00431
M106 S204
M106 S255
G1 F720
G3 X93.993 Y86.27 I-.103 J.385 E.00354
M106 S204
M106 S255
G1 F840
G3 X94.073 Y86.333 I-.224 J.372 E.00314
M106 S204
M106 S255
G1 F960
G1 X94.113 Y86.378 E.00185
M106 S204
M106 S255
G1 F1080
G3 X94.158 Y86.453 I-.37 J.276 E.00269
M106 S204
M106 S255
G1 F1200
G1 X94.174 Y86.492 E.00129
M106 S204
M106 S255
G1 X94.19 Y86.546 E.00175
M106 S204
M106 S255
G1 X94.198 Y86.594 E.00148
M106 S204
M106 S255
G3 X94.201 Y92.751 I-384.794 J3.254 E.18919
G3 X94.193 Y93.436 I-3.877 J.3 E.02108
M106 S204
M106 S255
G1 X94.174 Y93.507 E.00226
M106 S204
M106 S255
G1 X94.144 Y93.574 E.00224
M106 S204
M106 S255
G1 F1080
G1 X94.101 Y93.637 E.00235
M106 S204
M106 S255
G1 F960
G1 X94.075 Y93.666 E.00119
M106 S204
M106 S255
G1 F840
G3 X93.993 Y93.73 I-.314 J-.317 E.0032
M106 S204
M106 S255
G1 F720
G3 X93.915 Y93.767 I-.211 J-.343 E.00266
M106 S204
M106 S255
G1 F600
G3 X93.748 Y93.792 I-.161 J-.504 E.00521
M106 S204
M106 S255
G1 X93.513 Y93.798 E.00723
M106 S204
M106 S255
G3 X92.738 Y93.784 I-.221 J-9.724 E.0238
M106 S204
M106 S255
G1 X92.606 Y93.773 E.00408
M106 S204
M106 S255
G1 X92.509 Y93.759 E.003
M106 S204
M106 S255
G1 F720
G1 X92.464 Y93.749 E.00143
M106 S204
M106 S255
G1 F1080
G1 X92.379 Y93.706 E.00294
M106 S204
M106 S255
G1 F1200
G1 X92.264 Y93.669 E.00369
M106 S204
G1 X92.081 Y93.633 E.00575
G1 X91.898 Y93.61 E.00566
G1 X91.603 Y93.585 E.0091
G1 X91.306 Y93.57 E.00914
G1 X90.899 Y93.56 E.01249
G1 X90.53 Y93.559 E.01135
G1 X90.396 Y93.561 E.00411
G2 X89.195 Y93.594 I.209 J29.71 E.03694
G1 X84.552 Y93.848 E.14288
G1 X84.535 Y93.834 E.00067
G1 X84.533 Y92.826 E.03099
G1 X84.394 Y92.808 E.0043
G1 X84.394 Y87.192 E.17255
G1 X84.534 Y87.174 E.00431
G1 X84.535 Y86.675 E.01535
; WIPE_START
G1 F12000
M204 S6000
G1 X84.537 Y86.16 E-.19546
G1 X86.021 Y86.239 E-.56454
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z16.9 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z16.9
G1 X0 Y90.0001 F18000 ; move to safe pos
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
            G0 Z16.9 F4000
            G39.3 S1
            G0 Z16.9 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




M73 P87 R2
G1 X84.786 Y87.347 F42000
G1 Z16.5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.178285
G1 F1200
M204 S6000
G1 X84.764 Y87.397 E.0006
; LINE_WIDTH: 0.222207
G1 X84.742 Y87.447 E.0008
; LINE_WIDTH: 0.257011
G1 X84.73 Y87.461 E.00034
; LINE_WIDTH: 0.295281
G1 X84.717 Y87.476 E.0004
G1 X84.717 Y92.524 E.10381
G1 X84.742 Y92.552 E.00078
; LINE_WIDTH: 0.223572
G1 X84.764 Y92.603 E.00081
; LINE_WIDTH: 0.158909
G1 X84.786 Y92.653 E.00052
G1 X84.787 Y93.526 E.00825
G1 X84.797 Y93.574 E.00046
G1 X84.846 Y93.582 E.00047
G1 X89.184 Y93.341 E.04106
G1 X90.529 Y93.287 E.01273
; LINE_WIDTH: 0.206646
G1 X90.904 Y93.277 E.005
; LINE_WIDTH: 0.234469
G1 X91.318 Y93.271 E.00646
; LINE_WIDTH: 0.267292
G1 X91.626 Y93.27 E.00563
; LINE_WIDTH: 0.305135
G1 X91.936 Y93.274 E.00663
; LINE_WIDTH: 0.345432
G1 X92.142 Y93.282 E.00509
; LINE_WIDTH: 0.377164
G1 X92.245 Y93.289 E.00282
; LINE_WIDTH: 0.405663
G1 X92.372 Y93.298 E.00374
; LINE_WIDTH: 0.436255
G1 X92.446 Y93.308 E.0024
; LINE_WIDTH: 0.470477
G3 X92.555 Y93.323 I-.145 J1.409 E.00382
M204 S10000
G1 X92.607 Y93.334 F42000
; LINE_WIDTH: 0.54383
G1 F1200
M204 S6000
G2 X92.916 Y93.338 I.232 J-6.455 E.01261
; LINE_WIDTH: 0.58319
G2 X93.506 Y93.319 I-.056 J-10.989 E.02599
; LINE_WIDTH: 0.633263
G1 X93.589 Y93.292 E.0042
; LINE_WIDTH: 0.682717
G1 X93.672 Y93.265 E.00455
; LINE_WIDTH: 0.687588
G1 X93.692 Y93.157 E.00576
; LINE_WIDTH: 0.647876
G1 X93.712 Y93.05 E.0054
; LINE_WIDTH: 0.62797
G1 X93.712 Y92.215 E.0398
M204 S10000
G1 X93.429 Y92.151 F42000
; LINE_WIDTH: 0.0848917
G1 F1200
M204 S6000
G1 X93.452 Y92.157 E.00008
; LINE_WIDTH: 0.132114
G1 X93.476 Y92.162 E.00018
; LINE_WIDTH: 0.179337
G1 X93.5 Y92.167 E.00027
; LINE_WIDTH: 0.226559
G1 X93.523 Y92.172 E.00036
; LINE_WIDTH: 0.273782
G1 X93.547 Y92.178 E.00046
; LINE_WIDTH: 0.321005
G1 X93.571 Y92.183 E.00055
; LINE_WIDTH: 0.368227
G1 X93.594 Y92.188 E.00064
; LINE_WIDTH: 0.41545
G1 X93.618 Y92.194 E.00073
; LINE_WIDTH: 0.462672
G1 X93.641 Y92.199 E.00083
; LINE_WIDTH: 0.509895
G1 X93.665 Y92.204 E.00092
; LINE_WIDTH: 0.557118
G1 X93.689 Y92.21 E.00101
; LINE_WIDTH: 0.618949
G1 X93.712 Y92.215 E.00114
G1 X93.717 Y92.142 E.00342
G1 X93.712 Y90.535 E.07543
; LINE_WIDTH: 0.604351
G1 X93.689 Y90.54 E.00111
; LINE_WIDTH: 0.557125
G1 X93.665 Y90.546 E.00101
; LINE_WIDTH: 0.5099
G1 X93.641 Y90.551 E.00092
; LINE_WIDTH: 0.462675
G1 X93.618 Y90.556 E.00083
; LINE_WIDTH: 0.41545
G1 X93.594 Y90.562 E.00073
; LINE_WIDTH: 0.368224
G1 X93.571 Y90.567 E.00064
; LINE_WIDTH: 0.320999
G1 X93.547 Y90.572 E.00055
; LINE_WIDTH: 0.273774
G1 X93.523 Y90.578 E.00046
; LINE_WIDTH: 0.226549
G1 X93.5 Y90.583 E.00036
; LINE_WIDTH: 0.179324
G1 X93.476 Y90.588 E.00027
; LINE_WIDTH: 0.132098
G1 X93.452 Y90.593 E.00018
; LINE_WIDTH: 0.0848732
G1 X93.429 Y90.599 E.00008
M204 S10000
G1 X93.712 Y90.535 F42000
; LINE_WIDTH: 0.627991
G1 F1200
M204 S6000
G1 X93.712 Y86.95 E.17091
; LINE_WIDTH: 0.647645
G1 X93.693 Y86.843 E.00537
; LINE_WIDTH: 0.686935
G1 X93.673 Y86.736 E.00572
; LINE_WIDTH: 0.681976
G1 X93.589 Y86.708 E.0046
; LINE_WIDTH: 0.632761
G1 X93.505 Y86.681 E.00424
; LINE_WIDTH: 0.588823
G2 X93.092 Y86.665 I-.334 J3.253 E.01841
; LINE_WIDTH: 0.555477
G2 X92.658 Y86.664 I-.235 J9.458 E.01814
; LINE_WIDTH: 0.524463
G1 X92.601 Y86.667 E.00221
M204 S10000
G1 X92.533 Y86.681 F42000
; LINE_WIDTH: 0.475146
G1 F1200
M204 S6000
G1 X92.495 Y86.687 E.00133
; LINE_WIDTH: 0.453082
G1 X92.413 Y86.696 E.00279
; LINE_WIDTH: 0.421994
G1 X92.312 Y86.707 E.00313
; LINE_WIDTH: 0.383829
G1 X92.132 Y86.719 E.00502
; LINE_WIDTH: 0.337762
G1 X91.853 Y86.728 E.00669
; LINE_WIDTH: 0.289652
G1 X91.471 Y86.73 E.00768
; LINE_WIDTH: 0.249941
G1 X91.116 Y86.727 E.006
; LINE_WIDTH: 0.214619
G1 X90.536 Y86.714 E.00811
; LINE_WIDTH: 0.158186
G1 X88.813 Y86.639 E.0162
G1 X84.846 Y86.419 E.03732
G1 X84.796 Y86.427 E.00048
G1 X84.786 Y86.474 E.00045
G1 X84.786 Y87.347 E.0082
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 16.7
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15000
G1 X84.786 Y86.474 E-.33172
G1 X84.796 Y86.427 E-.01825
G1 X84.846 Y86.419 E-.01938
G1 X85.873 Y86.476 E-.39064
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 84/111
; update layer progress
M73 L84
M991 S0 P83 ;notify layer change

; OBJECT_ID: 427
M204 S10000
G17
G3 Z16.9 I-.108 J1.212 P1  F42000
G1 X93.229 Y87.131 Z16.9
G1 Z16.7
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X93.229 Y92.869 E.17631
G1 X85.023 Y93.325 E.25252
G1 X85.023 Y87.033 E.19332
G1 X85.023 Y86.675 E.01101
G1 X93.169 Y87.128 E.25068
; WIPE_START
G1 F12000
M204 S6000
G1 X93.19 Y89.128 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.965 Y86.668 Z17.1 F42000
G1 X84.517 Y86.175 Z17.1
G1 Z16.7
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X84.543 Y86.145 E.00121
G2 X88.326 Y86.319 I5.919 J-87.462 E.11637
G1 X88.48 Y86.321 E.00474
G1 X89.052 Y86.314 E.01758
G1 X89.324 Y86.305 E.00834
G1 X89.546 Y86.293 E.00684
G1 X89.767 Y86.275 E.00681
G1 X90.005 Y86.246 E.00738
G1 X90.153 Y86.218 E.00462
G1 X90.226 Y86.199 E.00231
M106 S204
M106 S255
G1 X90.284 Y86.18 E.00189
M106 S204
M106 S255
G1 F1080
G1 X90.386 Y86.131 E.00346
M106 S204
M106 S255
G1 F720
G1 X90.433 Y86.12 E.0015
M106 S204
M106 S255
G1 F600
G1 X90.527 Y86.107 E.00291
M106 S204
M106 S255
G1 X90.822 Y86.086 E.00909
M106 S204
M106 S255
G3 X91.376 Y86.081 I.37 J9.97 E.01702
M106 S204
M106 S255
G1 X91.673 Y86.088 E.00913
M106 S204
M106 S255
G1 F1080
G1 X92.127 Y86.108 E.01396
M106 S204
M106 S255
G1 F1200
G1 X92.526 Y86.13 E.01229
G1 X93.065 Y86.161 E.01658
G1 X93.464 Y86.185 E.01229
G1 X93.847 Y86.209 E.01179
G3 X94.22 Y86.649 I-.068 J.436 E.01932
G1 X94.22 Y93.351 E.20596
G3 X93.833 Y93.793 I-.458 J-.011 E.01959
G1 X93.458 Y93.815 E.01154
G1 X93.059 Y93.838 E.01229
G1 X92.572 Y93.867 E.01497
G1 X92.173 Y93.89 E.01229
G1 F1080
G1 X91.728 Y93.91 E.0137
M106 S204
M106 S255
G1 F600
G1 X91.435 Y93.918 E.00899
M106 S204
M106 S255
G1 X91.004 Y93.919 E.01325
M106 S204
M106 S255
G1 X90.822 Y93.914 E.00559
M106 S204
M106 S255
G1 X90.527 Y93.893 E.00909
M106 S204
M106 S255
G1 X90.433 Y93.88 E.00291
M106 S204
M106 S255
G1 F720
G1 X90.387 Y93.869 E.00145
M106 S204
M106 S255
G1 F1080
G1 X90.296 Y93.824 E.00312
M106 S204
M106 S255
G1 F1200
G1 X90.18 Y93.788 E.00375
M106 S204
G1 X90.037 Y93.759 E.00448
G1 X89.87 Y93.736 E.00516
G1 X89.672 Y93.716 E.00611
G1 X89.38 Y93.698 E.00901
G1 X88.818 Y93.681 E.01725
G1 X88.341 Y93.682 E.01468
G2 X87.212 Y93.71 I.37 J37.073 E.0347
G1 X84.55 Y93.855 E.08191
G1 X84.521 Y93.843 E.00098
G1 X84.517 Y86.235 E.23377
; WIPE_START
G1 F12000
M204 S6000
G1 X84.543 Y86.145 E-.03552
G1 X86.447 Y86.246 E-.72448
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z17.1 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z17.1
G1 X0 Y90.0001 F18000 ; move to safe pos
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
            G0 Z17.1 F4000
            G39.3 S1
            G0 Z17.1 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X88.479 Y86.594 F42000
G1 Z16.7
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.158572
G1 F1200
M204 S6000
G1 X84.831 Y86.413 E.03443
G1 X84.78 Y86.421 E.00048
G1 X84.77 Y86.468 E.00045
G1 X84.78 Y93.579 E.06702
G1 X88.147 Y93.417 E.03177
; LINE_WIDTH: 0.199368
G1 X88.824 Y93.398 E.00863
; LINE_WIDTH: 0.242013
G1 X89.396 Y93.39 E.00929
; LINE_WIDTH: 0.284687
G1 X89.701 Y93.392 E.006
; LINE_WIDTH: 0.319256
G1 X89.914 Y93.396 E.0048
; LINE_WIDTH: 0.354006
G1 X90.102 Y93.404 E.00477
; LINE_WIDTH: 0.395636
G1 X90.284 Y93.418 E.00526
; LINE_WIDTH: 0.433051
G1 X90.359 Y93.427 E.00239
; LINE_WIDTH: 0.466636
G3 X90.469 Y93.442 I-.134 J1.386 E.00382
M204 S10000
G1 X90.527 Y93.454 F42000
; LINE_WIDTH: 0.542808
G1 F1200
M204 S6000
G2 X90.844 Y93.458 I.207 J-3.654 E.01292
; LINE_WIDTH: 0.603075
G2 X93.441 Y93.337 I-.985 J-48.842 E.11865
; LINE_WIDTH: 0.626476
G1 X93.523 Y93.314 E.00405
; LINE_WIDTH: 0.662965
G1 X93.605 Y93.291 E.0043
; LINE_WIDTH: 0.685363
G1 X93.687 Y93.268 E.00446
M73 P88 R2
G1 X93.724 Y93.054 E.01133
; LINE_WIDTH: 0.64191
G1 X93.724 Y86.946 E.29818
; LINE_WIDTH: 0.66078
G1 X93.706 Y86.839 E.00544
; LINE_WIDTH: 0.69854
G1 X93.687 Y86.733 E.00577
; LINE_WIDTH: 0.69915
G1 X93.605 Y86.71 E.00456
; LINE_WIDTH: 0.66259
G1 X93.523 Y86.687 E.0043
; LINE_WIDTH: 0.609095
G1 X93.441 Y86.664 E.00393
G2 X91.371 Y86.554 I-5.483 J84.019 E.09564
; LINE_WIDTH: 0.581412
G2 X90.844 Y86.542 I-.703 J18.9 E.0231
; LINE_WIDTH: 0.542498
G2 X90.523 Y86.546 I-.11 J3.602 E.01308
M204 S10000
G1 X90.453 Y86.56 F42000
; LINE_WIDTH: 0.458091
G1 F1200
M204 S6000
G1 X90.331 Y86.577 E.00417
; LINE_WIDTH: 0.419601
G1 X90.229 Y86.587 E.00313
; LINE_WIDTH: 0.383235
G1 X90.055 Y86.598 E.00484
; LINE_WIDTH: 0.339507
G1 X89.797 Y86.607 E.00623
; LINE_WIDTH: 0.301197
G1 X89.566 Y86.61 E.00487
; LINE_WIDTH: 0.272951
G1 X89.336 Y86.61 E.00431
; LINE_WIDTH: 0.247691
G1 X89.058 Y86.607 E.00464
; LINE_WIDTH: 0.216041
G1 X88.479 Y86.594 E.00817
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 16.9
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F15000
G1 X89.058 Y86.607 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 85/111
; update layer progress
M73 L85
M991 S0 P84 ;notify layer change

; OBJECT_ID: 427
M204 S10000
G17
G3 Z17.1 I-.15 J1.208 P1  F42000
G1 X93.234 Y87.126 Z17.1
G1 Z16.9
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X93.234 Y92.874 E.17663
G1 X85.008 Y93.331 E.25315
G1 X85.008 Y86.943 E.19627
G1 X85.009 Y86.669 E.00842
G1 X93.174 Y87.123 E.25127
; WIPE_START
G1 F12000
M204 S6000
G1 X93.195 Y89.122 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.967 Y86.67 Z17.3 F42000
G1 X84.502 Y86.172 Z17.3
G1 Z16.9
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X84.509 Y86.145 E.00085
G1 X84.532 Y86.139 E.00073
G2 X86.23 Y86.197 I2.083 J-35.809 E.05223
G1 X86.665 Y86.199 E.01335
G1 X86.995 Y86.193 E.01015
G1 X87.305 Y86.182 E.00953
G1 X87.713 Y86.152 E.01257
G1 X87.928 Y86.125 E.00665
G1 X88.078 Y86.097 E.00469
G1 X88.165 Y86.073 E.00278
M106 S204
M106 S255
G1 X88.208 Y86.059 E.00139
M106 S204
M106 S255
G1 F1080
G1 X88.31 Y86.01 E.00346
M106 S204
M106 S255
G1 F720
G1 X88.357 Y85.999 E.00149
M106 S204
M106 S255
G1 F600
G1 X88.45 Y85.986 E.00288
M106 S204
M106 S255
G1 X88.745 Y85.966 E.00909
M106 S204
M106 S255
G3 X89.246 Y85.96 I.361 J9.611 E.01541
M106 S204
M106 S255
G1 X89.596 Y85.967 E.01075
M106 S204
M106 S255
G1 F1080
G1 X90.095 Y85.989 E.01537
M106 S204
M106 S255
G1 F1200
G1 X90.495 Y86.012 E.01229
G1 X90.985 Y86.041 E.01508
G1 X91.384 Y86.064 E.01229
G1 X93.839 Y86.205 E.07555
G3 X94.239 Y86.647 I-.046 J.444 E.02007
G1 X94.239 Y93.353 E.20606
G3 X93.851 Y93.793 I-.444 J0 E.01972
G1 X91.382 Y93.936 E.07597
G1 X90.983 Y93.959 E.01229
G1 X90.496 Y93.987 E.015
G1 X90.096 Y94.011 E.01229
G1 F1080
G1 X89.596 Y94.033 E.01539
M106 S204
M106 S255
G1 F600
G1 X89.132 Y94.041 E.01426
M106 S204
M106 S255
G1 X88.927 Y94.039 E.00628
M106 S204
M106 S255
G1 X88.745 Y94.034 E.00561
M106 S204
M106 S255
G1 X88.45 Y94.014 E.00909
M106 S204
M106 S255
G1 X88.357 Y94.001 E.00288
M106 S204
M106 S255
G1 F720
G1 X88.31 Y93.99 E.00146
M106 S204
M106 S255
G1 F1080
G1 X88.218 Y93.944 E.00318
M106 S204
M106 S255
G1 F1200
G1 X88.159 Y93.924 E.0019
M106 S204
M106 S255
G1 X88.067 Y93.9 E.00293
M106 S204
G1 X87.918 Y93.873 E.00464
G1 X87.776 Y93.854 E.00442
G1 X87.572 Y93.835 E.00628
G1 X87.255 Y93.816 E.00976
G1 X86.714 Y93.801 E.01662
G1 X86.279 Y93.802 E.01336
G2 X84.506 Y93.851 I.905 J65.595 E.05452
G1 X84.502 Y86.232 E.23409
; WIPE_START
G1 F12000
M204 S6000
G1 X84.509 Y86.145 E-.03306
G1 X84.532 Y86.139 E-.009
G1 X86.23 Y86.197 E-.6458
G1 X86.42 Y86.198 E-.07214
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z17.3 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z17.3
G1 X0 Y90.0001 F18000 ; move to safe pos
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
            G0 Z17.3 F4000
            G39.3 S1
            G0 Z17.3 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X86.665 Y86.48 F42000
G1 Z16.9
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.22488
G1 F1200
M204 S6000
G1 X87.002 Y86.486 E.005
; LINE_WIDTH: 0.251826
G1 X87.32 Y86.489 E.00541
; LINE_WIDTH: 0.280024
G1 X87.533 Y86.488 E.00412
; LINE_WIDTH: 0.306853
G1 X87.742 Y86.486 E.0045
; LINE_WIDTH: 0.341308
G1 X87.978 Y86.478 E.00574
; LINE_WIDTH: 0.38363
G1 X88.155 Y86.466 E.00492
; LINE_WIDTH: 0.421549
G1 X88.257 Y86.455 E.00318
; LINE_WIDTH: 0.453352
G1 X88.341 Y86.445 E.00283
; LINE_WIDTH: 0.475212
G1 X88.377 Y86.44 E.00126
M204 S10000
G1 X88.447 Y86.426 F42000
; LINE_WIDTH: 0.54257
G1 F1200
M204 S6000
G3 X88.767 Y86.421 I.209 J3.542 E.01302
; LINE_WIDTH: 0.588507
G3 X89.58 Y86.445 I-.399 J28.035 E.03616
; LINE_WIDTH: 0.608502
G3 X93.446 Y86.66 I-14.707 J298.57 E.17844
G1 X93.531 Y86.685 E.00411
; LINE_WIDTH: 0.66457
G1 X93.617 Y86.71 E.00451
; LINE_WIDTH: 0.70468
G1 X93.702 Y86.735 E.00481
; LINE_WIDTH: 0.70754
G1 X93.719 Y86.838 E.00564
; LINE_WIDTH: 0.67318
G1 X93.737 Y86.94 E.00534
; LINE_WIDTH: 0.656
G1 X93.737 Y93.06 E.3057
; LINE_WIDTH: 0.694441
G1 X93.702 Y93.264 E.01102
G1 X93.617 Y93.289 E.00474
; LINE_WIDTH: 0.664116
G1 X93.531 Y93.315 E.00452
; LINE_WIDTH: 0.623921
G1 X93.446 Y93.34 E.00422
; LINE_WIDTH: 0.604444
G1 X90.072 Y93.531 E.15463
G3 X88.767 Y93.579 I-2.069 J-38.48 E.05975
; LINE_WIDTH: 0.542671
G3 X88.45 Y93.575 I-.11 J-3.566 E.01292
M204 S10000
G1 X88.391 Y93.563 F42000
; LINE_WIDTH: 0.465903
G1 F1200
M204 S6000
G1 X88.281 Y93.547 E.00384
; LINE_WIDTH: 0.424075
G1 X88.155 Y93.534 E.00395
; LINE_WIDTH: 0.382995
G1 X87.977 Y93.522 E.00493
; LINE_WIDTH: 0.346931
G1 X87.816 Y93.516 E.00399
; LINE_WIDTH: 0.315875
G1 X87.599 Y93.512 E.00483
; LINE_WIDTH: 0.280545
G1 X87.27 Y93.511 E.00637
; LINE_WIDTH: 0.238441
G1 X86.719 Y93.519 E.00878
; LINE_WIDTH: 0.19864
G1 X86.084 Y93.537 E.00806
; LINE_WIDTH: 0.159456
G1 X84.815 Y93.595 E.01206
G1 X84.765 Y93.586 E.00048
G1 X84.755 Y93.538 E.00047
G1 X84.756 Y86.462 E.0672
G1 X84.766 Y86.414 E.00046
G1 X84.818 Y86.405 E.0005
G1 X86.038 Y86.461 E.0116
; LINE_WIDTH: 0.196502
G1 X86.665 Y86.48 E.00786
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 17.1
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15000
G1 X86.038 Y86.461 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 86/111
; update layer progress
M73 L86
M991 S0 P85 ;notify layer change

M106 S255
; OBJECT_ID: 427
M204 S10000
G17
G3 Z17.3 I-.021 J1.217 P1  F42000
G1 X93.866 Y86.598 Z17.3
G1 Z17.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2403
M204 S6000
G1 X93.866 Y93.402 E.22569
G1 X88.757 Y93.696 E.16976
G3 X86.414 Y93.744 I-1.547 J-18.097 E.07781
G2 X85.247 Y93.547 I-1.124 J3.101 E.03947
G1 X84.86 Y93.533 E.01285
G1 X84.86 Y86.467 E.23436
G2 X86.268 Y86.308 I.137 J-5.096 E.04716
G3 X86.414 Y86.256 I.156 J.205 E.00523
G3 X87.506 Y86.238 I.71 J10.397 E.03625
G1 X93.806 Y86.595 E.20933
M204 S10000
G1 X94.148 Y86.353 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2403
M204 S5000
G3 X94.258 Y86.638 I-.332 J.292 E.00956
G1 X94.258 Y93.355 E.20641
G3 X93.847 Y93.796 I-.439 J.003 E.02043
G1 X89.308 Y94.057 E.1397
G1 X88.908 Y94.08 E.01229
G1 X88.417 Y94.108 E.01513
G1 X88.018 Y94.131 E.01229
G1 F1200
G1 X87.681 Y94.148 E.01035
M106 S201.45
M106 S255
G1 F600
G1 X87.28 Y94.159 E.01232
M106 S201.45
M106 S255
G1 X86.849 Y94.16 E.01325
M106 S201.45
M106 S255
G1 X86.667 Y94.155 E.00559
M106 S201.45
M106 S255
G1 X86.372 Y94.135 E.00909
M106 S201.45
M106 S255
G1 X86.281 Y94.121 E.00284
M106 S201.45
M106 S255
G1 F720
G1 X86.233 Y94.11 E.00151
M106 S201.45
M106 S255
G1 F1200
G1 X86.118 Y94.055 E.00392
M106 S201.45
M106 S255
G1 F1800
G1 X85.988 Y94.02 E.00414
M106 S201.45
M106 S255
G1 F2160
G1 X85.837 Y93.993 E.00472
G1 F2403
G1 X85.682 Y93.973 E.0048
G1 X85.445 Y93.952 E.00731
G1 X85.228 Y93.939 E.00669
G1 X84.938 Y93.928 E.00891
G1 X84.539 Y93.919 E.01226
G1 X84.538 Y93.919 E.00003
G1 X84.508 Y93.908 E.00098
G1 X84.497 Y93.9 E.00041
G1 X84.484 Y93.887 E.00058
G1 X84.468 Y93.836 E.00165
G1 X84.468 Y86.163 E.23574
G1 X84.488 Y86.11 E.00175
G1 X84.495 Y86.103 E.0003
G1 X84.515 Y86.088 E.00077
G1 X84.543 Y86.08 E.00088
G1 X84.553 Y86.079 E.00033
G1 X84.937 Y86.072 E.0118
G1 X85.221 Y86.062 E.00872
G1 X85.631 Y86.032 E.01263
G1 X85.813 Y86.01 E.00565
G1 F2160
G1 X86.002 Y85.977 E.00589
G1 F1680
G1 X86.128 Y85.941 E.00403
M106 S201.45
M106 S255
G1 F1080
G1 X86.233 Y85.89 E.00359
M106 S201.45
M106 S255
G1 F720
G1 X86.281 Y85.879 E.00149
M106 S201.45
M106 S255
G1 F600
G1 X86.372 Y85.865 E.00284
M106 S201.45
M106 S255
G1 X86.667 Y85.845 E.00908
M106 S201.45
M106 S255
G1 X86.85 Y85.84 E.00561
M106 S201.45
M106 S255
G1 X87.116 Y85.839 E.00818
M106 S201.45
M106 S255
G1 X87.519 Y85.847 E.01237
M106 S201.45
M106 S255
G1 F1080
G1 X88.018 Y85.869 E.01536
M106 S201.45
M106 S255
G1 F2403
G1 X88.417 Y85.892 E.01229
G1 X88.909 Y85.92 E.01511
G1 X89.308 Y85.943 E.01229
G1 X93.846 Y86.204 E.13969
G3 X94.105 Y86.311 I-.031 J.441 E.00876
; WIPE_START
G1 F12000
M204 S6000
G1 X94.23 Y86.488 E-.08224
G1 X94.258 Y86.638 E-.05794
G1 X94.258 Y88.269 E-.61982
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z17.5 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z17.5
G1 X0 Y90.0001 F18000 ; move to safe pos
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
            G0 Z17.5 F4000
            G39.3 S1
            G0 Z17.5 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X93.532 Y93.257 F42000
G1 Z17.1
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.42192
G1 F3000
M204 S6000
G1 X93.532 Y86.913 E.19594
G1 X93.153 Y86.892 E.01172
G1 X93.153 Y93.109 E.19202
G1 X92.774 Y93.131 E.01172
G1 X92.774 Y86.87 E.19336
G1 X92.395 Y86.849 E.01172
G1 X92.395 Y93.153 E.19469
G1 X92.016 Y93.175 E.01172
G1 X92.016 Y86.827 E.19603
G1 X91.637 Y86.806 E.01172
M73 P89 R2
G1 X91.637 Y93.196 E.19736
G1 X91.258 Y93.218 E.01172
G1 X91.258 Y86.784 E.1987
G1 X90.879 Y86.763 E.01172
G1 X90.879 Y93.24 E.20003
G1 X90.5 Y93.262 E.01172
G1 X90.5 Y86.742 E.20137
G1 X90.121 Y86.72 E.01172
G1 X90.121 Y93.284 E.20271
G1 X89.742 Y93.305 E.01172
G1 X89.742 Y86.699 E.20404
G1 X89.363 Y86.677 E.01172
G1 X89.363 Y93.327 E.20538
G1 X88.984 Y93.349 E.01172
G1 X88.984 Y86.656 E.20671
G1 X88.605 Y86.634 E.01172
G1 X88.605 Y93.371 E.20805
G1 X88.226 Y93.393 E.01172
G1 X88.226 Y86.613 E.20938
G1 X87.847 Y86.592 E.01172
G1 X87.847 Y93.412 E.21064
G1 X87.468 Y93.426 E.01171
G1 X87.468 Y86.571 E.21171
G1 X87.089 Y86.568 E.01171
G1 X87.089 Y93.429 E.21191
G1 X86.71 Y93.419 E.01171
M73 P89 R1
G1 X86.71 Y86.574 E.21141
G2 X86.331 Y86.632 I-.078 J.752 E.01197
G1 X86.331 Y93.369 E.20806
G2 X85.952 Y93.276 I-.548 J1.426 E.01208
G1 X85.952 Y86.722 E.20242
G3 X85.573 Y86.753 I-.329 J-1.724 E.01177
G1 X85.573 Y93.236 E.20024
G2 X85.194 Y93.214 I-.38 J3.297 E.01173
G1 X85.194 Y86.609 E.20402
M106 S201.45
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 17.3
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F3000
G1 X85.194 Y88.609 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 87/111
; update layer progress
M73 L87
M991 S0 P86 ;notify layer change

; OBJECT_ID: 427
M204 S10000
G17
G3 Z17.5 I-.07 J1.215 P1  F42000
G1 X93.117 Y89.062 Z17.5
G1 Z17.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3530
M204 S6000
G1 X93.22 Y89.173 E.00502
G3 X91.971 Y88.729 I-.996 J.825 E.22337
G1 X92.156 Y88.706 E.00621
G3 X93.073 Y89.022 I.068 J1.291 E.03295
M204 S10000
G1 X92.825 Y89.326 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3530
M204 S5000
G1 X92.834 Y89.335 E.00037
G3 X92.048 Y89.115 I-.609 J.664 E.14796
G1 X92.177 Y89.099 E.00401
G3 X92.732 Y89.254 I.047 J.9 E.01801
G1 X92.778 Y89.29 E.0018
; WIPE_START
G1 F12000
M204 S6000
G1 X92.834 Y89.335 E-.02735
G1 X92.922 Y89.426 E-.04801
G1 X93.031 Y89.591 E-.07544
G1 X93.114 Y89.838 E-.09877
G1 X93.127 Y89.964 E-.04817
G1 X93.114 Y90.162 E-.07549
G1 X93.082 Y90.285 E-.04817
G1 X93.029 Y90.411 E-.05213
G1 X92.881 Y90.621 E-.09746
G1 X92.729 Y90.749 E-.07559
G1 X92.619 Y90.812 E-.04824
G1 X92.457 Y90.87 E-.06518
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z17.7 I1.154 J.386 P1  F42000
G1 X93.886 Y86.598 Z17.7
G1 Z17.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3530
M204 S6000
G1 X93.885 Y93.402 E.2257
G1 X86.683 Y93.816 E.23933
G3 X84.625 Y93.883 I-1.714 J-21.082 E.06833
G1 X84.626 Y86.116 E.25766
G3 X85.429 Y86.118 I.373 J11.403 E.02661
G1 X93.826 Y86.595 E.27899
M204 S10000
G1 X94.165 Y86.349 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3530
M204 S5000
G3 X94.278 Y86.645 I-.326 J.294 E.00997
G1 X94.278 Y93.356 E.2062
G3 X93.863 Y93.796 I-.443 J-.002 E.02045
G1 X87.231 Y94.178 E.20413
G1 X86.831 Y94.201 E.01229
G1 X86.34 Y94.229 E.01512
G1 X85.941 Y94.252 E.01229
G1 F1320
G1 X85.658 Y94.266 E.00869
M106 S201.45
M106 S255
G1 F600
G1 X85.203 Y94.28 E.014
M106 S201.45
M106 S255
G1 X84.773 Y94.281 E.01321
M106 S201.45
M106 S255
G1 X84.543 Y94.273 E.00706
M106 S201.45
M106 S255
G3 X84.385 Y94.23 I.034 J-.442 E.00506
M106 S201.45
M106 S255
G1 X84.336 Y94.193 E.00189
M106 S201.45
M106 S255
G1 X84.315 Y94.172 E.00093
M106 S201.45
M106 S255
G1 X84.294 Y94.143 E.00108
M106 S201.45
M106 S255
G1 F720
G1 X84.281 Y94.121 E.0008
M106 S201.45
M106 S255
G1 F840
G1 X84.272 Y94.098 E.00077
M106 S201.45
M106 S255
G1 F960
G1 X84.262 Y94.063 E.0011
M106 S201.45
M106 S255
G1 F1200
G1 X84.256 Y94.035 E.00088
M106 S201.45
M106 S255
G1 F1560
G1 X84.236 Y93.914 E.00377
M106 S201.45
M106 S255
G1 F1680
G3 X84.233 Y93.265 I4.575 J-.348 E.01995
M106 S201.45
M106 S255
G1 F1800
G1 X84.234 Y86.107 E.21995
M106 S201.45
M106 S255
G1 F1560
G1 X84.263 Y85.931 E.0055
M106 S201.45
M106 S255
G1 F960
G1 X84.274 Y85.897 E.0011
M106 S201.45
M106 S255
G1 F840
G1 X84.283 Y85.875 E.00072
M106 S201.45
M106 S255
G1 F600
G1 X84.319 Y85.824 E.00192
M106 S201.45
M106 S255
G1 X84.351 Y85.793 E.00137
M106 S201.45
M106 S255
G3 X84.418 Y85.753 I.167 J.201 E.00239
M106 S201.45
M106 S255
G3 X84.988 Y85.718 I.408 J1.955 E.0176
M106 S201.45
M106 S255
G1 X85.441 Y85.726 E.01394
M106 S201.45
M106 S255
G1 F1080
G1 X85.941 Y85.748 E.01537
M106 S201.45
G1 F3530
G1 X86.34 Y85.771 E.01229
G1 X86.831 Y85.799 E.01511
G1 X87.23 Y85.822 E.01229
G1 X93.863 Y86.204 E.20413
G3 X94.122 Y86.307 I-.024 J.438 E.00872
; WIPE_START
G1 F12000
M204 S6000
G1 X94.255 Y86.502 E-.08997
G1 X94.278 Y86.645 E-.05493
G1 X94.278 Y88.264 E-.6151
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z17.7 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z17.7
G1 X0 Y90.0001 F18000 ; move to safe pos
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
            G0 Z17.7 F4000
            G39.3 S1
            G0 Z17.7 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X93.663 Y87.531 F42000
G1 Z17.3
G1 E.8 F1800
; FEATURE: Internal solid infill
G1 F3530
M204 S6000
G1 X92.897 Y86.765 E.03329
G1 X92.332 Y86.733
G1 X93.663 Y88.064 E.05786
G1 X93.663 Y88.597
G1 X91.766 Y86.7 E.08242
G1 X91.201 Y86.668
G1 X93.372 Y88.839 E.09434
G1 X92.511 Y88.512
G1 X90.636 Y86.636 E.0815
G1 X90.07 Y86.604
G1 X91.971 Y88.505 E.08261
G1 X91.569 Y88.636
G1 X89.505 Y86.572 E.08969
G1 X88.94 Y86.54
G1 X91.248 Y88.849 E.10033
G1 X90.99 Y89.123
G1 X88.374 Y86.508 E.11365
G1 X87.809 Y86.476
G1 X90.803 Y89.47 E.13013
G1 X90.716 Y89.917
G1 X87.243 Y86.444 E.15092
G1 X86.678 Y86.412
G1 X90.81 Y90.544 E.17956
; WIPE_START
G1 F15000
G1 X89.396 Y89.129 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z17.7 I-.601 J1.058 P1  F42000
G1 X93.102 Y91.236 Z17.7
G1 Z17.3
G1 E.8 F1800
G1 F3530
M204 S6000
G1 X93.663 Y91.797 E.02438
G1 X93.663 Y92.33
G1 X92.749 Y91.416 E.03971
G1 X92.311 Y91.511
G1 X93.663 Y92.863 E.05876
G1 X93.47 Y93.203
G1 X91.678 Y91.411 E.07786
; WIPE_START
G1 F15000
G1 X93.092 Y92.826 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z17.7 I-1.162 J-.362 P1  F42000
G1 X92.965 Y93.232 Z17.7
G1 Z17.3
G1 E.8 F1800
G1 F3530
M204 S6000
G1 X86.113 Y86.379 E.29778
G1 X85.547 Y86.347
G1 X92.461 Y93.261 E.30044
G1 X91.957 Y93.29
G1 X85.006 Y86.339 E.30205
G1 X84.849 Y86.715
G1 X91.453 Y93.319 E.28697
G1 X90.948 Y93.348
G1 X84.849 Y87.248 E.26507
G1 X84.848 Y87.781
G1 X90.444 Y93.377 E.24316
G1 X89.94 Y93.406
G1 X84.848 Y88.315 E.22126
G1 X84.848 Y88.848
G1 X89.436 Y93.435 E.19935
G1 X88.931 Y93.464
G1 X84.848 Y89.381 E.17744
G1 X84.848 Y89.914
G1 X88.427 Y93.493 E.15554
G1 X87.923 Y93.522
G1 X84.848 Y90.447 E.13363
G1 X84.848 Y90.98
G1 X87.419 Y93.551 E.11173
G1 X86.914 Y93.58
G1 X84.848 Y91.513 E.08982
G1 X84.847 Y92.046
G1 X86.41 Y93.609 E.06791
G1 X85.906 Y93.638
G1 X84.847 Y92.58 E.046
G1 X84.847 Y93.113
G1 X85.392 Y93.658 E.02369
; WIPE_START
G1 F15000
G1 X84.847 Y93.113 E-.29301
G1 X84.847 Y92.58 E-.20259
G1 X85.339 Y93.072 E-.26441
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z17.7 I.3 J1.179 P1  F42000
G1 X91.616 Y91.473 Z17.7
G1 Z17.3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.201211
G1 F3530
M204 S6000
G1 X91.51 Y91.398 E.00168
; LINE_WIDTH: 0.170756
G1 X91.394 Y91.315 E.00149
; LINE_WIDTH: 0.135028
G3 X90.919 Y90.842 I3.066 J-3.556 E.00503
; LINE_WIDTH: 0.164369
G1 X90.872 Y90.777 E.00079
; LINE_WIDTH: 0.202589
G1 X90.749 Y90.605 E.00276
M204 S10000
G1 X90.727 Y89.906 F42000
; LINE_WIDTH: 0.120949
G1 F3530
M204 S6000
G1 X90.643 Y90.109 E.0014
; WIPE_START
G1 F15000
G1 X90.727 Y89.906 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z17.7 I-.871 J.85 P1  F42000
M73 P90 R1
G1 X92.29 Y91.51 Z17.7
G1 Z17.3
G1 E.8 F1800
; LINE_WIDTH: 0.0989624
G1 F3530
M204 S6000
G3 X92.118 Y91.585 I-.808 J-1.616 E.00086
; WIPE_START
G1 F15000
G1 X92.29 Y91.51 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z17.7 I.535 J1.093 P1  F42000
G1 X93.398 Y90.967 Z17.7
G1 Z17.3
G1 E.8 F1800
; LINE_WIDTH: 0.107995
G1 F3530
M204 S6000
G1 X93.481 Y90.888 E.00061
; LINE_WIDTH: 0.137512
G1 X93.546 Y90.817 E.00074
; LINE_WIDTH: 0.174018
G1 X93.608 Y90.75 E.00097
; LINE_WIDTH: 0.176685
G2 X93.669 Y90.504 I-4.07 J-1.149 E.00276
M204 S10000
G1 X93.66 Y90.503 F42000
; LINE_WIDTH: 0.116629
G1 F3530
M204 S6000
G3 X93.591 Y90.854 I-9.728 J-1.725 E.00215
; WIPE_START
G1 F15000
G1 X93.66 Y90.503 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.668 Y89.496 Z17.7 F42000
G1 Z17.3
G1 E.8 F1800
; LINE_WIDTH: 0.168312
G1 F3530
M204 S6000
G1 X93.615 Y89.278 E.00229
; LINE_WIDTH: 0.158802
G1 X93.551 Y89.205 E.00092
; LINE_WIDTH: 0.115171
G1 X93.44 Y89.084 E.00097
; CHANGE_LAYER
; Z_HEIGHT: 17.5
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15000
G1 X93.551 Y89.205 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 88/111
; update layer progress
M73 L88
M991 S0 P87 ;notify layer change

; OBJECT_ID: 427
M204 S10000
G17
G3 Z17.7 I.481 J-1.118 P1  F42000
G1 X93.004 Y88.97 Z17.7
G1 Z17.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3250
M204 S6000
G1 X93.036 Y88.991 E.00126
G3 X91.97 Y88.73 I-.812 J1.007 E.23215
G1 X92.152 Y88.707 E.00607
G3 X92.789 Y88.835 I.071 J1.292 E.02181
G1 X92.954 Y88.938 E.00642
M204 S10000
G1 X92.81 Y89.317 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3250
M204 S5000
G1 X92.961 Y89.481 E.00685
G3 X92.048 Y89.115 I-.738 J.518 E.14206
G1 X92.174 Y89.099 E.0039
G3 X92.765 Y89.278 I.05 J.9 E.01938
; WIPE_START
G1 F12000
M204 S6000
G1 X92.961 Y89.481 E-.10729
G1 X93.031 Y89.591 E-.04958
G1 X93.114 Y89.838 E-.0988
G1 X93.127 Y89.964 E-.04821
G1 X93.098 Y90.23 E-.1016
G1 X92.999 Y90.465 E-.09685
G1 X92.927 Y90.568 E-.04803
G1 X92.788 Y90.706 E-.07443
G1 X92.619 Y90.812 E-.07577
G1 X92.472 Y90.865 E-.05945
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.905 Y86.598 Z17.9 F42000
G1 Z17.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3250
M204 S6000
G1 X93.905 Y93.402 E.2257
G1 X84.45 Y93.946 E.31415
G1 X84.45 Y86.054 E.26179
G1 X93.845 Y86.595 E.31215
M204 S10000
G1 X94.167 Y86.335 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3250
M204 S5000
G3 X94.297 Y86.645 I-.318 J.316 E.01057
G1 X94.297 Y93.353 E.20614
G3 X93.879 Y93.796 I-.439 J.004 E.02068
G1 X85.154 Y94.298 E.26854
G1 X84.754 Y94.321 E.01229
G1 X84.492 Y94.336 E.00808
G1 X84.413 Y94.329 E.00243
G1 X84.39 Y94.324 E.00071
G1 X84.349 Y94.311 E.00133
G1 X84.276 Y94.278 E.00246
G1 X84.247 Y94.26 E.00106
G1 X84.206 Y94.228 E.0016
G1 X84.176 Y94.199 E.00128
G1 F3000
G1 X84.148 Y94.166 E.00131
G1 F2880
G1 X84.112 Y94.112 E.002
G1 F2760
G1 X84.101 Y94.091 E.00073
G1 F2640
G1 X84.084 Y94.049 E.00139
G1 F2520
G3 X84.058 Y93.913 I.437 J-.154 E.00426
G1 X84.058 Y86.083 E.24062
G1 F2400
G3 X84.069 Y86.003 I.438 J.017 E.00246
G1 F2520
G1 X84.084 Y85.95 E.00172
G1 F2640
G1 X84.101 Y85.909 E.00134
G1 F2760
G1 X84.112 Y85.888 E.00074
G1 F2880
G1 X84.148 Y85.834 E.00199
G1 F3000
G1 X84.176 Y85.801 E.00133
G1 F3250
G1 X84.206 Y85.772 E.00127
G1 X84.247 Y85.74 E.00159
G1 X84.279 Y85.72 E.00116
G1 X84.318 Y85.701 E.00133
G1 X84.363 Y85.684 E.00148
G1 X84.404 Y85.673 E.00132
G1 X84.447 Y85.666 E.00132
G1 X84.488 Y85.664 E.00128
G1 X84.54 Y85.666 E.0016
G1 X84.779 Y85.68 E.00734
G1 X85.178 Y85.703 E.01229
G1 X93.877 Y86.204 E.26773
G3 X94.121 Y86.295 I-.028 J.447 E.00815
; WIPE_START
G1 F12000
M204 S6000
G1 X94.26 Y86.464 E-.08265
G1 X94.297 Y86.645 E-.07023
G1 X94.297 Y88.242 E-.60711
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z17.9 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z17.9
G1 X0 Y90.0001 F18000 ; move to safe pos
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
            G0 Z17.9 F4000
            G39.3 S1
            G0 Z17.9 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X93.631 Y89.257 F42000
G1 Z17.5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0988394
G1 F3250
M204 S6000
G3 X93.678 Y89.547 I-4.164 J.817 E.00134
M204 S10000
G1 X93.701 Y89.424 F42000
; LINE_WIDTH: 0.127969
G1 F3250
M204 S6000
G2 X93.496 Y89.165 I-3.588 J2.633 E.00229
; WIPE_START
G1 F15000
G1 X93.701 Y89.424 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.623 Y90.749 Z17.9 F42000
G1 Z17.5
G1 E.8 F1800
; LINE_WIDTH: 0.127401
G1 F3250
M204 S6000
G2 X93.679 Y90.444 I-4.281 J-.938 E.00214
M204 S10000
G1 X93.701 Y90.571 F42000
; LINE_WIDTH: 0.1493
G1 F3250
M204 S6000
G1 X93.62 Y90.678 E.00116
; LINE_WIDTH: 0.113319
G1 X93.502 Y90.828 E.0011
; WIPE_START
G1 F15000
G1 X93.62 Y90.678 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.682 Y92.45 Z17.9 F42000
G1 Z17.5
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42
G1 F3250
M204 S6000
G1 X92.895 Y93.237 E.03421
G1 X92.329 Y93.27
G1 X93.682 Y91.917 E.0588
G1 X93.682 Y91.384
G1 X91.764 Y93.302 E.08338
G1 X91.198 Y93.335
G1 X93.452 Y91.08 E.09797
G1 X92.511 Y91.488
G1 X90.632 Y93.367 E.08166
G1 X90.066 Y93.4
G1 X91.971 Y91.495 E.08279
G1 X91.572 Y91.361
G1 X89.5 Y93.433 E.09003
G1 X88.935 Y93.465
G1 X91.243 Y91.157 E.1003
G1 X90.99 Y90.877
G1 X88.369 Y93.498 E.11389
G1 X87.803 Y93.53
G1 X90.803 Y90.53 E.13038
G1 X90.712 Y90.088
G1 X87.237 Y93.563 E.15099
G1 X86.671 Y93.595
G1 X90.81 Y89.456 E.17986
; WIPE_START
G1 F15000
G1 X89.396 Y90.871 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.102 Y88.764 Z17.9 F42000
G1 Z17.5
G1 E.8 F1800
G1 F3250
M204 S6000
G1 X93.682 Y88.184 E.02522
G1 X93.682 Y87.651
G1 X92.749 Y88.584 E.04055
G1 X92.313 Y88.487
G1 X93.682 Y87.117 E.05949
G1 X93.471 Y86.796
G1 X91.676 Y88.591 E.078
; WIPE_START
G1 F15000
G1 X93.09 Y87.177 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.966 Y86.767 Z17.9 F42000
G1 Z17.5
G1 E.8 F1800
G1 F3250
M204 S6000
G1 X86.105 Y93.628 E.29814
G1 X85.54 Y93.66
G1 X92.462 Y86.738 E.30082
G1 X91.958 Y86.709
G1 X84.974 Y93.693 E.30349
G1 X84.672 Y93.461
G1 X91.454 Y86.68 E.29468
G1 X90.95 Y86.651
G1 X84.672 Y92.928 E.27277
G1 X84.672 Y92.395
G1 X90.445 Y86.622 E.25086
G1 X89.941 Y86.593
G1 X84.672 Y91.861 E.22895
G1 X84.672 Y91.328
G1 X89.437 Y86.564 E.20703
G1 X88.933 Y86.535
G1 X84.672 Y90.795 E.18512
G1 X84.672 Y90.262
G1 X88.428 Y86.506 E.16321
G1 X87.924 Y86.477
G1 X84.672 Y89.728 E.1413
G1 X84.672 Y89.195
G1 X87.42 Y86.448 E.11939
G1 X86.916 Y86.419
G1 X84.672 Y88.662 E.09747
G1 X84.673 Y88.128
G1 X86.411 Y86.39 E.07556
G1 X85.907 Y86.361
G1 X84.673 Y87.595 E.05365
G1 X84.673 Y87.062
G1 X85.403 Y86.332 E.03174
; WIPE_START
G1 F15000
G1 X84.673 Y87.062 E-.39249
G1 X84.673 Y87.595 E-.20264
G1 X84.979 Y87.288 E-.16486
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.484 Y88.679 Z17.9 F42000
G1 X93.701 Y88.904 Z17.9
G1 Z17.5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.210449
G1 F3250
M204 S6000
G1 X93.642 Y88.812 E.0015
; LINE_WIDTH: 0.258846
G1 X93.582 Y88.719 E.00193
G1 X93.511 Y88.762 E.00146
; LINE_WIDTH: 0.230747
G1 X93.366 Y88.894 E.003
; LINE_WIDTH: 0.204157
G1 X93.36 Y89.014 E.00158
; WIPE_START
G1 F15000
G1 X93.366 Y88.894 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.609 Y88.525 Z17.9 F42000
G1 Z17.5
G1 E.8 F1800
; LINE_WIDTH: 0.191751
G1 F3250
M204 S6000
G1 X91.462 Y88.637 E.00225
; LINE_WIDTH: 0.153257
G2 X91.308 Y88.757 I1.003 J1.461 E.00176
; LINE_WIDTH: 0.130851
G2 X90.916 Y89.161 I2.711 J3.012 E.00404
; LINE_WIDTH: 0.16901
G1 X90.833 Y89.278 E.00148
; LINE_WIDTH: 0.201123
G1 X90.749 Y89.395 E.00185
M204 S10000
G1 X90.723 Y89.832 F42000
; LINE_WIDTH: 0.110879
G1 F3250
M204 S6000
G2 X90.638 Y90.014 I2.466 J1.271 E.00111
; CHANGE_LAYER
; Z_HEIGHT: 17.7
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15000
G1 X90.723 Y89.832 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 89/111
; update layer progress
M73 L89
M991 S0 P88 ;notify layer change

; OBJECT_ID: 427
M204 S10000
G17
G3 Z17.9 I.292 J1.181 P1  F42000
G1 X92.812 Y89.316 Z17.9
G1 Z17.7
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3235
M204 S5000
G1 X92.88 Y89.38 E.00288
G3 X92.048 Y89.115 I-.656 J.62 E.14616
G1 X92.177 Y89.099 E.00401
G3 X92.766 Y89.278 I.047 J.901 E.01928
; WIPE_START
G1 F12000
M204 S6000
G1 X92.88 Y89.38 E-.05841
G1 X93.029 Y89.589 E-.09747
G1 X93.114 Y89.838 E-.10002
G1 X93.127 Y89.964 E-.04813
G1 X93.114 Y90.159 E-.07416
G1 X93.06 Y90.344 E-.07323
G1 X93 Y90.464 E-.05137
G1 X92.879 Y90.623 E-.07571
G1 X92.729 Y90.749 E-.07444
G1 X92.619 Y90.812 E-.04822
G1 X92.502 Y90.859 E-.0479
G1 X92.474 Y90.865 E-.01094
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.193 Y86.441 Z18.1 F42000
G1 Z17.7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3235
M204 S6000
G1 X91.194 Y89.222 E.09224
G2 X91.194 Y90.778 I1.043 J.778 E.05535
G1 X91.193 Y93.559 E.09224
G1 X84.469 Y93.946 E.22342
G1 X84.469 Y86.054 E.26179
G1 X91.133 Y86.438 E.22142
; WIPE_START
G1 F15476.087
G1 X91.177 Y88.437 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.093 Y86.426 Z18.1 F42000
G1 Z17.7
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3235
M204 S5000
G3 X94.137 Y86.608 I-.288 J.166 E.00586
G1 X94.136 Y93.414 E.20911
G3 X93.868 Y93.732 I-.335 J-.01 E.01381
G3 X92.431 Y93.881 I-2.56 J-17.796 E.04441
G1 X84.507 Y94.336 E.24387
G3 X84.077 Y93.91 I.007 J-.438 E.02056
G1 X84.077 Y86.085 E.24045
G3 X84.546 Y85.666 I.436 J.016 E.02158
G1 X92.411 Y86.118 E.24206
G3 X93.942 Y86.289 I-.639 J12.713 E.04737
G3 X94.058 Y86.376 I-.137 J.303 E.00451
; WIPE_START
G1 F12000
M204 S6000
G1 X94.137 Y86.608 E-.09318
G1 X94.137 Y88.363 E-.66682
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z18.1 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z18.1
G1 X0 Y90.0001 F18000 ; move to safe pos
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
            G0 Z18.1 F4000
            G39.3 S1
            G0 Z18.1 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X93.039 Y86.373 F42000
G1 Z17.7
G1 E.8 F1800
; FEATURE: Top surface
G1 F3235
M204 S2000
G1 X93.93 Y87.264 E.03871
G1 X93.93 Y87.797
G1 X92.462 Y86.33 E.06378
G1 X91.896 Y86.296
G1 X93.93 Y88.33 E.08839
G1 X93.93 Y88.864
G1 X91.415 Y86.35 E.10925
G1 X91.416 Y86.883
M73 P91 R1
G1 X93.929 Y89.397 E.10924
G1 X93.929 Y89.93
G1 X91.416 Y87.416 E.10923
G1 X91.416 Y87.95
G1 X92.367 Y88.901 E.04132
G1 X91.879 Y88.946
G1 X91.416 Y88.483 E.02012
; WIPE_START
G1 F12000
M204 S6000
G1 X91.879 Y88.946 E-.24887
G1 X92.367 Y88.901 E-.18606
G1 X91.762 Y88.296 E-.32507
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.325 Y89.859 Z18.1 F42000
G1 Z17.7
G1 E.8 F1800
G1 F3235
M204 S2000
G1 X93.929 Y90.463 E.02627
G1 X93.929 Y90.996
G1 X93.278 Y90.345 E.02829
G1 X93.093 Y90.693
G1 X93.929 Y91.53 E.03635
G1 X93.929 Y92.063
G1 X92.809 Y90.943 E.04868
G1 X92.423 Y91.09
G1 X93.929 Y92.596 E.06544
G1 X93.929 Y93.129
G1 X91.84 Y91.04 E.09077
G1 X91.416 Y91.15
G1 X93.799 Y93.533 E.10356
G1 X93.33 Y93.597
G1 X91.416 Y91.683 E.08317
G1 X91.416 Y92.216
G1 X92.843 Y93.643 E.06203
G1 X92.345 Y93.678
G1 X91.416 Y92.749 E.04036
G1 X91.416 Y93.282
G1 X91.84 Y93.707 E.01846
; WIPE_START
G1 F12000
M204 S6000
G1 X91.416 Y93.282 E-.22824
G1 X91.416 Y92.749 E-.20256
G1 X92.028 Y93.362 E-.32919
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.709 Y88.997 Z18.1 F42000
G1 Z17.7
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.141737
G1 F3235
M204 S6000
G1 X92.439 Y88.829 E.00256
; WIPE_START
G1 F15000
G1 X92.709 Y88.997 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.402 Y89.781 Z18.1 F42000
G1 Z17.7
G1 E.8 F1800
; LINE_WIDTH: 0.100425
G1 F3235
M204 S6000
G2 X93.225 Y89.519 I-7.952 J5.162 E.00149
M204 S10000
G1 X93.395 Y89.788 F42000
; LINE_WIDTH: 0.139636
G1 F3235
M204 S6000
G1 X93.23 Y89.515 E.00251
M204 S10000
G1 X93.381 Y89.649 F42000
; LINE_WIDTH: 0.114955
G1 F3235
M204 S6000
G1 X93.312 Y89.871 E.00137
; WIPE_START
G1 F15000
G1 X93.381 Y89.649 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.065 Y86.599 Z18.1 F42000
G1 Z17.7
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42
G1 F3235
M204 S6000
G1 X90.971 Y87.505 E.03937
G1 X90.971 Y88.038
G1 X89.499 Y86.566 E.06397
G1 X88.933 Y86.534
G1 X90.971 Y88.572 E.08857
G1 X90.972 Y89.105
G1 X88.367 Y86.501 E.11316
G1 X87.802 Y86.469
G1 X90.803 Y89.47 E.13044
G1 X90.717 Y89.917
G1 X87.236 Y86.436 E.15126
G1 X86.67 Y86.403
G1 X90.81 Y90.544 E.17991
G1 X90.971 Y91.238
G1 X86.104 Y86.371 E.21151
G1 X85.538 Y86.338
G1 X90.971 Y91.771 E.23609
G1 X90.971 Y92.304
G1 X84.973 Y86.306 E.26067
G1 X84.691 Y86.558
G1 X90.971 Y92.837 E.27287
G1 X90.951 Y93.35
G1 X84.691 Y87.091 E.27199
G1 X84.691 Y87.624
G1 X90.446 Y93.379 E.25008
G1 X89.942 Y93.408
G1 X84.691 Y88.158 E.22817
G1 X84.691 Y88.691
G1 X89.438 Y93.437 E.20625
G1 X88.934 Y93.466
G1 X84.691 Y89.224 E.18434
G1 X84.691 Y89.757
G1 X88.429 Y93.495 E.16243
G1 X87.925 Y93.524
G1 X84.691 Y90.291 E.14052
G1 X84.691 Y90.824
G1 X87.421 Y93.553 E.11861
G1 X86.917 Y93.582
G1 X84.691 Y91.357 E.09669
G1 X84.691 Y91.89
G1 X86.412 Y93.611 E.07478
G1 X85.908 Y93.64
G1 X84.691 Y92.424 E.05287
G1 X84.691 Y92.957
G1 X85.404 Y93.669 E.03096
; WIPE_START
G1 F15000
G1 X84.691 Y92.957 E-.38287
G1 X84.691 Y92.424 E-.20263
G1 X85.016 Y92.748 E-.1745
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.99 Y89.117 Z18.1 F42000
G1 Z17.7
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.103935
G1 F3235
M204 S6000
G1 X90.871 Y89.271 E.00097
M204 S10000
G1 X90.726 Y89.907 F42000
; LINE_WIDTH: 0.122556
G1 F3235
M204 S6000
G1 X90.643 Y90.11 E.00142
; CHANGE_LAYER
; Z_HEIGHT: 17.9
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F15000
G1 X90.726 Y89.907 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 90/111
; update layer progress
M73 L90
M991 S0 P89 ;notify layer change

; OBJECT_ID: 427
M204 S10000
G17
G3 Z18.1 I.324 J1.173 P1  F42000
G1 X92.826 Y89.327 Z18.1
G1 Z17.9
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2496
M204 S5000
G1 X92.835 Y89.334 E.00034
G3 X92.116 Y89.104 I-.608 J.665 E.15006
G1 X92.234 Y89.098 E.00363
G3 X92.733 Y89.253 I-.006 J.901 E.01628
G1 X92.779 Y89.29 E.00183
; WIPE_START
G1 F12000
M204 S6000
G1 X92.835 Y89.334 E-.02706
G1 X92.922 Y89.426 E-.04802
G1 X93.031 Y89.592 E-.07548
G1 X93.114 Y89.838 E-.09874
G1 X93.127 Y89.964 E-.04817
G1 X93.114 Y90.162 E-.07546
G1 X93.082 Y90.285 E-.04818
G1 X93.029 Y90.411 E-.05203
G1 X92.882 Y90.62 E-.09725
G1 X92.729 Y90.749 E-.07588
G1 X92.619 Y90.812 E-.04823
G1 X92.457 Y90.87 E-.0655
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X89.118 Y91.385 Z18.3 F42000
G1 Z17.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2496
M204 S6000
G1 X89.116 Y93.68 E.0761
G1 X84.488 Y93.946 E.15378
G1 X84.488 Y86.054 E.26178
G1 X89.116 Y86.32 E.15377
G1 X89.119 Y88.154 E.06082
G1 X89.118 Y91.325 E.1052
; WIPE_START
G1 F15476.087
G1 X89.117 Y93.325 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.062 Y88.898 Z18.3 F42000
G1 Z17.9
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2496
M204 S5000
G3 X93.097 Y89.354 I.063 J1.259 E.03605
G3 X92.348 Y91.077 I-.882 J.641 E.06957
G1 X92.062 Y91.102 E.00883
G1 X92.061 Y93.796 E.08275
G3 X90.38 Y94 I-2.323 J-12.106 E.05205
G1 X84.527 Y94.336 E.18017
G3 X84.096 Y93.907 I.012 J-.443 E.0206
G1 X84.096 Y86.082 E.24042
G3 X84.554 Y85.665 I.44 J.023 E.0211
G1 X90.348 Y85.999 E.17831
G3 X92.061 Y86.205 I-.603 J12.231 E.05306
G1 X92.062 Y88.838 E.0809
; WIPE_START
G1 F12000
M204 S6000
G1 X92.46 Y88.941 E-.15628
G1 X92.67 Y89.011 E-.08418
G1 X92.947 Y89.19 E-.1253
G1 X93.097 Y89.354 E-.08442
G1 X93.209 Y89.544 E-.08397
G1 X93.292 Y89.805 E-.10399
G1 X93.307 Y90.082 E-.10527
G1 X93.297 Y90.124 E-.01658
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z18.3 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z18.3
G1 X0 Y90.0001 F18000 ; move to safe pos
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
            G0 Z18.3 F4000
            G39.3 S1
            G0 Z18.3 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X91.854 Y93.212 F42000
G1 Z17.9
G1 E.8 F1800
; FEATURE: Top surface
G1 F2496
M204 S2000
G1 X91.361 Y93.705 E.02141
G1 X90.769 Y93.764
G1 X91.854 Y92.679 E.04716
G1 X91.854 Y92.145
G1 X90.197 Y93.802 E.072
G1 X89.631 Y93.835
G1 X91.854 Y91.612 E.0966
G1 X91.854 Y91.079
G1 X89.339 Y93.594 E.1093
G1 X89.34 Y93.06
G1 X91.534 Y90.866 E.09533
G1 X91.283 Y90.584
G1 X89.341 Y92.526 E.08439
G1 X89.342 Y91.992
G1 X91.135 Y90.198 E.07795
G1 X91.185 Y89.615
G1 X89.341 Y91.459 E.08012
G1 X89.338 Y90.928
G1 X91.854 Y88.412 E.10932
G1 X91.854 Y87.879
G1 X89.34 Y90.394 E.10925
G1 X89.341 Y89.859
G1 X91.854 Y87.346 E.10918
G1 X91.854 Y86.813
G1 X89.34 Y89.327 E.10921
G1 X89.339 Y88.794
G1 X91.779 Y86.355 E.106
G1 X91.311 Y86.289
G1 X89.339 Y88.261 E.08571
G1 X89.341 Y87.726
G1 X90.826 Y86.241 E.06452
G1 X90.329 Y86.205
G1 X89.34 Y87.193 E.04295
G1 X89.339 Y86.661
G1 X89.824 Y86.176 E.02107
; WIPE_START
G1 F12000
M204 S6000
G1 X89.339 Y86.661 E-.26061
G1 X89.34 Y87.193 E-.20232
G1 X89.893 Y86.641 E-.29708
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.873 Y88.832 Z18.3 F42000
G1 Z17.9
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.219287
G1 F2496
M204 S6000
G1 X91.665 Y88.976 E.00364
; LINE_WIDTH: 0.162494
G1 X91.433 Y89.175 E.00297
G1 X91.253 Y89.373 E.00261
; LINE_WIDTH: 0.190023
G1 X91.172 Y89.482 E.00163
G1 X91.195 Y89.625 E.00175
; WIPE_START
G1 F15000
G1 X91.172 Y89.482 E-.39291
G1 X91.253 Y89.373 E-.36709
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.802 Y91.495 Z18.3 F42000
G1 Z17.9
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.49324
G1 F2496
M204 S6000
G1 X86.802 Y88.565 E.10751
M204 S10000
G1 X87.216 Y88.505 F42000
; LINE_WIDTH: 0.41999
G1 F2496
M204 S6000
G1 X87.216 Y88.115 E.012
G1 X86.389 Y88.067 E.02546
G1 X86.389 Y91.933 E.11879
G1 X87.216 Y91.885 E.02547
G1 X87.216 Y88.565 E.10202
M204 S10000
G1 X87.593 Y88.505 F42000
G1 F2496
M204 S6000
G1 X87.593 Y87.759 E.02294
G1 X86.012 Y87.668 E.04867
G1 X86.011 Y92.332 E.14334
G1 X87.593 Y92.241 E.04868
G1 X87.593 Y88.565 E.11296
M204 S10000
G1 X87.97 Y88.505 F42000
G1 F2496
M204 S6000
G1 X87.97 Y87.403 E.03388
G1 X85.635 Y87.268 E.07188
G1 X85.634 Y92.732 E.16788
G1 X87.97 Y92.597 E.07189
G1 X87.97 Y88.565 E.1239
M204 S10000
G1 X88.347 Y88.505 F42000
G1 F2496
M204 S6000
G1 X88.347 Y87.047 E.04482
G1 X85.258 Y86.869 E.09509
G1 X85.257 Y93.131 E.19242
G1 X88.347 Y92.953 E.0951
G1 X88.347 Y88.565 E.13484
M204 S10000
G1 X88.724 Y88.505 F42000
G1 F2496
M204 S6000
G1 X88.724 Y86.691 E.05575
G1 X84.881 Y86.469 E.1183
G1 X84.88 Y93.531 E.21697
G1 X88.724 Y93.309 E.11831
G1 X88.724 Y88.565 E.14578
; CHANGE_LAYER
; Z_HEIGHT: 18.1
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15000
G1 X88.724 Y90.565 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 91/111
; update layer progress
M73 L91
M991 S0 P90 ;notify layer change

; OBJECT_ID: 427
M204 S10000
G17
G3 Z18.3 I-.761 J-.949 P1  F42000
G1 X84.507 Y93.946 Z18.3
M73 P92 R1
G1 Z18.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2040
M204 S6000
G1 X84.508 Y86.054 E.26178
G1 X87.039 Y86.2 E.08409
G2 X87.042 Y88.389 I406.93 J.574 E.07261
G1 X87.039 Y93.8 E.17951
G1 X84.567 Y93.942 E.08213
M204 S10000
G1 X84.249 Y94.209 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2040
M204 S5000
G3 X84.115 Y93.902 I.312 J-.318 E.01056
G1 X84.116 Y86.072 E.24058
G3 X84.564 Y85.665 I.44 J.034 E.02048
G3 X88.763 Y85.913 I-7.36 J160.248 E.12926
G3 X89.984 Y86.085 I-.591 J8.619 E.03792
G1 X89.987 Y88.165 E.06392
G3 X89.98 Y93.917 I-1339.8 J1.302 E.17675
G3 X88.33 Y94.119 I-2.022 J-9.706 E.05114
G1 X84.548 Y94.336 E.1164
G3 X84.295 Y94.248 I.013 J-.446 E.00838
; WIPE_START
G1 F12000
M204 S6000
G1 X84.159 Y94.089 E-.07962
G1 X84.115 Y93.902 E-.07296
G1 X84.116 Y92.303 E-.60743
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z18.5 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z18.5
G1 X0 Y90.0001 F18000 ; move to safe pos
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
            G0 Z18.5 F4000
            G39.3 S1
            G0 Z18.5 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X86.647 Y87.395 F42000
G1 Z18.1
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F2040
M204 S6000
G1 X86.647 Y86.57 E.02534
G1 X84.9 Y86.469 E.05376
G1 X84.899 Y93.531 E.21696
G1 X86.647 Y93.43 E.05378
G1 X86.647 Y87.455 E.1836
M204 S10000
G1 X86.27 Y87.395 F42000
G1 F2040
M204 S6000
G1 X86.27 Y86.926 E.0144
G1 X85.277 Y86.869 E.03055
G1 X85.277 Y93.131 E.19242
G1 X86.27 Y93.074 E.03057
G1 X86.27 Y87.455 E.17267
M204 S10000
G1 X85.928 Y87.395 F42000
; LINE_WIDTH: 0.350864
G1 F2040
M204 S6000
G1 X85.928 Y87.249 E.00365
G1 X85.62 Y87.232 E.00774
G1 X85.619 Y92.768 E.13894
G1 X85.927 Y92.751 E.00774
G1 X85.928 Y87.455 E.1329
; WIPE_START
G1 F15000
G1 X85.928 Y89.455 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X89.085 Y86.152 Z18.5 F42000
G1 Z18.1
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F2040
M204 S2000
G1 X89.778 Y86.845 E.03011
G1 X89.778 Y87.379
G1 X88.502 Y86.102 E.05548
G1 X87.933 Y86.066
G1 X89.779 Y87.913 E.08025
G1 X89.78 Y88.447
G1 X87.367 Y86.034 E.10486
G1 X87.262 Y86.462
G1 X89.776 Y88.976 E.10924
G1 X89.779 Y89.513
G1 X87.263 Y86.996 E.10935
G1 X87.263 Y87.53
G1 X89.779 Y90.045 E.10932
G1 X89.777 Y90.577
G1 X87.262 Y88.062 E.10929
G1 X87.264 Y88.598
G1 X89.777 Y91.11 E.10917
G1 X89.777 Y91.644
G1 X87.264 Y89.131 E.10921
G1 X87.264 Y89.664
G1 X89.779 Y92.179 E.1093
G1 X89.778 Y92.711
G1 X87.264 Y90.197 E.10928
G1 X87.263 Y90.729
G1 X89.777 Y93.244 E.10926
G1 X89.759 Y93.758
G1 X87.263 Y91.262 E.10845
G1 X87.263 Y91.795
G1 X89.292 Y93.825 E.0882
G1 X88.809 Y93.875
G1 X87.262 Y92.328 E.06719
G1 X87.262 Y92.861
G1 X88.313 Y93.912 E.04566
G1 X87.808 Y93.941
G1 X87.262 Y93.394 E.02376
; WIPE_START
G1 F12000
M204 S6000
G1 X87.808 Y93.941 E-.29381
G1 X88.313 Y93.912 E-.19194
G1 X87.802 Y93.402 E-.27426
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X89.795 Y91.627 Z18.5 F42000
G1 Z18.1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.094069
G1 F2040
M204 S6000
G1 X89.706 Y91.839 E.00096
; WIPE_START
G1 F15000
G1 X89.795 Y91.627 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.815 Y89.344 Z18.5 F42000
G1 Z18.1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.378512
G1 F2040
M204 S5000
G1 X92.82 Y89.35 E.00022
G3 X92.118 Y89.125 I-.594 J.646 E.12991
G1 X92.231 Y89.118 E.0031
G3 X92.721 Y89.271 I-.005 J.877 E.01422
G1 X92.767 Y89.307 E.00163
M204 S10000
G1 X92.029 Y88.907 F42000
G1 F2040
M204 S5000
G1 X92.24 Y88.889 E.00578
G1 X92.353 Y88.896 E.0031
G3 X91.97 Y88.918 I-.126 J1.104 E.18036
; CHANGE_LAYER
; Z_HEIGHT: 18.3
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F12000
M204 S6000
G1 X92.24 Y88.889 E-.10301
G1 X92.353 Y88.896 E-.04302
G1 X92.68 Y88.985 E-.12901
G1 X92.877 Y89.099 E-.08651
G1 X93.044 Y89.247 E-.08468
G1 X93.18 Y89.429 E-.08636
G1 X93.258 Y89.587 E-.06682
G1 X93.32 Y89.803 E-.08544
G1 X93.335 Y90 E-.07515
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 92/111
; update layer progress
M73 L92
M991 S0 P91 ;notify layer change

; OBJECT_ID: 427
M204 S10000
G17
G3 Z18.5 I.498 J-1.111 P1  F42000
G1 X84.528 Y86.054 Z18.5
G1 Z18.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1412
M204 S6000
G1 X84.962 Y86.079 E.01442
G3 X84.962 Y93.921 I-1475.538 J3.825 E.26011
G1 X84.526 Y93.946 E.01446
G1 X84.528 Y86.114 E.25979
M204 S10000
G1 X84.281 Y85.777 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1412
M204 S5000
G3 X84.577 Y85.664 I.294 J.329 E.00994
G1 X86.342 Y85.766 E.05432
G3 X87.907 Y85.964 I-.621 J11.188 E.04851
G2 X87.91 Y88.387 I481.568 J.583 E.07442
G1 X87.897 Y94.04 E.17371
G3 X86.314 Y94.236 I-1.932 J-9.125 E.04907
G1 X84.568 Y94.336 E.05375
G3 X84.134 Y93.887 I.008 J-.441 E.02129
G1 X84.136 Y86.064 E.2404
G3 X84.239 Y85.82 I.439 J.042 E.00827
; WIPE_START
G1 F12000
M204 S6000
G1 X84.411 Y85.695 E-.08053
G1 X84.577 Y85.664 E-.06428
G1 X86.193 Y85.758 E-.61519
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z18.7 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z18.7
G1 X0 Y90.0001 F18000 ; move to safe pos
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
            G0 Z18.7 F4000
            G39.3 S1
            G0 Z18.7 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X87.7 Y93.1 F42000
G1 Z18.3
G1 E.8 F1800
; FEATURE: Top surface
G1 F1412
M204 S2000
G1 X86.812 Y93.987 E.03856
G1 X86.234 Y94.032
G1 X87.7 Y92.567 E.0637
G1 X87.7 Y92.033
G1 X85.668 Y94.065 E.0883
G1 X85.184 Y94.016
G1 X87.701 Y91.499 E.10935
G1 X87.701 Y90.966
G1 X85.186 Y93.481 E.10928
G1 X85.187 Y92.946
G1 X87.701 Y90.432 E.10925
G1 X87.702 Y89.899
G1 X85.187 Y92.413 E.10926
G1 X85.187 Y91.88
G1 X87.702 Y89.365 E.10928
G1 X87.702 Y88.832
G1 X85.187 Y91.347 E.10929
G1 X85.187 Y90.813
G1 X87.702 Y88.299 E.10927
G1 X87.7 Y87.768
G1 X85.187 Y90.28 E.10918
G1 X85.187 Y89.747
G1 X87.701 Y87.233 E.10925
G1 X87.7 Y86.7
G1 X85.187 Y89.213 E.10921
G1 X85.187 Y88.68
G1 X87.7 Y86.168 E.10918
G1 X87.272 Y86.062
G1 X85.187 Y88.147 E.09059
G1 X85.187 Y87.614
G1 X86.791 Y86.01 E.06967
G1 X86.296 Y85.972
G1 X85.187 Y87.08 E.04819
G1 X85.187 Y86.547
G1 X85.792 Y85.942 E.02628
; WIPE_START
G1 F12000
M204 S6000
G1 X85.187 Y86.547 E-.32498
G1 X85.187 Y87.08 E-.20268
G1 X85.62 Y86.648 E-.23234
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.767 Y89.326 Z18.7 F42000
G1 X92.814 Y89.344 Z18.7
G1 Z18.3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.378512
G1 F1412
M204 S5000
G1 X92.821 Y89.349 E.00024
G3 X92.118 Y89.125 I-.594 J.65 E.13047
G1 X92.229 Y89.118 E.00304
G3 X92.721 Y89.27 I-.003 J.88 E.01427
G1 X92.767 Y89.307 E.00161
M204 S10000
G1 X92.029 Y88.901 F42000
G1 F1412
M204 S5000
G1 X92.24 Y88.882 E.00581
G1 X92.353 Y88.889 E.00308
G3 X91.97 Y88.911 I-.126 J1.111 E.18154
; CHANGE_LAYER
; Z_HEIGHT: 18.5
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F12000
M204 S6000
G1 X92.24 Y88.882 E-.10341
G1 X92.353 Y88.889 E-.0428
G1 X92.683 Y88.979 E-.13009
G1 X92.881 Y89.094 E-.08722
G1 X93.047 Y89.241 E-.08424
G1 X93.185 Y89.424 E-.08714
G1 X93.266 Y89.587 E-.06908
G1 X93.327 Y89.802 E-.08494
G1 X93.341 Y89.989 E-.07109
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 93/111
; update layer progress
M73 L93
M991 S0 P92 ;notify layer change

M106 S204
; OBJECT_ID: 427
M204 S10000
G17
G3 Z18.7 I-.591 J-1.064 P1  F42000
G1 X85.83 Y94.157 Z18.7
G1 Z18.5
M73 P93 R1
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G3 X84.5 Y94.324 I-1.623 J-7.556 E.04123
G3 X84.154 Y93.895 I.086 J-.423 E.01834
G1 X84.154 Y86.104 E.2394
G3 X84.603 Y85.671 I.427 J-.007 E.0215
G3 X85.829 Y85.843 I-.609 J8.779 E.03808
G3 X85.83 Y94.097 I-1289.819 J4.265 E.25362
; WIPE_START
G1 F12000
M204 S6000
G1 X85.319 Y94.252 E-.20287
G1 X84.579 Y94.331 E-.28293
G1 X84.5 Y94.324 E-.03002
G1 X84.362 Y94.271 E-.05621
G1 X84.246 Y94.167 E-.05918
G1 X84.172 Y94.024 E-.0612
G1 X84.154 Y93.895 E-.04923
G1 X84.154 Y93.847 E-.01836
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z18.9 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z18.9
G1 X0 Y90.0001 F18000 ; move to safe pos
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
            G0 Z18.9 F4000
            G39.3 S1
            G0 Z18.9 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X85.133 Y85.933 F42000
G1 Z18.5
G1 E.8 F1800
; FEATURE: Top surface
G1 F1200
M204 S2000
G1 X85.625 Y86.425 E.02136
G1 X85.625 Y86.958
G1 X84.546 Y85.879 E.04689
G1 X84.361 Y86.228
G1 X85.625 Y87.492 E.05493
G1 X85.625 Y88.025
G1 X84.361 Y86.761 E.05493
G1 X84.361 Y87.294
G1 X85.625 Y88.558 E.05493
G1 X85.625 Y89.091
G1 X84.361 Y87.827 E.05493
G1 X84.361 Y88.361
G1 X85.625 Y89.625 E.05493
G1 X85.625 Y90.158
G1 X84.361 Y88.894 E.05493
G1 X84.361 Y89.427
G1 X85.625 Y90.691 E.05493
G1 X85.625 Y91.224
G1 X84.361 Y89.96 E.05493
G1 X84.361 Y90.494
G1 X85.625 Y91.758 E.05492
G1 X85.625 Y92.291
G1 X84.361 Y91.027 E.05492
G1 X84.361 Y91.56
G1 X85.625 Y92.824 E.05492
G1 X85.622 Y93.355
G1 X84.361 Y92.093 E.05481
G1 X84.361 Y92.627
G1 X85.622 Y93.888 E.0548
G1 X85.253 Y94.051
G1 X84.361 Y93.16 E.03874
G1 X84.361 Y93.693
G1 X84.772 Y94.104 E.01785
; WIPE_START
G1 F12000
M204 S6000
G1 X84.361 Y93.693 E-.22077
G1 X84.361 Y93.16 E-.20264
G1 X84.988 Y93.786 E-.33659
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.626 Y90.02 Z18.9 F42000
G1 X92.815 Y89.345 Z18.9
G1 Z18.5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.378512
G1 F1200
M204 S5000
G1 X92.821 Y89.35 E.0002
G3 X92.118 Y89.125 I-.595 J.649 E.13048
G1 X92.227 Y89.119 E.00298
G3 X92.609 Y89.206 I-.001 J.881 E.0108
G1 X92.765 Y89.312 E.00515
M204 S10000
G1 X92.028 Y88.893 F42000
G1 F1200
M204 S5000
G1 X92.241 Y88.875 E.00583
G1 X92.352 Y88.881 E.00306
G3 X91.97 Y88.904 I-.125 J1.118 E.18275
; CHANGE_LAYER
; Z_HEIGHT: 18.7
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F12000
M204 S6000
G1 X92.241 Y88.875 E-.10367
G1 X92.352 Y88.881 E-.04246
G1 X92.686 Y88.972 E-.13133
G1 X92.886 Y89.088 E-.08778
G1 X93.051 Y89.234 E-.08388
G1 X93.19 Y89.419 E-.08784
G1 X93.273 Y89.587 E-.07109
G1 X93.334 Y89.801 E-.08471
G1 X93.347 Y89.978 E-.06725
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 94/111
; update layer progress
M73 L94
M991 S0 P93 ;notify layer change

; OBJECT_ID: 427
M204 S10000
G17
G3 Z18.9 I.932 J-.783 P1  F42000
G1 X92.816 Y89.346 Z18.9
G1 Z18.7
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X92.82 Y89.351 E.00017
G3 X92.118 Y89.125 I-.596 J.649 E.1305
G1 X92.221 Y89.119 E.00283
G3 X92.72 Y89.272 I.003 J.881 E.01448
G1 X92.769 Y89.309 E.00168
M204 S10000
G1 X92.028 Y88.886 F42000
G1 F1200
M204 S5000
G1 X92.241 Y88.868 E.00584
G1 X92.352 Y88.874 E.00306
G3 X91.969 Y88.897 I-.125 J1.125 E.18393
; WIPE_START
G1 F12000
M204 S6000
G1 X92.241 Y88.868 E-.10386
G1 X92.352 Y88.874 E-.04249
G1 X92.467 Y88.893 E-.04427
G1 X92.688 Y88.966 E-.08833
G1 X92.89 Y89.083 E-.08861
G1 X93.055 Y89.228 E-.08344
G1 X93.195 Y89.414 E-.08853
G1 X93.281 Y89.587 E-.07334
G1 X93.341 Y89.8 E-.08428
G1 X93.353 Y89.965 E-.06284
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z19.1 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z19.1
G1 X0 Y90.0001 F18000 ; move to safe pos
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
            G0 Z19.1 F4000
            G39.3 S1
            G0 Z19.1 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




; CHANGE_LAYER
; Z_HEIGHT: 18.9
; LAYER_HEIGHT: 0.199999
; layer num/total_layer_count: 95/111
; update layer progress
M73 L95
M991 S0 P94 ;notify layer change

; OBJECT_ID: 427
G1 X92.816 Y89.346 F42000
G1 Z18.9
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X92.819 Y89.351 E.00017
G3 X92.118 Y89.125 I-.596 J.648 E.1305
G1 X92.219 Y89.119 E.00277
G3 X92.608 Y89.207 I.005 J.881 E.01101
G1 X92.766 Y89.313 E.00519
M204 S10000
G1 X92.027 Y88.879 F42000
G1 F1200
M204 S5000
G1 X92.241 Y88.861 E.00586
G1 X92.352 Y88.867 E.00305
G3 X91.969 Y88.89 I-.125 J1.132 E.18512
; WIPE_START
G1 F12000
M204 S6000
G1 X92.241 Y88.861 E-.1041
G1 X92.352 Y88.867 E-.04243
G1 X92.468 Y88.886 E-.04457
G1 X92.691 Y88.959 E-.08908
G1 X92.894 Y89.077 E-.08927
G1 X93.058 Y89.222 E-.08308
G1 X93.2 Y89.409 E-.08935
G1 X93.288 Y89.587 E-.07553
G1 X93.348 Y89.799 E-.08375
G1 X93.359 Y89.954 E-.05884
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z19.3 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z19.3
G1 X0 Y90.0001 F18000 ; move to safe pos
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
            G0 Z19.3 F4000
            G39.3 S1
            G0 Z19.3 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




; CHANGE_LAYER
; Z_HEIGHT: 19.1
; LAYER_HEIGHT: 0.200001
; layer num/total_layer_count: 96/111
; update layer progress
M73 L96
M991 S0 P95 ;notify layer change

; OBJECT_ID: 427
G1 X92.816 Y89.346 F42000
G1 Z19.1
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X92.819 Y89.351 E.00016
G3 X92.118 Y89.125 I-.596 J.648 E.1305
G1 X92.217 Y89.119 E.00271
G3 X92.72 Y89.272 I.007 J.881 E.0146
G1 X92.769 Y89.309 E.00169
M204 S10000
G1 X92.027 Y88.872 F42000
G1 F1200
M204 S5000
G1 X92.241 Y88.854 E.00588
G1 X92.352 Y88.86 E.00304
G3 X91.968 Y88.883 I-.125 J1.139 E.18631
; WIPE_START
G1 F12000
M204 S6000
G1 X92.241 Y88.854 E-.10438
G1 X92.352 Y88.86 E-.04227
G1 X92.469 Y88.879 E-.04495
G1 X92.694 Y88.953 E-.0898
G1 X92.898 Y89.072 E-.08996
G1 X93.062 Y89.215 E-.08267
M73 P94 R1
G1 X93.205 Y89.404 E-.09006
G1 X93.296 Y89.588 E-.07799
G1 X93.355 Y89.799 E-.0831
G1 X93.365 Y89.943 E-.05484
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z19.5 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z19.5
G1 X0 Y90.0001 F18000 ; move to safe pos
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
            G0 Z19.5 F4000
            G39.3 S1
            G0 Z19.5 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




; CHANGE_LAYER
; Z_HEIGHT: 19.3
; LAYER_HEIGHT: 0.199999
; layer num/total_layer_count: 97/111
; update layer progress
M73 L97
M991 S0 P96 ;notify layer change

; OBJECT_ID: 427
G1 X92.817 Y89.346 F42000
G1 Z19.3
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X92.818 Y89.352 E.00016
G3 X92.118 Y89.125 I-.595 J.644 E.12992
G1 X92.214 Y89.119 E.00265
G3 X92.719 Y89.273 I.009 J.877 E.01466
G1 X92.769 Y89.31 E.0017
M204 S10000
G1 X92.026 Y88.865 F42000
G1 F1200
M204 S5000
G1 X92.241 Y88.847 E.00589
G1 X92.352 Y88.853 E.00304
G3 X91.968 Y88.876 I-.125 J1.146 E.18749
; WIPE_START
G1 F12000
M204 S6000
G1 X92.241 Y88.847 E-.10454
G1 X92.352 Y88.853 E-.04225
G1 X92.585 Y88.904 E-.09049
G1 X92.803 Y89.001 E-.09075
G1 X92.958 Y89.108 E-.0716
G1 X93.112 Y89.262 E-.08263
G1 X93.245 Y89.46 E-.09075
G1 X93.335 Y89.681 E-.09073
G1 X93.376 Y89.912 E-.08916
G1 X93.376 Y89.931 E-.00711
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z19.7 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z19.7
G1 X0 Y90.0001 F18000 ; move to safe pos
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
            G0 Z19.7 F4000
            G39.3 S1
            G0 Z19.7 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




; CHANGE_LAYER
; Z_HEIGHT: 19.5
; LAYER_HEIGHT: 0.200001
; layer num/total_layer_count: 98/111
; update layer progress
M73 L98
M991 S0 P97 ;notify layer change

; OBJECT_ID: 427
G1 X92.818 Y89.347 F42000
G1 Z19.5
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X92.819 Y89.351 E.00012
G3 X92.117 Y89.125 I-.596 J.648 E.1305
G1 X92.212 Y89.119 E.0026
G3 X92.719 Y89.272 I.011 J.88 E.01472
G1 X92.77 Y89.31 E.00173
M204 S10000
G1 X92.026 Y88.858 F42000
G1 F1200
M204 S5000
G1 X92.241 Y88.84 E.00589
G1 X92.352 Y88.846 E.00305
G3 X91.967 Y88.869 I-.125 J1.153 E.18868
; WIPE_START
G1 F12000
M204 S6000
G1 X92.241 Y88.84 E-.10456
G1 X92.352 Y88.846 E-.04237
G1 X92.587 Y88.897 E-.09129
G1 X92.807 Y88.995 E-.09148
G1 X92.963 Y89.104 E-.0725
G1 X93.134 Y89.277 E-.09222
G1 X93.251 Y89.456 E-.08153
G1 X93.341 Y89.68 E-.09149
G1 X93.383 Y89.912 E-.08962
G1 X93.383 Y89.919 E-.00296
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z19.9 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z19.9
G1 X0 Y90.0001 F18000 ; move to safe pos
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
            G0 Z19.9 F4000
            G39.3 S1
            G0 Z19.9 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




; CHANGE_LAYER
; Z_HEIGHT: 19.7
; LAYER_HEIGHT: 0.200001
; layer num/total_layer_count: 99/111
; update layer progress
M73 L99
M991 S0 P98 ;notify layer change

; OBJECT_ID: 427
G1 X92.818 Y89.347 F42000
G1 Z19.7
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X92.819 Y89.351 E.00011
G3 X92.117 Y89.125 I-.596 J.648 E.13049
G1 X92.21 Y89.119 E.00254
G3 X92.719 Y89.272 I.013 J.88 E.01478
G1 X92.771 Y89.311 E.00176
M204 S10000
G1 X92.025 Y88.851 F42000
G1 F1200
M204 S5000
G1 X92.241 Y88.833 E.00591
G1 X92.352 Y88.839 E.00305
G3 X91.967 Y88.862 I-.125 J1.16 E.18987
; WIPE_START
G1 F12000
M204 S6000
G1 X92.241 Y88.833 E-.10477
G1 X92.352 Y88.839 E-.04234
G1 X92.589 Y88.89 E-.09201
G1 X92.81 Y88.989 E-.09229
G1 X92.969 Y89.1 E-.07359
G1 X93.14 Y89.274 E-.09275
G1 X93.257 Y89.453 E-.08119
G1 X93.348 Y89.678 E-.0921
G1 X93.39 Y89.908 E-.08896
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z20.1 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z20.1
G1 X0 Y90.0001 F18000 ; move to safe pos
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
            G0 Z20.1 F4000
            G39.3 S1
            G0 Z20.1 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




; CHANGE_LAYER
; Z_HEIGHT: 19.9
; LAYER_HEIGHT: 0.199999
; layer num/total_layer_count: 100/111
; update layer progress
M73 L100
M991 S0 P99 ;notify layer change

; OBJECT_ID: 427
G1 X92.819 Y89.348 F42000
G1 Z19.9
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X92.819 Y89.351 E.00009
G3 X92.117 Y89.125 I-.596 J.648 E.13049
G1 X92.208 Y89.119 E.00248
G3 X92.719 Y89.272 I.015 J.88 E.01484
G1 X92.771 Y89.312 E.00178
M204 S10000
G1 X92.025 Y88.844 F42000
G1 F1200
M204 S5000
G1 X92.241 Y88.826 E.00593
G1 X92.352 Y88.832 E.00304
G3 X91.966 Y88.855 I-.125 J1.167 E.19105
; WIPE_START
G1 F12000
M204 S6000
G1 X92.241 Y88.826 E-.10502
G1 X92.352 Y88.832 E-.04226
M73 P94 R0
G1 X92.591 Y88.883 E-.09277
G1 X92.814 Y88.983 E-.09292
G1 X92.975 Y89.096 E-.07481
G1 X93.147 Y89.272 E-.09343
G1 X93.263 Y89.449 E-.0807
G1 X93.355 Y89.676 E-.09286
G1 X93.395 Y89.897 E-.08523
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z20.3 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z20.3
G1 X0 Y90.0001 F18000 ; move to safe pos
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
            G0 Z20.3 F4000
            G39.3 S1
            G0 Z20.3 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




; CHANGE_LAYER
; Z_HEIGHT: 20.1
; LAYER_HEIGHT: 0.200001
; layer num/total_layer_count: 101/111
; update layer progress
M73 L101
M991 S0 P100 ;notify layer change

; OBJECT_ID: 427
G1 X92.82 Y89.349 F42000
G1 Z20.1
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X92.819 Y89.351 E.00008
G3 X92.117 Y89.125 I-.596 J.648 E.13045
G1 X92.206 Y89.119 E.00243
G3 X92.719 Y89.272 I.018 J.88 E.0149
G1 X92.772 Y89.312 E.00181
M204 S10000
G1 X92.024 Y88.837 F42000
G1 F1200
M204 S5000
G1 X92.241 Y88.819 E.00594
G1 X92.352 Y88.825 E.00304
G3 X91.965 Y88.848 I-.125 J1.174 E.19224
; WIPE_START
G1 F12000
M204 S6000
G1 X92.241 Y88.819 E-.10523
G1 X92.352 Y88.825 E-.0422
G1 X92.592 Y88.877 E-.09342
G1 X92.818 Y88.977 E-.09385
G1 X92.981 Y89.091 E-.07573
G1 X93.154 Y89.269 E-.09417
G1 X93.269 Y89.446 E-.0803
G1 X93.362 Y89.674 E-.09351
G1 X93.4 Y89.885 E-.08161
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z20.5 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z20.5
G1 X0 Y90.0001 F18000 ; move to safe pos
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
            G0 Z20.5 F4000
            G39.3 S1
            G0 Z20.5 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




; CHANGE_LAYER
; Z_HEIGHT: 20.3
; LAYER_HEIGHT: 0.199999
; layer num/total_layer_count: 102/111
; update layer progress
M73 L102
M991 S0 P101 ;notify layer change

; OBJECT_ID: 427
G1 X92.82 Y89.349 F42000
G1 Z20.3
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X92.818 Y89.352 E.0001
G3 X92.053 Y89.135 I-.597 J.648 E.12885
G1 X92.2 Y89.119 E.00403
G3 X92.719 Y89.273 I.021 J.881 E.01505
G1 X92.772 Y89.313 E.00182
M204 S10000
G1 X92.024 Y88.829 F42000
G1 F1200
M204 S5000
G1 X92.241 Y88.812 E.00596
G1 X92.352 Y88.818 E.00303
G3 X91.965 Y88.841 I-.125 J1.181 E.19343
; WIPE_START
G1 F12000
M204 S6000
G1 X92.241 Y88.812 E-.10546
G1 X92.352 Y88.818 E-.04215
G1 X92.594 Y88.87 E-.09416
G1 X92.82 Y88.971 E-.09407
G1 X93.022 Y89.117 E-.09481
G1 X93.165 Y89.272 E-.08019
G1 X93.275 Y89.441 E-.07654
G1 X93.368 Y89.672 E-.09474
G1 X93.405 Y89.874 E-.07789
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z20.7 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z20.7
G1 X0 Y90.0001 F18000 ; move to safe pos
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
            G0 Z20.7 F4000
            G39.3 S1
            G0 Z20.7 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




; CHANGE_LAYER
; Z_HEIGHT: 20.5
; LAYER_HEIGHT: 0.200001
; layer num/total_layer_count: 103/111
; update layer progress
M73 L103
M991 S0 P102 ;notify layer change

; OBJECT_ID: 427
G1 X92.818 Y89.352 F42000
G1 Z20.5
G1 E.8 F1800
G1 F1200
M204 S5000
G3 X92.053 Y89.135 I-.597 J.647 E.12868
G1 X92.198 Y89.119 E.00397
G3 X92.773 Y89.313 I.024 J.88 E.01695
M204 S10000
G1 X92.023 Y88.822 F42000
G1 F1200
M204 S5000
G1 X92.241 Y88.805 E.00598
G1 X92.351 Y88.811 E.00302
G3 X91.964 Y88.834 I-.125 J1.188 E.19462
; WIPE_START
G1 F12000
M204 S6000
G1 X92.241 Y88.805 E-.10573
G1 X92.351 Y88.811 E-.04202
G1 X92.596 Y88.863 E-.09497
G1 X92.824 Y88.965 E-.09475
G1 X93.027 Y89.112 E-.09547
G1 X93.17 Y89.266 E-.07968
G1 X93.281 Y89.438 E-.07771
G1 X93.376 Y89.672 E-.09605
G1 X93.412 Y89.862 E-.07362
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z20.9 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z20.9
G1 X0 Y90.0001 F18000 ; move to safe pos
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
            G0 Z20.9 F4000
            G39.3 S1
            G0 Z20.9 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




; CHANGE_LAYER
; Z_HEIGHT: 20.7
; LAYER_HEIGHT: 0.200001
; layer num/total_layer_count: 104/111
; update layer progress
M73 L104
M991 S0 P103 ;notify layer change

; OBJECT_ID: 427
G1 X92.819 Y89.352 F42000
G1 Z20.7
G1 E.8 F1800
G1 F1200
M204 S5000
M73 P95 R0
G3 X92.053 Y89.135 I-.597 J.648 E.12882
G1 X92.195 Y89.119 E.00391
G3 X92.773 Y89.313 I.026 J.881 E.01701
M204 S10000
G1 X92.023 Y88.815 F42000
G1 F1200
M204 S5000
G1 X92.241 Y88.798 E.00599
G1 X92.351 Y88.804 E.00302
G3 X91.964 Y88.827 I-.124 J1.195 E.1958
; WIPE_START
G1 F12000
M204 S6000
G1 X92.241 Y88.798 E-.10594
G1 X92.351 Y88.804 E-.04203
G1 X92.597 Y88.856 E-.09546
G1 X92.827 Y88.959 E-.09555
G1 X93.032 Y89.107 E-.09628
G1 X93.174 Y89.26 E-.07916
G1 X93.307 Y89.474 E-.09591
G1 X93.382 Y89.67 E-.07974
G1 X93.417 Y89.851 E-.06992
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z21.1 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z21.1
G1 X0 Y90.0001 F18000 ; move to safe pos
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
            G0 Z21.1 F4000
            G39.3 S1
            G0 Z21.1 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




; CHANGE_LAYER
; Z_HEIGHT: 20.9
; LAYER_HEIGHT: 0.199999
; layer num/total_layer_count: 105/111
; update layer progress
M73 L105
M991 S0 P104 ;notify layer change

; OBJECT_ID: 427
G1 X92.836 Y89.335 F42000
G1 Z20.9
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X92.919 Y89.428 E.00383
G3 X92.049 Y89.115 I-.698 J.572 E.14431
G1 X92.192 Y89.098 E.00443
G3 X92.79 Y89.299 I.029 J.902 E.01979
; WIPE_START
G1 F12000
M204 S6000
G1 X92.919 Y89.428 E-.0693
G1 X93.031 Y89.592 E-.07529
G1 X93.114 Y89.838 E-.09877
G1 X93.127 Y89.964 E-.04817
G1 X93.114 Y90.162 E-.0754
G1 X93.082 Y90.285 E-.04822
G1 X93.029 Y90.411 E-.05218
G1 X92.881 Y90.621 E-.0974
G1 X92.729 Y90.749 E-.0756
G1 X92.619 Y90.812 E-.04826
G1 X92.502 Y90.859 E-.04792
G1 X92.441 Y90.871 E-.02349
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.002 Y88.658 Z21.3 F42000
G1 Z20.9
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X92.02 Y88.655 E.00056
G3 X92.386 Y88.647 I.213 J1.405 E.01129
G3 X93.095 Y88.951 I-.239 J1.538 E.02395
G1 X93.199 Y89.046 E.00432
G1 X93.258 Y89.111 E.00271
G3 X93.478 Y89.463 I-1.185 J.983 E.01279
G1 X93.526 Y89.592 E.00421
G1 X93.56 Y89.726 E.00426
G3 X93.56 Y90.274 I-1.764 J.274 E.01691
G1 X93.526 Y90.408 E.00426
G3 X93.06 Y91.077 I-1.441 J-.507 E.02536
G1 X92.946 Y91.156 E.00424
G3 X92.567 Y91.319 I-.782 J-1.3 E.01272
G3 X92.293 Y91.361 I-.343 J-1.321 E.00853
G3 X91.929 Y91.329 I-.045 J-1.602 E.01125
G3 X91.668 Y91.243 I.301 J-1.344 E.00847
G3 X91.429 Y91.105 I.575 J-1.273 E.0085
G3 X91.135 Y90.816 I.926 J-1.235 E.01271
G3 X90.867 Y90.092 I1.276 J-.883 E.02395
G1 X90.864 Y89.954 E.00425
G3 X91.626 Y88.777 I1.372 J.053 E.04522
G1 X91.752 Y88.723 E.00422
G1 X91.944 Y88.673 E.00608
; WIPE_START
G1 F2400
M204 S6000
G1 X92.02 Y88.655 E-.02965
G1 X92.386 Y88.647 E-.13923
G1 X92.523 Y88.671 E-.05255
G1 X92.784 Y88.757 E-.10464
G1 X93.095 Y88.951 E-.13931
G1 X93.199 Y89.046 E-.05343
G1 X93.258 Y89.111 E-.03355
G1 X93.344 Y89.222 E-.05345
G1 X93.478 Y89.463 E-.1046
G1 X93.523 Y89.586 E-.04959
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z21.3 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z21.3
G1 X0 Y90.0001 F18000 ; move to safe pos
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
            G0 Z21.3 F4000
            G39.3 S1
            G0 Z21.3 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X93.297 Y89.664 F42000
G1 Z20.9
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.110524
G1 F1200
M204 S6000
G1 X93.333 Y89.773 E.00063
G3 X91.098 Y90.091 I-1.107 J.232 E.02039
G1 X91.094 Y89.999 E.00051
G3 X93.234 Y89.491 I1.131 J.006 E.01661
G1 X93.276 Y89.608 E.00068
; CHANGE_LAYER
; Z_HEIGHT: 21.1
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15000
G1 X93.333 Y89.773 E-.06621
G1 X93.356 Y89.954 E-.06933
G1 X93.34 Y90.201 E-.09418
G1 X93.3 Y90.356 E-.06086
G1 X93.215 Y90.549 E-.08016
G1 X93.049 Y90.777 E-.10699
G1 X92.919 Y90.895 E-.06698
G1 X92.721 Y91.018 E-.08852
G1 X92.509 Y91.096 E-.08573
G1 X92.403 Y91.112 E-.04104
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 106/111
; update layer progress
M73 L106
M991 S0 P105 ;notify layer change

; OBJECT_ID: 427
M204 S10000
G17
G3 Z21.3 I1.182 J.289 P1  F42000
G1 X92.836 Y89.336 Z21.3
G1 Z21.1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X92.919 Y89.428 E.00381
G3 X92.049 Y89.115 I-.697 J.572 E.14431
G1 X92.19 Y89.098 E.00437
G3 X92.79 Y89.299 I.032 J.901 E.01987
; WIPE_START
G1 F12000
M204 S6000
G1 X92.919 Y89.428 E-.06923
G1 X93.031 Y89.592 E-.07532
G1 X93.114 Y89.838 E-.09875
G1 X93.127 Y89.964 E-.04819
G1 X93.114 Y90.162 E-.07548
G1 X93.082 Y90.285 E-.04816
G1 X93.029 Y90.412 E-.05217
G1 X92.881 Y90.621 E-.09738
G1 X92.729 Y90.749 E-.07566
G1 X92.619 Y90.812 E-.04822
G1 X92.442 Y90.875 E-.07143
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.995 Y88.616 Z21.5 F42000
G1 Z21.1
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X92.014 Y88.613 E.00059
G3 X92.391 Y88.605 I.218 J1.397 E.01164
G3 X93.106 Y88.908 I-.244 J1.571 E.02409
G1 X93.123 Y88.921 E.00066
G3 X93.282 Y89.076 I-1.021 J1.204 E.00685
G1 X93.293 Y89.088 E.00048
G3 X93.371 Y89.189 I-.496 J.464 E.00393
G1 X93.381 Y89.204 E.00056
G3 X93.45 Y89.315 I-.515 J.398 E.00403
G1 X93.454 Y89.321 E.0002
G3 X93.509 Y89.434 I-.525 J.327 E.00388
G1 X93.518 Y89.454 E.00066
G3 X93.559 Y89.564 I-.515 J.254 E.00362
G1 X93.567 Y89.588 E.00077
G3 X93.598 Y89.708 I-.569 J.21 E.00381
G1 X93.601 Y89.723 E.00048
G3 X93.619 Y89.842 I-.581 J.151 E.0037
G1 X93.622 Y89.867 E.00078
G3 X93.629 Y89.989 I-.595 J.091 E.00378
G1 X93.629 Y90.005 E.00049
G3 X93.623 Y90.126 I-.593 J.031 E.00371
G1 X93.621 Y90.15 E.00076
G3 X93.601 Y90.278 I-.647 J-.035 E.00396
G1 X93.6 Y90.285 E.00022
G3 X93.568 Y90.407 I-.596 J-.088 E.00388
G1 X93.562 Y90.428 E.00067
G3 X93.52 Y90.541 I-.591 J-.155 E.00373
G1 X93.513 Y90.559 E.00058
G3 X92.853 Y91.255 I-1.289 J-.561 E.03008
M73 P96 R0
G1 X92.82 Y91.27 E.00112
G3 X92.714 Y91.316 I-.278 J-.502 E.00354
G1 X92.711 Y91.317 E.00009
G3 X92.58 Y91.358 I-.272 J-.641 E.00423
G1 X92.571 Y91.36 E.00028
G3 X92.443 Y91.386 I-.195 J-.619 E.00405
G1 X92.429 Y91.388 E.00041
G3 X92.301 Y91.401 I-.128 J-.62 E.00396
G1 X92.272 Y91.402 E.00091
G3 X91.298 Y91.053 I-.044 J-1.407 E.03255
G1 X91.286 Y91.042 E.00049
G3 X91.195 Y90.952 I.395 J-.492 E.00393
G1 X91.187 Y90.943 E.00038
G3 X91.106 Y90.846 I.447 J-.453 E.0039
G1 X91.094 Y90.829 E.00063
G3 X91.024 Y90.724 I.487 J-.402 E.0039
G1 X91.021 Y90.719 E.00016
G3 X90.96 Y90.604 I.534 J-.359 E.00402
G1 X90.95 Y90.582 E.00074
G3 X90.904 Y90.469 I.528 J-.281 E.00375
G1 X90.9 Y90.458 E.00036
G3 X90.863 Y90.334 I.587 J-.241 E.00397
G1 X90.854 Y90.293 E.00129
G3 X91.102 Y89.159 I1.439 J-.279 E.03666
G1 X91.106 Y89.155 E.00017
G3 X91.739 Y88.685 I1.126 J.855 E.02455
G1 X91.937 Y88.632 E.00631
; WIPE_START
G1 F12000
M204 S6000
G1 X92.014 Y88.613 E-.03003
G1 X92.156 Y88.597 E-.05457
G1 X92.391 Y88.605 E-.08936
G1 X92.531 Y88.629 E-.05396
G1 X92.801 Y88.719 E-.10806
G1 X93.106 Y88.908 E-.13626
G1 X93.123 Y88.921 E-.00817
G1 X93.282 Y89.076 E-.08462
G1 X93.293 Y89.088 E-.00592
G1 X93.371 Y89.189 E-.04853
G1 X93.381 Y89.204 E-.00694
G1 X93.45 Y89.315 E-.0498
G1 X93.454 Y89.321 E-.00249
G1 X93.509 Y89.434 E-.04784
G1 X93.518 Y89.454 E-.00812
G1 X93.541 Y89.516 E-.02533
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z21.5 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z21.5
G1 X0 Y90.0001 F18000 ; move to safe pos
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
            G0 Z21.5 F4000
            G39.3 S1
            G0 Z21.5 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X93.304 Y89.606 F42000
G1 Z21.1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.152751
G1 F1200
M204 S6000
G1 X93.335 Y89.693 E.00082
G3 X91.077 Y90.094 I-1.11 J.311 E.03441
G1 X91.073 Y89.998 E.00086
G3 X93.254 Y89.483 I1.152 J.006 E.02751
G1 X93.281 Y89.551 E.00065
; CHANGE_LAYER
; Z_HEIGHT: 21.3
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F15000
G1 X93.335 Y89.693 E-.05776
G1 X93.377 Y89.948 E-.09825
G1 X93.361 Y90.203 E-.09733
G1 X93.314 Y90.382 E-.0703
G1 X93.225 Y90.575 E-.08064
G1 X93.101 Y90.75 E-.08136
G1 X92.931 Y90.913 E-.08965
G1 X92.731 Y91.036 E-.08901
G1 X92.553 Y91.106 E-.07284
G1 X92.494 Y91.117 E-.02285
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 107/111
; update layer progress
M73 L107
M991 S0 P106 ;notify layer change

; OBJECT_ID: 427
M204 S10000
G17
G3 Z21.5 I1.195 J.23 P1  F42000
G1 X92.837 Y89.336 Z21.5
G1 Z21.3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X92.919 Y89.428 E.00379
G3 X92.049 Y89.115 I-.697 J.57 E.14405
G1 X92.188 Y89.098 E.0043
G3 X92.79 Y89.3 I.034 J.9 E.01995
; WIPE_START
G1 F12000
M204 S6000
G1 X92.919 Y89.428 E-.06897
G1 X93.031 Y89.592 E-.07535
G1 X93.114 Y89.838 E-.09871
G1 X93.127 Y89.964 E-.04818
G1 X93.114 Y90.162 E-.07551
G1 X93.082 Y90.285 E-.04818
G1 X93.029 Y90.411 E-.0521
G1 X92.881 Y90.621 E-.09741
G1 X92.729 Y90.749 E-.07561
G1 X92.619 Y90.812 E-.04821
G1 X92.502 Y90.859 E-.0479
G1 X92.441 Y90.872 E-.02386
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.997 Y88.616 Z21.7 F42000
G1 Z21.3
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X92.013 Y88.612 E.00052
G3 X92.26 Y88.596 I.214 J1.387 E.00761
G1 X92.391 Y88.605 E.00403
G3 X91.738 Y88.683 I-.164 J1.394 E.25062
G1 X91.939 Y88.631 E.00638
; WIPE_START
G1 F12000
M204 S6000
G1 X92.013 Y88.612 E-.02924
G1 X92.26 Y88.596 E-.09404
G1 X92.391 Y88.605 E-.04982
G1 X92.669 Y88.667 E-.10822
G1 X92.928 Y88.784 E-.10793
G1 X93.145 Y88.938 E-.10135
G1 X93.321 Y89.121 E-.09627
G1 X93.474 Y89.356 E-.10664
G1 X93.538 Y89.519 E-.06649
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z21.7 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z21.7
G1 X0 Y90.0001 F18000 ; move to safe pos
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
            G0 Z21.7 F4000
            G39.3 S1
            G0 Z21.7 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X93.304 Y89.608 F42000
G1 Z21.3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.152746
G1 F1200
M204 S6000
G1 X93.335 Y89.693 E.00081
G3 X91.077 Y90.094 I-1.11 J.311 E.0344
G1 X91.073 Y89.998 E.00086
G3 X93.254 Y89.483 I1.152 J.006 E.02751
G1 X93.282 Y89.552 E.00066
; CHANGE_LAYER
; Z_HEIGHT: 21.5
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15000
G1 X93.335 Y89.693 E-.05726
G1 X93.377 Y89.948 E-.09813
G1 X93.361 Y90.203 E-.09735
G1 X93.314 Y90.382 E-.07024
G1 X93.224 Y90.575 E-.08076
G1 X93.101 Y90.75 E-.08128
G1 X92.93 Y90.913 E-.08969
G1 X92.731 Y91.036 E-.08891
G1 X92.553 Y91.106 E-.0729
G1 X92.492 Y91.117 E-.02348
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 108/111
; update layer progress
M73 L108
M991 S0 P107 ;notify layer change

; OBJECT_ID: 427
M204 S10000
G17
G3 Z21.7 I1.195 J.232 P1  F42000
G1 X92.837 Y89.337 Z21.7
G1 Z21.5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X92.919 Y89.428 E.00377
G3 X92.049 Y89.115 I-.697 J.571 E.14405
G1 X92.186 Y89.098 E.00424
G3 X92.791 Y89.3 I.037 J.9 E.02004
; WIPE_START
G1 F12000
M204 S6000
G1 X92.919 Y89.428 E-.06892
G1 X93.031 Y89.592 E-.07532
G1 X93.114 Y89.838 E-.09878
G1 X93.127 Y89.964 E-.04816
G1 X93.114 Y90.162 E-.07547
G1 X93.082 Y90.285 E-.04816
G1 X93.029 Y90.411 E-.05215
G1 X92.881 Y90.621 E-.09741
G1 X92.729 Y90.749 E-.07565
G1 X92.619 Y90.812 E-.0482
G1 X92.502 Y90.859 E-.04784
G1 X92.44 Y90.872 E-.02394
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.999 Y88.615 Z21.9 F42000
G1 Z21.5
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X92.014 Y88.612 E.00045
G3 X92.269 Y88.596 I.215 J1.387 E.00787
G1 X92.391 Y88.605 E.00376
G3 X91.738 Y88.684 I-.163 J1.394 E.25063
G1 X91.941 Y88.63 E.00645
; WIPE_START
G1 F12000
M204 S6000
G1 X92.014 Y88.612 E-.02835
G1 X92.269 Y88.596 E-.09717
G1 X92.391 Y88.605 E-.04654
G1 X92.669 Y88.667 E-.10819
G1 X92.928 Y88.784 E-.10815
G1 X93.145 Y88.938 E-.10123
G1 X93.321 Y89.121 E-.09644
G1 X93.474 Y89.356 E-.10638
G1 X93.539 Y89.521 E-.06754
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z21.9 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z21.9
G1 X0 Y90.0001 F18000 ; move to safe pos
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
            G0 Z21.9 F4000
            G39.3 S1
            G0 Z21.9 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X93.305 Y89.61 F42000
G1 Z21.5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.152739
G1 F1200
M204 S6000
G1 X93.335 Y89.693 E.00078
G3 X91.077 Y90.094 I-1.109 J.311 E.03441
G1 X91.073 Y89.998 E.00086
G3 X93.254 Y89.483 I1.152 J.006 E.02751
G1 X93.282 Y89.555 E.00069
; CHANGE_LAYER
; Z_HEIGHT: 21.7
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15000
G1 X93.335 Y89.693 E-.05611
G1 X93.377 Y89.948 E-.09831
G1 X93.361 Y90.203 E-.09731
G1 X93.314 Y90.382 E-.07013
G1 X93.224 Y90.575 E-.08091
G1 X93.101 Y90.75 E-.08124
G1 X92.93 Y90.913 E-.08975
G1 X92.731 Y91.036 E-.08891
G1 X92.553 Y91.106 E-.07284
G1 X92.489 Y91.118 E-.0245
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 109/111
; update layer progress
M73 L109
M991 S0 P108 ;notify layer change

; OBJECT_ID: 427
M204 S10000
G17
G3 Z21.9 I1.194 J.234 P1  F42000
G1 X92.838 Y89.337 Z21.9
G1 Z21.7
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X92.92 Y89.427 E.00375
G3 X92.048 Y89.115 I-.697 J.571 E.14406
G1 X92.183 Y89.099 E.00418
G3 X92.791 Y89.3 I.04 J.9 E.02011
; WIPE_START
G1 F12000
M204 S6000
G1 X92.92 Y89.427 E-.06886
G1 X93.031 Y89.592 E-.07541
G1 X93.114 Y89.838 E-.09873
G1 X93.127 Y89.964 E-.04816
G1 X93.114 Y90.162 E-.07548
G1 X93.082 Y90.285 E-.04812
G1 X93.029 Y90.412 E-.05222
G1 X92.881 Y90.621 E-.09738
G1 X92.729 Y90.749 E-.07564
G1 X92.619 Y90.812 E-.04822
G1 X92.502 Y90.859 E-.04789
G1 X92.44 Y90.872 E-.02389
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.001 Y88.615 Z22.1 F42000
G1 Z21.7
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X92.014 Y88.612 E.00038
G3 X92.277 Y88.596 I.215 J1.387 E.00813
G1 X92.391 Y88.605 E.0035
G3 X91.736 Y88.685 I-.162 J1.394 E.25058
G1 X91.943 Y88.63 E.00658
; WIPE_START
G1 F12000
M204 S6000
G1 X92.014 Y88.612 E-.02752
G1 X92.277 Y88.596 E-.10037
G1 X92.391 Y88.605 E-.04323
G1 X92.531 Y88.629 E-.05422
G1 X92.801 Y88.719 E-.10811
G1 X93.045 Y88.859 E-.1068
G1 X93.26 Y89.05 E-.1092
G1 X93.43 Y89.277 E-.10794
G1 X93.545 Y89.522 E-.10262
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z22.1 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z22.1
G1 X0 Y90.0001 F18000 ; move to safe pos
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
            G0 Z22.1 F4000
            G39.3 S1
            G0 Z22.1 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X93.303 Y89.606 F42000
G1 Z21.7
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.152726
G1 F1200
M204 S6000
G1 X93.345 Y89.73 E.00117
G3 X91.077 Y90.094 I-1.12 J.272 E.03403
G1 X91.073 Y89.998 E.00086
G3 X93.268 Y89.511 I1.152 J.005 E.0278
G1 X93.282 Y89.55 E.00037
; CHANGE_LAYER
; Z_HEIGHT: 21.9
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F15000
G1 X93.345 Y89.73 E-.07266
G1 X93.378 Y89.948 E-.08354
G1 X93.361 Y90.203 E-.09735
G1 X93.314 Y90.382 E-.07022
G1 X93.214 Y90.593 E-.08871
G1 X93.075 Y90.78 E-.08849
G1 X92.896 Y90.938 E-.0908
G1 X92.725 Y91.04 E-.07567
G1 X92.496 Y91.121 E-.0921
G1 X92.495 Y91.121 E-.00045
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 110/111
; update layer progress
M73 L110
M991 S0 P109 ;notify layer change

; OBJECT_ID: 427
M204 S10000
G17
G3 Z22.1 I1.195 J.23 P1  F42000
G1 X92.838 Y89.337 Z22.1
G1 Z21.9
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X92.92 Y89.427 E.00375
G3 X92.048 Y89.115 I-.697 J.571 E.14405
G1 X92.181 Y89.099 E.00412
G3 X92.792 Y89.299 I.042 J.9 E.0202
; WIPE_START
G1 F12000
M204 S6000
M73 P97 R0
G1 X92.92 Y89.427 E-.06893
G1 X93.031 Y89.592 E-.07532
G1 X93.114 Y89.838 E-.09867
G1 X93.127 Y89.964 E-.04816
G1 X93.114 Y90.162 E-.07549
G1 X93.082 Y90.285 E-.04821
G1 X93.029 Y90.412 E-.05212
G1 X92.881 Y90.621 E-.09737
G1 X92.729 Y90.749 E-.0756
G1 X92.619 Y90.812 E-.04825
G1 X92.441 Y90.875 E-.07188
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.003 Y88.614 Z22.3 F42000
G1 Z21.9
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X92.013 Y88.612 E.00031
G3 X92.286 Y88.597 I.216 J1.387 E.00839
G1 X92.39 Y88.605 E.00323
G3 X91.736 Y88.685 I-.161 J1.394 E.25058
G1 X91.945 Y88.629 E.00665
; WIPE_START
G1 F12000
M204 S6000
G1 X92.013 Y88.612 E-.02661
G1 X92.286 Y88.597 E-.10362
G1 X92.39 Y88.605 E-.03996
G1 X92.531 Y88.629 E-.05434
G1 X92.801 Y88.719 E-.10806
G1 X93.04 Y88.856 E-.1045
G1 X93.26 Y89.05 E-.11151
G1 X93.43 Y89.277 E-.10806
G1 X93.546 Y89.524 E-.10333
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z22.3 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z22.3
G1 X0 Y90.0001 F18000 ; move to safe pos
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
            G0 Z22.3 F4000
            G39.3 S1
            G0 Z22.3 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X93.304 Y89.608 F42000
G1 Z21.9
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.152729
G1 F1200
M204 S6000
G1 X93.345 Y89.73 E.00115
G3 X91.077 Y90.094 I-1.12 J.272 E.03403
G1 X91.073 Y89.997 E.00087
G3 X93.268 Y89.511 I1.152 J.006 E.0278
G1 X93.283 Y89.552 E.00039
; CHANGE_LAYER
; Z_HEIGHT: 22.1
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15000
G1 X93.345 Y89.73 E-.07183
G1 X93.378 Y89.948 E-.08357
G1 X93.361 Y90.203 E-.09738
G1 X93.314 Y90.382 E-.0702
G1 X93.214 Y90.593 E-.08871
G1 X93.075 Y90.78 E-.08845
G1 X92.893 Y90.94 E-.09216
G1 X92.725 Y91.04 E-.0743
G1 X92.497 Y91.121 E-.09205
G1 X92.493 Y91.122 E-.00134
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 111/111
; update layer progress
M73 L111
M991 S0 P110 ;notify layer change

; OBJECT_ID: 427
M204 S10000
G17
G3 Z22.3 I1.195 J.231 P1  F42000
G1 X92.838 Y89.338 Z22.3
G1 Z22.1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X92.921 Y89.427 E.00374
G3 X92.048 Y89.115 I-.696 J.572 E.14406
G1 X92.177 Y89.099 E.00401
G3 X92.792 Y89.299 I.047 J.9 E.02033
; WIPE_START
G1 F12000
M204 S6000
G1 X92.921 Y89.427 E-.06891
G1 X93.031 Y89.592 E-.07535
G1 X93.114 Y89.838 E-.09878
G1 X93.127 Y89.964 E-.04816
G1 X93.114 Y90.162 E-.07547
G1 X93.082 Y90.285 E-.04818
G1 X93.029 Y90.411 E-.05212
G1 X92.881 Y90.621 E-.09741
G1 X92.729 Y90.749 E-.07565
G1 X92.619 Y90.812 E-.04827
G1 X92.441 Y90.875 E-.0717
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.005 Y88.614 Z22.5 F42000
G1 Z22.1
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X92.013 Y88.612 E.00024
G3 X92.293 Y88.597 I.214 J1.387 E.00862
G1 X92.439 Y88.612 E.00453
G3 X91.736 Y88.684 I-.212 J1.388 E.24905
G1 X91.947 Y88.629 E.00671
; WIPE_START
G1 F12000
M204 S6000
G1 X92.013 Y88.612 E-.02573
G1 X92.293 Y88.597 E-.10642
G1 X92.439 Y88.612 E-.05602
G1 X92.668 Y88.667 E-.08944
G1 X92.928 Y88.784 E-.10836
G1 X93.159 Y88.95 E-.10797
G1 X93.351 Y89.159 E-.10795
G1 X93.497 Y89.403 E-.10791
G1 X93.541 Y89.527 E-.0502
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z22.5 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z22.5
G1 X0 Y90.0001 F18000 ; move to safe pos
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
            G0 Z22.5 F4000
            G39.3 S1
            G0 Z22.5 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X93.304 Y89.61 F42000
G1 Z22.1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.152718
G1 F1200
M204 S6000
G1 X93.345 Y89.73 E.00114
G3 X91.077 Y90.094 I-1.12 J.273 E.03403
G1 X91.073 Y89.998 E.00086
G3 X93.268 Y89.511 I1.152 J.005 E.0278
G1 X93.283 Y89.554 E.00041
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F15000
G1 X93.345 Y89.73 E-.07112
G1 X93.378 Y89.948 E-.08352
G1 X93.361 Y90.203 E-.09735
G1 X93.314 Y90.382 E-.07012
G1 X93.214 Y90.593 E-.08873
G1 X93.075 Y90.78 E-.08852
G1 X92.893 Y90.94 E-.09207
G1 X92.724 Y91.04 E-.0745
G1 X92.496 Y91.121 E-.09225
G1 X92.491 Y91.122 E-.00184
; WIPE_END
G1 E-.04 F1800
M106 S0
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
G1 Z22.6 F900 ; lower z a little
G1 X0 Y90.0001 F18000 ; move to safe pos
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

    G1 Z122.1 F600
    G1 Z120.1

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

