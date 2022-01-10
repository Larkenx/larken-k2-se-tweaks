local util = {}
-------------------------------------------------------------------------------
function util.has_value(tab, val)
  for index, value in ipairs(tab) do
    if value == val then
      return true
    end
  end

  return false
end

-------------------------------------------------------------------------------
function util.get_recipe_name(recipe)
  if recipe.name ~= nil then
    return recipe.name
  end
  local main_product = recipe.main_product
  if main_product == nil then
    if recipe.results and recipe.results[0] then
      return recipe.results[0].name
    elseif recipe.result and recipe.result.name then
      return recipe.result.name
    elseif recipe.result and recipe.result ~= nil then
      return recipe.result
    end
  else
    return main_product
  end
end
-------------------------------------------------------------------------------
function util.remove_ingredient(recipe, name)
  for i = #recipe.ingredients, 1, -1 do
    if recipe.ingredients[i] then
      for _, value in pairs(recipe.ingredients[i]) do
        if value == name then
          table.remove(recipe.ingredients, i)
        end
      end
    end
  end
end
-------------------------------------------------------------------------------
function util.remove_result(recipe, name)
  for i = #recipe.results, 1, -1 do
    if recipe.results[i] then
      for _, value in pairs(recipe.results[i]) do
        if value == name then
          table.remove(recipe.results, i)
        end
      end
    end
  end
end
-------------------------------------------------------------------------------

return util
