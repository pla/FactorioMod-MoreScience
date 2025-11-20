--require "graphics/screenshots/science-order" --   <<<-- for screenshot purpose only

-- technology tree cleanup
local containsExtension = false
for _,extension in pairs{
  -- when modules present, we don't remove redundant prerequisites here
  --"ScienceCostTweakerExtension",
  --"BobAngelsExtension",
} do
  if mods["MoreScience-" .. extension] then
    containsExtension = true
    break
  end
end
if not containsExtension then
  LSlib.utils.log.log("----- Cleaning up the tech tree -----")
  LSlib.technology.removeAllRedundantPrerequisites()
end

-- compat with bzgas
if mods["bzgas2"] then
  LSlib.recipe.editIngredient("lab-mk0", "electronic-circuit", "copper-cable")
  LSlib.recipe.addIngredient("lab", "electronic-circuit", 10, "item")
  LSlib.technology.moveRecipeUnlock("basic-automation", "electronics", "lab")
  LSlib.technology.moveRecipeUnlock("electronics", "basic-automation", "lab-mk0")
end

