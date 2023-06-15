view: teacher_meet_facts {
  derived_table: {
    explore_source: meet_activities {
      column: user_id { field: teachers.user_id }
      column: average_percent_meet_on { field: meet_events.average_percent_meet_on }
      column: average_duration { field: meet_events.average_duration }
      column: total_duration { field: meet_events.total_duration }
      column: number_meets { field: meet_events.number_meets }
    }
  }

  dimension: user_id {
    hidden: yes
    type: string
    primary_key: yes
  }

  dimension: average_percent_meet_on {
    group_label: "Meet Utilization"
    description: "Average percent of the meet that the teacher was on for"
    value_format_name: percent_1
    type: number
  }

  dimension: average_duration {
    group_label: "Meet Utilization"
    description: "Average duration of the meets in minutes"
    value_format_name: percent_1
    type: number
  }

  dimension: total_duration {
    group_label: "Meet Utilization"
    description: "Total duration of all meets in minutes"
    value_format_name: percent_1
    type: number
  }

  dimension: number_meets {
    group_label: "Meet Utilization"
    description: "Total number of meets"
    type: number
  }

  dimension: approximate_number_meets_per_course {
    group_label: "Meet Utilization"
    description: "Total number of meets divided by the number of courses that the teacher instructs"
    type: number
    sql: ${number_meets}/(select count(distinct id) from  `looker-private-demo.classroom_staging.courses`
    where ownerId = ${user_id}) ;;
  }


}
