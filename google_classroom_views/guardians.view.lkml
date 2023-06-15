view: guardians {
  sql_table_name: `looker-private-demo.classroom_staging.guardians`
    ;;
  drill_fields: [guardian_id]

  dimension: guardian_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.guardianId ;;
  }

  dimension: student_id {
    hidden: yes
    type: string
    sql: ${TABLE}.studentId ;;
  }

  measure: count {
    label: "Number of Guardians"
    type: count_distinct
    sql: ${guardian_id} ;;
  }
}
