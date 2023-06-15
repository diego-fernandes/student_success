# If necessary, uncomment the line below to include explore_source.
# include: "student_success.model.lkml"

view: course_fact {
  derived_table: {
    explore_source: courses {
      column: min_grade_percent { field: coursework_submissions.min_grade_percent }
      column: max_grade_percent { field: coursework_submissions.max_grade_percent }
      column: median_grade_percent { field: coursework_submissions.median_grade_percent }
      column: average_grade_percent { field: coursework_submissions.average_grade_percent }
      column: percent_submitted { field: coursework.percent_submitted }
      column: percent_submissions_late { field: coursework_submissions.percent_submissions_late }
      column: 25th_percentile_grade_percent { field: coursework_submissions.25th_percentile_grade_percent }
      column: 75th_percentile_grade_percent { field: coursework_submissions.75th_percentile_grade_percent }
      column: id {}
      filters: {
        field: students.user_id
        value: "-NULL"
      }
    }
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
    group_label: "Grades"
    value_format: "#,##0.00%"
    type: number
  }

  dimension: percent_submissions_late {
    group_label: "Grades"
    value_format: "#,##0.00%"
    type: number
  }

  dimension: 25th_percentile_grade_percent {
    group_label: "Grades"
    value_format: "#,##0.00%"
    type: number
  }

  dimension: 75th_percentile_grade_percent {
    group_label: "Grades"
    value_format: "#,##0.00%"
    type: number
  }

  dimension: average_grade_tier {
    type: tier
    sql: ${average_grade_percent}*100 ;;
    tiers: [60,70,80,90]
  }

  dimension: late_submissions_tier {
    type: tier
    sql: ${percent_submissions_late}*100 ;;
    tiers: [60,70,80,90]
  }

  dimension: submissions_tier {
    type: tier
    sql: ${percent_submitted}*100 ;;
    tiers: [60,70,80,90]
  }

  dimension: id {}
}
