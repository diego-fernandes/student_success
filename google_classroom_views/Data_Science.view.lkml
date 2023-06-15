

# If necessary, uncomment the line below to include explore_source.
# include: "student_success.model.lkml"

view: data_science_inputs {
  derived_table: {
    datagroup_trigger: once_weekly
    explore_source: courses {
      column: name {}
      column: section {}
      column: student_user_id { field: students.user_id }
      column: teacher_user_id { field: teachers.user_id }
      column: id {}
      column: percent_points_earned { field: coursework_submissions.percent_points_earned }
      column: total_points_earned { field: coursework_submissions.total_points_earned }
      column: count { field: coursework_submissions.count }
      column: total_attended { field: student_attendance_facts.total_attended }
      column: average_days_to_submit { field: coursework_submissions.average_days_to_submit }
      column: total_attendance_rate { field: student_attendance_facts.total_attendance_rate }
    }
    }

  dimension: name {}
  dimension: section {}
  dimension: teacher_user_id {}
  dimension: student_user_id {}
  dimension: id {
    label: "Course ID"
  }
  dimension: percent_points_earned {
    value_format_name: percent_2
    type: number
  }
  dimension: total_points_earned {
    type: number
  }
  dimension: count {
    label: "Coursework Submissions Number of Submissions"
    type: number
  }
  dimension: total_attended {
    label: "Students Total Attended"
    type: number
  }
  dimension: average_days_to_submit {
    type: number
  }
  dimension: total_attendance_rate {
    label: "Students Total Attendance Rate"
    value_format: "#,##0.0%"
    type: number
  }

}


view: predicted_performance {
  derived_table: {
    datagroup_trigger: once_weekly
    sql_create:
    CREATE OR REPLACE MODEL ${SQL_TABLE_NAME}
    OPTIONS(
      model_type='kmeans',
      num_clusters=4
    ) AS
    SELECT
      * EXCEPT(name, section, teacher_user_id)
    FROM
      ${data_science_inputs.SQL_TABLE_NAME}
    ;;

    }
  }

######################## TRAINING INFORMATION #############################

view: predicted_performance_evaluation {
  derived_table: {
    sql: SELECT * FROM ml.EVALUATE(
          MODEL ${predicted_performance.SQL_TABLE_NAME},
          (SELECT * FROM ${data_science_inputs.SQL_TABLE_NAME})) ;;
  }
  dimension: davies_bouldin_index {
    type: number
    value_format_name: decimal_3}
  dimension: mean_squared_distance {
    type: number
    value_format_name: decimal_3}
}

view: predicted_performance_training {
  derived_table: {
    sql: SELECT  * FROM ml.TRAINING_INFO(MODEL ${predicted_performance.SQL_TABLE_NAME});;
  }
  dimension: training_run {type: number}
  dimension: iteration {type: number}
  dimension: loss {
    type: number
    value_format_name: decimal_3}

  dimension: eval_loss {type: number}
  dimension: duration_ms {label:"Duration (ms)" type: number}
  dimension: learning_rate {type: number}
  measure: iterations {type:count}
  measure: total_loss {
    type: sum
    value_format_name: decimal_3
    sql: ${loss} ;;
  }
  measure: total_training_time {
    type: sum
    label:"Total Training Time (sec)"
    sql: ${duration_ms}/1000 ;;
    value_format_name: decimal_1
  }
  measure: average_iteration_time {
    type: average
    label:"Average Iteration Time (sec)"
    sql: ${duration_ms}/1000 ;;
    value_format_name: decimal_1
  }
  set: detail {fields: [training_run,iteration,loss,eval_loss,duration_ms,learning_rate]}
}

######################## TRAINING INFORMATION #############################

