import 'package:app_crud_flutter/add_product.dart';
import 'package:app_crud_flutter/message_response.dart';
import 'package:flutter/material.dart';
import 'package:app_crud_flutter/modify_product.dart';

class Home_Page extends StatefulWidget {
  final String _title;
  Home_Page(this._title);
  @override
  State<StatefulWidget> createState() => _Home_Page();
}

class _Home_Page extends State<Home_Page> {
  List<Product> products = [
    Product(
        name: 'Bulto de cemento',
        description: 'Bulto de cemento argos 50 kilos',
        price: '45000'),
    Product(
        name: 'Bulto de Arena',
        description: 'Bulto de arena argos, 40 kilos',
        price: '30000'),
    Product(
        name: 'Ladrillo',
        description: 'Ladrillo cafe, 1 kilo',
        price: '5500')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget._title),
        ),
        body: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {
                Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => ModifyProduct(products[index])))
                    .then((newProduct) {
                  if (newProduct != null) {
                    setState(() {
                      products.removeAt(index);

                      products.insert(index, newProduct);

                      messageResponse(
                          context, newProduct.name + " ha sido modificado exitosamente");
                    });
                  }
                });
              },
              onLongPress: () {
                removeProduct(context, products[index]);
              },
              title: Text(products[index].name),
              subtitle: Text("Descripcion del producto: "+products[index].description +
                  "\nPrecio del producto:  " + products[index].price + " COP "),
                         
              leading: Card(
                child: Text(products[index].name.substring(0, 1)),
              ),
              trailing: Icon(
                Icons.task,
                color: Colors.green,
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                    context, MaterialPageRoute(builder: (_) => AddProduct()))
                .then((newProduct) {
              if (newProduct != null) {
                setState(() {
                  products.add(newProduct);
                  messageResponse(context,
                      newProduct.name + "ha sido creado con exito!...");
                });
              }
            });
          },
          tooltip: "Add new product",
          child: Icon(Icons.add),
        ));
  }

  removeProduct(BuildContext context, Product product) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text("Eliminar producto"),
              content: Text("Esta seguro de eliminar a " + product.name + "?"),
              actions: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      this.products.remove(product);
                      Navigator.pop(context);
                    });
                  },
                  child: Text(
                    "Eliminar",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Cancelar",
                    style: TextStyle(color: Colors.blue),
                  ),
                )
              ],
            ));
  }
}

class Product {
  var name;
  var description;
  var price;

  Product({this.name, this.description, this.price});
}
