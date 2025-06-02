local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node
local fmt = require("luasnip.extras.fmt").fmt
-- local rep = require("luasnip.extras").rep
local sn = ls.snippet_node
local d = ls.dynamic_node

local function breakable_mirror(pos, ref)
  return d(pos, function(args)
    return sn(nil, {
      i(1, args[1][1]), -- insert node pre-filled with the mirrored value
    })
  end, {ref})
end

return {
  -- LOG statement (openstack)
  s("logo", fmt('LOG.{}("{} %({})s", {{"{}": {}}})', {
    c(1, { t("debug"), t("error"), t("info"), t("warning"), t("critical"), t("exception") }),
    i(2, "sometext"),
    i(3, "var"),
    breakable_mirror(4, 3),
    breakable_mirror(5, 3),
  })),

  -- LOG.debug (openstack)
  s("logd", fmt('LOG.debug("{} %({})s", {{"{}": {}}})', {
    i(1, "sometext"),
    i(2, "var"),
    breakable_mirror(3, 2),
    breakable_mirror(4, 2),
  })),

  -- LOG.info (openstack)
  s("logi", fmt('LOG.info("{} %({})s", {{"{}": {}}})', {
    i(1, "sometext"),
    i(2, "var"),
    breakable_mirror(3, 2),
    breakable_mirror(4, 2),
  })),

  -- LOG.error (openstack)
  s("loge", fmt('LOG.error("{} %({})s", {{"{}": {}}})', {
    i(1, "sometext"),
    i(2, "var"),
    breakable_mirror(3, 2),
    breakable_mirror(4, 2),
  })),
}