view: predicted_performance_applied {
  derived_table: {
    sql:
          SELECT
  * EXCEPT(nearest_centroids_distance)
FROM
  ML.PREDICT(MODEL ${predicted_performance.SQL_TABLE_NAME},
  (
    SELECT
      *
    FROM
      ${data_science_inputs.SQL_TABLE_NAME}));;
  }

  dimension: centroid_id {
    type: number
    sql: ${TABLE}.centroid_id ;;
  }

  dimension: predicted_grade {
    type: string
    sql: CASE WHEN ${centroid_id} = 1 THEN "At Risk"
              WHEN ${centroid_id} = 2 THEN "B Students"
              WHEN ${centroid_id} = 3 THEN "B+/A- Students"
              WHEN ${centroid_id} = 4 THEN "A/A+ Students" END;;
    order_by_field: centroid_id
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}.student_user_id ;;
  }

  dimension: teacher_id {
    type: string
    sql: ${TABLE}.teacher_user_Id ;;
  }

  dimension: avg_meet_duration {
    hidden: yes
    type: number
    sql: ${TABLE}.avgMeetDuration ;;
  }

  dimension: course_grade {
    hidden: yes
    type: number
    value_format_name: percent_3
    sql: ${TABLE}.courseGrade ;;
  }

  dimension: course_id {
    hidden: yes
    type: string
    sql: ${TABLE}.courseId ;;
  }

  dimension: name {
    hidden: yes
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: num_assignments_turned_in {
    hidden: yes
    type: number
    sql: ${TABLE}.numAssignmentsTurnedIn ;;
  }

  dimension: num_meets {
    hidden: yes
    type: number
    sql: ${TABLE}.numMeets ;;
  }

  dimension: percent_assignments_late {
    hidden: yes
    type: number
    sql: ${TABLE}.percentAssignmentsLate ;;
  }

  dimension: percent_assignments_turned_in {
    hidden: yes
    type: number
    sql: ${TABLE}.percentAssignmentsTurnedIn ;;
  }

  dimension: section {
    hidden: yes
    type: string
    sql: ${TABLE}.section ;;
  }

  dimension: total_assignments {
    hidden: yes
    type: number
    sql: ${TABLE}.totalAssignments ;;
  }

  dimension: total_points {
    hidden: yes
    type: number
    sql: ${TABLE}.totalPoints ;;
  }

  dimension: total_possible_points {
    hidden: yes
    type: number
    sql: ${TABLE}.totalPossiblePoints ;;
  }

  measure: count {
    type: count
  }

  measure: sum_of_predicted_at_risk {
    drill_fields: [schools.school_district, schools.school_name, count]
    type: sum
    sql: CASE WHEN ${predicted_grade} = "At Risk" THEN 1
      ELSE 0 END;;
    link: {
      label: "District and School Breakdown"
      url: "/explore/edu_bqml_demo/predicted_performance_applied?fields=predicted_performance_applied.sum_of_predicted_failing,predicted_performance_applied.percent_of_students_failing,schools.school_district,schools.school_name&f[schools.school_district]={{ _filters['schools.school_district'] | url_encode }}&f[schools.school_name]=&sorts=predicted_performance_applied.sum_of_predicted_failing+desc&limit=500&column_limit=50&vis=%7B%22show_view_names%22%3Afalse%2C%22show_row_numbers%22%3Atrue%2C%22transpose%22%3Afalse%2C%22truncate_text%22%3Atrue%2C%22hide_totals%22%3Afalse%2C%22hide_row_totals%22%3Afalse%2C%22size_to_fit%22%3Atrue%2C%22table_theme%22%3A%22white%22%2C%22limit_displayed_rows%22%3Afalse%2C%22enable_conditional_formatting%22%3Afalse%2C%22header_text_alignment%22%3A%22left%22%2C%22header_font_size%22%3A12%2C%22rows_font_size%22%3A12%2C%22conditional_formatting_include_totals%22%3Afalse%2C%22conditional_formatting_include_nulls%22%3Afalse%2C%22custom_color_enabled%22%3Atrue%2C%22show_single_value_title%22%3Atrue%2C%22show_comparison%22%3Atrue%2C%22comparison_type%22%3A%22value%22%2C%22comparison_reverse_colors%22%3Afalse%2C%22show_comparison_label%22%3Atrue%2C%22custom_color%22%3A%22%23EA4335%22%2C%22single_value_title%22%3A%22Students+Predicted+to+Fail%22%2C%22comparison_label%22%3A%22Percent+Predicted+to+Fail%22%2C%22series_types%22%3A%7B%7D%2C%22type%22%3A%22looker_grid%22%2C%22defaults_version%22%3A1%7D&filter_config=%7B%22schools.school_district%22%3A%5B%7B%22type%22%3A%22%3D%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22%22%7D%2C%7B%7D%5D%2C%22id%22%3A2%2C%22error%22%3Afalse%7D%5D%2C%22schools.school_name%22%3A%5B%7B%22type%22%3A%22%3D%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22%22%7D%2C%7B%7D%5D%2C%22id%22%3A3%2C%22error%22%3Afalse%7D%5D%7D&origin=share-expanded"
      icon_url: "https://looker.com/assets/img/images/logos/looker_grey.svg"
    }
  }

  measure: total_students {
    hidden: yes
    type: count
    sql: ${predicted_grade} ;;
  }

  measure: percent_of_students_at_risk {
    type: number
    value_format_name: percent_1
    sql: ${sum_of_predicted_at_risk}/nullif(${total_students},0) ;;
    link: {
      label: "District Breakdown"
      url: "/explore/student_success/predicted_performance_applied?fields=schools.school_district,predicted_performance_applied.percent_of_students_at_risk,predicted_performance_applied.sum_of_predicted_at_risk&sorts=predicted_performance_applied.percent_of_students_at_risk+desc&limit=500&query_timezone=America%2FLos_Angeles&vis=%7B%7D&filter_config=%7B%7D&origin=share-expanded"
      icon_url: "https://looker.com/assets/img/images/logos/looker_grey.svg"
    }
    link: {
      label: "School Breakdown"
      url: "/explore/student_success/predicted_performance_applied?fields=schools.school_district,schools.school_name,predicted_performance_applied.percent_of_students_at_risk,predicted_performance_applied.sum_of_predicted_at_risk&f[schools.school_district]={{ _filters['schools.school_district'] | url_encode }}&sorts=predicted_performance_applied.percent_of_students_at_risk+desc&limit=500&query_timezone=America%2FLos_Angeles&vis=%7B%7D&filter_config=%7B%22schools.school_district%22%3A%5B%7B%22type%22%3A%22%3D%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22%22%7D%2C%7B%7D%5D%2C%22id%22%3A0%7D%5D%7D&origin=share-expanded"
      icon_url: "https://looker.com/assets/img/images/logos/looker_grey.svg"
    }
    link: {
      label: "Teacher Breakdown"
      url: "/explore/student_success/predicted_performance_applied?fields=predicted_performance_applied.percent_of_students_at_risk,predicted_performance_applied.sum_of_predicted_at_risk,teacher_profiles.name&f[schools.school_district]={{ _filters['schools.school_district'] | url_encode }}&f[schools.school_name]={{ _filters['schools.school_name'] | url_encode }}&sorts=predicted_performance_applied.percent_of_students_at_risk+desc&limit=500&query_timezone=America%2FLos_Angeles&vis=%7B%7D&filter_config=%7B%22schools.school_district%22%3A%5B%7B%22type%22%3A%22%3D%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22%22%7D%2C%7B%7D%5D%2C%22id%22%3A0%7D%5D%2C%22schools.school_name%22%3A%5B%7B%22type%22%3A%22%3D%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22%22%7D%2C%7B%7D%5D%2C%22id%22%3A2%7D%5D%7D&origin=share-expanded"
      icon_url: "https://looker.com/assets/img/images/logos/looker_grey.svg"
    }
    link: {
      label: "Data Science Overview Dashboard"
      url: "/dashboards/782"
      icon_url: "https://looker.com/assets/img/images/logos/looker_grey.svg"
    }
  }
  }
