using Genie, Genie.Router, Genie.Requests, GenieAutoReload
using IndecesController, PrefixsController, InfixsController

route("/", IndecesController.index, named = :get_index)

route("/prefix", named = :get_prefix) do
  expr = haskey(@params, :expression) ? @params(:expression) : nothing
  PrefixsController.calc(expr)
end

route("/infix", named = :get_infix) do
  expr = haskey(@params, :expression) ? @params(:expression) : nothing
  InfixsController.calc(expr)
end
