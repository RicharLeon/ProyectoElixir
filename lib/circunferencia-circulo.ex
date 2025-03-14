defmodule CircunfereniaCirculo do
  @pi 3.14159265359

  def circunferencia(radio) when is_number(radio) and radio >=0 do
    2 * @pi * radio
  end

  def circunferencia(_radio) do
    {:error, "El radui debe ser un numero positivo"}
  end


end
