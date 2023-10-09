# Util-Lite
Basic Utilization Monitoring Tool For Linux Systems

# How To Use

# Sh

``` bash
chmod +x util-lite.sh
```

``` bash
./util-lite.sh
```

``` bash
RAM: 3686MB / 31776MB
RAM Usage: [=====                                             ] 11%

Swap: 0MB / 2047MB
Swap Usage: [                                                  ] 0%

CPU Cores: 20
CPU: 11%
CPU Usage: [=====                                             ] 11%
```

**_Note: If you'd like to change the symbols for RAM, CPU, and Swap area, you can use the following parameters: -r for RAM, -c for CPU, and -s for Swap._** 

``` bash
./util-lite.sh -c "c" -s "s" -r "r"
```

```
RAM: 3663MB / 31776MB
RAM Usage: [rrrrr                                             ] 11%

Swap: 0MB / 2047MB
Swap Usage: [                                                  ] 0%

CPU Cores: 20
CPU: 11%
CPU Usage: [ccccc                                             ] 11%

```
