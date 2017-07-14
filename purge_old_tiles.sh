# ----------------------------------------------------------------------------
# purge_old_tiles.sh
#
# When a tile is marked "dirty" the access time is set to a long time ago
# (20 years ago in the standard mod_tile; 10k days or about 27 years in my
# version)
# If it is left dirty for 3 months, it'll appear to have been last accessed
# > 243 months ago.
# Higher zoom tiles that aren't dirtied have to be looked for using more a 
# recent modification time.
# Lower zoom tiles that aren't dirtied likewise, but we're more tolerant of
# older tiles.
# ----------------------------------------------------------------------------
find /var/lib/mod_tile/ajt -type f ! -newermt `date +%Y%m%d --date="243 month ago"` -exec rm {} \; -print
#
find /var/lib/mod_tile/ajt/19 -type f ! -newermt `date +%Y%m%d --date="3 month ago"` -exec rm {} \; -print
find /var/lib/mod_tile/ajt/2? -type f ! -newermt `date +%Y%m%d --date="3 month ago"` -exec rm {} \; -print
#
find /var/lib/mod_tile/ajt/12 -type f ! -newermt `date +%Y%m%d --date="6 month ago"` -exec rm {} \; -print
find /var/lib/mod_tile/ajt/11 -type f ! -newermt `date +%Y%m%d --date="6 month ago"` -exec rm {} \; -print
find /var/lib/mod_tile/ajt/10 -type f ! -newermt `date +%Y%m%d --date="6 month ago"` -exec rm {} \; -print
find /var/lib/mod_tile/ajt/? -type f ! -newermt `date +%Y%m%d --date="6 month ago"` -exec rm {} \; -print
#
