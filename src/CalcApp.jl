module CalcApp

using Genie, Logging, LoggingExtras

function main()
  Base.eval(Main, :(const UserApp = CalcApp))

  Genie.genie(; context = @__MODULE__)
  Genie.load_resources()

  Base.eval(Main, :(const Genie = CalcApp.Genie))
  Base.eval(Main, :(using Genie))
  Genie.up()
end

end
