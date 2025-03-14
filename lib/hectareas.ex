defmodule Hectareas do

  @hectarea 10_000
  @fanegada 6_400

  def hectareas(fanega) when is_number(fanega) do

    resultado = fanega * @fanegada / @hectarea
    resultado
  end

  def hectareas (_fanega) do
    {:error, "El número de fanegas debe ser un número"}
  end

end
