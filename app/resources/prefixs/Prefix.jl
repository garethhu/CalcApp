module Prefix

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

calculate(expression) = @match expression[1] begin
        op::Char => begin
                left, tail = calculate(expression[2:end])
                right, tail = calculate(tail)
                return eval_expr(op, left, right), tail
        end
        n::Number => begin
           return n, expression[2:end]
        end
end

evaluate(expression) = first(calculate(tokenize(expression)))

end # module
