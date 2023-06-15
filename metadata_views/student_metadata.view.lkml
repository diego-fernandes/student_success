view: student_metadata {
  view_label: "Students"
  sql_table_name: `looker-private-demo.classroom_staging.student_metadata`
    ;;

  dimension: grade {
    label: "Grade Level"
    order_by_field: grade_order
    type: string
    sql: ${TABLE}.grade ;;
  }

  dimension: school {
    hidden: yes
    type: string
    sql: ${TABLE}.school ;;
  }


  dimension: grade_order {
    type: number
    hidden: yes
    sql: case when ${grade} = 'Kindergarten' then 0 when ${grade}='1st Grade' then 1
              when ${grade} = '2nd Grade' then 2 when ${grade}='3rd Grade' then 3
              when ${grade} = '4th Grade' then 4 when ${grade}='5th Grade' then 4
              when ${grade} = '6th Grade' then 6 when ${grade}='7th Grade' then 7
              when ${grade} = '8th Grade' then 8 when ${grade}='9th Grade' then 9
              when ${grade} = '10th Grade' then 10 when ${grade}='11th Grade' then 11
              when ${grade} = '12th Grade' then 12 else null end;;
  }

  dimension: user_id {
    hidden: yes
    type: string
    sql: ${TABLE}.userId ;;
  }
}
