module PrefixsController
  using Prefix
  # Build something great

  export calc

  function calc(nout::Nothing)
    """
    {
    "PrefixCalculateExpression": "/prefix?expression=expression::String"
    }
    """
  end

# TODO format checking
  function calc(expression::String)
    evaluate(expression)
  end

end
