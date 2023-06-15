view: teachers {
  sql_table_name: (select userId, max(courseId) as courseId from `looker-private-demo.classroom_staging.teachers` group by 1 )
    ;;

  dimension: course_id {
    type: string
    hidden: yes
    sql: ${TABLE}.courseId ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}.userId ;;
  }

  measure: count {
    label: "Number of Teachers"
    type: count_distinct
    sql: ${user_id} ;;
    drill_fields: [courses.name, courses.id]
  }
}
