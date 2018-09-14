require "util"

local Constants = require 'Constants'

local empty_sprite = {
  filename = "__core__/graphics/empty.png",
  width = 0,
  height = 0,
  frame_count = 1,
}

local overlay_icon = {
  icon = "__core__/graphics/arrows/indication-arrow-up-to-down.png",
  icon_size = 64,
  scale = 0.25,
  shift = {8, -8},
}

local function make_connector(ug)
  local name = ug.name.."-beltlayer-connector"
  local loader = util.table.deepcopy(ug)
  loader.type = "loader"
  loader.name = name
  loader.localised_name = {"entity-name.beltlayer-connector", ug.localised_name or {"entity-name."..ug.name}}
  loader.localised_description = {"entity-description.beltlayer-connector"}
  if loader.icons then
    table.insert(loader.icons, overlay_icon)
  else
    loader.icons = {
      {
        icon = ug.icon,
        icon_size = ug.icon_size,
      },
      overlay_icon,
    }
  end
  loader.minable.result = name
  loader.max_distance = nil
  loader.underground_sprite = nil
  loader.underground_remove_belts_sprite = nil
  loader.fast_replaceable_group = "beltlayer-connector"
  loader.filter_count = 0
  loader.container_distance = 0
  loader.belt_distance = 0

  return loader
end

for _, ug in pairs(data.raw["underground-belt"]) do
  local loader = make_connector(ug)
  data:extend{loader}
end

data:extend{
  {
    type = "container",
    name = "beltlayer-buffer",
    collision_box = {{-0.1, -0.1}, {0.1, 0.1}},
    collision_mask = {},
    flags = {"player-creation", "hide-alt-info", "not-blueprintable", "not-deconstructable"},
    inventory_size = Constants.CONNECTOR_CAPACITY,
    picture = empty_sprite,
  }
}