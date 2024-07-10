--[[
    A Pandoc lua filter that unnumbers headers.
    It inserts the unnumbered class to all headers without the class.
    Author: Christopher T. Kenny
--]]
function Header(el)
    if not el.classes:includes('unnumbered') then
        el.classes:insert('unnumbered')
    end
    return el
end
