view: students {
  drill_fields: [student_profiles.name,student_metadata.grade, course_id,student_profiles.email_address,guardian_profiles.email_address
    ]
  sql_table_name: `looker-private-demo.classroom_staging.students`
    ;;

  dimension: pk {
    primary_key: yes
    hidden: yes
    sql: concat(${user_id}, '-', ${course_id}) ;;
  }

  dimension: course_id {
    type: string
    hidden: yes
    sql: ${TABLE}.courseId ;;
  }

  dimension: user_id {
    label: "Student ID"
    type: string
    sql: ${TABLE}.userId ;;
  }

  measure: count {
    label: "Number of Students"
    type: count_distinct
    sql: ${user_id} ;;
    drill_fields: [courses.name, courses.id]
  }

  measure: students_without_attendance {
    description: "The number of students that have not attended any meets for their courses"
    type: count
    filters: [
      student_attendance_facts.has_0_attendance: "yes"
    ]
  }
}
