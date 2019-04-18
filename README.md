pimatic filebrowser plugin
===========================
Pimatic plugin to provide a simple web file browser for a local directory.

Configuration:
--------------

    {
       "plugin": "filebrowser",
       "mappings": [
         {
           "path": "/files",
           "directory": "/media/usb1"
         }
       ]
     }

With this config you can browse your files in `/media/usb1` with `http://your-ip/files`.
 Make sure you reboot pimatic after applying these settings or you will get 
 a `Cannot GET /files` error message.
