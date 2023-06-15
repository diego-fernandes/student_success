view: announcements {
  sql_table_name: `looker-private-demo.classroom_staging.announcements`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: alternate_link {
    type: string
    sql: ${TABLE}.alternateLink ;;
  }

  dimension: assignee_mode {
    type: string
    sql: ${TABLE}.assigneeMode ;;
  }

  dimension: course_id {
    type: string
    hidden: yes
    sql: ${TABLE}.courseId ;;
  }

  dimension: creation_time {
    type: string
    sql: ${TABLE}.creationTime ;;
  }

  dimension: creator_user_id {
    hidden: yes
    type: string
    sql: ${TABLE}.creatorUserId ;;
  }

  dimension: materials {
    type: string
    sql: ${TABLE}.materials ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: text {
    type: string
    sql: ${TABLE}.text ;;
  }

  dimension: update_time {
    type: string
    sql: ${TABLE}.updateTime ;;
  }

  measure: count {
    label: "Number of Announcements"
    type: count
    drill_fields: [id, courses.name, courses.id]
  }
}
