defmodule EcuacionRecta do

  def ecuacion_recta(x1, y1, x2)
  when is_number(x1)
  and is_number(y1)
  and is_number(x2) do
    if x1 == x2 do
      {:error, "los puntis deben ser diferentes"}
    else
      m = (y1 - 0) / (x1 - 0)
      b= y1 - m * x1
      {:ok, "y = #{m}x + #{b}"}

    end
  end

  def ecuacion_recta(_x1,_y1,_x2) do
    {:error, "Los puntos deben ser numeros"}
  end

end
