# #pimatic-filebrowser plugin config options
module.exports = {
  title: "pimatic-filebrowser plugin config options"
  type: "object"
  properties: {
    mappings:
      description: "Maps directories to the URL paths of pimatic"
      type: "array"
      default: []
      format: "table"
      items:
        type: "object"
        properties:
          path:
            type: "string"
            description: "The URL path, e.g., /files. Should start with /"
          directory:
            type: "string"
            description: "The absolute directory path, e.g., /media/usb1"
          hidden:
            type: "boolean"
            description: "Display hidden (dot) files"
            default: false
          view:
            enum: ["tiles", "details"]
            description: "Display mode: tiles and details are available"
            default: "tiles"
  }
}