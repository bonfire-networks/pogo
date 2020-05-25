defmodule Pogo.Query do

  import Ecto.Function

  defmacro cast(a, b), do: cast_impl(a, b)

  defp cast_impl(a, {:array, b}) when is_atom(b), do: {:fragment, [], ["? :: #{Atom.to_string(b)}[]", a]}
  defp cast_impl(a, {:array, b}) when is_binary(b), do: {:fragment, [], ["? :: #{b}[]", a]}
  defp cast_impl(a, b) when is_atom(b), do: {:fragment, [], ["? :: #{Atom.to_string(b)}", a]}
  defp cast_impl(a, b) when is_binary(b), do: {:fragment, [], ["? :: #{b}", a]}

  # comparison

  defmacro between(a, b, c), do: {:fragment, [], ["? between ? and ?", a, b, c]}
  defmacro not_between(a, b, c), do: {:fragment, [], ["? not between ? and ?", a, b, c]}
  defmacro between_symmetric(a, b, c), do: {:fragment, [], ["? between symmetric ? and ?", a, b, c]}
  defmacro not_between_symmetric(a, b, c), do: {:fragment, [], ["? not between symmetric ? and ?", a, b, c]}

  defmacro is_distinct_from(a, b), do: {:fragment, [], ["? is distinct from ?", a, b]}
  defmacro is_not_distinct_from(a, b), do: {:fragment, [], ["? is not distinct from ?", a, b]}

  defmacro is(expr, what), do: is_impl(expr, what)

  defp is_impl(expr, what) when is_binary(what), do: {:fragment, [], ["? is #{what}", expr]}
  defp is_impl(expr, nil), do: {:is_nil, [], [expr]}
  defp is_impl(expr, :not_nil), do: {:not, [], [{:is_nil, [], [expr]}]}
  defp is_impl(expr, true), do: is_impl(expr, "true")
  defp is_impl(expr, :not_true), do: is_impl(expr, "not true")
  defp is_impl(expr, false), do: is_impl(expr, "false")
  defp is_impl(expr, :not_false), do: is_impl(expr, "not false")
  defp is_impl(expr, :unknown), do: is_impl(expr, "unknown")
  defp is_impl(expr, :not_unknown), do: is_impl(expr, "not unknown")

  # math

  defqueryfunc abs(x)
  defqueryfunc cbrt(x)
  defqueryfunc ceil(x)
  defqueryfunc degrees(x)
  defqueryfunc div(x, y)
  defqueryfunc exp(x)
  defqueryfunc floor(x)
  defqueryfunc ln(x)
  defqueryfunc log(x)
  defqueryfunc log10(x)
  defqueryfunc mod(x, y)
  defqueryfunc pi()
  defqueryfunc power(x, y)
  defqueryfunc radians(x)
  defqueryfunc round(x)
  defqueryfunc round(x, y)
  defqueryfunc scale(x)
  defqueryfunc sign(x)
  defqueryfunc sqrt(x)
  defqueryfunc trunc(x)
  defqueryfunc trunc(x, y)
  defqueryfunc width_bucket(x, y)
  defqueryfunc width_bucket(x, y, z, a)

  # random

  defqueryfunc random()
  defqueryfunc setseed(x)

  # trig

  defqueryfunc acos(x)
  defqueryfunc acosd(x)

  defqueryfunc asin(x)
  defqueryfunc asind(x)

  defqueryfunc atan(x)
  defqueryfunc atand(x)

  defqueryfunc atan2(x)
  defqueryfunc atan2d(x)

  defqueryfunc cos(x)
  defqueryfunc cosd(x)

  defqueryfunc cot(x)
  defqueryfunc cotd(x)

  defqueryfunc sin(x)
  defqueryfunc sind(x)

  defqueryfunc tan(x)
  defqueryfunc tand(x)


  defqueryfunc sinh(x)
  defqueryfunc cosh(x)
  defqueryfunc tanh(x)
  defqueryfunc asinh(x)
  defqueryfunc acosh(x)
  defqueryfunc atanh(x)

  # strings

  defqueryfunc bit_length(x)
  defqueryfunc char_length(x)
  defqueryfunc lower(x)
  defqueryfunc octet_length(x)
