import 'package:belajarflutter/ui/products_detail.dart';
import 'package:belajarflutter/ui/products_form.dart';
import 'package:flutter/material.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Produk'),
        actions: [
          GestureDetector(
          //   Menampilkan ikon +
            child: const Icon(Icons.add),
            onTap: () async {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ProductsForm()
                )
              );
            },
          )
        ],
      ),
      body: ListView(
        children: const [
          ProductsItem(
            kodeProduk: 'A001',
            namaProduk: 'Kulkas',
            harga: 25000,
          ),
          ProductsItem(
            kodeProduk: 'A001',
            namaProduk: 'Kulkas',
            harga: 25000,
          ),
          ProductsItem(
            kodeProduk: 'A001',
            namaProduk: 'Kulkas',
            harga: 25000,
          )
        ],
      )
    );
  }
}

class ProductsItem extends StatelessWidget {
  final String? kodeProduk;
  final String? namaProduk;
  final int? harga;

  const ProductsItem({Key? key, this.kodeProduk, this.namaProduk, this.harga}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        child: ListTile(
          title: Text(namaProduk.toString()),
          subtitle: Text(harga.toString()),
        ),
      ),
      onTap: () {
        Navigator.push(
            context,
          MaterialPageRoute(
              builder: (context) => ProductsDetail(
                kodeProduk: kodeProduk,
                namaProduk: namaProduk,
                harga: harga,
              )
          )
        );
      },
    );
  }
}