view: chrome_usage {
  derived_table: {
  datagroup_trigger: classroom_trigger
   sql:
      SELECT
        u.emailaddress as user
        , date
        , device_id
        , serial_number
        , org_unit_path
        , location
        , private_ip_address
        , public_ip_address
        , mac_address
        , device_os_version
        , model
        , CASE WHEN duration IS NULL
            THEN 0
            ELSE duration END as duration
      FROM looker-private-demo.classroom_staging.user_profiles u
        CROSS JOIN UNNEST(generate_date_array( (SELECT CAST(TIMESTAMP(MIN(date)) AS date)  FROM looker-private-demo.classroom_staging.chrome_usage), (SELECT CAST(TIMESTAMP(MAX(date)) AS date ) FROM looker-private-demo.classroom_staging.chrome_usage) , interval 1 day )) AS date
        LEFT JOIN looker-private-demo.classroom_staging.chrome_usage c
          ON u.emailaddress = c.user
          AND date = CAST(TIMESTAMP(c.date) as date)
     WHERE u.id in (SELECT distinct userId FROM looker-private-demo.classroom_staging.students) OR u.id in (SELECT distinct userId FROM looker-private-demo.classroom_staging.teachers)


      ;;
  }

  # Define your dimensions and measures here, like this:
    dimension: is_active_day {
      type: yesno
      sql:  ${duration} > 0;;
    }

    dimension: pk {
      hidden: yes
      primary_key: yes
      sql: concat(${device_id},${usage_date}) ;;
    }

    dimension_group: usage {
      type:time
      timeframes: [date,day_of_week,day_of_month,month,raw]
      sql: timestamp(${TABLE}.date) ;;
    }

    dimension: device_id {
      group_label: "Device"
      type: string
      sql: ${TABLE}.device_id ;;
    }

    dimension: device_os_version {
      group_label: "Device"
      type: string
      sql: ${TABLE}.device_os_version ;;
    }

    dimension: duration {
      description: "Daily usage in minutes"
      type: number
      sql: ${TABLE}.duration ;;
    }

    dimension: location {
      description: "Approximate Usage Location"
      type: string
      sql: ${TABLE}.location ;;
    }

    dimension: mac_address {
      group_label: "Device"
      type: string
      sql: ${TABLE}.mac_address ;;
    }

    dimension: model {
      group_label: "Device"
      type: string
      sql: ${TABLE}.model ;;
    }

    dimension: org_unit_path {
      type: string
      sql: ${TABLE}.org_unit_path ;;
    }

    dimension: school_name {
      sql: replace(split(${org_unit_path},'/')[offset(2)],'_',' ') ;;
    }

    dimension: private_ip_address {
      group_label: "Device"
      type: string
      sql: ${TABLE}.private_ip_address ;;
    }

    dimension: public_ip_address {
      group_label: "Device"
      type: string
      sql: ${TABLE}.public_ip_address ;;
    }

    dimension: serial_number {
      group_label: "Device"
      type: string
      sql: ${TABLE}.serial_number ;;
    }

    dimension: user {
      hidden: no
      type: string
      sql: ${TABLE}.user ;;
    }

    measure: total_duration {
      value_format_name: decimal_1
      type: sum
      sql: ${duration} ;;
    }

    measure: average_daily_duration {
      description: "Only includes weekdays"
      value_format_name: decimal_1
      type: average
      sql: ${duration} ;;
      filters: [usage_day_of_week: "Monday, Tuesday, Wednesday, Thursday, Friday"]
    }

}
