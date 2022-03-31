view: bm_d_transfer_station {
  sql_table_name: `project_a_team.bm_d_transfer_station`
    ;;

  dimension: station_cd {
    type: number
    sql: ${TABLE}.station_cd ;;
  }

  dimension: station_nm {
    type: string
    sql: ${TABLE}.station_nm ;;
  }

  dimension: subway_route_nm {
    type: number
    sql: ${TABLE}.subway_route_nm ;;
  }

  dimension: transfer {
    type: string
    sql: ${TABLE}.transfer ;;
  }

  dimension: transfer_line_cnt {
    type: number
    sql: ${TABLE}.transfer_line_cnt ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
