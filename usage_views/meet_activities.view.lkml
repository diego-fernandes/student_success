view: meet_activities {
  sql_table_name: `looker-private-demo.classroom_staging.meet_activities`
    ;;
  drill_fields: [id]

  dimension: id {
    hidden: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: unique_idenitifier {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${id}.uniqueQualifier ;;
  }

  dimension_group: start {
    timeframes: [hour_of_day,date,time,day_of_week,day_of_month]
    type: time
    description: "The time that the attendee joined the meet"
    sql:${id}.time;;
  }

  dimension: actor {
    hidden: yes
    type: string
    sql: ${TABLE}.actor ;;
  }

  dimension: email {
    type: string
    sql:${actor}.email ;;
  }

  dimension: user_id {
    type: string
    sql:${actor}.profileId ;;
  }

  dimension: etag {
    hidden: yes
    type: string
    sql: ${TABLE}.etag ;;
  }

  dimension: events {
    hidden: yes
    type: string
    sql: ${TABLE}.events ;;
  }

  dimension: kind {
    hidden: yes
    type: string
    sql: ${TABLE}.kind ;;
  }
}

view: meet_events {
  #eav schema so need to transform
  derived_table: {
    datagroup_trigger: classroom_trigger
    sql:
        SELECT
        m.id.uniqueQualifier AS ID,
        m2.intValue as duration,
        m4.intValue as video_duration,
        m6.intValue as audio_duration,
        m8.intValue as meeting_code,
        FROM `looker-private-demo.classroom_staging.meet_activities` as m
        left join unnest(m.events) AS m1
        left join unnest(m1.parameters) as m2

        left join unnest(m.events) AS m3
        left join unnest(m1.parameters) as m4

        left join unnest(m.events) AS m5
        left join unnest(m1.parameters) as m6

        left join unnest(m.events) AS m7
        left join unnest(m1.parameters) as m8

        where
        m2.name = "duration_seconds"  and m4.name = 'video_send_seconds'
        and m6.name = 'audio_send_seconds' and m8.name = 'meeting_code'
        and cast(m2.intValue as int64)>0 ;;
  }

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }


  dimension: duration {
    description: "The amount of time the user sent an audio signal in minutes"
    type: number
    sql: cast(${TABLE}.duration as int64)/60;;
  }

  dimension: audio_duration {
    description: "The amount of time the user sent an audio signal in minutes"
    type: number
    sql: cast(${TABLE}.audio_duration as int64)/60  ;;
  }

  dimension: video_duration {
    description: "The amount of time the user had their video on in minutes"
    type: number
    sql: cast(${TABLE}.video_duration as int64)/60  ;;
  }

  dimension: meeting_code {
    type: string
    sql: ${TABLE}.meeting_code ;;
  }

  dimension: had_video_on {
    type: yesno
    description: "Did the student have video on at all during the meet?"
    sql: ${video_duration}>0 ;;
  }

  dimension: spoke_in_class {
    type: yesno
    description: "Did the student speak at all during the meet?"
    sql: ${audio_duration}>0 ;;
  }

  dimension: percent_of_meet_on {
    description: "The percent of the meet that the user was on for"
    type: number
    value_format_name: percent_1
    sql: ${duration}/nullif(${meeting_facts.max_duration},0) ;;
  }

#   measure: percent_of_classes_attended {
#
#   }

  dimension: percent_spoken {
    description: "The percent of the time the user was in the meet that they were speaking for"
    type: number
    sql: ${audio_duration}/nullif(${duration},0) ;;
    value_format_name: percent_1
  }

  measure: average_duration {
    group_label: "Duration"
    type: average
    sql: ${duration} ;;
    value_format_name: decimal_0
  }

  measure: total_duration {
    group_label: "Duration"
    type: sum
    sql: ${duration} ;;
    value_format_name: decimal_0
  }

  measure: number_meet_attendance {
    group_label: "Attendance"
    label: "Number of Meet Attendances"
    type: count
    filters: [
      duration: ">0"
    ]
  }

  measure: number_meets_with_audio {
    group_label: "Attendance"
    type: count
    filters: [
      had_video_on: "yes"
    ]
  }

  measure: number_meets_with_video {
    group_label: "Attendance"
    type: count
    filters: [
      had_video_on: "yes"
    ]
  }

  measure: number_meets {
    type: count_distinct
    sql: ${meeting_code}  ;;
  }

  measure: percent_meets_with_audio {
    group_label: "Attendance"
    type: number
    value_format_name: percent_1
    sql: ${number_meets_with_audio}/nullif(${number_meet_attendance},0) ;;
  }

  measure: percent_meets_with_video {
    group_label: "Attendance"
    type: number
    value_format_name: percent_1
    sql: ${number_meets_with_video}/nullif(${number_meet_attendance},0) ;;
  }

  measure: max_duration {
    group_label: "Duration"
    hidden: yes
    description: "The maximum duration that anyone stayed on, used for calculating the approximate time the meet was for"
    type: max
    sql: ${duration} ;;
  }

  measure: average_percent_spoken {
    group_label: "Duration"
    description: "The average duration of the meet that the user was speaking for "
    type: average
    sql: ${percent_spoken} ;;
    value_format_name: percent_1
  }

  measure: average_percent_meet_on {
    group_label: "Duration"
    type: average
    description: "The average percent of each class that the user stayed on for"
    sql: ${percent_of_meet_on} ;;
    value_format_name: percent_1
  }

}
