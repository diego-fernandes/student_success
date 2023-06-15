view: meeting_facts {
  derived_table: {
    datagroup_trigger: classroom_trigger
    explore_source: meet_activities {
      column: max_duration { field: meet_events.max_duration }
      column: meeting_code { field: meet_events.meeting_code }
    }
  }

  dimension: max_duration {
    type: number
    label: "Approximate Meeting Durating"
  }

  dimension: meeting_code {
    primary_key: yes
    hidden: yes
  }
}
