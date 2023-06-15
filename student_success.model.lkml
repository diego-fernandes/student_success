connection: "looker-private-demo"

include: "/google_classroom_views/*.view.lkml"
include: "/google_classroom_views/derived_tables/*.view.lkml"
include: "/usage_views/*.view.lkml"
include: "/usage_views/derived_tables/*.view.lkml"
include: "/metadata_views/*.view.lkml"
include: "/dashboards/*"
include: "city_overview.dashboard"

datagroup: classroom_trigger {
  sql_trigger: SELECT COUNT(*) from ${coursework.SQL_TABLE_NAME} ;;
}

datagroup: once_weekly {
  max_cache_age: "168 hours"
  sql_trigger: SELECT extract(week from current_date()) ;;
}

explore: courses {
  label: "Google Classrooms"
  description: "Explore Google Classroom and associated usage data to understand how students and teachers are performing"
  join: coursework {
    type: full_outer
    relationship: one_to_many
    sql_on: ${courses.id} = ${coursework.course_id} ;;
  }
  join: students {
    type: full_outer
    relationship: many_to_one
    sql_on: ${students.course_id}=${courses.id} ;;
  }
  join: coursework_submissions {
    type: full_outer
    relationship: one_to_many
    sql_on: ${coursework_submissions.course_work_id}=${coursework.id} and ${students.user_id}=${coursework_submissions.user_id};;
  }
  join: student_profiles {
    relationship: one_to_one
    from: user_profiles
    view_label: "Students"
    fields: [student_profiles.name,student_profiles.email_address,student_profiles.photo_url]
    sql_on: ${students.user_id} = ${student_profiles.id} ;;
  }
  join: teachers {
    type: left_outer
    relationship: one_to_one
    sql_on: ${teachers.user_id}=${courses.owner_id} ;;
  }
  join: teacher_profiles {
    relationship: one_to_one
    from: user_profiles
    view_label: "Teachers"
    fields: [teacher_profiles.name,teacher_profiles.email_address,teacher_profiles.photo_url]
    sql_on: ${teachers.user_id} = ${teacher_profiles.id} ;;
  }
  join: guardians {
    type: left_outer
    relationship: many_to_one
    sql_on: ${guardians.student_id}=${students.user_id} ;;
  }
  join: guardian_profiles {
    relationship: one_to_one
    from: user_profiles
    view_label: "Guardians"
    fields: [guardian_profiles.name,guardian_profiles.email_address]
    sql_on: ${guardians.guardian_id} = ${guardian_profiles.id} ;;
  }
  join: schools {
    type: inner
    relationship: many_to_one
    sql_on: ${courses.section} like concat('%', ${schools.school_name},'%') ;;
  }
  join: announcements {
    type: inner
    relationship: one_to_many
    sql_on: ${announcements.course_id}=${courses.id} ;;
  }
  join: student_facts {
    relationship: one_to_one
    sql_on: ${student_facts.user_id}=${students.user_id} ;;
  }
  join: teacher_facts {
    relationship: one_to_one
    sql_on: ${teacher_facts.user_id}=${teachers.user_id} ;;
  }
  join: student_metadata {
    relationship: one_to_one
    sql_on: ${student_metadata.user_id}=${students.user_id} ;;
  }
  join: coursework_materials {
    view_label: "Coursework"
    from: materials
    sql:LEFT JOIN UNNEST(JSON_EXTRACT_ARRAY(${coursework.materials})) as coursework_materials ;;
  }
  join: announcement_materials {
    view_label: "Announcements"
    from: materials
    sql: LEFT JOIN UNNEST(JSON_EXTRACT_ARRAY(${announcements.materials})) as announcement_materials ;;
  }
  join: student_chrome_facts {
    view_label: "Students"
    sql_on: ${student_chrome_facts.user_id}=${students.user_id} ;;
  }
  join: teacher_chrome_facts {
    view_label: "Teachers"
    sql_on: ${teacher_chrome_facts.user_id}=${teachers.user_id} ;;
  }
  join: student_meet_facts {
    view_label: "Students"
    sql_on: ${student_meet_facts.user_id}=${students.user_id} ;;
  }
  join: teacher_meet_facts {
    view_label: "Teachers"
    sql_on: ${teacher_meet_facts.user_id}=${teachers.user_id} ;;
  }
  join: student_attendance_facts {
    view_label: "Students"
    sql_on: ${student_attendance_facts.student_id}=${students.user_id} ;;
  }
  join: topics {
    view_label: "Courses"
    sql_on: ${topics.topic_id}=${coursework.topic_id} ;;
  }
}

