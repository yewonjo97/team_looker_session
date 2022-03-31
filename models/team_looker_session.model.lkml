connection: "team_looker_session"

# include all the views
include: "/views/**/*.view"

datagroup: team_looker_session_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: team_looker_session_default_datagroup

# explore: bm_d_time_range_cd {}

# explore: bm_d_passenger_type_cd {}

explore: joey_bm_f_passenger_subway_dd {
  label: "team-looker-session"
  from: joey_bm_f_passenger_subway_dd
  join: bm_d_passenger_type_cd {
    type: left_outer
    relationship: many_to_one
    sql_on: ${joey_bm_f_passenger_subway_dd.passenger_type_cd} = ${bm_d_passenger_type_cd.passenger_type_cd} ;;
  }
  join: bm_d_time_range_cd {
    type: left_outer
    relationship: many_to_one
    sql_on: ${joey_bm_f_passenger_subway_dd.tm_range_cd} = ${bm_d_time_range_cd.tm_range_cd} ;;
  }
  sql_always_where: ${rush_hours} <> '보통시간' ;;
}