#  defqueryfunc overlay(x)
  
  defmacro position(x, y), do: {:fragment, [], ["position(? in ?)", x, y]}
  # TODO - defqueryfunc substring(x)
  # TODO - defqueryfunc trim(x)
  defqueryfunc upper(x)

  defqueryfunc ascii(x)
  defqueryfunc btrim(x)
  defqueryfunc btrim(x, y)
  defqueryfunc chr(x)

  defmacro concat(a), do: {:fragment, [], ["concat(?)", a]}
  defmacro concat(a, b), do: {:fragment, [], ["concat(?,?)", a, b]}
  defmacro concat(a, b, c), do: {:fragment, [], ["concat(?,?,?)", a, b, c]}
  defmacro concat(a, b, c, d), do: {:fragment, [], ["concat(?,?,?,?)", a, b, c, d]}
  defmacro concat(a, b, c, d, e), do: {:fragment, [], ["concat(?,?,?,?,?)", a, b, c, d, e]}
  defmacro concat(a, b, c, d, e, f), do: {:fragment, [], ["concat(?,?,?,?,?,?)", a, b, c, d, e, f]}

  defmacro concat_ws(a, b), do: {:fragment, [], ["concat_ws(?,?)", a, b]}
  defmacro concat_ws(a, b, c), do: {:fragment, [], ["concat_ws(?,?,?)", a, b, c]}
  defmacro concat_ws(a, b, c, d), do: {:fragment, [], ["concat_ws(?,?,?,?)", a, b, c, d]}
  defmacro concat_ws(a, b, c, d, e), do: {:fragment, [], ["concat_ws(?,?,?,?,?)", a, b, c, d, e]}
  defmacro concat_ws(a, b, c, d, e, f), do: {:fragment, [], ["concat_ws(?,?,?,?,?,?)", a, b, c, d, e, f]}
  defmacro concat_ws(a, b, c, d, e, f, g), do: {:fragment, [], ["concat_ws(?,?,?,?,?,?,?)", a, b, c, d, e, f, g]}


  defqueryfunc convert(x, y, z)
  defqueryfunc convert_from(x, y)
  defqueryfunc convert_to(x, y)
  defqueryfunc decode(x, y)
  defqueryfunc encode(x, y)

  defqueryfunc format(a, b)
  defqueryfunc format(a, b, c)
  defqueryfunc format(a, b, c, d)
  defqueryfunc format(a, b, c, d, e)
  defqueryfunc format(a, b, c, d, e, f)
  defqueryfunc format(a, b, c, d, e, f, g)

  defqueryfunc initcap(x)
  defqueryfunc left(x, y)
  defqueryfunc length(x)
  defqueryfunc length(x, y)
  
  defqueryfunc lpad(x, y)
  defqueryfunc lpad(x, y, z)
  defqueryfunc ltrim(x)
  defqueryfunc ltrim(x, y)
  defqueryfunc md5(x)
  # TODO - defqueryfunc parse_ident(x)
  defqueryfunc pq_client_encoding()
  defqueryfunc quote_ident(x)
  defqueryfunc quote_literal(x)
  defqueryfunc quote_nullable(x)
  defqueryfunc regexp_match(x, y)
  defqueryfunc regexp_match(x, y, z)
  defqueryfunc regexp_matches(x, y)
  defqueryfunc regexp_matches(x, y, z)
  defqueryfunc regexp_replace(x, y, z)
  defqueryfunc regexp_replace(x, y, z, a)
  defqueryfunc regexp_split_to_array(x, y)
  defqueryfunc regexp_split_to_array(x, y, z)
  defqueryfunc regexp_split_to_table(x, y)
  defqueryfunc regexp_split_to_table(x, y, z)
  defqueryfunc repeat(x, y)
  defqueryfunc replace(x, y, z)
  defqueryfunc reverse(x)
  defqueryfunc right(x, y)
  defqueryfunc rpad(x, y)
  defqueryfunc rpad(x, y, z)
  defqueryfunc rtrim(x)
  defqueryfunc rtrim(x, y)
  defqueryfunc split_part(x, y, z)
  defqueryfunc strpos(x, y)
  defqueryfunc substr(x, y)
  defqueryfunc substr(x, y, z)
  defqueryfunc starts_with(x, y)
  defqueryfunc to_ascii(x)
  defqueryfunc to_ascii(x, y)
  defqueryfunc to_hex(x)
  defqueryfunc translate(x, y, z)

  defmacro conc(x, y), do: {:fragment, [], ["? || ?", x, y]}
  defmacro bit_and(x, y), do: {:fragment, [], ["? & ?", x, y]}
  defmacro bit_or(x, y), do: {:fragment, [], ["? | ?", x, y]}
  defmacro bit_xor(x, y), do: {:fragment, [], ["? # ?", x, y]}
  defmacro bit_not(x), do: {:fragment, [], ["~ ?", x]}
  defmacro bit_shift_left(x, y), do: {:fragment, [], ["? << ?", x, y]}
  defmacro bit_shift_right(x, y), do: {:fragment, [], ["? >> ?", x, y]}

  # defqueryfunc (x)

  # TODO - num_nonnulls(variadic any)
  # TODO - num_nulls(variadic any)
  

end
