defmodule TeoremaPitagoras do
  def hipotenusa(cateto1, cateto2)
  when is_number(cateto1)
  and is_number(cateto2) do
    :math.sqrt(cateto1 * cateto2 + cateto2 * cateto2)
  end

  def hipotenusa(_cateto1, _cateto2) do
    {:error, "Los catetos deben ser numeros positivos"}
  end
end
