- dashboard: school_overview
  title: School Overview
  layout: newspaper
  elements:
  - name: School Report
    type: text
    title_text: School Report
    row: 0
    col: 0
    width: 24
    height: 3
  - name: Teacher Deep Dive
    type: text
    title_text: Teacher Deep Dive
    row: 11
    col: 0
    width: 24
    height: 3
  - name: Student Deep Dive
    type: text
    title_text: Student Deep Dive
    row: 29
    col: 0
    width: 24
    height: 3
  - title: Student Participation Rate
    name: Student Participation Rate
    model: student_success
    explore: meet_activities
    type: single_value
    fields: [meet_events.percent_meets_with_audio]
    filters:
      students.user_id: "-NULL"
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
    series_types: {}
    defaults_version: 1
    note_state: collapsed
    note_display: below
    note_text: Students who spoke in class
    listen:
      School: schools.school_name
      District: schools.school_district
    row: 7
    col: 4
    width: 5
    height: 4
  - title: Teachers Heavily Utilizing Meet
    name: Teachers Heavily Utilizing Meet
    model: student_success
    explore: meet_activities
    type: looker_column
    fields: [teacher_profiles.name, meet_events.total_duration, meet_events.average_percent_meet_on,
      meet_events.average_percent_spoken]
    sorts: [meet_events.total_duration desc]
    limit: 20
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
    y_axes: [{label: '', orientation: left, series: [{axisId: meet_events.total_duration,
            id: meet_events.total_duration, name: Total Duration}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: !!null '', orientation: right, series: [{axisId: meet_events.average_percent_meet_on,
            id: meet_events.average_percent_meet_on, name: Average Percent Meet On},
          {axisId: meet_events.average_percent_spoken, id: meet_events.average_percent_spoken,
            name: Average Percent Spoken}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_types:
      meet_events.average_percent_spoken: line
      meet_events.average_percent_meet_on: line
    defaults_version: 1
    listen:
      School: schools.school_name
      District: schools.school_district
    row: 14
    col: 0
    width: 12
    height: 8
  - title: Number of Teachers with No Meets
    name: Number of Teachers with No Meets
    model: student_success
    explore: courses
    type: single_value
    fields: [teachers.count]
    filters:
      teacher_meet_facts.number_meets: '0'
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
    series_types: {}
    defaults_version: 1
    listen:
      School: schools.school_name
      District: schools.school_district
    row: 14
    col: 12
    width: 6
    height: 4
  - title: Teachers Working Too Much
    name: Teachers Working Too Much
    model: student_success
    explore: courses
    type: single_value
    fields: [teachers.count]
    filters:
      teacher_chrome_facts.average_daily_duration: ">200"
    sorts: [teachers.count desc]
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
    custom_color: "#FBBC04"
    series_types: {}
    defaults_version: 1
    note_state: collapsed
    note_display: below
    note_text: More than 8 hours / day on chromebook
    listen:
      School: schools.school_name
      District: schools.school_district
    row: 14
    col: 18
    width: 6
    height: 4
  - title: Assignments by Teacher
    name: Assignments by Teacher
    model: student_success
    explore: courses
    type: looker_grid
    fields: [teacher_profiles.name, announcements.count, coursework.number_assignments,
      announcement_materials.count, coursework.number_questions, coursework_materials.count]
    sorts: [announcements.count desc]
    limit: 500
    column_limit: 50
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
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_labels:
      announcements.count: Announcements
      coursework_materials.count: Course Materials
      coursework.number_assignments: Assignment Materials
      coursework.number_questions: Questions
      announcement_materials.count: Assignment Materials
    series_cell_visualizations:
      announcements.count:
        is_active: true
      coursework_materials.count:
        is_active: true
      coursework.number_assignments:
        is_active: true
      coursework.number_questions:
        is_active: true
      announcement_materials.count:
        is_active: true
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
      School: schools.school_name
      District: schools.school_district
    row: 22
    col: 0
    width: 24
    height: 7
  - title: Number of Courses
    name: Number of Courses
    model: student_success
    explore: courses
    type: single_value
    fields: [courses.count, coursework.count]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Number of Assignments
    series_types: {}
    defaults_version: 1
    listen:
      School: schools.school_name
      District: schools.school_district
    row: 3
    col: 4
    width: 5
    height: 4
  - title: Number of Students
    name: Number of Students
    model: student_success
    explore: courses
    type: single_value
    fields: [students.count, teachers.count]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Number of Teachers
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    defaults_version: 1
    series_types: {}
    listen:
      School: schools.school_name
      District: schools.school_district
    row: 3
    col: 9
    width: 5
    height: 4
  - title: Attendance Rate
    name: Attendance Rate
    model: student_success
    explore: courses
    type: single_value
    fields: [student_attendance_facts.total_attendance_rate]
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
    comparison_label: Number of Teachers
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    defaults_version: 1
    series_types: {}
    note_state: collapsed
    note_display: below
    note_text: Meets for each course that students attended
    listen:
      School: schools.school_name
      District: schools.school_district
    row: 7
    col: 9
    width: 5
    height: 4
  - title: Average Points Earned
    name: Average Points Earned
    model: student_success
    explore: courses
    type: single_value
    fields: [student_facts.average_points_earned]
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
    defaults_version: 1
    note_state: collapsed
    note_display: below
    note_text: Across all courses
    listen:
      School: schools.school_name
      District: schools.school_district
    row: 7
    col: 14
    width: 5
    height: 4
  - title: Teachers Not Working Enough
    name: Teachers Not Working Enough
    model: student_success
    explore: courses
    type: single_value
    fields: [teachers.count]
    filters:
      teacher_meet_facts.number_meets: '0'
      teacher_chrome_facts.average_daily_duration: "<=60"
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
    custom_color: "#FBBC04"
    series_types: {}
    defaults_version: 1
    note_state: collapsed
    note_display: below
    note_text: Less than 1 hour  / day on chromebook
    listen:
      School: schools.school_name
      District: schools.school_district
    row: 18
    col: 18
    width: 6
    height: 4
  - title: Harsh Graders
    name: Harsh Graders
    model: student_success
    explore: courses
    type: single_value
    fields: [teachers.count]
    filters:
      teacher_facts.average_grade_percent: "<=70"
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
    series_types: {}
    defaults_version: 1
    note_state: collapsed
    note_display: below
    note_text: Teachers with an average GPA < 65%
    listen:
      School: schools.school_name
      District: schools.school_district
    row: 18
    col: 12
    width: 6
    height: 4
  - title: At Risk Students
    name: At Risk Students
    model: student_success
    explore: courses
    type: looker_grid
    fields: [student_facts.average_student_health_score, student_facts.average_points_earned,
      student_attendance_facts.total_attendance_rate, student_profiles.name, teacher_profiles.email_address]
    filters:
      student_facts.student_health_score: "<.31"
    sorts: [student_facts.average_student_health_score]
    limit: 500
    column_limit: 50
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
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    defaults_version: 1
    series_types: {}
    listen:
      School: schools.school_name
      District: schools.school_district
    row: 36
    col: 0
    width: 11
    height: 6
  - title: Meet Participation
    name: Meet Participation
    model: student_success
    explore: meet_activities
    type: looker_area
    fields: [meet_activities.start_date, meet_events.total_duration, meet_events.number_meets_with_video,
      meet_events.number_meets_with_audio]
    filters:
      students.user_id: "-NULL"
    sorts: [meet_activities.start_date desc]
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
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: monotone
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: meet_events.total_duration,
            id: meet_events.total_duration, name: Total Duration}], showLabels: true,
        showValues: true, minValue: 5000, unpinAxis: true, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: !!null '', orientation: right, series: [{axisId: meet_events.number_meets_with_video,
            id: meet_events.number_meets_with_video, name: Number Meets with Video},
          {axisId: meet_events.number_meets_with_audio, id: meet_events.number_meets_with_audio,
            name: Number Meets with Audio}], showLabels: true, showValues: true, unpinAxis: true,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_types: {}
    defaults_version: 1
    hidden_fields:
    listen:
      School: schools.school_name
      District: schools.school_district
    row: 32
    col: 11
    width: 13
    height: 5
  - title: Chromebook Utilization
    name: Chromebook Utilization
    model: student_success
    explore: chrome_usage
    type: looker_line
    fields: [chrome_usage.total_duration, chrome_usage.usage_date]
    fill_fields: [chrome_usage.usage_date]
    filters:
      students.user_id: "-NULL"
    sorts: [chrome_usage.usage_date desc]
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
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: monotone
    y_axes: [{label: '', orientation: left, series: [{axisId: chrome_usage.total_duration,
            id: chrome_usage.total_duration, name: Total Duration}], showLabels: false,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    defaults_version: 1
    listen:
      School: schools.school_name
      District: schools.school_district
    row: 37
    col: 11
    width: 13
    height: 5
  - title: Students With 0% Attendance
    name: Students With 0% Attendance
    model: student_success
    explore: courses
    type: single_value
    fields: [students.count]
    filters:
      student_attendance_facts.has_0_attendance: 'Yes'
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
    series_types: {}
    defaults_version: 1
    listen:
      School: schools.school_name
      District: schools.school_district
    row: 32
    col: 0
    width: 5
    height: 4
  - title: Students with No Chromebook Utilization
    name: Students with No Chromebook Utilization
    model: student_success
    explore: courses
    type: single_value
    fields: [students.count]
    filters:
      student_chrome_facts.total_duration: '0'
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
    series_types: {}
    defaults_version: 1
    listen:
      School: schools.school_name
      District: schools.school_district
    row: 32
    col: 5
    width: 6
    height: 4
  - title: At Risk Students
    name: At Risk Students (2)
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
      School: schools.school_name
      District: schools.school_district
    row: 3
    col: 14
    width: 5
    height: 4
  filters:
  - name: School
    title: School
    type: field_filter
    default_value: Hanna High School
    allow_multiple_values: true
    required: false
    model: student_success
    explore: courses
    listens_to_filters: []
    field: schools.school_name
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
