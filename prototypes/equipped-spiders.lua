--
-- from D:\Games\Factorio\data\base\prototypes\entity\entities.lua
--
local spidertron_animations = require("__base__.prototypes.entity.spidertron-animations")
local sounds = require("__base__.prototypes.entity.sounds")

function create_spidertron(arguments)
  
local scale = arguments.scale or 1
local leg_scale = scale * (arguments.leg_scale or 1)
local grid = arguments.grid or "spidertron-equipment-grid"

data:extend(
{
  {
    type = "item-with-entity-data",
    name = arguments.name,
    icon = "__base__/graphics/icons/spidertron.png",
    icon_tintable = "__base__/graphics/icons/spidertron-tintable.png",
    icon_tintable_mask = "__base__/graphics/icons/spidertron-tintable-mask.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "transport",
    order = "b[personal-transport]-c[spidertron]-a[spider]",
    place_result = arguments.name,
    stack_size = 1
  },
  {
    type = "spider-vehicle",
    name = arguments.name,
    collision_box = {{-1 * scale, -1 * scale}, {1 * scale, 1 * scale}},
    sticker_box = {{-1.5 * scale, -1.5 * scale}, {1.5 * scale, 1.5 * scale}},
    selection_box = {{-1 * scale, -1 * scale}, {1 * scale, 1 * scale}},
    drawing_box = {{-3 * scale, -4 * scale}, {3 * scale, 2 * scale}},
    icon = "__base__/graphics/icons/spidertron.png",
    mined_sound = {filename = "__core__/sound/deconstruct-large.ogg",volume = 0.8},
    open_sound = { filename = "__base__/sound/spidertron/spidertron-door-open.ogg", volume= 0.35 },
    close_sound = { filename = "__base__/sound/spidertron/spidertron-door-close.ogg", volume = 0.4 },
    sound_minimum_speed = 0.1,
    sound_scaling_ratio = 0.6,
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/spidertron/spidertron-vox.ogg",
        volume = 0.35
      },
      activate_sound =
      {
        filename = "__base__/sound/spidertron/spidertron-activate.ogg",
        volume = 0.5
      },
      deactivate_sound =
      {
        filename = "__base__/sound/spidertron/spidertron-deactivate.ogg",
        volume = 0.5
      },
      match_speed_to_activity = true
    },
    icon_size = 64, icon_mipmaps = 4,
    weight = 1,
    braking_force = 1,
    friction_force = 1,
    flags = {"placeable-neutral", "player-creation", "placeable-off-grid"},
    collision_mask = {},
    minable = {mining_time = 1, result = arguments.name},
    max_health = 3000,
    resistances =
    {
      {
        type = "fire",
        decrease = 15,
        percent = 60
      },
      {
        type = "physical",
        decrease = 15,
        percent = 60
      },
      {
        type = "impact",
        decrease = 50,
        percent = 80
      },
      {
        type = "explosion",
        decrease = 20,
        percent = 75
      },
      {
        type = "acid",
        decrease = 0,
        percent = 70
      },
      {
        type = "laser",
        decrease = 0,
        percent = 70
      },
      {
        type = "electric",
        decrease = 0,
        percent = 70
      }
    },
    minimap_representation =
    {
      filename = "__base__/graphics/entity/spidertron/spidertron-map.png",
      flags = {"icon"},
      size = {128, 128},
      scale = 0.5
    },
    corpse = "spidertron-remnants",
    dying_explosion = "spidertron-explosion",
    energy_per_hit_point = 1,
    guns = { "spidertron-rocket-launcher-1", "spidertron-rocket-launcher-2", "spidertron-rocket-launcher-3", "spidertron-rocket-launcher-4" },
    inventory_size = 80,
    equipment_grid = grid,
    trash_inventory_size = 20,
    height = 1.5  * scale * leg_scale,
    torso_rotation_speed = 0.005,
    chunk_exploration_radius = 3,
    selection_priority = 51,
    graphics_set = spidertron_torso_graphics_set(scale),
    energy_source =
    {
      type = "void"
    },
    movement_energy_consumption = "250kW",
    automatic_weapon_cycling = true,
    chain_shooting_cooldown_modifier = 0.5,
    spider_engine =
    {
      legs =
      {
        { -- 1
          leg = arguments.name .. "-leg-1",
          mount_position = util.by_pixel(15  * scale, -22 * scale),--{0.5, -0.75},
          ground_position = {2.25  * leg_scale, -2.5  * leg_scale},
          blocking_legs = {2},
          leg_hit_the_ground_trigger = get_leg_hit_the_ground_trigger()
        },
        { -- 2
          leg = arguments.name .. "-leg-2",
          mount_position = util.by_pixel(23  * scale, -10  * scale),--{0.75, -0.25},
          ground_position = {3  * leg_scale, -1  * leg_scale},
          blocking_legs = {1, 3},
          leg_hit_the_ground_trigger = get_leg_hit_the_ground_trigger()
        },
        { -- 3
          leg = arguments.name .. "-leg-3",
          mount_position = util.by_pixel(25  * scale, 4  * scale),--{0.75, 0.25},
          ground_position = {3  * leg_scale, 1  * leg_scale},
          blocking_legs = {2, 4},
          leg_hit_the_ground_trigger = get_leg_hit_the_ground_trigger()
        },
        { -- 4
          leg = arguments.name .. "-leg-4",
          mount_position = util.by_pixel(15  * scale, 17  * scale),--{0.5, 0.75},
          ground_position = {2.25  * leg_scale, 2.5  * leg_scale},
          blocking_legs = {3},
          leg_hit_the_ground_trigger = get_leg_hit_the_ground_trigger()
        },
        { -- 5
          leg = arguments.name .. "-leg-5",
          mount_position = util.by_pixel(-15 * scale, -22 * scale),--{-0.5, -0.75},
          ground_position = {-2.25 * leg_scale, -2.5 * leg_scale},
          blocking_legs = {6, 1},
          leg_hit_the_ground_trigger = get_leg_hit_the_ground_trigger()
        },
        { -- 6
          leg = arguments.name .. "-leg-6",
          mount_position = util.by_pixel(-23 * scale, -10 * scale),--{-0.75, -0.25},
          ground_position = {-3 * leg_scale, -1 * leg_scale},
          blocking_legs = {5, 7},
          leg_hit_the_ground_trigger = get_leg_hit_the_ground_trigger()
        },
        { -- 7
          leg = arguments.name .. "-leg-7",
          mount_position = util.by_pixel(-25 * scale, 4 * scale),--{-0.75, 0.25},
          ground_position = {-3 * leg_scale, 1 * leg_scale},
          blocking_legs = {6, 8},
          leg_hit_the_ground_trigger = get_leg_hit_the_ground_trigger()
        },
        { -- 8
          leg = arguments.name .. "-leg-8",
          mount_position = util.by_pixel(-15 * scale, 17 * scale),--{-0.5, 0.75},
          ground_position = {-2.25 * leg_scale, 2.5 * leg_scale},
          blocking_legs = {7},
          leg_hit_the_ground_trigger = get_leg_hit_the_ground_trigger()
        }
      },
      military_target = "spidertron-military-target"
    }
  },
  make_spidertron_leg(arguments.name, leg_scale, arguments.leg_thickness, arguments.leg_movement_speed, 1),
  make_spidertron_leg(arguments.name, leg_scale, arguments.leg_thickness, arguments.leg_movement_speed, 2),
  make_spidertron_leg(arguments.name, leg_scale, arguments.leg_thickness, arguments.leg_movement_speed, 3),
  make_spidertron_leg(arguments.name, leg_scale, arguments.leg_thickness, arguments.leg_movement_speed, 4),
  make_spidertron_leg(arguments.name, leg_scale, arguments.leg_thickness, arguments.leg_movement_speed, 5),
  make_spidertron_leg(arguments.name, leg_scale, arguments.leg_thickness, arguments.leg_movement_speed, 6),
  make_spidertron_leg(arguments.name, leg_scale, arguments.leg_thickness, arguments.leg_movement_speed, 7),
  make_spidertron_leg(arguments.name, leg_scale, arguments.leg_thickness, arguments.leg_movement_speed, 8),
})
end
--
--  new locked grid
--
data:extend(
{
  {
    type = "equipment-grid",
    name = "spidertron-equipment-grid-locked",
    width = 10,
    height = 6,
    locked = true,
    equipment_categories = {"armor"}
  }
}
)
--
-- creating a new spider
--
function create_new_spider(name_of_new_spider, ingredients_of_new_spider)
create_spidertron
{
    name = name_of_new_spider,
    grid = "spidertron-equipment-grid-locked",
    leg_movement_speed = 1,
    leg_thickness = 1
}
data:extend(
{
  {
    type = "recipe",
    name = name_of_new_spider,
    enabled = false,
    ingredients = ingredients_of_new_spider,
    result = name_of_new_spider,
    result_count = 1,
    energy = 1
  }
}
)
table.insert(
    data.raw["technology"]["spidertron"].effects,
    {
        type = "unlock-recipe",
        recipe = name_of_new_spider
    }
)
end

-- #########################################
-- spider-fast
-- #########################################
create_new_spider
(
    "spider-fast",
    {
        {"spidertron", 1},
        {"fusion-reactor-equipment", 1},
        {"exoskeleton-equipment", 3},
        {"battery-mk2-equipment", 4},
        {"personal-laser-defense-equipment", 1},
        {"personal-roboport-mk2-equipment", 1},
        {"solar-panel-equipment", 3},
        {"belt-immunity-equipment", 1}
    }
)
