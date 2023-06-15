view: coursework_submissions {
  sql_table_name: `looker-private-demo.classroom_staging.coursework_submissions`;;

  drill_fields: [id,creation_time,student_profiles.name,average_days_to_submit, average_grade_percent]

  dimension: id {
    label: "Coursework Submission ID"
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
    link: {
      label: "View Submission"
    }
  }

  dimension: alternate_link {
    hidden: yes
    label: "Submission Link"
    type: string
    sql: ${TABLE}.alternateLink ;;
  }

  dimension: assigned_grade {
    label: "Grade"
    type: number
    sql: ${TABLE}.assignedGrade ;;
  }

  dimension: assignment_submission {
    type: string
    sql: ${TABLE}.assignmentSubmission ;;
  }

  dimension: associated_with_developer {
    hidden: yes
    type: yesno
    sql: ${TABLE}.associatedWithDeveloper = 'YES' ;;
  }

  dimension: course_id {
    type: string
    hidden: yes
    sql: ${TABLE}.courseId ;;
  }

  dimension: course_work_id {
    hidden: yes
    type: string
    sql: ${TABLE}.courseWorkId ;;
  }

  dimension: course_work_type {
    hidden: yes
    type: string
    sql: ${TABLE}.courseWorkType ;;
  }

  dimension_group: creation {
    label: "Submission"
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.creationTime ;;
  }

  dimension: draft_grade {
    hidden: yes
    type: number
    sql: ${TABLE}.draftGrade ;;
  }

  dimension: late {
    type: yesno
    sql: ${TABLE}.late = "YES";;
  }

  dimension: multiple_choice_submission {
    type: string
    sql: ${TABLE}.multipleChoiceSubmission ;;
  }

  dimension: short_answer_submission {
    type: string
    sql: ${TABLE}.shortAnswerSubmission ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: submission_history {
    hidden: yes
    type: string
    sql: ${TABLE}.submissionHistory ;;
  }

  dimension_group: update {
    hidden: yes
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.updateTime ;;
  }

  dimension: user_id {
    hidden: yes
    type: string
    sql: ${TABLE}.userId ;;
  }

  dimension: normalized_grade {
    type: number
    sql: ${assigned_grade}/nullif(${coursework.max_points},0) ;;
    value_format_name: percent_2
  }

  dimension: number_days_to_submit {
    description: "The number of days from when the assignment was created to when the submission was completed"
    type: duration_day
    sql_start: ${coursework.created_raw} ;;
    sql_end: ${creation_raw} ;;
  }


  measure: number_late_submissions {
    group_label: "Missing or Late"
    filters: [
      late: "yes"
    ]
    type: count_distinct
    sql: ${id} ;;
  }


  measure: percent_submissions_late {
    description: "Percent of submissions that were late"
    type: number
    value_format_name: percent_2
    sql: ${number_late_submissions}/nullif(${count},0);;
  }

  measure: average_days_to_submit {
    type: average
    sql: ${number_days_to_submit} ;;
  }

  measure: count {
    label: "Number of Submissions"
    type: count_distinct
    sql: ${id} ;;
    drill_fields: [id, courses.name, courses.id]
  }

  measure: average_grade_percent {
    group_label: "Normalized Grade Statistics"
    type: average
    sql:  ${normalized_grade};;
    value_format_name: percent_2
    drill_fields: [courses.subject,average_grade_percent]
  }

  measure: max_grade_percent {
    group_label: "Normalized Grade Statistics"
    type: max
    sql: ${normalized_grade} ;;
    value_format_name: percent_2
  }

  measure: min_grade_percent {
    group_label: "Normalized Grade Statistics"
    type: min
    sql: ${normalized_grade} ;;
    value_format_name: percent_2
  }

  measure: median_grade_percent {
    group_label: "Normalized Grade Statistics"
    type: median
    sql: ${normalized_grade} ;;
    value_format_name: percent_2
  }

  measure: 25th_percentile_grade_percent {
    group_label: "Normalized Grade Statistics"
    type: percentile
    percentile: 25
    sql: ${normalized_grade} ;;
    value_format_name: percent_2
  }

  measure: 75th_percentile_grade_percent {
    group_label: "Normalized Grade Statistics"
    type: percentile
    percentile: 75
    sql: ${normalized_grade} ;;
    value_format_name: percent_2
  }


  measure: average_grade {
    group_label: "Raw Grade Statistics"
    type: average
    sql:  ${assigned_grade};;
  }

  measure: max_grade {
    group_label: "Raw Grade Statistics"
    type: max
    sql: ${assigned_grade} ;;
  }

  measure: min_grade {
    group_label: "Raw Grade Statistics"
    type: min
    sql: ${assigned_grade} ;;
  }

  measure: median_grade {
    group_label: "Raw Grade Statistics"
    type: median
    sql: ${assigned_grade} ;;
  }

  measure: 25th_percentile_grade {
    group_label: "Raw Grade Statistics"
    type: percentile
    percentile: 25
    sql: ${assigned_grade} ;;
  }

  measure: 75th_percentile_grade {
    group_label: "Raw Grade Statistics"
    type: percentile
    percentile: 75
    sql: ${assigned_grade} ;;
  }

  measure: total_points_earned {
    type: sum
    sql: ${assigned_grade} ;;
  }

  measure: percent_points_earned {
    type: number
    sql: ${total_points_earned}/nullif(${coursework.total_points},0) ;;
    value_format_name: decimal_2
  }

}


view: submission_history {}
