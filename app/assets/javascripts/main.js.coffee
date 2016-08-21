Items = {
  data: {}

  # maintain a master hash
  # of everything we've seen
  update: (targetId, content) ->
    this[targetId] = []
    for item, id in content
      this.data[item.id] = content[id]
      this[targetId].push item.id
}

setSelector = (id, item, options) ->
  origLength = item.length_mm
  selector = $("#select_" + id)

  # reset the selector to empty and add blank option
  selector.html("<option />")

  for optId in options
    opt = Items.data[optId]
    multStr = (opt.length_mm / origLength).toFixed(1)
    nameStr = opt.name + " (" + multStr + "x)"
    selector.append("<option value=''" + optId + "'>" + nameStr + "</option>")

initSelector = (nextId, currentId, lookup) ->
  $("select#select_" + currentId).change ->
    me = $(this)
    iid = me.val()
    $.ajax({
      url: "/items/" + lookup + "/" + iid,
      success: (result) ->
        # set the selected item to an object
        # while the options are an array
        Items[currentId] = result.requested
        Items.update(nextId, result.found)
        setSelector(nextId, Items[currentId], Items[nextId])
        $("span." + currentId).text(result.requested.name) # set *all* orig spans
        # #nextId is the div
        $("#" + nextId).show()
      })

initPickers = ->
  initSelector("tenx", "orig", "tenx")
  initSelector("hunx", "tenx", "tenx")

$(document).ready initPickers
