# test that trimming removes spaces
expect_equal(str_trim("abc   "),   "abc")
expect_equal(str_trim("   abc"),   "abc")
expect_equal(str_trim("  abc   "), "abc")

# test that trimming removes tabs
expect_equal(str_trim("abc\t"),   "abc")
expect_equal(str_trim("\tabc"),   "abc")
expect_equal(str_trim("\tabc\t"), "abc")

# test that side argument restricts trimming
expect_equal(str_trim(" abc ", "left"),  "abc ")
expect_equal(str_trim(" abc ", "right"), " abc")

# test that str_squish removes excess spaces from all parts of string
expect_equal(str_squish("ab\t\tc\t"),   "ab c")
expect_equal(str_squish("\ta  bc"),   "a bc")
expect_equal(str_squish("\ta\t bc\t"), "a bc")
