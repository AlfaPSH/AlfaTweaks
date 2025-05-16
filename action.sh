#!/system/bin/sh
MODDIR=${0%/*}
OPT_SCRIPT="$MODDIR/optimizing.sh"
BAT_SCRIPT="$MODDIR/post-fs-data.sh"
PROP_KEY="persist.sys.performance_mode"

# Detect current mode
CURRENT_MODE=$(getprop "$PROP_KEY")

# Toggle and apply
if [ "$CURRENT_MODE" = "0" ]; then
    setprop "$PROP_KEY" 1
    sh "$OPT_SCRIPT" > /dev/null 2>&1
    cmd notification post -S bigtext -t "AlfaBoost" "Modo Estabilidad Activado" "Optimizaciones para batería aplicadas." > /dev/null 2>&1
else
    setprop "$PROP_KEY" 0
    sh "$BAT_SCRIPT" > /dev/null 2>&1
    cmd notification post -S bigtext -t "AlfaBoost" "Modo Rendimiento Activado" "Optimizaciones avanzadas aplicadas." > /dev/null 2>&1
fi

exit 0