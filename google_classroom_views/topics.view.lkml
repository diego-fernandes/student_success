view: topics {
  view_label: "Coursework"
  sql_table_name: `looker-private-demo.classroom_staging.topics`
    ;;
  drill_fields: [topic_id]

  dimension: topic_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.topicId ;;
  }

  dimension: course_id {
    hidden: yes
    type: string
    sql: ${TABLE}.courseId ;;
  }

  dimension: name {
    label: "Topic Name"
    type: string
    sql: ${TABLE}.name ;;
  }

  measure: count {
    label: "Number of Topics"
    type: count_distinct
    sql: ${topic_id} ;;
    drill_fields: [topic_id, name]
  }
}
