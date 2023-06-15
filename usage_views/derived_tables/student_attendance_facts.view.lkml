view: student_attendance_facts {
    derived_table: {
      datagroup_trigger: classroom_trigger
      explore_source: meet_attendance {
        column: total_number_meets_expected {}
        column: total_attended { field: teacher_student_meet_facts.total_attended }
        column: percent_attended { field: teacher_student_meet_facts.percent_attended }
        column: student_id {}
      }
    }

    dimension: meets_expected {
      type: number
      hidden: yes
      sql: ${TABLE}.total_number_meets_expected ;;
    }

    dimension: meets_attended {
      type: number
      hidden: yes
      sql: ${TABLE}.total_attended ;;
    }

    dimension: percent_attended {
      group_label: "Meet Participation"
      description: "The percent of the meets that the student attended"
      value_format: "#,##0.0%"
      type: number
    }

    dimension: student_id {
      hidden: yes
      primary_key: yes
    }

    dimension: has_0_attendance {
      type: yesno
      sql: ${percent_attended} <= 0  ;;
    }

   dimension: attendance_rate_tier {
     type: tier
     tiers: [0,25,50,75,100]
     sql: ${percent_attended}*100 ;;
     style: integer
   }

    measure: total_expected_meets {
      type: sum
      #hidden: yes
      sql: ${meets_expected} ;;
    }

    measure: total_attended {
      type: sum
      #hidden: yes
      sql: ${meets_attended} ;;
    }

    measure: total_attendance_rate {
      type: number
      value_format_name: percent_1
      sql: CASE WHEN ${total_attended}/nullif(${total_expected_meets},0) > 1
      THEN 1
      ELSE ${total_attended}/nullif(${total_expected_meets},0) END;;
    }




  }
