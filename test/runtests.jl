include("../app/resources/infixs/Infix.jl")
include("../app/resources/prefixs/Prefix.jl")

using CalcApp, Test
using .Prefix, .Infix
# implement your tests here

# TODO unhappy path cases, where format is incorrect

@testset "prefix calculator" begin
    @test Prefix.evaluate("+ 2 3") == 5
    @test Prefix.evaluate("* 4 8") == 32
    @test Prefix.evaluate("/ 12 6") == 2
    @test Prefix.evaluate("/ 6 12") == 0.5
    @test Prefix.evaluate("- 9 7") == 2
    @test Prefix.evaluate("- 7 9") == -2

    @test Prefix.evaluate("+ 2 * 5 3") == 17
    @test Prefix.evaluate("+ * 5 3 2") == 17
end

@testset "infix calculator" begin
    @test Infix.evaluate("( 2 + 3 )") == 5
    @test Infix.evaluate("( 4 * 8 )") == 32
    @test Infix.evaluate("( 12 / 6 )") == 2
    @test Infix.evaluate("( 6 / 12 )") == 0.5
    @test Infix.evaluate("( 9 - 7 )") == 2
    @test Infix.evaluate("( 7 - 9 )") == -2

    @test Infix.evaluate("( 2 + ( 5 * 3 ) )") == 17
    @test Infix.evaluate("( ( 5 * 3 ) + 2 )") == 17
end
