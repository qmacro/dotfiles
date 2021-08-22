cat << EOF
# Strava Statistics

## Latest Run

|Statistic|Value|
|-|-|
|Start Time|$(v '[.[]|select(.type=="Run")][0] | .start_date_local')|
|Distance (km)|$(v '[.[]|select(.type=="Run")][0] | .distance/1000')|
|Total Elevation (m)|$(v '[.[]|select(.type=="Run")][0] | .total_elevation_gain')|
|Elapsed Time|$(v '[.[]|select(.type=="Run")][0] | map([.elapsed_time/60, .elapsed_time%60 ])')|
EOF
