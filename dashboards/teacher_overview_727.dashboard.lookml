- dashboard: teacher_overview
  title: Teacher Overview
  layout: newspaper
  elements:
  - title: Average % Points Earned
    name: Average % Points Earned
    model: student_success
    explore: courses
    type: single_value
    fields: [coursework_submissions.average_grade_percent]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: goal, label: Goal, expression: 80/100, value_format: !!null '',
        value_format_name: percent_1, is_disabled: false, _kind_hint: dimension, _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: progress
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#34A853"
    comparison_label: 80% Goal
    conditional_formatting: [{type: greater than, value: 0.8, background_color: '',
        font_color: "#34A853", color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}, {type: between,
        value: [0.7, 0.8], background_color: '', font_color: "#FBBC04", color_application: {
          collection_id: google, palette_id: google-sequential-0}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}, {type: less than, value: 0.7, background_color: '',
        font_color: "#EA4335", color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    hidden_fields: []
    listen:
      Teacher Filter: teacher_profiles.name
      Course Filter: courses.name
      Section Filter: courses.section
      District Filter: schools.school_district
    row: 3
    col: 0
    width: 6
    height: 4
  - title: Meet Attendance Rate
    name: Meet Attendance Rate
    model: student_success
    explore: courses
    type: single_value
    fields: [student_attendance_facts.total_attendance_rate]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: goal, label: Goal, expression: 80/100, value_format: !!null '',
        value_format_name: percent_1, _kind_hint: dimension, _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: progress
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: 80% Goal
    conditional_formatting: [{type: greater than, value: 0.8, background_color: '',
        font_color: "#34A853", color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}, {type: between,
        value: [0.6, 0.8], background_color: '', font_color: "#FBBC04", color_application: {
          collection_id: google, palette_id: google-sequential-0}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}, {type: less than, value: 0.6, background_color: '',
        font_color: "#EA4335", color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    hidden_fields: []
    listen:
      Teacher Filter: teacher_profiles.name
      Course Filter: courses.name
      Section Filter: courses.section
      District Filter: schools.school_district
    row: 3
    col: 6
    width: 6
    height: 4
  - name: "<span class='fa fa-tachometer'> Teacher Overview</span>"
    type: text
    title_text: "<span class='fa fa-tachometer'> Teacher Overview</span>"
    subtitle_text: How am I performing at a high level?
    body_text: ''
    row: 0
    col: 0
    width: 24
    height: 3
  - name: "<span class='fa fa-users'> Student Engagement </span>"
    type: text
    title_text: "<span class='fa fa-users'> Student Engagement </span>"
    subtitle_text: How are my students engaging with the materials and through meet?
    row: 11
    col: 0
    width: 24
    height: 3
  - title: Missing Assignments
    name: Missing Assignments
    model: student_success
    explore: courses
    type: single_value
    fields: [coursework.missing_submissions, coursework.percent_missing]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#EA4335"
    comparison_label: Percent Missing
    defaults_version: 1
    listen:
      Teacher Filter: teacher_profiles.name
      Course Filter: courses.name
      Section Filter: courses.section
      District Filter: schools.school_district
    row: 3
    col: 12
    width: 6
    height: 4
  - title: Student Breakdown
    name: Student Breakdown
    model: student_success
    explore: courses
    type: looker_grid
    fields: [student_profiles.name, student_attendance_facts.total_attendance_rate]
    filters: {}
    sorts: [student_attendance_facts.total_attendance_rate desc]
    limit: 500
    query_timezone: America/Los_Angeles
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields: []
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    listen:
      Teacher Filter: teacher_profiles.name
      Course Filter: courses.name
      Section Filter: courses.section
      District Filter: schools.school_district
    row: 14
    col: 5
    width: 10
    height: 8
  - title: Attendance and Grade Correlation
    name: Attendance and Grade Correlation
    model: student_success
    explore: courses
    type: looker_column
    fields: [student_attendance_facts.attendance_rate_tier, coursework_submissions.average_grade_percent]
    filters: {}
    sorts: [student_attendance_facts.attendance_rate_tier]
    limit: 500
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: true
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: google
      palette_id: google-categorical-0
      options:
        steps: 5
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    series_types: {}
    series_colors: {}
    label_color: [green]
    trend_lines: [{color: "#EA4335", label_position: left, period: 7, regression_type: linear,
        series_index: 1, show_label: false, label_type: string}]
    show_dropoff: false
    hidden_fields: []
    defaults_version: 1
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    listen:
      Teacher Filter: teacher_profiles.name
      Course Filter: courses.name
      Section Filter: courses.section
      District Filter: schools.school_district
    row: 33
    col: 5
    width: 11
    height: 8
  - name: "<span class='fa fa-smile-o'> Classroom Performance </span>"
    type: text
    title_text: "<span class='fa fa-smile-o'> Classroom Performance </span>"
    subtitle_text: How are my students performing on assignments and coursework?
    row: 30
    col: 2
    width: 19
    height: 3
  - title: Average Points Earned
    name: Average Points Earned
    model: student_success
    explore: courses
    type: looker_grid
    fields: [student_facts.average_points_earned, student_profiles.name]
    filters: {}
    sorts: [student_facts.average_points_earned desc]
    limit: 500
    query_timezone: America/Los_Angeles
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    font_size: '12'
    series_types: {}
    point_style: none
    series_colors:
      0 to 4 - 1 - students.count: "#EA4335"
      25 to 49 - 4 - students.count: "#FBBC04"
      50 or Above - 5 - students.count: "#34A853"
      10 to 24 - 3 - students.count: "#EA8600"
    series_labels: {}
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    charts_across: 5
    defaults_version: 1
    hidden_fields: []
    hidden_points_if_no: []
    listen:
      Teacher Filter: teacher_profiles.name
      Course Filter: courses.name
      Section Filter: courses.section
      District Filter: schools.school_district
    row: 33
    col: 16
    width: 8
    height: 8
  - title: Assigned Materials
    name: Assigned Materials
    model: student_success
    explore: courses
    type: looker_column
    fields: [teacher_profiles.name, coursework.count, coursework.number_assignments,
      coursework_materials.count]
    filters: {}
    sorts: [coursework_materials.count desc]
    limit: 1
    column_limit: 50
    dynamic_fields: [{dimension: calculation_1, label: Calculation 1, expression: 'avg(${coursework.materials})',
        value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
        _type_hint: 'null'}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: google
      palette_id: google-categorical-0
      options:
        steps: 5
    series_types: {}
    show_dropoff: true
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    smoothedBars: false
    orientation: automatic
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Median Number of Materials
    defaults_version: 1
    show_null_points: true
    interpolation: linear
    value_labels: legend
    label_type: labPer
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: fit_data
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    listen:
      Teacher Filter: teacher_profiles.name
      Course Filter: courses.name
      Section Filter: courses.section
      District Filter: schools.school_district
    row: 14
    col: 15
    width: 9
    height: 8
  - title: New Tile
    name: New Tile
    model: student_success
    explore: courses
    type: single_value
    fields: [students.students_without_attendance]
    filters: {}
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#EA4335"
    single_value_title: Students Without Attendance
    defaults_version: 1
    series_types: {}
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    interpolation: linear
    value_labels: legend
    label_type: labPer
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: fit_data
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    groupBars: true
    labelSize: 10pt
    showLegend: true
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    listen:
      Teacher Filter: teacher_profiles.name
      Course Filter: courses.name
      Section Filter: courses.section
      District Filter: schools.school_district
    row: 14
    col: 0
    width: 5
    height: 4
  - title: New Tile
    name: New Tile (2)
    model: student_success
    explore: courses
    type: single_value
    fields: [teacher_meet_facts.number_meets]
    filters: {}
    sorts: [teacher_meet_facts.number_meets]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Number of Meets
    defaults_version: 1
    listen:
      Teacher Filter: teacher_profiles.name
      Course Filter: courses.name
      Section Filter: courses.section
      District Filter: schools.school_district
    row: 18
    col: 0
    width: 5
    height: 4
  - title: Average Meet Duration by Day
    name: Average Meet Duration by Day
    model: student_success
    explore: meet_activities
    type: looker_column
    fields: [meet_events.average_duration, meet_activities.start_day_of_week, meet_events.number_meets]
    filters:
      meet_events.average_duration: ">0"
    sorts: [meet_activities.start_day_of_week]
    limit: 500
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: true
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: meet_events.average_duration,
            id: meet_events.average_duration, name: Average Duration}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: !!null '', orientation: right, series: [{axisId: meet_events.number_meets,
            id: meet_events.number_meets, name: Number Meets}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    series_types:
      meet_events.number_meets: line
    reference_lines: []
    trend_lines: []
    show_null_points: false
    interpolation: linear
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Average Meet Duration (Minutes)
    value_format: ''
    defaults_version: 1
    listen:
      Teacher Filter: teacher_profiles.name
      District Filter: schools.school_district
    row: 22
    col: 0
    width: 12
    height: 8
  - title: Meet Details
    name: Meet Details
    model: student_success
    explore: meet_activities
    type: looker_line
    fields: [meet_events.average_percent_spoken, meet_activities.start_date, meet_events.average_duration]
    fill_fields: [meet_activities.start_date]
    filters: {}
    sorts: [meet_activities.start_date desc]
    limit: 500
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: meet_events.average_percent_spoken,
            id: meet_events.average_percent_spoken, name: Average Percent Spoken}],
        showLabels: true, showValues: true, maxValue: !!null '', unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}, {label: '', orientation: right,
        series: [{axisId: meet_events.average_duration, id: meet_events.average_duration,
            name: Average Duration}], showLabels: true, showValues: true, maxValue: 100,
        unpinAxis: false, tickDensity: default, type: linear}]
    series_types: {}
    reference_lines: [{reference_type: line, range_start: max, range_end: min, margin_top: deviation,
        margin_value: mean, margin_bottom: deviation, label_position: center, color: "#34A853",
        line_value: ".6", label: 60% goal}, {reference_type: line, range_start: max,
        range_end: min, margin_top: deviation, margin_value: mean, margin_bottom: deviation,
        label_position: center, color: "#FBBC04", line_value: ".30", label: 30 min
          goal}]
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Average % Spoken During Meet
    value_format: ''
    defaults_version: 1
    ordering: none
    show_null_labels: false
    value_labels: legend
    label_type: labPer
    listen:
      Teacher Filter: teacher_profiles.name
      District Filter: schools.school_district
    row: 22
    col: 12
    width: 12
    height: 8
  - title: Average Grade %
    name: Average Grade %
    model: student_success
    explore: courses
    type: marketplace_viz_bar_gauge::bar_gauge-marketplace
    fields: [coursework_submissions.average_grade_percent, coursework_submissions.min_grade_percent]
    filters: {}
    limit: 500
    column_limit: 50
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    y_axes: [{label: '', orientation: left, series: [{axisId: coursework_submissions.average_grade_percent,
            id: coursework_submissions.average_grade_percent, name: Average Grade
              Percent}], showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}, {label: !!null '', orientation: right,
        series: [{axisId: coursework_submissions.count, id: coursework_submissions.count,
            name: Number of Submissions}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    font_size: '12'
    series_types: {}
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    defaults_version: 0
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    smoothedBars: false
    orientation: automatic
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    ordering: none
    show_null_labels: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    bar_range_max: 1
    listen:
      Teacher Filter: teacher_profiles.name
      Course Filter: courses.name
      Section Filter: courses.section
      District Filter: schools.school_district
    row: 33
    col: 0
    width: 5
    height: 8
  - title: Chrome Utilization vs Grade
    name: Chrome Utilization vs Grade
    model: student_success
    explore: courses
    type: looker_scatter
    fields: [student_chrome_facts.average_daily_duration, student_facts.average_points_earned]
    filters: {}
    sorts: [student_facts.average_points_earned desc]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    y_axes: [{label: '', orientation: left, series: [{axisId: student_facts.average_points_earned,
            id: student_facts.average_points_earned, name: Average Points Earned}],
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: log}]
    series_types: {}
    trend_lines: [{color: "#EA4335", label_position: right, period: 7, regression_type: logarithmic,
        series_index: 1, show_label: false}]
    defaults_version: 1
    listen:
      Teacher Filter: teacher_profiles.name
      Course Filter: courses.name
      Section Filter: courses.section
      District Filter: schools.school_district
    row: 41
    col: 0
    width: 13
    height: 9
  - title: "% Meets with Video vs Grade"
    name: "% Meets with Video vs Grade"
    model: student_success
    explore: courses
    type: looker_scatter
    fields: [student_meet_facts.percent_meets_with_video, student_facts.average_points_earned]
    filters:
      teacher_profiles.name: Brenda Lindsey
    sorts: [student_facts.average_points_earned desc]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    y_axes: [{label: '', orientation: left, series: [{axisId: student_facts.average_points_earned,
            id: student_facts.average_points_earned, name: Average Points Earned}],
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    series_types: {}
    trend_lines: [{color: "#34A853", label_position: right, period: 7, regression_type: exponential,
        series_index: 1, show_label: false}]
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen:
      Section Filter: courses.section
      District Filter: schools.school_district
    row: 41
    col: 13
    width: 11
    height: 9
  - title: Number of At Risk Students
    name: Number of At Risk Students
    model: student_success
    explore: predicted_performance_applied
    type: single_value
    fields: [predicted_performance_applied.sum_of_predicted_at_risk]
    filters:
      schools.school_district: Jimenezshire
      schools.school_name: Hanna High School
      teacher_profiles.name: Brenda Lindsey
    limit: 500
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#EA4335"
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: At Risk is constructed from Classroom Assessment grade percentage,
      percent of Meets attended, and percentage of Classroom Assignments submitted
      late. This metric can be updated with additional fields from the Meet data and/or
      can be enriched when additional data sets are joined in.
    listen: {}
    row: 3
    col: 18
    width: 6
    height: 4
  filters:
  - name: Teacher Filter
    title: Teacher Filter
    type: field_filter
    default_value: Brenda Lindsey
    allow_multiple_values: true
    required: false
    model: student_success
    explore: courses
    listens_to_filters: []
    field: teacher_profiles.name
  - name: Course Filter
    title: Course Filter
    type: field_filter
    default_value: 10th Grade Technology
    allow_multiple_values: true
    required: false
    model: student_success
    explore: courses
    listens_to_filters: []
    field: courses.name
  - name: Section Filter
    title: Section Filter
    type: field_filter
    default_value: 'Hanna High School : Period 3'
    allow_multiple_values: true
    required: false
    model: student_success
    explore: courses
    listens_to_filters: []
    field: courses.section
  - name: District Filter
    title: District Filter
    type: field_filter
    default_value: Jimenezshire
    allow_multiple_values: true
    required: false
    model: student_success
    explore: courses
    listens_to_filters: []
    field: schools.school_district
