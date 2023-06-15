# If necessary, uncomment the line below to include explore_source.
# include: "student_success.model.lkml"

view: student_facts {
  drill_fields: [student_profiles.name,student_metadata.average_points_earned, student_profiles.email_address,
    guardian_profiles.email_address, student_health_score,student_attendance_facts.percent_attended,
    student_chrome_facts.average_daily_duration
  ]
  view_label: "Students"
  derived_table: {
    datagroup_trigger: classroom_trigger
    explore_source: courses {
      column: user_id { field: students.user_id }
      column: count_courseworks { field: coursework.count }
      column: count_submissions { field: coursework_submissions.count }
      column: number_late_submissions { field: coursework_submissions.number_late_submissions }
      column: min_grade_percent { field: coursework_submissions.min_grade_percent }
      column: max_grade_percent { field: coursework_submissions.max_grade_percent }
      column: median_grade_percent { field: coursework_submissions.median_grade_percent }
      column: average_grade_percent { field: coursework_submissions.average_grade_percent }
      column: percent_missing { field: coursework.percent_missing }
      column: percent_points_earned { field: coursework_submissions.percent_points_earned}
      column: percent_submissions_late { field: coursework_submissions.percent_submissions_late }
      filters: {
        field: students.user_id
        value: "-NULL"
      }
    }
  }

  dimension: user_id {
    primary_key: yes
    hidden: yes
    label: "Students Student ID"
  }

  dimension: count_courseworks {
    hidden: yes
    label: "Number of Courseworks"
    type: number
  }

  dimension: count_submissions {
    hidden: yes
    label: "Number of Submissions"
    type: number
  }

  dimension: number_late_submissions {
    hidden: yes
    type: number
  }

  dimension: min_grade_percent {
    group_label: "Grades"
    value_format: "#,##0.00%"
    type: number
  }

  dimension: max_grade_percent {
    group_label: "Grades"
    value_format: "#,##0.00%"
    type: number
  }

  dimension: median_grade_percent {
    group_label: "Grades"
    value_format: "#,##0.00%"
    type: number
  }

  dimension: average_grade_percent {
    group_label: "Grades"
    value_format: "#,##0.00%"
    type: number
  }

  dimension: percent_submitted {
    group_label: "Submissions"
    description: "Percent of assignments that were submitted"
    value_format: "#,##0.00%"
    type: number
  }

  dimension: percent_missing{
    group_label: "Submissions"
    description: "Percent of coursework that has not been completed"
    value_format: "#,##0.00%"
    type: number
  }

  dimension: percent_points_earned {
    type: number
  }

  dimension: average_grade_tier {
#     group_label: "Tiers"
    type: tier
    sql: ${percent_points_earned}*100 ;;
    tiers: [60,70,80,90]
    style: integer
  }

  dimension: missing_submissions_tier {
    group_label: "Submissions"
    type: tier
    sql: ${percent_missing}*100 ;;
    tiers: [25,50,75]
    style: integer
  }

#   dimension: student_healthscore_tier {
#     group_label: "Health Score"
#     type: tier
# #     sql: ${percent_missing}*100 ;;
# #     tiers: [25,50,75]
#     style: integer
#   }

  dimension: is_missing_all {
    group_label: "Submissions"
    type: yesno
    sql: ${percent_missing}>.5;;
  }

  dimension: student_health_score {
    group_label: "Health Score"
    type: number
    value_format_name: decimal_2
    description: "Health score to flag at risk students, combination of grade, attendance rate and time on chromebook"
    sql: (coalesce(${average_grade_percent},0)+
          coalesce(${student_attendance_facts.percent_attended},0)+(
        coalesce( ${student_chrome_facts.average_daily_duration},0)/120))/3 ;;
  }

  measure: average_points_earned {
    type: average
    sql: ${percent_points_earned} ;;
    value_format_name: percent_2
  }

  measure: missing_more_than_half {
    type: count
    filters: [
      percent_missing: ">=.5"
    ]
  }

  measure: number_students_missing_all_assignments {
    type: count
    filters: [
      is_missing_all: "yes"
    ]
  }

  measure:  average_student_health_score {
    type: average
    sql:  ${student_health_score};;
    group_label: "Health Score"
    value_format_name: decimal_2
  }

   measure: number_at_risk_students {
    group_label: "Health Score"
    description: "Students with a health score below .4"
    type: count
    filters: [
      student_health_score: "<.3"
    ]
  }

  measure:  percent_student_at_risk {
    group_label: "Health Score"
    type: number
    sql: ${number_at_risk_students}/nullif(${students.count},0) ;;
    value_format_name: percent_1
    link: {
      label: "District Breakdown"
      url: "/explore/student_success/courses?fields=student_facts.percent_student_at_risk,student_facts.average_student_health_score,student_facts.number_at_risk_students,schools.school_district&sorts=student_facts.percent_student_at_risk+desc&limit=500&column_limit=50&vis=%7B%22show_view_names%22%3Afalse%2C%22show_row_numbers%22%3Atrue%2C%22transpose%22%3Afalse%2C%22truncate_text%22%3Atrue%2C%22hide_totals%22%3Afalse%2C%22hide_row_totals%22%3Afalse%2C%22size_to_fit%22%3Atrue%2C%22table_theme%22%3A%22white%22%2C%22limit_displayed_rows%22%3Afalse%2C%22enable_conditional_formatting%22%3Atrue%2C%22header_text_alignment%22%3A%22left%22%2C%22header_font_size%22%3A12%2C%22rows_font_size%22%3A12%2C%22conditional_formatting_include_totals%22%3Afalse%2C%22conditional_formatting_include_nulls%22%3Afalse%2C%22custom_color_enabled%22%3Atrue%2C%22show_single_value_title%22%3Atrue%2C%22show_comparison%22%3Atrue%2C%22comparison_type%22%3A%22value%22%2C%22comparison_reverse_colors%22%3Afalse%2C%22show_comparison_label%22%3Atrue%2C%22custom_color%22%3A%22%23EA4335%22%2C%22conditional_formatting%22%3A%5B%7B%22type%22%3A%22equal+to%22%2C%22value%22%3Anull%2C%22background_color%22%3A%22%234285F4%22%2C%22font_color%22%3Anull%2C%22color_application%22%3A%7B%22collection_id%22%3A%22google%22%2C%22palette_id%22%3A%22google-sequential-0%22%7D%2C%22bold%22%3Afalse%2C%22italic%22%3Afalse%2C%22strikethrough%22%3Afalse%2C%22fields%22%3Anull%7D%5D%2C%22type%22%3A%22looker_grid%22%2C%22defaults_version%22%3A1%2C%22series_types%22%3A%7B%7D%2C%22column_order%22%3A%5B%22%24%24%24_row_numbers_%24%24%24%22%2C%22schools.school_district%22%2C%22student_facts.number_at_risk_students%22%2C%22student_facts.percent_student_at_risk%22%2C%22student_facts.average_student_health_score%22%5D%7D&filter_config=%7B%7D&dynamic_fields=%5B%5D&origin=share-expanded"
      icon_url: "https://looker.com/assets/img/images/logos/looker_grey.svg"
    }
    link: {
      label: "School Breakdown"
      url: "/explore/student_success/courses?fields=student_facts.percent_student_at_risk,student_facts.average_student_health_score,student_facts.number_at_risk_students,schools.school_district,schools.school_name&f[schools.school_district]={{ _filters['schools.school_district'] | url_encode }}&sorts=schools.school_name+desc&limit=500&column_limit=50&vis=%7B%22show_view_names%22%3Afalse%2C%22show_row_numbers%22%3Atrue%2C%22transpose%22%3Afalse%2C%22truncate_text%22%3Atrue%2C%22hide_totals%22%3Afalse%2C%22hide_row_totals%22%3Afalse%2C%22size_to_fit%22%3Atrue%2C%22table_theme%22%3A%22white%22%2C%22limit_displayed_rows%22%3Afalse%2C%22enable_conditional_formatting%22%3Atrue%2C%22header_text_alignment%22%3A%22left%22%2C%22header_font_size%22%3A12%2C%22rows_font_size%22%3A12%2C%22conditional_formatting_include_totals%22%3Afalse%2C%22conditional_formatting_include_nulls%22%3Afalse%2C%22custom_color_enabled%22%3Atrue%2C%22show_single_value_title%22%3Atrue%2C%22show_comparison%22%3Atrue%2C%22comparison_type%22%3A%22value%22%2C%22comparison_reverse_colors%22%3Afalse%2C%22show_comparison_label%22%3Atrue%2C%22custom_color%22%3A%22%23EA4335%22%2C%22conditional_formatting%22%3A%5B%7B%22type%22%3A%22equal+to%22%2C%22value%22%3Anull%2C%22background_color%22%3A%22%234285F4%22%2C%22font_color%22%3Anull%2C%22color_application%22%3A%7B%22collection_id%22%3A%22google%22%2C%22palette_id%22%3A%22google-sequential-0%22%7D%2C%22bold%22%3Afalse%2C%22italic%22%3Afalse%2C%22strikethrough%22%3Afalse%2C%22fields%22%3Anull%7D%5D%2C%22type%22%3A%22looker_grid%22%2C%22defaults_version%22%3A1%2C%22series_types%22%3A%7B%7D%2C%22column_order%22%3A%5B%22%24%24%24_row_numbers_%24%24%24%22%2C%22schools.school_district%22%2C%22schools.school_name%22%2C%22student_facts.number_at_risk_students%22%2C%22student_facts.percent_student_at_risk%22%2C%22student_facts.average_student_health_score%22%5D%7D&filter_config=%7B%22schools.school_district%22%3A%5B%7B%22type%22%3A%22%3D%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22%22%7D%2C%7B%7D%5D%2C%22id%22%3A1%2C%22error%22%3Afalse%7D%5D%7D&dynamic_fields=%5B%5D&origin=share-expanded"
      icon_url: "https://looker.com/assets/img/images/logos/looker_grey.svg"
    }
    link: {
      label: "Teacher Breakdown"
      url: "/explore/student_success/courses?fields=teacher_profiles.name,student_facts.percent_student_at_risk,student_facts.average_student_health_score,student_facts.number_at_risk_students&f[schools.school_name]={{ _filters['schools.school_name'] | url_encode }}&f[schools.school_district]={{ _filters['schools.school_district'] | url_encode }}&sorts=student_facts.percent_student_at_risk+desc&limit=500&column_limit=50&vis=%7B%22show_view_names%22%3Afalse%2C%22show_row_numbers%22%3Atrue%2C%22transpose%22%3Afalse%2C%22truncate_text%22%3Atrue%2C%22hide_totals%22%3Afalse%2C%22hide_row_totals%22%3Afalse%2C%22size_to_fit%22%3Atrue%2C%22table_theme%22%3A%22white%22%2C%22limit_displayed_rows%22%3Afalse%2C%22enable_conditional_formatting%22%3Atrue%2C%22header_text_alignment%22%3A%22left%22%2C%22header_font_size%22%3A12%2C%22rows_font_size%22%3A12%2C%22conditional_formatting_include_totals%22%3Afalse%2C%22conditional_formatting_include_nulls%22%3Afalse%2C%22custom_color_enabled%22%3Atrue%2C%22show_single_value_title%22%3Atrue%2C%22show_comparison%22%3Atrue%2C%22comparison_type%22%3A%22value%22%2C%22comparison_reverse_colors%22%3Afalse%2C%22show_comparison_label%22%3Atrue%2C%22custom_color%22%3A%22%23EA4335%22%2C%22conditional_formatting%22%3A%5B%7B%22type%22%3A%22equal+to%22%2C%22value%22%3Anull%2C%22background_color%22%3A%22%234285F4%22%2C%22font_color%22%3Anull%2C%22color_application%22%3A%7B%22collection_id%22%3A%22google%22%2C%22palette_id%22%3A%22google-sequential-0%22%7D%2C%22bold%22%3Afalse%2C%22italic%22%3Afalse%2C%22strikethrough%22%3Afalse%2C%22fields%22%3Anull%7D%5D%2C%22type%22%3A%22looker_grid%22%2C%22defaults_version%22%3A1%2C%22series_types%22%3A%7B%7D%2C%22column_order%22%3A%5B%22%24%24%24_row_numbers_%24%24%24%22%2C%22teacher_profiles.name%22%2C%22student_facts.number_at_risk_students%22%2C%22student_facts.percent_student_at_risk%22%2C%22student_facts.average_student_health_score%22%5D%7D&filter_config=%7B%22schools.school_name%22%3A%5B%7B%22type%22%3A%22%3D%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22%22%7D%2C%7B%7D%5D%2C%22id%22%3A1%2C%22error%22%3Afalse%7D%5D%2C%22schools.school_district%22%3A%5B%7B%22type%22%3A%22%3D%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22%22%7D%2C%7B%7D%5D%2C%22id%22%3A2%2C%22error%22%3Afalse%7D%5D%7D&dynamic_fields=%5B%5D&origin=share-expanded"
      icon_url: "https://looker.com/assets/img/images/logos/looker_grey.svg"
    }
  }

}
