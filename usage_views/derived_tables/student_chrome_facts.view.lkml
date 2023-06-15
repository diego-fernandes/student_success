view: student_chrome_facts {
  derived_table: {
    explore_source: chrome_usage {
      column: average_daily_duration {}
      column: total_duration {}
      column: user_id { field: students.user_id }
      filters: {
        field: chrome_usage.usage_day_of_week
        value: "-Sunday,-Saturday"
      }
      filters: {
        field: students.user_id
        value: "-NULL"
      }
    }
  }

  dimension: average_daily_duration {
    group_label: "Chromebook Usage"
    value_format_name: decimal_2
    type: number
  }

  dimension: total_duration {
    group_label: "Chromebook Usage"
    value_format_name: decimal_2
    type: number
  }

  dimension: average_daily_duration_tier {
    description: "Tier for how much time the student uses their chromebook on an average day"
    group_label: "Chromebook Usage"
    type: tier
    value_format_name: decimal_2
    sql:  ${average_daily_duration};;
    style: integer
    tiers: [15,30,60,120,240]
  }



  dimension: user_id {
    hidden: yes
    label: "Students Student ID"
  }
}
