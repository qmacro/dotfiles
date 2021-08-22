cat << EOF
# Strava Statistics

## Runs Year To Date

|Statistic|Value|
|-|-|
|Count|$(v '.ytd_run_totals.count')|
|Distance (km)|$(v '(.ytd_run_totals.distance/1000|floor)')|
|Time (hr)|$(v '(.ytd_run_totals.elapsed_time/3600|floor)')|
|Elevation (m)|$(v '.ytd_run_totals.elevation_gain')|

## Runs Total

|Statistic|Value|
|-|-|
|Count|$(v '.all_run_totals.count')|
|Distance (km)|$(v '(.all_run_totals.distance/1000|floor)')|
|Time (hr)|$(v '(.all_run_totals.elapsed_time/3600|floor)')|
|Elevation (m)|$(v '.all_run_totals.elevation_gain')|
EOF
