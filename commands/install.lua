return function ()
  local uv = require('uv')
  local core = require('core')()
  local dist = nil
  for i=2,#args do
    if args[i]=='-d' then
      dist = args[i+1]
      table.remove(args,i+1)
      table.remove(args,i)
      break
    end
  end

  if #args < 2 then
    core.installDeps(uv.cwd(), dist)
  else
    local list = {}
    for i = 2, #args do
      list[#list + 1] = args[i]
    end
    core.installList(uv.cwd(), list, dist)
  end
end
