defmodule AreaCirculo do
  @pi 3.141592655359

  def area(radio) when is_number(radio) and radio >= 0 do
    @pi * radio * radio
  end

  def area(_radio) do
    {:error, "El radio debe ser un numero positivo"}
  end



end
