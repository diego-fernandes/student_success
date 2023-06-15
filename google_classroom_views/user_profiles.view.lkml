view: user_profiles {
  sql_table_name: `looker-private-demo.classroom_staging.user_profiles`
    ;;
  drill_fields: [id]

  dimension: id {
#     hidden: yes
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: email_address {
    type: string
    sql: ${TABLE}.emailAddress ;;
    label: "{% if _view._name == 'student_profiles' %}
    Student Email
    {% elsif _view._name == 'teacher_profiles' %}
    Teacher Email
    {% else %}
    Guardian Email
    {% endif %}
    "
    action: {
      label: "{% if _view._name == 'student_profiles' %}
              Email Student
              {% elsif _view._name == 'teacher_profiles' %}
              Follow up With Teacher
              {% else %}
              Reach Out to Guardian
               {% endif %}
              "
      icon_url: "https://img.favpng.com/21/2/1/gmail-google-logo-email-computer-icons-png-favpng-WGUQeg40tUKsubAALzrr3WP47.jpg"
      url: "https://google.com"
      form_param: {
        type: string
        name: "Subject"
      }
      form_param: {
        type: textarea
        name: "Body"
      }
    }

  }

  dimension: name {
    label: "{% if _view._name == 'student_profiles' %}
    Student Name
    {% elsif _view._name == 'teacher_profiles' %}
    Teacher Name
    {% else %}
    Guardian Name
    {% endif %}
    "
    type: string
    sql: TRIM(JSON_EXTRACT(${TABLE}.name,'$.fullName'),'"') ;;
    link:{
      label:"{% if _view._name == 'student_profiles' %}
    View Student Profile
    {% endif %}
    "

      url: "https://classroom.google.com/c/MTUyMDk5NTg1NzY1/sp/MTUyMDk5NTg1ODY5/all"
      icon_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/Google_Classroom_Logo.png/220px-Google_Classroom_Logo.png"
    }
  }

  dimension: photo_url {
    type: string
    sql: ${TABLE}.photoUrl ;;
  }

  dimension: verified_teacher {
    hidden: no
    type: string
    sql: ${TABLE}.verifiedTeacher ;;
  }

  measure: count {
    hidden: no
    type: count
    drill_fields: [id, name]
  }
}
