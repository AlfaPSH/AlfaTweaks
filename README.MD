# Advanced Kernel Optimizer

This script performs advanced tweaks to optimize kernel performance on Android devices.

# IMPORTANT
### No magisk
### Mostly made for Custom ROMS

## Main functions

- Configuration of the **LMKD (Low Memory Killer Daemon)**.
- Changing the ZRAM compression algorithm to **lz4**.
- Scheduler and **CPU governor** adjustments.
- Loading additional kernel modules.
- Generating log files.

## Log Location

Log files are generated in:

/data/local/tmp

## Preferences

- Script was made for Redmi 10c.
- Working on LineageOS, AOSP or Pixel based ROMS, some errors on stock ROMS.
- Working on stock kernel of AOSP based ROMS.
- I've tried on some other phones and there were no errors.

## Mode

- This script has two modes, each can be easily changed by pressing the action button on KSU manager app 
- The first mode is a battery optimization mode, activated by default as boot, wich aims to save battery without losing anything
- The second one is a complete optimization mode, it optimizes the phone A LOT but uses 25% more battery
- When changing mode a notification should appear saying with mode it's been changed to.

## Responsability

- I am not responsible for any bootloop, brick or any error that apper to you phone
- I am also not responsible for any bank details stole, nuclear war or any of that shit.

## Developer

- Im AlfaPSH, android developer, main kotlin programmer.
- For any doubt on errors contact me on Issues.
- I port android ROMS and develop KSU modules, mostly to tune kernel values.
- All my modules are ONLY functional with ksu, no magisk.
