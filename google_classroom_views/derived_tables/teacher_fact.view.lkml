view: teacher_facts {
  view_label: "Teachers"
  drill_fields: [teacher_profiles.name,average_grade_percent, teacher_profiles.email_address,courses.name,courses.id
  ]
  derived_table: {
    explore_source: courses {
      column: user_id { field: teachers.user_id }
      column: count_courseworks { field: coursework.count }
      column: min_grade_percent { field: coursework_submissions.min_grade_percent }
      column: max_grade_percent { field: coursework_submissions.max_grade_percent }
      column: median_grade_percent { field: coursework_submissions.median_grade_percent }
      column: average_grade_percent { field: coursework_submissions.average_grade_percent }
      column: percent_submissions_late { field: coursework_submissions.percent_submissions_late }
      column: percent_missing { field: coursework.percent_missing }
      column: total_points { field: coursework.total_points }
      column: total_coursework_material { field: coursework_materials.count }
      column: total_announcement_material { field: announcement_materials.count }
      column: total_announcements { field: announcements.count }

      filters: {
        field: teachers.user_id
        value: "-NULL"
      }
    }
  }

  dimension: user_id {
    primary_key: yes
    hidden: yes
    label: "Teacher ID"
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
    group_label: "Assignments"
    value_format: "#,##0.00%"
    type: number
  }

  dimension: max_grade_percent {
    group_label: "Assignments"
    value_format: "#,##0.00%"
    type: number
  }

  dimension: median_grade_percent {
    group_label: "Assignments"
    value_format: "#,##0.00%"
    type: number
  }

  dimension: average_grade_percent {
    group_label: "Assignments"
    value_format: "#,##0.00%"
    type: number
  }

  dimension: percent_submitted {
    group_label: "Assignments"
    description: "Percent of assignments that were submitted"
    value_format: "#,##0.00%"
    type: number
  }

  dimension: percent_submissions_late {
    group_label: "Assignments"
    description: "Percent of submissions that were late"
    value_format: "#,##0.00%"
    type: number
  }

  dimension: average_grade_tier {
    group_label: "Assignments"
    type: tier
    sql: ${average_grade_percent}*100 ;;
    tiers: [60,70,80,90]
  }

  dimension: late_submissions_tier {
    group_label: "Assignments"
    type: tier
    sql: ${percent_submissions_late}*100 ;;
    tiers: [60,70,80,90]
  }

  dimension: submissions_tier {
    group_label: "Assignments"
    type: tier
    sql: ${percent_submitted}*100 ;;
    tiers: [60,70,80,90]
  }
}
