defmodule Calculator do

  def run do
    IO.puts("Seleccione una opción: ")
    IO.puts("1. Circunferencua de un círculo")
    IO.puts("2. Área de un círculo")
    IO.puts("3. Área de un cuadrado")
    IO.puts("4. Cuantas hectáreas hay en x fanegadas")
    IO.puts("5. Adiós")

    opcion = IO.gets("Opción: ") |> String.trim()

    opciones = [
      {"1", &circunferencia_circulo/0},
      {"2", &area_circulo/0},
      {"3", &area_cuadrado/0},
      {"4", &hectareas/0},
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

  defp area_cuadrado do
    IO.puts("Área de un cuadrado")
    IO.puts("Ingrese el radio del lado:")

    radio = IO.gets("")
    |> String.trim()
    |> case do
      "" -> {:error, "Entrada vacía"}
      input ->
        case Float.parse(input) do
          {valor, _} when valor >= 0 -> {:ok, valor}
          {valor, _} -> {:error, "El lado no puede ser negativo"}
          :error -> {:error, "Debes ingresar un número válido"}
        end
    end

    resultado = case radio do
      {:ok, num} -> AreaCuadrado.area(num)
      {:error, mensaje} -> mensaje
    end

    IO.puts("Resultado: #{resultado}")
  end

  defp hectareas do
    IO.puts("Fanegadas a hectáreas")
    IO.puts("Ingrese el numero de fanegadas:")

    radio = IO.gets("")
    |> String.trim()
    |> case do
      "" -> {:error, "Entrada vacía"}
      input ->
        case Float.parse(input) do
          {valor, _} when valor > 0 -> {:ok, valor}
          {valor, _} -> {:error, "El numero no puede ser negativo ni cero"}
          :error -> {:error, "Debes ingresar un número válido"}
        end
    end

    resultado = case radio do
      {:ok, num} -> Hectareas.hectareas(num)
      {:error, mensaje} -> mensaje
    end

    IO.puts("Tienes una cantidad de : #{resultado} hectáreas")
  end



  defp adios do
    IO.puts("Adios")
    System.halt(0)
  end

end

Calculator.run()
