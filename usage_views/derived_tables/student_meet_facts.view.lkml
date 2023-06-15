view: student_meet_facts {
  derived_table: {
    datagroup_trigger: classroom_trigger
    explore_source: meet_activities {
      column: user_id { field: students.user_id }
      column: percent_meets_with_audio { field: meet_events.percent_meets_with_audio }
      column: percent_meets_with_video { field: meet_events.percent_meets_with_video }
      column: number_meet_attendance { field: meet_events.number_meet_attendance }
      column: average_duration { field: meet_events.average_duration }
      column: average_percent_meet_on { field: meet_events.average_percent_meet_on }
      }
    }

  dimension: user_id {
    label: "Students Student ID"
  }

  dimension: percent_meets_with_audio {
    group_label: "Meet Participation"
    value_format_name: percent_1
    type: number
  }

  dimension: percent_meets_with_video {
    group_label: "Meet Participation"
    value_format_name: percent_1
    type: number
  }

  dimension: number_meet_attendance {
   group_label: "Meet Participation"
    type: number
  }

  dimension: average_percent_meet_on {
    description: "The average percent of the meet duration the student stayed on for"
    group_label: "Meet Participation"
    type: number
  }

  dimension: average_duration {
   group_label: "Meet Participation"
    type: number
  }

  dimension: meet_participation_tier {
    type: tier
    tiers: [0,5,10,25,50]
    sql: ${percent_meets_with_audio}*100 ;;
    style: integer
  }


}
