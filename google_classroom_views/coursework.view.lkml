view: coursework {
  sql_table_name: `looker-private-demo.classroom_staging.coursework`
    ;;
   drill_fields: [id, teacher_profiles.name, courses.name, courses.id, title, created_date, work_type, coursework_submissions.count, coursework_materials.count, coursework_submissions.average_grade_percent]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
    link: {
      label: "View Coursework"
      url: "{{ alternate_link._value }}"
    }
  }

  dimension: alternate_link {
    hidden: yes
    label: "Coursework Link"
    type: string
    sql: ${TABLE}.alternateLink ;;
  }

  dimension: assignee_mode {
    description: "What students was this coursework assigned to?"
    type: string
    sql: ${TABLE}.assigneeMode ;;
  }

  dimension: course_id {
    type: string
    hidden: yes
    sql: ${TABLE}.courseId ;;
  }

  dimension_group: created {
    timeframes: [day_of_month,day_of_week,day_of_year,date,month,month_name, raw]
    type: time
    sql: timestamp(${TABLE}.creationTime) ;;
  }

  dimension: creator_user_id {
    hidden: yes
    type: string
    sql: ${TABLE}.creatorUserId ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: due_date_ {
    hidden: yes
    type: string
    sql: ${TABLE}.dueDate ;;
  }

  dimension: due_time_ {
    hidden: yes
    type: string
    sql: ${TABLE}.dueTime ;;
  }

  dimension_group: due {
    timeframes: [day_of_month,day_of_week,day_of_year,date,month,month_name, hour_of_day, time]
    type: time
    sql: concat(JSON_EXTRACT(${due_date_},'$.year'),'-',
                JSON_EXTRACT(${due_date_},'$.month'),'-',
                JSON_EXTRACT(${due_date_},'$.day'),' ',
                JSON_EXTRACT(${due_time_},'$.hours'),':',
                JSON_EXTRACT(${due_time_},'$.minutes'),'"00+00");;
  }

  dimension: materials {
    type: string
    sql: ${TABLE}.materials ;;
  }

  dimension: max_points {
    type: number
    sql: ${TABLE}.maxPoints ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: submission_modification_mode {
    type: string
    sql: ${TABLE}.submissionModificationMode ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }

  dimension: topic_id {
    hidden: yes
    type: string
    sql: ${TABLE}.topicId ;;
  }

  dimension: update_time {
    hidden: yes
    type: string
    sql: ${TABLE}.updateTime ;;
  }

  dimension: work_type {
    type: string
    sql: ${TABLE}.workType ;;
  }

  measure: count {
    label: "Number of Courseworks"
    type: count_distinct
    sql: ${id} ;;
  }

  measure: number_assignments {
    type: count_distinct
    sql: ${id} ;;
    filters: [
      work_type: "ASSIGNMENT"
    ]
  }

  measure: number_questions {
    type: count_distinct
    sql: ${id} ;;
    filters: [
      work_type: "-ASSIGNMENT"
    ]
  }

  measure: expected_submissions {
#     hidden: yes
    type: count_distinct
    sql: concat(${students.pk},'-',${coursework.id}) ;;
  }

  measure: total_points {
    description: "The total number of possible points on all courseworks"
    type: sum
    sql: ${max_points} ;;
  }

  measure: missing_submissions {
    type: count_distinct
    sql: concat(${students.pk},'-',${coursework.id}) ;;
    filters: [
      coursework_submissions.id: "NULL"
    ]
    drill_fields: [student_profiles.name, created_date, courses.name, title, work_type]
  }

  measure: percent_missing {
    type: number
    description: "Percent of the class that has not submitted this assignment"
    sql: ${missing_submissions}/nullif(${expected_submissions},0) ;;
    value_format_name: percent_2
    drill_fields: [student_profiles.name, created_date, courses.name, title, work_type]
  }


}

# view: coursework_materials {
#   sql_table_name: UNNEST(SPLIT(SUBSTR(${coursework.materials}, 2 , LENGTH(${coursework.materials}) - 2)))) ;;
#
#   dimension: coursework_id {
#     type: string
#     sql: ${coursework.coursework_id} ;;
#   }
#
#   dimension: type {
#     sql: case when 'driveFile' in  ;;
#   }
#
#     [{'driveFile': {'driveFile': {'id': '1kRZo1hOzO-IA3QQfFJ-8OY_S3m9LmhmP86a_2coSFCM', 'title': 'Google Classroom Demo Doc', 'alternateLink': 'https://drive.google.com/open?id=1kRZo1hOzO-IA3QQfFJ-8OY_S3m9LmhmP86a_2coSFCM', 'thumbnailUrl': 'https://drive.google.com/thumbnail?id=1kRZo1hOzO-IA3QQfFJ-8OY_S3m9LmhmP86a_2coSFCM&sz=s200'}, 'shareMode': 'VIEW'}}, {'driveFile': {'driveFile': {'id': '1kRZo1hOzO-IA3QQfFJ-8OY_S3m9LmhmP86a_2coSFCM', 'title': 'Google Classroom Demo Doc', 'alternateLink': 'https://drive.google.com/open?id=1kRZo1hOzO-IA3QQfFJ-8OY_S3m9LmhmP86a_2coSFCM', 'thumbnailUrl': 'https://drive.google.com/thumbnail?id=1kRZo1hOzO-IA3QQfFJ-8OY_S3m9LmhmP86a_2coSFCM&sz=s200'}, 'shareMode': 'VIEW'}}, {'driveFile': {'driveFile': {'id': '1kRZo1hOzO-IA3QQfFJ-8OY_S3m9LmhmP86a_2coSFCM', 'title': 'Google Classroom Demo Doc', 'alternateLink': 'https://drive.google.com/open?id=1kRZo1hOzO-IA3QQfFJ-8OY_S3m9LmhmP86a_2coSFCM', 'thumbnailUrl': 'https://drive.google.com/thumbnail?id=1kRZo1hOzO-IA3QQfFJ-8OY_S3m9LmhmP86a_2coSFCM&sz=s200'}, 'shareMode': 'VIEW'}}, {'driveFile': {'driveFile': {'id': '1kRZo1hOzO-IA3QQfFJ-8OY_S3m9LmhmP86a_2coSFCM', 'title': 'Google Classroom Demo Doc', 'alternateLink': 'https://drive.google.com/open?id=1kRZo1hOzO-IA3QQfFJ-8OY_S3m9LmhmP86a_2coSFCM', 'thumbnailUrl': 'https://drive.google.com/thumbnail?id=1kRZo1hOzO-IA3QQfFJ-8OY_S3m9LmhmP86a_2coSFCM&sz=s200'}, 'shareMode': 'VIEW'}}, {'driveFile': {'driveFile': {'id': '1kRZo1hOzO-IA3QQfFJ-8OY_S3m9LmhmP86a_2coSFCM', 'title': 'Google Classroom Demo Doc', 'alternateLink': 'https://drive.google.com/open?id=1kRZo1hOzO-IA3QQfFJ-8OY_S3m9LmhmP86a_2coSFCM', 'thumbnailUrl': 'https://drive.google.com/thumbnail?id=1kRZo1hOzO-IA3QQfFJ-8OY_S3m9LmhmP86a_2coSFCM&sz=s200'}, 'shareMode': 'VIEW'}}]
# }
