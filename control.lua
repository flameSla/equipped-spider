script.on_event(defines.events.on_built_entity, function(event)
  if event.created_entity.name == "spider-fast" then
    local grid = event.created_entity.grid
    grid.put{name="fusion-reactor-equipment"}
    grid.put{name="exoskeleton-equipment"}
    grid.put{name="exoskeleton-equipment"}
    grid.put{name="exoskeleton-equipment"}
    grid.put{name="battery-mk2-equipment"}
    grid.put{name="battery-mk2-equipment"}
    grid.put{name="battery-mk2-equipment"}
    grid.put{name="battery-mk2-equipment"}
    grid.put{name="personal-laser-defense-equipment"}
    grid.put{name="personal-roboport-mk2-equipment"}
    grid.put{name="solar-panel-equipment"}
    grid.put{name="belt-immunity-equipment"}
    grid.put{name="solar-panel-equipment"}
    grid.put{name="solar-panel-equipment"}
  end
end)