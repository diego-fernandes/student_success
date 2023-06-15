view: materials {
  drill_fields: [id, title, type]
  dimension: id {
    hidden: yes
    primary_key: yes
    sql: {% if _view._name == 'announcement_materials' %} concat(${announcements.id},'-',${alternate_link})
          {% else %} concat(${coursework.id},'-',${alternate_link})
          {% endif %};;
  }

  dimension: type {
    group_label: "Materials"
    type: string
    sql: case when ${TABLE} like '%driveFile%' then 'Google Drive File'
              when ${TABLE} like '%youtubeVideo%' then 'Youtube Video'
              when ${TABLE} like '%form%' then 'Google Form'
              else 'Link' end;;
  }

  dimension: title {
    group_label: "Materials"
    type: string
    link: {
      label: "View Material"
      icon_url: "https://cdn.worldvectorlogo.com/logos/google-classroom.svg"
      url: "{{ alternate_link._value }}"
    }
    sql: case when ${type} = 'Google Drive File' then JSON_EXTRACT(${TABLE},'$.driveFile.driveFile.title')
               when ${type} = 'YouTube Video' then JSON_EXTRACT(${TABLE},'$.youtubeVideo.title')
              when ${type} = 'Google Form' then JSON_EXTRACT(${TABLE},'$.form.title')
              else JSON_EXTRACT(${TABLE},'$.link.title')  end
            ;;
  }

  dimension: alternate_link {
    hidden: yes
    group_label: "Materials"
    type: string
    sql: case when ${type} = 'Google Drive File' then JSON_EXTRACT(${TABLE},'$.driveFile.driveFile.alternateLink')
               when ${type} = 'Youtube Video' then JSON_EXTRACT(${TABLE},'$.youtubeVideo.alternateLink')
              when ${type} = 'Google Form' then JSON_EXTRACT(${TABLE},'$.form.alternateLink')
              else JSON_EXTRACT(${TABLE},'$.link.alternateLink')  end
            ;;
  }

  measure: count {
    group_label: "Materials"
    label: "Number of Materials"
    type: count
  }

  measure: count_videos {
    group_label: "Materials"
    label: "Number of YouTube Videos"
    type: count
    filters: [
      type: "YouTube Video"
    ]
  }

  measure: count_forms {
    group_label: "Materials"
    label: "Number of Google Forms"
    type: count
    filters: [
      type: "Google Forms"
    ]
  }

  measure: count_docs {
    group_label: "Materials"
    label: "Number of Google Drive Files"
    type: count
    filters: [
      type: "Google Drive File"
    ]
  }
}



#
# view: coursework_materials {
#   extends: [materials]
#
#   dimension: id {
#     primary_key: yes
#     sql:  ;;
#   }
# }
#
# view: announcement_materials {
#   extends: [materials]
#
#   dimension: id {
#     primary_key: yes
#     sql: concat(${announcement_id} ;;
#   }
# }
