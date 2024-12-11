local function getLetter(counter)
    if counter < 1 or counter > 26 then
        return nil  -- Return nil for invalid input
    end
    local letter = string.char(counter + 64)  -- 64 is used because ASCII value of 'A' is 65
    return letter
end

local function process_div(div)
  if div.classes:includes("acknowledgments") then
    if #div.content and #div.content[1].content then
      div.content[1].content:insert(1, pandoc.RawInline("latex", "\\acknowledgments\n"))
    elseif #div.content then
      div.content:insert(1, pandoc.RawInline("latex", "\\acknowledgments\n"))
    end
    return div.content
  end
  if div.classes:includes("datastatement") then
    if #div.content and #div.content[1].content then
      div.content[1].content:insert(1, pandoc.RawInline("latex", "\\datastatement\n"))
    elseif #div.content then
      div.content:insert(1, pandoc.RawInline("latex", "\\datastatement\n"))
    end
    return div.content
  end
  if div.classes:includes("appendix") then
    nb_appendix = 0
    div.content:walk({
      Header = function(h)
        if h.level == 1 then
          nb_appendix = nb_appendix + 1
        end
      end
    })
    if nb_appendix > 0 then
      local counter = 0
      return div.content:walk({
        traverse = 'topdown',
        Header = function(h)
          if h.level == 1 then
            counter = counter + 1
            local appendix
            if nb_appendix == 1 then
              appendix = pandoc.RawInline("latex", "\\appendix\n")
            else
              appendix = pandoc.RawInline("latex", string.format("\\appendix[%s]\n", getLetter(counter)))
            end
            h.content:insert(1, pandoc.RawInline("latex", "\\appendixtitle{"))
            h.content:insert(pandoc.RawInline("latex", "}"))
            h.content:insert(1, appendix)
            return { h.content }
          elseif h.level == 2 then
            local star = ""
            if h.classes:includes("unnumbered") then
              star = "*"
            end
            h.content:insert(1, pandoc.RawInline("latex", string.format("\\subsection%s{", star)))
            h.content:insert(pandoc.RawInline("latex", "}"))
            return { h.content}
          end
        end
      })
    end
  end
  return div.content
end

return {
  Div = process_div,
}
