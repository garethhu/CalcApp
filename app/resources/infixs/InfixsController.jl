module InfixsController
  using Infix
  # Build something great

  export calc

  function calc(nout::Nothing)
    """
    {
    "InfixCalculateExpression": /infix?expression=expression::String
    }
    """
  end

# TODO format checking
  function calc(expression::String)
    evaluate(expression)
  end
end
