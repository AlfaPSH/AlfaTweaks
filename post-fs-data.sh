#!/system/bin/sh
MODDIR=${0%/*}

setprop persist.sys.performance_mode 1

# CPU Governor and frequencies for battery life
for cpu in /sys/devices/system/cpu/cpu[0-9]*; do
    echo "schedutil" > $cpu/cpufreq/scaling_governor
    echo 600000 > $cpu/cpufreq/scaling_min_freq
    echo 1600000 > $cpu/cpufreq/scaling_max_freq
    
    # Slower frequency scaling for better battery
    echo 50000 > $cpu/cpufreq/schedutil/up_rate_limit_us
    echo 100000 > $cpu/cpufreq/schedutil/down_rate_limit_us
done

# Disable CPU boost for battery savings
echo 0 > /sys/module/cpu_boost/parameters/input_boost_enabled

# GPU settings for battery life
if [ -d /sys/class/kgsl/kgsl-3d0 ]; then
    echo "powersave" > /sys/class/kgsl/kgsl-3d0/devfreq/governor
    echo 0 > /sys/class/kgsl/kgsl-3d0/force_bus_on
    echo 0 > /sys/class/kgsl/kgsl-3d0/force_rail_on
    echo 0 > /sys/class/kgsl/kgsl-3d0/force_clk_on
fi

# Conservative ZRAM settings
echo lz4 > /sys/block/zram0/comp_algorithm
echo 30 > /proc/sys/vm/swappiness
echo 150 > /proc/sys/vm/vfs_cache_pressure

# Conservative LMK
echo 0 > /sys/module/lowmemorykiller/parameters/enable_adaptive_lmk
echo 73728,86016,98304,122880,159744,204800 > /sys/module/lowmemorykiller/parameters/minfree

# I/O Scheduler for better battery life
for blk in /sys/block/*/queue/scheduler; do
    echo cfq > $blk 2>/dev/null || echo bfq > $blk 2>/dev/null || echo noop > $blk
done

exit 0
