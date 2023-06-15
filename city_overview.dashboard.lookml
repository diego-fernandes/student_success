- dashboard: city_overview
  title: City Overview
  layout: newspaper
  preferred_viewer: dashboards
  elements:
  - title: Students by Grade Tier
    name: Students by Grade Tier
    model: student_success
    explore: courses
    type: looker_bar
    fields: [students.count, student_facts.average_grade_tier, schools.school_district]
    pivots: [student_facts.average_grade_tier]
    filters:
      student_facts.average_grade_tier: "-Undefined"
    sorts: [students.count desc 0, student_facts.average_grade_tier 0]
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
    listen: {}
    row: 35
    col: 12
    width: 12
    height: 7
  - name: KPIs
    type: text
    title_text: KPIs
    subtitle_text: How are we tracking towards goals?
    row: 0
    col: 0
    width: 24
    height: 3
  - name: GPA + Participation Trends
    type: text
    title_text: GPA + Participation Trends
    subtitle_text: How is chromebook usage and meet participation related to GPA?
    row: 7
    col: 0
    width: 24
    height: 3
  - name: District & School Overview
    type: text
    title_text: District & School Overview
    subtitle_text: Where do we need to focus attention?
    row: 31
    col: 0
    width: 24
    height: 4
  - title: Average Grade - in Classroom
    name: Average Grade - in Classroom
    model: student_success
    explore: courses
    type: single_value
    fields: [coursework_submissions.average_grade_percent]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: goal, label: Goal, expression: 85/100, value_format: !!null '',
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
    comparison_label: 85% Goal
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
    hidden_fields: []
    note_state: collapsed
    note_display: hover
    note_text: Weighted average of all graded assignments in Classroom
    listen: {}
    row: 3
    col: 0
    width: 6
    height: 4
  - title: Elementary School Utilization vs Grade in Classroom
    name: Elementary School Utilization vs Grade in Classroom
    model: student_success
    explore: courses
    type: looker_scatter
    fields: [student_facts.average_points_earned, student_chrome_facts.average_daily_duration,
      student_metadata.grade]
    pivots: [student_metadata.grade]
    filters:
      schools.grades: K-4
    sorts: [student_chrome_facts.average_daily_duration desc, student_metadata.grade]
    limit: 5000
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
              Grade - 4 - student_facts.average_points_earned, name: 4th Grade}],
        showLabels: false, showValues: true, maxValue: !!null '', minValue: !!null '',
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    size_by_field: ''
    hidden_series: [11th Grade - 11 - student_facts.average_points_earned, 12th Grade
        - 12 - student_facts.average_points_earned, 5th Grade - 4 - student_facts.average_points_earned,
      7th Grade - 7 - student_facts.average_points_earned, 9th Grade - 9 - student_facts.average_points_earned]
    series_types: {}
    trend_lines: []
    defaults_version: 1
    hidden_fields: []
    listen: {}
    row: 10
    col: 10
    width: 14
    height: 7
  - title: Students Missing Assignments
    name: Students Missing Assignments
    model: student_success
    explore: courses
    type: looker_column
    fields: [students.count, student_facts.missing_more_than_half, schools.school_district]
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
    listen: {}
    row: 35
    col: 0
    width: 12
    height: 7
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
    comparison_label: 120 min Daily Usage Goal
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
    listen: {}
    row: 3
    col: 12
    width: 6
    height: 4
  - title: Average Chromebook Usage by Grade
    name: Average Chromebook Usage by Grade
    model: student_success
    explore: chrome_usage
    type: looker_column
    fields: [chrome_usage.average_daily_duration, student_metadata.grade, schools.school_district]
    pivots: [schools.school_district]
    filters:
      chrome_usage.usage_day_of_week: "-Sunday,-Saturday"
      students.user_id: "-NULL"
      chrome_usage.school_name: "-NULL"
    sorts: [student_metadata.grade]
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
    listen: {}
    row: 42
    col: 12
    width: 12
    height: 7
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
    hidden_fields: []
    note_state: collapsed
    note_display: hover
    note_text: The average percent of points earned for all courseworks across the
      district
    listen: {}
    row: 3
    col: 6
    width: 6
    height: 4
  - title: At Risk Students
    name: At Risk Students
    model: student_success
    explore: courses
    type: single_value
    fields: [student_facts.percent_student_at_risk, student_facts.average_student_health_score]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#EA4335"
    conditional_formatting: [{type: equal to, value: !!null '', background_color: "#4285F4",
        font_color: !!null '', color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    listen: {}
    row: 3
    col: 18
    width: 6
    height: 4
  - title: Attendance Rates vs Grade in Classroom
    name: Attendance Rates vs Grade in Classroom
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
    listen: {}
    row: 10
    col: 0
    width: 10
    height: 11
  - title: Meet Participation
    name: Meet Participation
    model: student_success
    explore: courses
    type: looker_donut_multiples
    fields: [students.count, student_meet_facts.meet_participation_tier, schools.school_district]
    pivots: [student_meet_facts.meet_participation_tier]
    filters:
      schools.school_district: ''
      student_meet_facts.meet_participation_tier: "-Undefined"
    sorts: [student_meet_facts.meet_participation_tier 0, students.count desc 0]
    limit: 500
    query_timezone: America/Los_Angeles
    show_value_labels: false
    font_size: 12
    charts_across: 5
    series_colors:
      0 to 4 - 1 - students.count: "#EA4335"
      25 to 49 - 4 - students.count: "#FBBC04"
      50 or Above - 5 - students.count: "#34A853"
      10 to 24 - 3 - students.count: "#EA8600"
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
    listen: {}
    row: 42
    col: 0
    width: 12
    height: 7
  - title: Participation Tier by Average Grade in Classroom
    name: Participation Tier by Average Grade in Classroom
    model: student_success
    explore: courses
    type: looker_column
    fields: [student_meet_facts.meet_participation_tier, students.count, student_facts.average_points_earned]
    filters:
      student_meet_facts.meet_participation_tier: "-Undefined"
    sorts: [student_meet_facts.meet_participation_tier]
    limit: 500
    query_timezone: America/Los_Angeles
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
            name: Number of Students}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}, {label: !!null '',
        orientation: right, series: [{axisId: student_facts.average_points_earned,
            id: student_facts.average_points_earned, name: Average Points Earned}],
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    size_by_field: student_facts.average_points_earned
    series_types:
      student_facts.average_points_earned: scatter
    series_colors:
      students.count: "#BDC1C6"
      student_facts.average_points_earned: "#34A853"
    defaults_version: 1
    show_null_points: true
    interpolation: linear
    listen: {}
    row: 21
    col: 0
    width: 10
    height: 10
  - title: Middle School Utilization vs Grade in Classroom
    name: Middle School Utilization vs Grade in Classroom
    model: student_success
    explore: courses
    type: looker_scatter
    fields: [student_facts.average_points_earned, student_chrome_facts.average_daily_duration,
      student_metadata.grade]
    pivots: [student_metadata.grade]
    filters:
      schools.grades: 5-8
    sorts: [student_chrome_facts.average_daily_duration desc, student_metadata.grade]
    limit: 5000
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
            id: 5th Grade - 4 - student_facts.average_points_earned, name: 5th Grade},
          {axisId: student_facts.average_points_earned, id: 6th Grade - 6 - student_facts.average_points_earned,
            name: 6th Grade}, {axisId: student_facts.average_points_earned, id: 7th
              Grade - 7 - student_facts.average_points_earned, name: 7th Grade}, {
            axisId: student_facts.average_points_earned, id: 8th Grade - 8 - student_facts.average_points_earned,
            name: 8th Grade}], showLabels: false, showValues: true, maxValue: !!null '',
        minValue: !!null '', unpinAxis: false, tickDensity: custom, tickDensityCustom: 5,
        type: linear}]
    size_by_field: ''
    hidden_series: [4th Grade - 4 - student_facts.average_points_earned, 11th Grade
        - 11 - student_facts.average_points_earned, 12th Grade - 12 - student_facts.average_points_earned,
      2nd Grade - 2 - student_facts.average_points_earned, 1st Grade - 1 - student_facts.average_points_earned,
      3rd Grade - 3 - student_facts.average_points_earned, 9th Grade - 9 - student_facts.average_points_earned,
      Kindergarten - 0 - student_facts.average_points_earned]
    series_types: {}
    trend_lines: []
    defaults_version: 1
    listen: {}
    row: 17
    col: 10
    width: 14
    height: 7
  - title: High School Utilization vs Grade in Classroom
    name: High School Utilization vs Grade in Classroom
    model: student_success
    explore: courses
    type: looker_scatter
    fields: [student_facts.average_points_earned, student_chrome_facts.average_daily_duration,
      student_metadata.grade]
    pivots: [student_metadata.grade]
    filters:
      schools.grades: 9-12
    sorts: [student_chrome_facts.average_daily_duration desc, student_metadata.grade]
    limit: 5000
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
            id: 9th Grade - 9 - student_facts.average_points_earned, name: 9th Grade},
          {axisId: student_facts.average_points_earned, id: 10th Grade - 10 - student_facts.average_points_earned,
            name: 10th Grade}, {axisId: student_facts.average_points_earned, id: 11th
              Grade - 11 - student_facts.average_points_earned, name: 11th Grade},
          {axisId: student_facts.average_points_earned, id: 12th Grade - 12 - student_facts.average_points_earned,
            name: 12th Grade}], showLabels: false, showValues: true, maxValue: !!null '',
        minValue: !!null '', unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    size_by_field: ''
    hidden_series: [4th Grade - 4 - student_facts.average_points_earned, 2nd Grade
        - 2 - student_facts.average_points_earned, 1st Grade - 1 - student_facts.average_points_earned,
      3rd Grade - 3 - student_facts.average_points_earned, 5th Grade - 4 - student_facts.average_points_earned,
      7th Grade - 7 - student_facts.average_points_earned, Kindergarten - 0 - student_facts.average_points_earned]
    series_types: {}
    reference_lines: []
    trend_lines: []
    defaults_version: 1
    listen: {}
    row: 24
    col: 10
    width: 14
    height: 7
