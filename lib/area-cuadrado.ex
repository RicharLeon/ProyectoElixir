defmodule AreaCuadrado do
4
  def area(lado)
  when is_number(lado) do
    area = lado *lado
  end

  def area (_lado) do
    {:error, "El lado debe ser un número"}
  end




end
