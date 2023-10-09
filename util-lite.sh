#!/bin/bash

cpu_symbol="="
ram_symbol="="
swap_symbol="="

generate_cpu_graph() {
  cpu_percentage="$1"
  cpu_cores="$2"
  cpu_graph_symbol="$3"

  cpu_percentage=${cpu_percentage%\%}
  cpu_blocks=$((cpu_percentage / 2))
  free_blocks=$((50 - cpu_blocks))

  graph="["
  for ((i = 0; i < cpu_blocks; i++)); do
    graph+="$cpu_graph_symbol"
  done
  for ((i = 0; i < free_blocks; i++)); do
    graph+=" "
  done
  graph+="] ${cpu_percentage}%"

  echo ""
  echo "CPU Cores: $cpu_cores"
  echo "CPU: ${cpu_percentage}%"
  echo "CPU Usage: $graph"
}

generate_usage_graph() {
  used="$1"
  total="$2"
  symbol="$3"
  label="$4"

  used_percentage=$((used * 100 / total))

  used_blocks=$((used_percentage / 2))
  free_blocks=$((50 - used_blocks))

  graph="["
  for ((i = 0; i < used_blocks; i++)); do
    graph+="$symbol"
  done
  for ((i = 0; i < free_blocks; i++)); do
    graph+=" "
  done
  graph+="] $used_percentage%"

  echo ""
  echo "$label: ${used}MB / ${total}MB"
  echo "${label} Usage: $graph"
}

while getopts "c:r:s:" opt; do
  case "$opt" in
    c)
      cpu_symbol="$OPTARG"
      ;;
    r)
      ram_symbol="$OPTARG"
      ;;
    s)
      swap_symbol="$OPTARG"
      ;;
  esac
done

while true; do
  ram_info=$(free -m | awk 'NR==2{print $2, $3}')

  total_ram=$(echo "$ram_info" | awk '{print $1}')
  used_ram=$(echo "$ram_info" | awk '{print $2}')

  swap_info=$(free -m | awk 'NR==3{print $2, $3}')

  total_swap=$(echo "$swap_info" | awk '{print $1}')
  used_swap=$(echo "$swap_info" | awk '{print $2}')

  cpu_usage=$(top -b -n 1 | awk '/%Cpu/{print 100 - $8"%"}')
  
  cpu_cores=$(nproc)

  clear

  generate_usage_graph "$used_ram" "$total_ram" "$ram_symbol" "RAM"

  generate_usage_graph "$used_swap" "$total_swap" "$swap_symbol" "Swap"

  generate_cpu_graph "$cpu_usage" "$cpu_cores" "$cpu_symbol"

  sleep 1
done
root@Latitude-5440 bash(keystone)# cat util-lite.sh 
#!/bin/bash

cpu_symbol="="
ram_symbol="="
swap_symbol="="

generate_cpu_graph() {
  cpu_percentage="$1"
  cpu_cores="$2"
  cpu_graph_symbol="$3"

  cpu_percentage=${cpu_percentage%\%}
  cpu_blocks=$((cpu_percentage / 2))
  free_blocks=$((50 - cpu_blocks))

  graph="["
  for ((i = 0; i < cpu_blocks; i++)); do
    graph+="$cpu_graph_symbol"
  done
  for ((i = 0; i < free_blocks; i++)); do
    graph+=" "
  done
  graph+="] ${cpu_percentage}%"

  echo ""
  echo "CPU Cores: $cpu_cores"
  echo "CPU: ${cpu_percentage}%"
  echo "CPU Usage: $graph"
}

generate_usage_graph() {
  used="$1"
  total="$2"
  symbol="$3"
  label="$4"

  used_percentage=$((used * 100 / total))

  used_blocks=$((used_percentage / 2))
  free_blocks=$((50 - used_blocks))

  graph="["
  for ((i = 0; i < used_blocks; i++)); do
    graph+="$symbol"
  done
  for ((i = 0; i < free_blocks; i++)); do
    graph+=" "
  done
  graph+="] $used_percentage%"

  echo ""
  echo "$label: ${used}MB / ${total}MB"
  echo "${label} Usage: $graph"
}

while getopts "c:r:s:" opt; do
  case "$opt" in
    c)
      cpu_symbol="$OPTARG"
      ;;
    r)
      ram_symbol="$OPTARG"
      ;;
    s)
      swap_symbol="$OPTARG"
      ;;
  esac
done

while true; do
  ram_info=$(free -m | awk 'NR==2{print $2, $3}')

  total_ram=$(echo "$ram_info" | awk '{print $1}')
  used_ram=$(echo "$ram_info" | awk '{print $2}')

  swap_info=$(free -m | awk 'NR==3{print $2, $3}')

  total_swap=$(echo "$swap_info" | awk '{print $1}')
  used_swap=$(echo "$swap_info" | awk '{print $2}')

  cpu_usage=$(top -b -n 1 | awk '/%Cpu/{print 100 - $8"%"}')
  
  cpu_cores=$(nproc)

  clear

  generate_usage_graph "$used_ram" "$total_ram" "$ram_symbol" "RAM"

  generate_usage_graph "$used_swap" "$total_swap" "$swap_symbol" "Swap"

  generate_cpu_graph "$cpu_usage" "$cpu_cores" "$cpu_symbol"

  sleep 1
done
