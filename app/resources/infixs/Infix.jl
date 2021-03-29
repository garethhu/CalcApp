module Infix

using Match

export evaluate

match_type(input) = try
           parse(Int64, input)
   catch e
           isa(e, ArgumentError) ? input[1] : throw(e)
   end

tokenize(input) = match_type.(split(input, ' '))

eval_expr(op::Char, a::Number, b::Number) = @match op begin
   '+' => a + b
   '-' => a - b
   '/' => a / b
   '*' => a * b
end

calculate(expression) = @match (@show expression[1:5]) begin
   ['(', a::Number, op::Char, b::Number, ')'] => begin
      result = eval_expr(op,a,b)
      tail = expression[6:end]
      append!(Any[result], tail)
   end
   _ => begin
      result = calculate(expression[2:end])
      remaining = append!(Any[expression[1]],result)
      length(remaining) < 5 ? remaining : calculate(remaining)
   end
end

evaluate(expression) = first(calculate(tokenize(expression)))
end
