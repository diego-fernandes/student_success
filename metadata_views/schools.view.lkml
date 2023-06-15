view: schools {
  sql_table_name: `looker-private-demo.classroom_staging.schools`
    ;;

  parameter: school_comparitor {
    type: string
    view_label: "Comparison Fields"
    description: "Use with the Is School field to compare one school against the others"
    suggest_dimension: school_name
    suggest_persist_for: "24 hours"
  }

  dimension: is_school {
    type: yesno
    view_label: "Comparison Fields"
    sql: {% parameter school_comparitor %} = ${school_name};;
  }

  parameter: district_comparitor {
    type: string
    view_label: "Comparison Fields"
    description: "Use with the Is District field to compare one school against the others"
    suggest_dimension: school_district
    suggest_persist_for: "24 hours"
  }

  dimension: is_district {
    view_label: "Comparison Fields"
    type: yesno
    sql: {% parameter district_comparitor %} = ${school_district};;
  }

  dimension: grades {
    order_by_field: grades_order
    description: "The grades that are in the school"
    type: string
    sql: ${TABLE}.grades ;;
  }

  dimension: grades_order {
    hidden: yes
    type: number
    sql: case when ${grades} like '%K%' then 0
              when ${grades} like '%7%' then 1
              else 2 end;;
  }


  dimension: school_district {
    drill_fields: [school_name]
    type: string
    sql: ${TABLE}.school_district ;;
    link: {
      label: "{{ value }} Overview Dashboard"
      url: "/dashboards-next/student_success::district_overview?District={{ value }}"
      icon_url: "https://looker.com/assets/img/images/logos/looker_grey.svg"
    }
    action: {
      url: "https://hooks.zapier.com/hooks/catch/5505451/oih24lt"
      label: "Schedule Follow Up With District Superintendent"
      icon_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a9/Google_Calendar_icon.svg/1200px-Google_Calendar_icon.svg.png"
      form_param: {
        name: "Event Start Time"
        default: "{{ 'now' | date: '%s' | plus: 86400 | date: '%Y-%m-%d %H:00' }}"
        required: yes
      }
      form_param: {
        name: "Event End Time"
        default: "{{ 'now' | date: '%s' | plus: 86400 | date: '%Y-%m-%d %H:30' }}"
        required: yes
      }
      form_param: {
        name: "Organizer Email"
        required: yes
        default: "{{ _user_attributes['email'] }}"
      }

      form_param: {
        name: "Calendar Event Name"
        default: "{{ value }} Assesment KPIs"
        required: yes
      }
      form_param: {
        name: "Calendar Event Description"
        default: "Hi  - I'm setting up some time for us to review the assesment analytics KPIs we are monitoring and figure out how to improve participation and utilization across the district"
        required: no
        type: textarea
      }

    }
  }

  dimension: school_name {
    drill_fields: [student.grade]
    primary_key: yes
    type: string
    sql: ${TABLE}.school_name ;;
    link: {
      label: "{{ value }} Overview Dashboard"
      url: "/dashboards/student_success::school_overview?School={{ value }}"
      icon_url: "https://looker.com/assets/img/images/logos/looker_grey.svg"
    }
    action: {
      url: "https://hooks.zapier.com/hooks/catch/5505451/oih24lt"
      label: "Schedule Follow Up With Principal"
      icon_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a9/Google_Calendar_icon.svg/1200px-Google_Calendar_icon.svg.png"
      form_param: {
        name: "Event Start Time"
        default: "{{ 'now' | date: '%s' | plus: 86400 | date: '%Y-%m-%d %H:00' }}"
        required: yes
      }
      form_param: {
        name: "Event End Time"
        default: "{{ 'now' | date: '%s' | plus: 86400 | date: '%Y-%m-%d %H:30' }}"
        required: yes
      }
      form_param: {
        name: "Organizer Email"
        required: yes
        default: "{{ _user_attributes['email'] }}"
      }

      form_param: {
        name: "Calendar Event Name"
        default: "{{ value }} Assesment KPIs"
        required: yes
      }
      form_param: {
        name: "Calendar Event Description"
        default: "Hi  - I'm setting up some time for us to review the assesment analytics KPIs we are monitoring and figure out how to improve participation and utilization across the district"
        required: no
        type: textarea
      }

    }
  }

  measure: count {
    type: count_distinct
    sql: ${school_name} ;;
    drill_fields: [school_name]
  }

  measure: count_districts {
    type: count_distinct
    sql: ${school_district} ;;
  }
}