explore: meet_activities {
  view_label: "Meet Usage"
  join: meet_events {
    relationship: one_to_one
    view_label: "Meet Usage"
    sql_on: ${meet_activities.unique_idenitifier}= ${meet_events.id} ;;
  }
  join: student_profiles {
    relationship: many_to_one
    type: full_outer
    from: user_profiles
    view_label: "Students"
    fields: [student_profiles.name,student_profiles.email_address,student_profiles.photo_url]
#     sql_on: ${meet_activities.email} = ${student_profiles.email_address} ;;
    sql_on: ${meet_activities.user_id} = ${student_profiles.id} ;;
  }
  join: students {
    sql_where: ${students.user_id} is not null ;;
    relationship: one_to_one
    sql_on: ${students.user_id} = ${student_profiles.id} ;;
  }

  join: student_metadata {
    relationship: one_to_one
    sql_on: ${student_metadata.user_id}=${students.user_id} ;;
  }
  join: teacher_profiles {
    type: full_outer
    relationship: many_to_one
    from: user_profiles
    view_label: "Teachers"
    fields: [teacher_profiles.name,teacher_profiles.email_address,teacher_profiles.photo_url]
#     sql_on: ${meet_activities.email} = ${teacher_profiles.email_address} ;;
    sql_on: ${meet_activities.user_id} = ${teacher_profiles.id} ;;
  }
  join: teachers {
    sql_where: ${teachers.user_id} is not null ;;
    relationship: one_to_one
    sql_on: ${teachers.user_id} = ${teacher_profiles.id} ;;
  }
  join: meeting_facts {
    view_label: "Meet Usage"
    relationship: one_to_one
    sql_on: ${meeting_facts.meeting_code}=${meet_events.meeting_code} ;;
  }
  join: schools {
    relationship: many_to_one
    sql_on: ${schools.school_name}=${student_metadata.school} ;;
  }
  join: student_attendance_facts {
    view_label: "Students"
    sql_on: ${student_attendance_facts.student_id}=${students.user_id} ;;
  }
}

explore: meet_attendance {
  join: teacher_student_meet_facts {
    relationship: one_to_one
    type: full_outer
    sql_on: ${meet_attendance.student_id} = ${teacher_student_meet_facts.student_id}
    and ${meet_attendance.teacher_id} = ${teacher_student_meet_facts.teacher_id};;
  }
}

explore: chrome_usage {
  label: "Chrome Usage"
  join: student_profiles {
    type: full_outer
    relationship: many_to_one
    from: user_profiles
    view_label: "Students"
    fields: [student_profiles.name,student_profiles.email_address,student_profiles.photo_url]
    sql_on: ${chrome_usage.user} = ${student_profiles.email_address} ;;
  }
  join: students {
    relationship: one_to_one
     sql_on: ${students.user_id} = ${student_profiles.id} ;;
  }

  join: student_metadata {
    relationship: one_to_one
    sql_on: ${student_metadata.user_id}=${students.user_id} ;;
  }
  join: student_attendance_facts {
    view_label: "Students"
    sql_on: ${student_attendance_facts.student_id}=${students.user_id} ;;
  }
  join: teacher_profiles {
    type: full_outer
    relationship: many_to_one
    from: user_profiles
    view_label: "Teachers"
    fields: [teacher_profiles.name,teacher_profiles.email_address,teacher_profiles.photo_url]
    sql_on: ${chrome_usage.user} = ${teacher_profiles.email_address} ;;
  }
  join: teachers {
    relationship: one_to_one
    sql_on: ${teachers.user_id} = ${teacher_profiles.id} ;;
  }
  join: schools {
    relationship: many_to_one
    sql_on: ${chrome_usage.school_name} =${schools.school_name};;
  }

}

explore: data_science_inputs {}

explore: predicted_performance {}

explore: predicted_performance_evaluation {}

explore: predicted_performance_training {}

explore: predicted_performance_applied {
  join: teacher_profiles {
    type: left_outer
    relationship: many_to_one
    from: user_profiles
    view_label: "Teachers"
    fields: [teacher_profiles.name,teacher_profiles.email_address,teacher_profiles.photo_url]
#     sql_on: ${meet_activities.email} = ${teacher_profiles.email_address} ;;
    sql_on: ${predicted_performance_applied.teacher_id} = ${teacher_profiles.id} ;;
  }
  join: student_profiles {
    relationship: many_to_one
    type: left_outer
    from: user_profiles
    view_label: "Students"
    fields: [student_profiles.name,student_profiles.email_address,student_profiles.photo_url]
#     sql_on: ${meet_activities.email} = ${student_profiles.email_address} ;;
    sql_on: ${predicted_performance_applied.user_id} = ${student_profiles.id} ;;
  }
  join: student_metadata {
    fields: []
    relationship: one_to_one
    sql_on: ${student_metadata.user_id}=${student_profiles.id} ;;
  }
  join: schools {
    fields: [schools.school_district, schools.school_name]
    relationship: many_to_one
    sql_on: ${schools.school_name}=${student_metadata.school} ;;
  }
}
