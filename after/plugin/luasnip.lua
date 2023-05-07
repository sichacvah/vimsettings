local ls = require "luasnip"
local types = require "luasnip.util.types"
local extras = require("luasnip.extras")
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep
local i = ls.insert_node
local s = ls.s
local l = extras.lambda
local f = ls.function_node


ls.config.set_config {
  history = true,
  updateevents = "TextChanged, TextChangedI",
  enable_autosnippets = true,
  ext_opts = {
    [types.choiceNode] = {
      active = {
        virt_text = { { "<-", "Error" } }
      }
    }
  }
}

ls.add_snippets("typescript", {
  s("td", fmt("export type {} = TypedData<{}, {}>\nexport const make{} = (payload: {}): {} => ({{\n  type: {},\n  data: payload,\n}})", {
    i(1, "TD"),
    i(2, "Type"),
    i(3, "Payload"),
    rep(1),
    rep(3),
    rep(1),
    rep(2),
  })),
  s("etd", fmt("export type {} = TypedData<{}>\nexport const {inst}: {} = {{\n  type: {}\n}}", {
    i(1, "TD"),
    i(2, "Type"),
    rep(1, "TD"),
    rep(2, "Type"),
    inst = f(function (args, parent, user_arg)
      local word = args[1][1]
      return word:sub(1, 1):lower() .. word:sub(2, -1)
    end, {1}),
  })),
  s("smd", fmt("export const moduleDefinition: SingletonModuleDefinition<{}, {}> = {{\n  id: {},\n  uniqId: {},\n  init({}) {{\n    {}\n  }},\n  update({}, {}, {}) {{\n    {}\n  }},\n}}\nregModuleDefinition(moduleDefinition)", {
    i(1, "Msg"),
    i(2, "State"),
    i(3, "moduleId"),
    i(4, "uniqId"),
    i(5, "env"),
    i(6, "return next(initialState)"),
    i(7, "msg"),
    i(8, "state"),
    i(9, "env"),
    i(10, "return next(state)"),
  })),
  s("fmd", fmt("export const moduleDefinition: FeatureModuleDefinition<{}, {}> = {{\n  id: {},\n  init(env) {{\n    {}\n  }},\n  update(msg, state, env) {{\n    {}\n  }},\n}}\nregModuleDefinition(moduleDefinition)", {
    i(1, "Msg"),
    i(2, "State"),
    i(3, "moduleId"),
    i(4, "return next(initialState)"),
    i(5, "return next(state)"),
  }))
})



