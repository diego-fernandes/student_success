- dashboard: guardian_overview
  title: Guardian Overview
  layout: newspaper
  elements:
  - title: Average % Points Earned
    name: Average % Points Earned
    model: student_success
    explore: courses
    type: single_value
    fields: [coursework_submissions.average_grade_percent]
    filters: {}
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
      Guardian Filter: guardian_profiles.name
      Student Filter: student_profiles.name
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
    filters: {}
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
      Guardian Filter: guardian_profiles.name
      Student Filter: student_profiles.name
    row: 3
    col: 6
    width: 6
    height: 4
  - title: Missing Assignments
    name: Missing Assignments
    model: student_success
    explore: courses
    type: single_value
    fields: [coursework.missing_submissions, coursework.percent_missing]
    filters: {}
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
      Guardian Filter: guardian_profiles.name
      Student Filter: student_profiles.name
    row: 3
    col: 18
    width: 6
    height: 4
  - title: Meet Participation
    name: Meet Participation
    model: student_success
    explore: meet_activities
    type: looker_grid
    fields: [meet_events.average_percent_spoken, meet_activities.start_date]
    fill_fields: [meet_activities.start_date]
    filters:
      meet_activities.start_date: 14 days
    sorts: [meet_activities.start_date desc]
    limit: 500
    column_limit: 50
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
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    single_value_title: Average % Spoken During Meet
    value_format: ''
    defaults_version: 1
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
    listen:
      Student Filter: student_profiles.name
    row: 11
    col: 12
    width: 12
    height: 8
  - title: Assignments
    name: Assignments
    model: student_success
    explore: courses
    type: looker_grid
    fields: [coursework_submissions.id, coursework_submissions.late, coursework_submissions.normalized_grade,
      coursework_submissions.state, coursework_submissions.creation_date]
    filters:
      coursework_submissions.creation_date: 30 days
    sorts: [coursework_submissions.creation_date desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{dimension: calculation_1, label: Calculation 1, expression: 'avg(${coursework.materials})',
        value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
        _type_hint: 'null'}]
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
    column_order: ["$$$_row_numbers_$$$", coursework_submissions.creation_date, coursework_submissions.id,
      coursework_submissions.normalized_grade, coursework_submissions.late, coursework_submissions.state]
    listen:
      Guardian Filter: guardian_profiles.name
      Student Filter: student_profiles.name
    row: 23
    col: 0
    width: 24
    height: 8
  - name: "<span class='fa fa-tachometer'> Student Overview</span>"
    type: text
    title_text: "<span class='fa fa-tachometer'> Student Overview</span>"
    subtitle_text: How is my student performing at a high level?
    row: 0
    col: 2
    width: 20
    height: 3
  - title: Student Average Chromebook Usage
    name: Student Average Chromebook Usage
    model: student_success
    explore: chrome_usage
    type: single_value
    fields: [chrome_usage.average_daily_duration, usage_goal]
    filters:
      chrome_usage.usage_day_of_week: "-Sunday,-Saturday"
    sorts: [chrome_usage.average_daily_duration desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{dimension: usage_goal, label: Usage Goal, expression: '120',
        value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
        _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: progress
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Student Average Chromebook Usage
    comparison_label: 120 min Usage Goal
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
    hidden_series: [students.count]
    series_types: {}
    listen:
      Student Filter: student_profiles.name
    row: 3
    col: 12
    width: 6
    height: 4
  - name: "<span class='fa fa-users'> Student Engagement </span>"
    type: text
    title_text: "<span class='fa fa-users'> Student Engagement </span>"
    subtitle_text: How is my student engaging with the materials and through meet?
    row: 7
    col: 2
    width: 20
    height: 4
  - title: Chrome Daily Usage
    name: Chrome Daily Usage
    model: student_success
    explore: chrome_usage
    type: looker_column
    fields: [chrome_usage.average_daily_duration, chrome_usage.usage_date]
    fill_fields: [chrome_usage.usage_date]
    filters:
      chrome_usage.usage_day_of_week: "-Sunday,-Saturday"
      student_profiles.name: Peter Moore
      chrome_usage.usage_date: 14 days
    sorts: [chrome_usage.usage_date desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{dimension: usage_goal, label: Usage Goal, expression: '120',
        value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
        _type_hint: number}]
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
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    hidden_series: [students.count]
    series_types: {}
    show_null_points: false
    interpolation: linear
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: progress
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Student Average Chromebook Usage
    comparison_label: 120 min Usage Goal
    defaults_version: 1
    listen: {}
    row: 11
    col: 0
    width: 12
    height: 8
  - name: "<span class='fa fa-smile-o'> Classroom Performance </span>"
    type: text
    title_text: "<span class='fa fa-smile-o'> Classroom Performance </span>"
    subtitle_text: How is my student performing on assignments and coursework?
    row: 19
    col: 2
    width: 20
    height: 4
  filters:
  - name: Guardian Filter
    title: Guardian Filter
    type: field_filter
    default_value: Jason Murray
    allow_multiple_values: true
    required: false
    model: student_success
    explore: courses
    listens_to_filters: []
    field: guardian_profiles.name
  - name: Student Filter
    title: Student Filter
    type: field_filter
    default_value: Peter Moore
    allow_multiple_values: true
    required: false
    model: student_success
    explore: courses
    listens_to_filters: []
    field: student_profiles.name
