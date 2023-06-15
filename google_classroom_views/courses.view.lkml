view: courses {
  sql_table_name: `looker-private-demo.classroom_staging.courses`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
    link: {
      label: "View Course"
      icon_url: "https://cdn.worldvectorlogo.com/logos/google-classroom.svg"
      url: "{{ alternate_link._value }}"
    }
    link: {
      label: "See Calendar"
      icon_url: "https://collegeinfogeek.com/wp-content/uploads/2016/08/Google_Calendar_Logo.png"
      url: "{{ calendar_id._value }}"
    }
    action: {
      #put teacher user attribute
      label: "Email Class"
      url: "https://google.com"
      icon_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ab/Gmail_Icon.svg/640px-Gmail_Icon.svg.png"
      form_param: {
        name: "Email Address"
        default: "{{ course_group_email._value }}"
        type: string
      }
      form_param: {
        name: "Subject"
        type: string
        default: "{{ name._value }} Course Update"
      }
      form_param: {
        name: "Body"
        type: textarea
      }
    }
    link: {
      label: "View Teacher Folder"
      icon_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/d/da/Google_Drive_logo.png/1024px-Google_Drive_logo.png"
      url: "{{ teacher_folder._value }}"
    }
    action: {
      #put teacher user attribute
      label: "Email Teacher Group"
      url: "https://google.com"
      icon_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ab/Gmail_Icon.svg/640px-Gmail_Icon.svg.png"
      form_param: {
        name: "Email Address"
        default: "{{ teacher_group_email._value }}"
        type: string
      }
      form_param: {
        name: "Subject"
        type: string
        default: "{{ name._value }} Teacher Follow-up"
      }
      form_param: {
        name: "Body"
        type: textarea
      }
    }

  }

  dimension: alternate_link {
    hidden: yes
    type: string
    sql: ${TABLE}.alternateLink ;;
  }

  dimension: subject {
    sql: case when  ${name} like '%Math%' then 'Math'
                when ${name} like '%Technology%' then 'Technology'
                when ${name} like '%Art%'  then 'Art'
                when ${name} like '%Science%'  then 'Science'
                when ${name} like '%History%'  then 'History'
                when ${name} like '%English%' then 'English'
                else 'Elementary' end;;
    drill_fields: [topics.name]
  }

  dimension: calendar_id {
    hidden: yes
    type: string
    sql: concat('https://calendar.google.com/calendar/embed?src=',${TABLE}.calendarId) ;;
  }

  dimension: course_group_email {
    hidden: yes
    type: string
    sql: ${TABLE}.courseGroupEmail ;;
  }

  dimension: course_state {
    description: "Is the course active, archived, etc."
    type: string
    sql: ${TABLE}.courseState ;;
  }

  dimension_group: creation {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.creationTime ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: description_heading {
    type: string
    sql: ${TABLE}.descriptionHeading ;;
  }

  dimension: enrollment_code {
    type: string
    sql: ${TABLE}.enrollmentCode ;;
  }

  dimension: guardians_enabled {
    type: yesno
    sql: ${TABLE}.guardiansEnabled = 'YES';;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: owner_id {
    hidden: yes
    type: string
    sql: ${TABLE}.ownerId ;;
  }

  dimension: room {
    type: number
    sql: ${TABLE}.room ;;
  }

  dimension: section {
    type: string
    sql: ${TABLE}.section ;;
  }

  dimension: teacher_folder {
    hidden: yes
    type: string
    sql:TRIM(JSON_EXTRACT(${TABLE}.teacherFolder,'$.alternateLink'),'"') ;;
  }

  dimension: teacher_group_email {
    hidden: yes
    type: string
    sql: ${TABLE}.teacherGroupEmail ;;
  }

  dimension_group: update {
    hidden: yes
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.updateTime ;;
  }

  measure: count {
    label: "Number of Courses"
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      name,
      description,
      students.count,
      coursework.count,
      coursework_submissions.count,
      announcements.count
    ]
  }
}
