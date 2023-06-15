view: meet_attendance {
  derived_table: {
    datagroup_trigger: classroom_trigger
    explore_source: courses {
      column: student_id { field: students.user_id }
      column: id {}
      column: approximate_number_meets_per_course { field: teacher_meet_facts.approximate_number_meets_per_course }
      column: teacher_id { field: teachers.user_id }
      filters: {
        field: students.user_id
        value: "-NULL"
      }
    }
  }

  dimension: student_id {
    type: string
  }

  dimension: course_id {
    sql: ${TABLE}.id ;;
  }

  dimension: approximate_number_meets_per_course {
    label: "Approximate Number Meets per Course"
    description: "Total number of meets divided by the number of courses that the teacher instructs"
    type: number
    sql: round(${TABLE}.approximate_number_meets_per_course) ;;
  }

  dimension: teacher_id {
    type: string
  }

  measure: total_number_meets_expected {
    type: sum
    sql: ${approximate_number_meets_per_course} ;;
  }
}
