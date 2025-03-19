import pandas as pd

df = pd.read_csv('datos_ventas.csv')

df["TotalVentas"] = df["Cantidad"] * df["PrecioUnitario"]

# Agrupar por producto y sumar las ventas
total_ventas = df.groupby("Producto")["TotalVentas"].sum().reset_index()

#print(total_ventas)

total_ventas.to_csv("resumen_ventas.csv", index=False)

print( "Archivo resumen_ventas.csv creado con éxito")
