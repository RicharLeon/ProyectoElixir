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
    validar_punto = fn (mensaje) ->
      IO.gets(mensaje)
      |> String.trim()
      |> case do
        "" -> {:error, "Entrada vacía"}
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

    # Validar todos los puntos usando with
    with {:ok, x1} <- validar_punto.("Ingrese el punto 1 (x1): "),
          {:ok, y1} <- validar_punto.("Ingrese el punto 1 (y1): "),
          {:ok, x2} <- validar_punto.("Ingrese el punto 2 (x2): ") do

        resultado = EcuacionRecta.ecuacion_recta(x1, y1, x2)
        IO.puts("Resultado: #{resultado}")
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
