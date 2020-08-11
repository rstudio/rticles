--[[
     A Pandoc 2 lua filter that allow to add short title to Latex section. 
     It takes information for Header in the AST and create Raw Tex content in place.
     Author: Christophe Dervieux
--]]
function Header(el)
  local options = el.attributes['short-title']
  if options == nil then return nil end
  -- which latex command for the header
  local HeaderLevel = { 'chapter', 'section', 'subsection', 'subsubsection', 'paragraph', 'subparagraph'}
  -- write raw Latex
  table.insert(
      el.content, 1,
      pandoc.RawInline('tex', '\\' .. HeaderLevel[el.level + 1] .. '['.. options .. ']{')
  )
  table.insert(
      el.content,
      pandoc.RawInline('tex', '}')
  )
  table.insert(
    el.content,
    pandoc.RawInline('tex', '\\label{'.. el.identifier .. '}')
  )
  -- transform the header to param
  return pandoc.Para(el.content)
end
