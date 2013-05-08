You need VLC to be installed for this panel to work.

If you're using 32-bit Windows or a different partition for Windows, change the VLC program path in config.

You can add your own playlists by copying them in the Radio folder, then you need to edit StationLink to point to the playlist file.

For example:

Station1Link=yourplaylist.pls
Station1Title=your playlist name

How to get station playlists:

; Go to http://shoutcast.com/
;
; Search for a choose the stations you want
; Download the .pls file for a station.  It
; will be called "tunein-station.pls".  After
; you download it, rename it something else
; and place it in your Radio folder.
; Then just replace the name and description
; in the [Variables] section of this .ini file.