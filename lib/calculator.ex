defmodule Calculator do

  def run do
    IO.puts("Seleccione una opción: ")
    IO.puts("1. Circunferencua de un círculo")
    IO.puts("2. Área de un círculo")
    IO.puts("3. Hipotenusa de un triangulo")
    IO.puts("4. Ecuación de la recta")
    IO.puts("5. Adiós")

    opcion = IO.gets("Opción: ") |> String.trim()

    opciones = [
      {"1", &circunferencia_circulo/0},
      {"2", &area_circulo/0},
      {"3", &hipotenusa_triangulo/0},
      {"4", &ecuacion_recta/0},
      {"5", &adios/0}
    ]

    case Enum.find(opciones, fn {clave, _fun} -> clave == opcion end) do
      {_, fun} -> fun.()
      nil -> IO.puts("Opcion no válida")
    end

    run()
  end

  defp circunferencia_circulo do
    IO.puts("Circunferencia de un círculo")
    IO.puts("Ingrese el radio del círculo:")

    radio = IO.gets("")
    |> String.trim()
    |> case do
      "" -> {:error, "Entrada vacía"}
      input ->
        case Float.parse(input) do
          {valor, _} when valor >= 0 -> {:ok, valor}
          {valor, _} -> {:error, "El radio no puede ser negativo"}
          :error -> {:error, "Debes ingresar un número válido"}
        end
    end

    resultado = case radio do
      {:ok, num} -> CircunfereniaCirculo.circunferencia(num)
      {:error, mensaje} -> mensaje
    end

    IO.puts("Resultado: #{resultado}")
  end

  defp area_circulo do
    IO.puts("Área de un círculo")
    IO.puts("Ingrese el radio del círculo:")

    radio = IO.gets("")
    |> String.trim()
    |> case do
      "" -> {:error, "Entrada vacía"}
      input ->
        case Float.parse(input) do
          {valor, _} when valor >= 0 -> {:ok, valor}
          {valor, _} -> {:error, "El radio no puede ser negativo"}
          :error -> {:error, "Debes ingresar un número válido"}
        end
    end

    resultado = case radio do
      {:ok, num} -> AreaCirculo.area(num)
      {:error, mensaje} -> mensaje
    end

    IO.puts("Resultado: #{resultado}")
  end

  defp hipotenusa_triangulo do
    IO.puts("Hipotenusa de un Triangulo")

    validar_cateto = fn mensaje ->
      IO.gets(mensaje)
      |> String.trim()
      |> case do
        "" ->
          {:error, "Entrada vacía"}

        input ->
          case Float.parse(input) do
            {valor, _} when valor > 0 ->
              {:ok, valor}

            {valor, _} ->
              {:error, "El cateto no puede ser negativo o cero"}

            :error ->
              {:error, "Debes ingresar un número válido"}
          end
      end
    end

    with {:ok, cateto1} <- validar_cateto.("Ingrese el Cateto 1: "),
         {:ok, cateto2} <- validar_cateto.("Ingrese el Cateto 2: ") do
      resultado = TeoremaPitagoras.hipotenusa(cateto1, cateto2)
      IO.puts("Resultado: #{resultado}")
    else
      {:error, motivo} ->
        IO.puts("Error: #{motivo}")
    end
  end



  defp ecuacion_recta do

    IO.puts("Ecuación de la recta")

    # Función auxiliar para validar puntos
    validar_punto = fn (mensaje, nombre_punto) ->
      IO.gets(mensaje)
      |> String.trim()
      |> case do
        "" -> {:error, "Entrada vacía para #{nombre_punto}"}
        input ->
          case Float.parse(input) do
            {valor, _} -> {:ok, valor}
            :error -> {:error, "Valor numérico inválido para #{nombre_punto}"}
          end
      end
    end

    # Validar todos los puntos usando with
    with {:ok, x1} <- validar_punto.("Ingrese el punto 1 (x1): ", "x1"),
          {:ok, y1} <- validar_punto.("Ingrese el punto 1 (y1): ", "y1"),
          {:ok, x2} <- validar_punto.("Ingrese el punto 2 (x2): ", "x2"),
          {:ok, y2} <- validar_punto.("Ingrese el punto 2 (y2): ", "y2") do

      # Cálculo de la pendiente
      m = (y2 - y1) / (x2 - x1)

      # Cálculo de la ordenada al origen
      b = y1 - m * x1

      # Formatear ecuación
      ecuacion = case {m, b} do
        {0, b} -> "y = #{Float.round(b, 4)}"
        {m, 0} -> "y = #{Float.round(m, 4)}x"
        {m, b} when b < 0 -> "y = #{Float.round(m, 4)}x - #{Float.round(abs(b), 4)}"
        {m, b} -> "y = #{Float.round(m, 4)}x + #{Float.round(b, 4)}"
      end

        IO.puts("La ecuación de la recta es: #{ecuacion}")

    else
        {:error, motivo} ->
          IO.puts("Error: #{motivo}")
    end

  end



  defp adios do
    IO.puts("Adios")
    System.halt(0)
  end

end

Calculator.run()
