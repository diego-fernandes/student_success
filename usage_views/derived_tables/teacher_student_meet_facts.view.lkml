view: teacher_student_meet_facts {
  derived_table: {
    datagroup_trigger: classroom_trigger
    sql: select student_meets.student_id,
          teacher_meets.teacher_id,
          count(*) as number_meets_attended
          from

          (SELECT
            meet_events.meeting_code  AS meet_events_meeting_code,
            students.userId  AS student_id
          FROM  ${meet_activities.SQL_TABLE_NAME}
               AS meet_activities
          LEFT JOIN ${meet_events.SQL_TABLE_NAME} AS meet_events ON meet_activities.id.uniqueQualifier= meet_events.id
          FULL OUTER JOIN ${user_profiles.SQL_TABLE_NAME}
               AS student_profiles ON meet_activities.actor.profileId = student_profiles.id
          LEFT JOIN ${students.SQL_TABLE_NAME}
               AS students ON students.userId = student_profiles.id
          WHERE (students.userId is not null) AND ((meet_events.meeting_code IS NOT NULL))
          GROUP BY 1,2
          ) as student_meets

          FULL OUTER JOIN

          (SELECT
            meet_events.meeting_code  AS meet_events_meeting_code,
            teachers.userId  AS teacher_id
          FROM `looker-private-demo.classroom_staging.meet_activities`
               AS meet_activities
          LEFT JOIN ${meet_events.SQL_TABLE_NAME}  AS meet_events ON meet_activities.id.uniqueQualifier= meet_events.id
          FULL OUTER JOIN ${user_profiles.SQL_TABLE_NAME}
               AS teacher_profiles ON meet_activities.actor.profileId = teacher_profiles.id
          LEFT JOIN ${teachers.SQL_TABLE_NAME}
               AS teachers ON teachers.userId = teacher_profiles.id
          WHERE (teachers.userId is not null) AND ((meet_events.meeting_code IS NOT NULL))
          GROUP BY 1,2
          ) as teacher_meets

          on student_meets.meet_events_meeting_code = teacher_meets.meet_events_meeting_code
          group by 1,2
                ;;
  }

  dimension: number_meets_attended {
    type: number
    sql: coalesce(${TABLE}.number_meets_attended,0) ;;
  }

  dimension: teacher_id {
    hidden: yes
    type: string
  }

  dimension: student_id {
    hidden: yes
    type: string
  }

  dimension: primary_key {
    primary_key: yes
    sql: concat(${student_id},${teacher_id}) ;;
  }

  measure: total_attended {
    type: sum
    sql: ${number_meets_attended} ;;
  }

  measure: percent_attended {
    description: "The percent of the meets that the student attended"
    type: number
    value_format_name: percent_1
    sql: CASE WHEN ${total_attended}/nullif(${meet_attendance.total_number_meets_expected},0) > 1
    THEN 1
    ELSE ${total_attended}/nullif(${meet_attendance.total_number_meets_expected},0) END ;;
  }
}
