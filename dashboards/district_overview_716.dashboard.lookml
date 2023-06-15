- dashboard: district_overview
  title: District Overview
  layout: newspaper
  elements:
  - title: Students by Grade Tier
    name: Students by Grade Tier
    model: student_success
    explore: courses
    type: looker_column
    fields: [schools.school_name, students.count, student_facts.average_grade_tier]
    pivots: [student_facts.average_grade_tier]
    filters:
      student_facts.average_grade_tier: "-Undefined"
    sorts: [students.count desc 5, student_facts.average_grade_tier 0]
    limit: 500
    row_total: right
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: percent
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
    y_axes: [{label: '', orientation: left, series: [{axisId: Below 60 - 0 - students.count,
            id: Below 60 - 0 - students.count, name: Below 60}, {axisId: 60 to 69
              - 1 - students.count, id: 60 to 69 - 1 - students.count, name: 60 to
              69}, {axisId: 70 to 79 - 2 - students.count, id: 70 to 79 - 2 - students.count,
            name: 70 to 79}, {axisId: 80 to 89 - 3 - students.count, id: 80 to 89
              - 3 - students.count, name: 80 to 89}, {axisId: 90 or Above - 4 - students.count,
            id: 90 or Above - 4 - students.count, name: 90 or Above}], showLabels: false,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    hidden_series: [TXX Undefined - students.count]
    series_types: {}
    series_colors:
      Below 60 - 0 - students.count: "#EA4335"
      60 to 69 - 1 - students.count: "#EA8600"
      90 or Above - 4 - students.count: "#4285F4"
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
    defaults_version: 1
    listen:
      District: schools.school_district
    row: 18
    col: 0
    width: 9
    height: 8
  - name: District Overview
    type: text
    title_text: District Overview
    subtitle_text: How are we doing overall?
    row: 0
    col: 0
    width: 24
    height: 3
  - name: Assignments & Grades
    type: text
    title_text: Assignments & Grades
    row: 7
    col: 0
    width: 24
    height: 3
  - name: Usage & Participation
    type: text
    title_text: Usage & Participation
    row: 26
    col: 0
    width: 24
    height: 4
  - title: Average % Points Earned
    name: Average % Points Earned
    model: student_success
    explore: courses
    type: single_value
    fields: [student_facts.average_points_earned, schools.is_district]
    fill_fields: [schools.is_district]
    filters: {}
    sorts: [student_facts.average_points_earned desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: difference, label: Difference, expression: "${student_facts.average_points_earned}-offset(${student_facts.average_points_earned},1)",
        value_format: !!null '', value_format_name: percent_1, _kind_hint: measure,
        _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Higher Than Other Districts in State
    conditional_formatting: [{type: greater than, value: !!null '', background_color: "#4285F4",
        font_color: !!null '', color_application: {collection_id: google, palette_id: google-sequential-0},
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
    hidden_fields: [schools.is_district]
    note_state: collapsed
    note_display: hover
    note_text: The average percent of points earned for all courseworks across the
      district
    listen:
      District: schools.district_comparitor
    row: 3
    col: 0
    width: 6
    height: 4
  - title: Average Points Earned by Teacher
    name: Average Points Earned by Teacher
    model: student_success
    explore: courses
    type: looker_scatter
    fields: [teacher_profiles.name, student_facts.average_points_earned, student_metadata.grade,
      students.count]
    pivots: [student_metadata.grade]
    filters:
      student_metadata.grade: "-NULL"
    sorts: [student_metadata.grade 0, teacher_profiles.name desc]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    y_axes: [{label: '', orientation: left, series: [{axisId: student_facts.average_points_earned,
            id: Kindergarten - 0 - student_facts.average_points_earned, name: Kindergarten},
          {axisId: student_facts.average_points_earned, id: 1st Grade - 1 - student_facts.average_points_earned,
            name: 1st Grade}, {axisId: student_facts.average_points_earned, id: 2nd
              Grade - 2 - student_facts.average_points_earned, name: 2nd Grade}, {
            axisId: student_facts.average_points_earned, id: 3rd Grade - 3 - student_facts.average_points_earned,
            name: 3rd Grade}, {axisId: student_facts.average_points_earned, id: 4th
              Grade - 4 - student_facts.average_points_earned, name: 4th Grade}, {
            axisId: student_facts.average_points_earned, id: 5th Grade - 4 - student_facts.average_points_earned,
            name: 5th Grade}, {axisId: student_facts.average_points_earned, id: 6th
              Grade - 6 - student_facts.average_points_earned, name: 6th Grade}, {
            axisId: student_facts.average_points_earned, id: 7th Grade - 7 - student_facts.average_points_earned,
            name: 7th Grade}, {axisId: student_facts.average_points_earned, id: 8th
              Grade - 8 - student_facts.average_points_earned, name: 8th Grade}, {
            axisId: student_facts.average_points_earned, id: 9th Grade - 9 - student_facts.average_points_earned,
            name: 9th Grade}, {axisId: student_facts.average_points_earned, id: 10th
              Grade - 10 - student_facts.average_points_earned, name: 10th Grade},
          {axisId: student_facts.average_points_earned, id: 11th Grade - 11 - student_facts.average_points_earned,
            name: 11th Grade}, {axisId: student_facts.average_points_earned, id: 12th
              Grade - 12 - student_facts.average_points_earned, name: 12th Grade}],
        showLabels: false, showValues: true, maxValue: 0.8, minValue: 0.7, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    size_by_field: students.count
    hidden_series: [4th Grade - 4 - student_facts.average_points_earned]
    series_types: {}
    defaults_version: 1
    listen:
      District: schools.school_district
    row: 14
    col: 9
    width: 15
    height: 12
  - title: Students Missing Assignments
    name: Students Missing Assignments
    model: student_success
    explore: courses
    type: looker_column
    fields: [schools.school_name, students.count, student_facts.missing_more_than_half]
    filters:
      student_facts.average_grade_tier: "-Undefined"
    sorts: [students.count desc]
    limit: 500
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: students.count, id: students.count,
            name: Number of Students}], showLabels: false, showValues: true, minValue: !!null '',
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear},
      {label: !!null '', orientation: right, series: [{axisId: student_facts.missing_more_than_half,
            id: student_facts.missing_more_than_half, name: Missing More Than Half}],
        showLabels: false, showValues: true, minValue: 0, unpinAxis: true, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    hidden_series: [TXX Undefined - students.count]
    series_types:
      student_facts.missing_more_than_half: line
    series_colors:
      Below 25 - 0 - students.count: "#34A853"
      25 to 49 - 1 - students.count: "#FBBC04"
      50 to 74 - 2 - students.count: "#EA8600"
      75 or Above - 3 - students.count: "#EA4335"
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
    defaults_version: 1
    listen:
      District: schools.school_district
    row: 10
    col: 0
    width: 9
    height: 8
  - title: Elementary Average
    name: Elementary Average
    model: student_success
    explore: courses
    type: marketplace_viz_radial_gauge::radial_gauge-marketplace
    fields: [coursework_submissions.average_grade_percent]
    filters:
      schools.grades: K-4
    limit: 500
    column_limit: 50
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    arm_length: 9
    arm_weight: 48
    spinner_length: 153
    spinner_weight: 25
    target_length: 10
    target_gap: 10
    target_weight: 25
    range_min: 0
    range_max: 1
    value_label_type: both
    value_label_font: 10
    value_label_override: Elementary Average
    value_label_padding: 45
    target_source: 'off'
    target_label_type: both
    target_label_font: 3
    label_font_size: 3
    fill_color: "#4285F4"
    background_color: "#E8EAED"
    spinner_color: "#5F6368"
    range_color: "#5F6368"
    gauge_fill_type: progress
    fill_colors: ["#7FCDAE", "#ffed6f", "#EE7772"]
    angle: 90
    cutout: 30
    range_x: 1
    range_y: 1
    target_label_padding: 1.06
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
    defaults_version: 0
    series_types: {}
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
    title_hidden: true
    listen:
      District: schools.school_district
    row: 10
    col: 9
    width: 5
    height: 4
  - title: Middle School Average
    name: Middle School Average
    model: student_success
    explore: courses
    type: marketplace_viz_radial_gauge::radial_gauge-marketplace
    fields: [coursework_submissions.average_grade_percent]
    filters:
      schools.grades: 5-8
    limit: 500
    column_limit: 50
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    arm_length: 9
    arm_weight: 48
    spinner_length: 153
    spinner_weight: 25
    target_length: 10
    target_gap: 10
    target_weight: 25
    range_min: 0
    range_max: 1
    value_label_type: both
    value_label_font: 10
    value_label_override: Middle Average
    value_label_padding: 45
    target_source: 'off'
    target_label_type: both
    target_label_font: 3
    label_font_size: 3
    fill_color: "#4285F4"
    background_color: "#E8EAED"
    spinner_color: "#5F6368"
    range_color: "#5F6368"
    gauge_fill_type: progress
    fill_colors: ["#7FCDAE", "#ffed6f", "#EE7772"]
    angle: 90
    cutout: 30
    range_x: 1
    range_y: 1
    target_label_padding: 1.06
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
    defaults_version: 0
    series_types: {}
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
    title_hidden: true
    listen:
      District: schools.school_district
    row: 10
    col: 14
    width: 5
    height: 4
  - title: HighSchool Average
    name: HighSchool Average
    model: student_success
    explore: courses
    type: marketplace_viz_radial_gauge::radial_gauge-marketplace
    fields: [coursework_submissions.average_grade_percent]
    filters:
      schools.grades: 9-12
    limit: 500
    column_limit: 50
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    arm_length: 9
    arm_weight: 48
    spinner_length: 153
    spinner_weight: 25
    target_length: 10
    target_gap: 10
    target_weight: 25
    range_min: 0
    range_max: 1
    value_label_type: both
    value_label_font: 10
    value_label_override: High School Average
    value_label_padding: 45
    target_source: 'off'
    target_label_type: both
    target_label_font: 3
    label_font_size: 3
    fill_color: "#4285F4"
    background_color: "#E8EAED"
    spinner_color: "#5F6368"
    range_color: "#5F6368"
    gauge_fill_type: progress
    fill_colors: ["#7FCDAE", "#ffed6f", "#EE7772"]
    angle: 90
    cutout: 30
    range_x: 1
    range_y: 1
    target_label_padding: 1.06
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
    defaults_version: 0
    series_types: {}
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
    title_hidden: true
    listen:
      District: schools.school_district
    row: 10
    col: 19
    width: 5
    height: 4
  - title: Average Daily Chrome Usage
    name: Average Daily Chrome Usage
    model: student_success
    explore: chrome_usage
    type: single_value
    fields: [chrome_usage.average_daily_duration, usage_goal]
    filters:
      chrome_usage.usage_day_of_week: "-Sunday,-Saturday"
      students.user_id: "-NULL"
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
    note_state: collapsed
    note_display: hover
    note_text: Average Daily Usage in Minutes for Students
    listen:
      District: schools.school_district
    row: 3
    col: 12
    width: 6
    height: 4
  - title: Daily Usage vs Grade
    name: Daily Usage vs Grade
    model: student_success
    explore: courses
    type: looker_scatter
    fields: [students.user_id, coursework_submissions.percent_points_earned, student_chrome_facts.average_daily_duration]
    filters:
      student_chrome_facts.total_duration: NOT NULL
    sorts: [coursework_submissions.percent_points_earned desc]
    limit: 5000
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: false
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
    point_style: circle_outline
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    y_axes: [{label: '', orientation: left, series: [{axisId: coursework_submissions.percent_points_earned,
            id: coursework_submissions.percent_points_earned, name: Percent Points
              Earned}], showLabels: true, showValues: true, minValue: !!null '', unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    size_by_field: ''
    series_types: {}
    hidden_fields: [students.user_id]
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
    defaults_version: 1
    listen:
      District: schools.school_district
    row: 30
    col: 0
    width: 10
    height: 8
  - title: Average Chromebook Usage by Grade
    name: Average Chromebook Usage by Grade
    model: student_success
    explore: chrome_usage
    type: looker_column
    fields: [chrome_usage.average_daily_duration, student_metadata.grade, chrome_usage.school_name]
    pivots: [chrome_usage.school_name]
    filters:
      chrome_usage.usage_day_of_week: "-Sunday,-Saturday"
      students.user_id: "-NULL"
      chrome_usage.school_name: "-NULL"
    sorts: [student_metadata.grade, chrome_usage.school_name]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
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
    y_axes: [{label: '', orientation: bottom, series: [{axisId: chrome_usage.average_daily_duration,
            id: chrome_usage.average_daily_duration, name: Average Daily Duration}],
        showLabels: false, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    hidden_series: [students.count]
    series_types: {}
    defaults_version: 1
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    listen:
      District: schools.school_district
    row: 30
    col: 10
    width: 14
    height: 8
  - title: Meet Attendance Rate
    name: Meet Attendance Rate
    model: student_success
    explore: courses
    type: single_value
    fields: [schools.is_district, student_attendance_facts.total_attendance_rate]
    fill_fields: [schools.is_district]
    filters: {}
    sorts: [schools.is_district desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: difference, label: Difference, expression: "${student_attendance_facts.total_attendance_rate}-offset(${student_attendance_facts.total_attendance_rate},1)",
        value_format: !!null '', value_format_name: percent_1, _kind_hint: measure,
        _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Higher Than Other Districts in State
    conditional_formatting: [{type: greater than, value: !!null '', background_color: "#4285F4",
        font_color: !!null '', color_application: {collection_id: google, palette_id: google-sequential-0},
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
    hidden_fields: [schools.is_district]
    note_state: collapsed
    note_display: hover
    note_text: The average percent of points earned for all courseworks across the
      district
    listen:
      District: schools.district_comparitor
    row: 3
    col: 6
    width: 6
    height: 4
  - title: Attendance Rates
    name: Attendance Rates
    model: student_success
    explore: courses
    type: looker_column
    fields: [student_attendance_facts.attendance_rate_tier, students.count, coursework_submissions.average_grade_percent]
    filters:
      student_attendance_facts.attendance_rate_tier: "-Undefined"
    sorts: [student_attendance_facts.attendance_rate_tier]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: false
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
    point_style: circle_outline
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: students.count, id: students.count,
            name: Number of Students}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}, {label: !!null '',
        orientation: right, series: [{axisId: coursework_submissions.average_grade_percent,
            id: coursework_submissions.average_grade_percent, name: Average Grade
              Percent}], showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    series_types:
      coursework_submissions.average_grade_percent: line
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    show_null_points: true
    interpolation: linear
    listen:
      District: schools.school_district
    row: 38
    col: 0
    width: 10
    height: 9
  - title: Meet Participation
    name: Meet Participation
    model: student_success
    explore: courses
    type: looker_donut_multiples
    fields: [schools.school_name, students.count, student_meet_facts.meet_participation_tier]
    pivots: [student_meet_facts.meet_participation_tier]
    filters:
      student_meet_facts.meet_participation_tier: "-Undefined"
    sorts: [student_meet_facts.meet_participation_tier 0, students.count desc 0]
    limit: 500
    query_timezone: America/Los_Angeles
    show_value_labels: false
    font_size: 12
    charts_across: 4
    series_colors:
      0 to 4 - 1 - students.count: "#EA4335"
      25 to 49 - 4 - students.count: "#FBBC04"
      50 or Above - 5 - students.count: "#34A853"
    series_labels: {}
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
    stacking: percent
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
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
    defaults_version: 1
    hidden_fields: []
    hidden_points_if_no: []
    listen:
      District: schools.school_district
    row: 38
    col: 10
    width: 14
    height: 8
  - title: At Risk Students
    name: At Risk Students
    model: student_success
    explore: predicted_performance_applied
    type: single_value
    fields: [predicted_performance_applied.percent_of_students_at_risk]
    filters: {}
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
    listen:
      District: schools.school_district
    row: 3
    col: 18
    width: 6
    height: 4
  filters:
  - name: District
    title: District
    type: field_filter
    default_value: Jimenezshire
    allow_multiple_values: true
    required: false
    model: student_success
    explore: courses
    listens_to_filters: []
    field: schools.school_district
